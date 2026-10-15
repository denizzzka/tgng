/// MTProto session state: message bookkeeping, acknowledgements and
/// server-controlled values such as salt and time offset.
///
/// A session owns the state that survives across messages but not across an
/// auth key: the `RpcContext` counters, the set of messages waiting for an
/// ack and the pending-request table. `auth.d` drives the handshake and hands
/// the negotiated key to this module.
module tgng.mtproto.session;

import tgng.mtproto.rpc: MtpMessage, RpcContext, RpcDispatcher, RpcResponse,
	RpcException, NewSessionCreatedId, BadServerSaltId, BadMsgNotificationId,
	parseMessage;

import core.time: Duration, msecs, seconds;
import std.bitmanip: littleEndianToNative, nativeToLittleEndian;
import std.exception: enforce;

@safe:

/// How long an unacknowledged message may stay pending before it is resent.
private enum DefaultAckTimeout = 5.seconds;

/// Identifier of the `msgs_ack` constructor from `mtproto_api.tl`.
enum uint MsgsAckId = 0x62d6b459;
/// Identifier of the `vector` constructor from the TL scheme.
enum uint VectorId = 0x1cb5c415;

/// A message that was sent and is waiting for the server to acknowledge it.
struct PendingMessage
{
	/// `msg_id` of the sent message.
	long messageId;
	/// Serialised body, kept for a possible resend.
	ubyte[] body;
	/// `seq_no` the message was sent with.
	int seqNo;
	/// Monotonic time at which the message was sent, in milliseconds.
	long sentAtMs;
}

/// Runtime state of one MTProto session.
///
/// The struct holds no socket: `persistent` owns the stream and calls back
/// into this session for every packet. That split keeps the message logic
/// testable without a network.
struct SessionState
{
	/// Counters shared with the RPC envelope builder.
	RpcContext context;
	/// Matches incoming results to outstanding requests.
	RpcDispatcher dispatcher;
	/// Messages sent but not yet acknowledged, keyed by `msg_id`.
	PendingMessage[long] pending;
	/// Time to wait before resending an unacknowledged message.
	Duration ackTimeout = DefaultAckTimeout;
	/// Monotonic clock reading of the last received packet, in milliseconds.
	long lastReceivedMs;

	/// Creates a session bound to the given auth key and session id.
	///
	/// `serverSalt` is zero right after the handshake: the first
	/// `new_session_created` (or `bad_server_salt`) fills it in.
	static SessionState create(long authKeyId, long sessionId) @safe
	{
		SessionState state;
		state.context.authKeyId = authKeyId;
		state.context.sessionId = sessionId;
		state.context.serverSalt = 0;
		return state;
	}

	/// Returns the salt the next outgoing message must carry.
	@property long serverSalt() const { return context.serverSalt; }

	/// Whether the session has a salt worth using.
	@property bool saltKnown() const { return context.serverSalt != 0; }

	/// Registers a body as a pending content-related request.
	///
	/// Returns the `msg_id` assigned to it, so the caller can send and later
	/// correlate the reply.
	long registerRequest(scope const(ubyte)[] body) @safe
	{
		auto msgId = context.nextMessageId();
		dispatcher.registerRequest(msgId);
		pending[msgId] = PendingMessage(msgId, body.dup, context.nextSeqNo(), nowMs());
		return msgId;
	}

	/// Removes a message from the pending set once its result arrived.
	void acknowledge(long messageId) @safe
	{
		pending.remove(messageId);
	}

	/// Returns the message ids whose ack has timed out.
	///
	/// The caller is expected to resend them and to call `markResent`.
	long[] timedOut() const @safe
	{
		auto now = nowMs();
		auto waitMs = ackTimeout.total!"msecs";
		long[] result;
		foreach (id, msg; pending)
			if (now - msg.sentAtMs >= waitMs)
				result ~= id;
		return result;
	}

	/// Restarts the ack timer of a message that is being resent.
	void markResent(long messageId) @safe
	{
		auto pos = messageId in pending;
		if (pos !is null)
			pos.sentAtMs = nowMs();
	}

	/// Handles a service message that is not an `rpc_result`.
	///
	/// Returns `true` when the message changed session state (a new salt or a
	/// session reset) and the caller must refresh its view.
	bool handleService(const(ubyte)[] body) @safe
	{
		enforce(body.length >= 4, new RpcException("Service message is too short"));
		switch (readU32(body, 0))
		{
			case NewSessionCreatedId:
				handleNewSession(body);
				return true;
			case BadServerSaltId:
				handleBadServerSalt(body);
				return true;
			case BadMsgNotificationId:
				handleBadMsgNotification(body);
				return true;
			default:
				return false;
		}
	}

