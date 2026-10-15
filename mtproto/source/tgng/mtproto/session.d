/// MTProto session state: message bookkeeping, acknowledgements and
/// server-controlled values such as salt and time offset.
///
/// A session owns the state that survives across messages but not across an
/// auth key: the `RpcContext` counters, the set of messages waiting for an
/// ack, the pending-request table and the salt/time bookkeeping. `auth.d`
/// drives the handshake and hands the negotiated key to this module.
module tgng.mtproto.session;

import tgng.mtproto.rpc: RpcContext, RpcDispatcher, RpcResponse, RpcException,
	NewSessionCreatedId, BadServerSaltId, BadMsgNotificationId,
	FutureSaltsId, parseMessage, parseRpcResult;

import core.time: Duration, seconds;
import std.bitmanip: littleEndianToNative, nativeToLittleEndian;
import std.conv: to;
import std.datetime.systime: Clock;
import std.exception: enforce;

@safe:

/// How long an unacknowledged message may stay pending before it is resent.
private enum DefaultAckTimeout = 5.seconds;

/// Identifier of the `msgs_ack` constructor from `mtproto_api.tl`.
enum uint MsgsAckId = 0x62d6b459;
/// Identifier of the `vector` constructor from the TL scheme.
enum uint VectorId = 0x1cb5c415;

/// `msg_id` values are compared modulo this window when looking for duplicates.
private enum MessageIdWindow = 1_000L;

/// A server salt with the interval during which it is valid.
///
/// The server may hand out several salts at once; the one whose interval
/// covers the current time is the one outgoing messages must carry.
struct ServerSalt
{
	/// The salt value itself.
	long salt;
	/// Unix time from which the salt is valid, in seconds.
	int validSince;
	/// Unix time until which the salt is valid, in seconds.
	int validUntil;

	/// Whether `unixTime` falls inside the salt's validity interval.
	bool validAt(long unixTime) const @safe
	{
		return unixTime >= validSince && unixTime <= validUntil;
	}
}

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

/// Raised when an incoming packet belongs to a different session.
class SessionMismatchException : RpcException
{
	this(long expected, long actual) @safe
	{
		super("Session id mismatch: expected " ~ expected.to!string
			~ ", got " ~ actual.to!string);
	}
}

/// Raised when an incoming `msg_id` is a duplicate or lies outside the
/// accepted window.
class MessageIdException : RpcException
{
	this(string reason) @safe pure nothrow
	{
		super(reason);
	}
}

/// Runtime state of one MTProto session.
///
/// The struct holds no socket: `persistent` owns the stream and calls back
/// into this session for every packet. That split keeps the message logic
/// testable without a network.
struct SessionState
{
	/// Auth key negotiated by the handshake; empty until `auth.d` fills it in.
	ubyte[] authKey;
	/// Counters shared with the RPC envelope builder.
	RpcContext context;
	/// Matches incoming results to outstanding requests.
	RpcDispatcher dispatcher;
	/// Messages sent but not yet acknowledged, keyed by `msg_id`.
	PendingMessage[long] pending;
	/// Salts handed out by the server, in the order they were received.
	ServerSalt[] salts;
	/// Time to wait before resending an unacknowledged message.
	Duration ackTimeout = DefaultAckTimeout;
	/// Monotonic clock reading of the last received packet, in milliseconds.
	long lastReceivedMs;
	/// Difference between server and local time, in seconds.
	long serverTimeDifference;
	/// Last incoming `msg_id` seen, for duplicate and shift detection.
	long lastIncomingMessageId;

	/// Creates a session bound to the given auth key and session id.
	///
	/// The salt is unknown right after the handshake: the first
	/// `new_session_created` (or `bad_server_salt`) fills it in.
	static SessionState create(long authKeyId, long sessionId) @safe
	{
		SessionState state;
		state.context.authKeyId = authKeyId;
		state.context.sessionId = sessionId;
		state.context.serverSalt = 0;
		state.dispatcher = new RpcDispatcher();
		return state;
	}

	/// Returns the salt the next outgoing message must carry.
	///
	/// The freshest salt covering the current server time wins; before any
	/// salt is known the value stays zero.
	@property long serverSalt() @safe
	{
		updateSalt(serverUnixTime());
		return context.serverSalt;
	}

	/// Whether the session has a salt worth using.
	@property bool saltKnown() const @safe { return context.serverSalt != 0; }

	/// Selects the salt valid at `unixTime`, if one is known.
	void updateSalt(long unixTime) @safe
	{
		foreach (ref salt; salts)
		{
			if (salt.validAt(unixTime))
			{
				context.serverSalt = salt.salt;
				return;
			}
		}
	}

	/// Replaces the known salts with the ones from a `future_salts` reply.
	void setFutureSalts(scope const(ServerSalt)[] newSalts) @safe
	{
		salts = newSalts.dup;
		updateSalt(serverUnixTime());
	}

	/// Current server time, derived from the local clock and the known offset.
	long serverUnixTime() const @safe
	{
		return Clock.currTime().toUnixTime + serverTimeDifference;
	}

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

	/// Checks that an incoming packet belongs to this session and that its
	/// `msg_id` is neither a duplicate nor too far ahead.
	///
	/// Returns the adjusted `msg_id` so the caller may reuse it.
	long checkIncoming(long authKeyId, long sessionId, long messageId) @safe
	{
		if (authKeyId != context.authKeyId)
			throw new MessageIdException(
				"Auth key id mismatch: expected " ~ context.authKeyId.to!string
				~ ", got " ~ authKeyId.to!string);
		if (sessionId != context.sessionId)
			throw new SessionMismatchException(context.sessionId, sessionId);

		checkMessageId(messageId);
		return messageId;
	}

	/// Guards against duplicate and badly shifted incoming `msg_id` values.
	void checkMessageId(long messageId) @safe
	{
		if (messageId == lastIncomingMessageId)
			throw new MessageIdException("Duplicate msg_id " ~ messageId.to!string);
		if (messageId <= lastIncomingMessageId - MessageIdWindow)
			throw new MessageIdException("msg_id " ~ messageId.to!string ~ " is too old");
		lastIncomingMessageId = messageId;

		updateServerTimeDifference(messageId);
	}

	/// Corrects the local/server clock difference from a server `msg_id`.
	void updateServerTimeDifference(long messageId) @safe
	{
		auto serverSeconds = cast(long) (messageId >> 32);
		auto localSeconds = Clock.currTime().toUnixTime;
		serverTimeDifference = serverSeconds - localSeconds;
	}

	/// Handles a service message that is not an `rpc_result`.
	///
	/// Returns `true` when the message changed session state (a new salt or a
	/// session reset) and the caller must refresh its view.
	bool handleService(const(ubyte)[] body) @safe
	{
		enforce!RpcException(body.length >= 4, "Service message is too short");
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
			case FutureSaltsId:
				handleFutureSalts(body);
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
		checkIncoming(msg.authKeyId, context.sessionId, msg.messageId);
		RpcResponse response;
		if (parseRpcResult(msg.body, response))
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
		// new_session_created first_msg_id:long unique_id:long server_salt:long
		enforce(body.length >= 4 + 8 + 8 + 8,
			new RpcException("new_session_created is too short"));
		size_t o = 4 + 8 + 8;
		setFutureSalts([ServerSalt(readI64(body, o), 0, int.max)]);
	}

	/// Consumes `bad_server_salt`, adopting the salt it carries.
	private void handleBadServerSalt(const(ubyte)[] body) @safe
	{
		// bad_server_salt bad_msg_id:long bad_msg_seqno:int error_code:int new_server_salt:long
		enforce(body.length >= 4 + 8 + 4 + 4 + 8,
			new RpcException("bad_server_salt is too short"));
		size_t o = 4 + 8 + 4 + 4;
		setFutureSalts([ServerSalt(readI64(body, o), 0, int.max)]);
	}