	/// Records that a packet was received now.
	void touch() @safe
	{
		lastReceivedMs = nowMs();
	}

	/// Parses and routes one incoming transport payload.
	///
	/// Returns the matched response when the payload carries an `rpc_result`
	/// for an outstanding request; otherwise the service handling inside this
	/// session consumes it and `null` is returned.
	RpcResponse* onPayload(scope const(ubyte)[] payload) @trusted
	{
		touch();
		auto msg = parseMessage(payload);
		RpcResponse response;
		if (parseRpcResultLocal(msg.body, response))
		{
			if (!dispatcher.takeResponse(response))
				return null;
			acknowledge(response.requestMessageId);
			auto stored = new RpcResponse;
			*stored = response;
			return stored;
		}
		handleService(msg.body);
		return null;
	}

	/// Consumes `new_session_created`, adopting its salt.
	private void handleNewSession(const(ubyte)[] body) @safe
	{
		enforce(body.length >= 4 + 8 + 8 + 8,
			new RpcException("new_session_created is too short"));
		size_t o = 4;
		context.serverSalt = readI64(body, o);
	}

	/// Consumes `bad_server_salt`, adopting the salt it carries.
	private void handleBadServerSalt(const(ubyte)[] body) @safe
	{
		// bad_server_salt bad_msg_id:long bad_msg_seqno:int error_code:int new_server_salt:long
		enforce(body.length >= 4 + 8 + 4 + 4 + 8,
			new RpcException("bad_server_salt is too short"));
		size_t o = 4 + 8 + 4 + 4;
		context.serverSalt = readI64(body, o);
	}

	/// Handles `bad_msg_notification` by resending the offending message.
	private void handleBadMsgNotification(const(ubyte)[] body) @safe
	{
		// bad_msg_notification bad_msg_id:long bad_msg_seqno:int error_code:int
		enforce(body.length >= 4 + 8 + 4 + 4,
			new RpcException("bad_msg_notification is too short"));
		size_t o = 4;
		auto badMsgId = readI64(body, o);
		// A stale timer is enough: the resend loop picks the message up.
		markResent(badMsgId);
	}

	/// Builds an `msgs_ack` body for the given message ids.
	static ubyte[] buildAck(scope const(long)[] messageIds) @safe
	{
		auto out_ = new ubyte[8 + messageIds.length * 8];
		size_t o;
		out_[o .. o + 4] = nativeToLittleEndian(MsgsAckId)[0 .. 4];
		o += 4;
		out_[o .. o + 4] = nativeToLittleEndian(VectorId)[0 .. 4];
		o += 4;
		out_[o .. o + 4] = nativeToLittleEndian(cast(uint) messageIds.length)[0 .. 4];
		o += 4;
		foreach (id; messageIds)
		{
			out_[o .. o + 8] = nativeToLittleEndian(id)[0 .. 8];
			o += 8;
		}
		return out_;
	}
}

/// Reads a little-endian `long` and advances the offset.
private long readI64(const(ubyte)[] data, ref size_t o) @trusted
{
	enforce(data.length >= o + 8, new RpcException("Truncated 64-bit field"));
	ubyte[8] raw;
	raw[] = data[o .. o + 8];
	o += 8;
	return littleEndianToNative!long(raw);
}

/// Reads a little-endian `uint` at `offset`.
private uint readU32(const(ubyte)[] data, size_t offset) @trusted
{
	enforce(data.length >= offset + 4, new RpcException("Truncated 32-bit field"));
	ubyte[4] raw;
	raw[] = data[offset .. offset + 4];
	return littleEndianToNative!uint(raw);
}

/// Reads a little-endian `long` at `offset`.
private long readI64At(const(ubyte)[] data, size_t offset) @trusted
{
	size_t o = offset;
	return readI64(data, o);
}

/// Returns the monotonic clock reading in milliseconds.
private long nowMs() @trusted
{
	import core.time: MonoTime, msecs;
	return MonoTime.currTime.ticks / 1_000_000L;
}

// `rpc.parseRpcResult` returns the request id and raw result, but this module
// needs the same parsing without importing the whole helper surface.
private bool parseRpcResultLocal(scope const(ubyte)[] body, out RpcResponse response) @trusted
{
	import tgng.mtproto.rpc: parseRpcResult;
	return parseRpcResult(body, response);
}