	/// Consumes `future_salts`, replacing the known salt set.
	private void handleFutureSalts(const(ubyte)[] body) @safe
	{
		// future_salts req_msg_id:long now:int salts:vector<future_salt>
		// future_salt valid_since:int valid_until:int salt:long
		enforce(body.length >= 4 + 8 + 4 + 4,
			new RpcException("future_salts is too short"));
		size_t o = 4 + 8 + 4;
		auto count = readU32(body, o);
		o += 4;

		ServerSalt[] parsed;
		parsed.reserve(count);
		foreach (_; 0 .. count)
		{
			enforce!RpcException(body.length >= o + 16, "future_salt is too short");
			auto validSince = cast(int) readU32(body, o);
			o += 4;
			auto validUntil = cast(int) readU32(body, o);
			o += 4;
			auto salt = readI64(body, o);
			parsed ~= ServerSalt(salt, validSince, validUntil);
		}
		setFutureSalts(parsed);
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
		auto out_ = new ubyte[12 + messageIds.length * 8];
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
	enforce!RpcException(data.length >= o + 8, "Truncated 64-bit field");
	ubyte[8] raw;
	raw[] = data[o .. o + 8];
	o += 8;
	return littleEndianToNative!long(raw);
}

/// Reads a little-endian `uint` at `offset`.
private uint readU32(const(ubyte)[] data, size_t offset) @trusted
{
	enforce!RpcException(data.length >= offset + 4, "Truncated 32-bit field");
	ubyte[4] raw;
	raw[] = data[offset .. offset + 4];
	return littleEndianToNative!uint(raw);
}

/// Returns the monotonic clock reading in milliseconds.
private long nowMs() @trusted
{
	import core.time: MonoTime;
	return MonoTime.currTime.ticks / 1_000_000L;
}

unittest
{
	import std.bitmanip: nativeToLittleEndian;
	import std.datetime.systime: Clock;

	// A session accepts its own ids and rejects a foreign session id.
	auto s = SessionState.create(0x1122334455667788L, 0x99AABBCCDDEEFF00L);
	auto now = Clock.currTime().toUnixTime;
	auto baseId = (now + 1) << 32 | 0x10;
	assert(s.checkIncoming(0x1122334455667788L, 0x99AABBCCDDEEFF00L, baseId) == baseId);

	bool threw;
	try
		s.checkIncoming(0x1122334455667788L, 0xDEADBEEFDEADBEEFL, baseId + 4);
	catch (SessionMismatchException)
		threw = true;
	assert(threw);

	// A duplicate msg_id must be rejected.
	threw = false;
	try
		s.checkMessageId(baseId);
	catch (MessageIdException)
		threw = true;
	assert(threw);

	// A msg_id far behind the window is rejected; a fresh one is accepted.
	threw = false;
	try
		s.checkMessageId(baseId - MessageIdWindow - 4);
	catch (MessageIdException)
		threw = true;
	assert(threw);
	s.checkMessageId(baseId + 4);

	// bad_server_salt replaces the salt set and unblocks sending.
	auto badSalt = new ubyte[4 + 8 + 4 + 4 + 8];
	size_t o;
	badSalt[o .. o + 4] = nativeToLittleEndian(BadServerSaltId)[0 .. 4];
	o += 4;
	badSalt[o .. o + 8] = nativeToLittleEndian(baseId)[0 .. 8];
	o += 8;
	badSalt[o .. o + 4] = nativeToLittleEndian(cast(int) 1)[0 .. 4];
	o += 4;
	badSalt[o .. o + 4] = nativeToLittleEndian(cast(int) 48)[0 .. 4];
	o += 4;
	badSalt[o .. o + 8] = nativeToLittleEndian(0xCAFEBABE_DEADBEEFL)[0 .. 8];

	assert(!s.saltKnown);
	assert(s.handleService(badSalt));
	assert(s.serverSalt == 0xCAFEBABE_DEADBEEFL);

	// new_session_created carries its salt after two long fields.
	auto newSession = new ubyte[4 + 8 + 8 + 8];
	o = 0;
	newSession[o .. o + 4] = nativeToLittleEndian(NewSessionCreatedId)[0 .. 4];
	o += 4;
	newSession[o .. o + 8] = nativeToLittleEndian(baseId)[0 .. 8];
	o += 8;
	newSession[o .. o + 8] = nativeToLittleEndian(0x1234L)[0 .. 8];
	o += 8;
	newSession[o .. o + 8] = nativeToLittleEndian(0x0BADF00D_0BADF00DL)[0 .. 8];

	assert(s.handleService(newSession));
	assert(s.serverSalt == 0x0BADF00D_0BADF00DL);

	// future_salts replaces the whole set.
	auto future = new ubyte[4 + 8 + 4 + 4 + 16];
	o = 0;
	future[o .. o + 4] = nativeToLittleEndian(FutureSaltsId)[0 .. 4];
	o += 4;
	future[o .. o + 8] = nativeToLittleEndian(baseId)[0 .. 8];
	o += 8;
	future[o .. o + 4] = nativeToLittleEndian(cast(int) now)[0 .. 4];
	o += 4;
	future[o .. o + 4] = nativeToLittleEndian(cast(uint) 1)[0 .. 4];
	o += 4;
	future[o .. o + 4] = nativeToLittleEndian(cast(int) 0)[0 .. 4];
	o += 4;
	future[o .. o + 4] = nativeToLittleEndian(cast(int) int.max)[0 .. 4];
	o += 4;
	future[o .. o + 8] = nativeToLittleEndian(0xFEEDFACE_CAFEBEEFL)[0 .. 8];

	assert(s.handleService(future));
	assert(s.serverSalt == 0xFEEDFACE_CAFEBEEFL);

	// msgs_ack has a stable byte layout: id, vector tag, count, ids.
	auto ack = SessionState.buildAck([baseId, baseId + 4]);
	size_t p;
	assert(readU32(ack, p) == MsgsAckId);
	p += 4;
	assert(readU32(ack, p) == VectorId);
	p += 4;
	assert(readU32(ack, p) == 2);
	p += 4;
	assert(readI64(ack, p) == baseId);
	assert(readI64(ack, p) == baseId + 4);

	// A registered request becomes pending and can time out for resend.
	ubyte[] body = [1, 2, 3, 4];
	auto msgId = s.registerRequest(body);
	assert((msgId in s.pending) !is null);
	s.ackTimeout = 0.seconds;
	assert(s.timedOut().length == 1);
	s.acknowledge(msgId);
	assert(msgId !in s.pending);
}
