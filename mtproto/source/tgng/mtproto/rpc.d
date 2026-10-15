/// MTProto RPC layer: message envelopes, `rpc_result` parsing and
/// request/response matching by `msg_id`.
///
/// The layer is pure byte plumbing on top of framing: it knows nothing about
/// DCs, keys or connections. `session` supplies the counters and the salt
/// through `RpcContext`, which keeps the module testable in isolation.
module tgng.mtproto.rpc;

import std.bitmanip: littleEndianToNative, nativeToLittleEndian;
import std.exception: enforce;

@safe:

/// ID of the `rpc_result` constructor from `mtproto_api.tl`.
enum uint RpcResultId = 0xf35c6d01;
/// ID of the `rpc_error` constructor from `mtproto_api.tl`.
enum uint RpcErrorId = 0x2144ca19;
/// ID of the `new_session_created` constructor from `mtproto_api.tl`.
enum uint NewSessionCreatedId = 0x9ec20908;
/// ID of the `bad_server_salt` constructor from `mtproto_api.tl`.
enum uint BadServerSaltId = 0xedab447b;
/// ID of the `bad_msg_notification` constructor from `mtproto_api.tl`.
enum uint BadMsgNotificationId = 0xa7eff811;

/// Content-related message flag: this bit is set in `seq_no` for messages
/// that carry RPC queries rather than service traffic.
private enum ContentRelatedMask = 1;

/// Per-session state required to build and route MTProto messages.
///
/// `session` owns this struct, fills it in after `auth_key` is negotiated and
/// refreshes `serverSalt` when the server hands out a new one.
struct RpcContext
{
	/// Auth key identifier: the low 64 bits of `sha256(auth_key)`.
	long authKeyId;
	/// Current session identifier (random per session).
	long sessionId;
	/// Server salt for the current session.
	long serverSalt;
	/// Last assigned message identifier; zero until the first message.
	long lastMessageId;
	/// `seq_no` counter: counts content-related messages.
	int seqNo;

	/// Allocates the next `msg_id`, keeping it strictly increasing.
	///
	/// `msg_id` is a server-time-based value in the high 32 bits and a
	/// counter in the low 32 bits, so it never goes backwards within a session.
	long nextMessageId() @trusted
	{
		long now = serverMessageTime();
		// The counter lives in the low 32 bits of the timestamp.
		long candidate = (now & 0xffffffff_00000000L) | ((lastMessageId + 4) & 0xffffffffL);
		if (candidate <= lastMessageId)
			candidate = lastMessageId + 4;
		lastMessageId = candidate;
		return candidate;
	}

	/// Returns the `seq_no` for a content-related message and advances it.
	int nextSeqNo()
	{
		seqNo += 2;
		return seqNo - 2;
	}
}

/// Returns the current server time in MTProto `msg_id` units.
///
/// MTProto uses the Unix time in nanoseconds truncated to seconds, so a
/// `msg_id` is a monotonically increasing value shared with the server.
long serverMessageTime() @trusted
{
	import std.datetime.systime: Clock;
	return (Clock.currTime().toUnixTime * 1_000_000_000L) & 0xffffffff_00000000L;
}

/// A single MTProto message as it travels inside the transport.
struct MtpMessage
{
	/// `auth_key_id`: zero in plaintext mode, the key identifier otherwise.
	long authKeyId;
	/// Message identifier, unique per session.
	long messageId;
	/// Sequence number.
	int seqNo;
	/// Serialised body: constructor id plus its fields.
	ubyte[] body;

	/// Serialises the message into the transport representation.
	///
	/// The result starts with `auth_key_id`, then `msg_id`, then `seq_no`,
	/// then the body length and the body itself; the body length is kept so
	/// that the low bits of `msg_id` stay meaningful (see MTProto).
	ubyte[] serialize() const @trusted
	{
		auto payload = body.dup;
		// Replacing the header with its length prefix: MTProto derives the
		// length from the constructor, but the wire format carries it explicitly.
		auto out_ = new ubyte[8 + 8 + 4 + 4 + payload.length];
		size_t o;
		out_[o .. o + 8] = nativeToLittleEndian(authKeyId)[0 .. 8];
		o += 8;
		out_[o .. o + 8] = nativeToLittleEndian(messageId)[0 .. 8];
		o += 8;
		out_[o .. o + 4] = nativeToLittleEndian(seqNo)[0 .. 4];
		o += 4;
		out_[o .. o + 4] = nativeToLittleEndian(cast(uint) payload.length)[0 .. 4];
		o += 4;
		out_[o .. o + payload.length] = payload[];
		return out_;
	}
}

/// A response to a previously sent request.
struct RpcResponse
{
	/// Identifier of the response message itself.
	long messageId;
	/// Identifier of the request the response belongs to.
	long requestMessageId;
	/// Reply body: a serialised object (often a `Vector` or an error).
	ubyte[] result;
}

/// Raised for malformed or unexpected transport payloads.
class RpcException : Exception
{
	this(string msg) @safe pure nothrow
	{
		super(msg);
	}
}

/// Parses a transport payload into an MTProto message.
///
/// The payload may be a plain message, a `vector` of messages or the
/// encrypted form; only the plain form is handled here, since encryption
/// happens a layer below.
MtpMessage parseMessage(const(ubyte)[] payload) @trusted
{
	enforce(payload.length >= 20, new RpcException("MTProto message is too short"));

	size_t o;
	MtpMessage msg;
	msg.authKeyId = readI64(payload, o);
	msg.messageId = readI64(payload, o);
	msg.seqNo = cast(int) readI32(payload, o);

	enforce(payload.length >= o, new RpcException("Truncated MTProto message header"));
	// Service messages declare their body length explicitly; for data
	// messages the remaining bytes are the body.
	if (msg.messageId & 0x80000000L) {
		// Container/ack style messages carry no body length here.
		msg.body = payload[o .. $].dup;
	} else {
		enforce(payload.length >= o + 4, new RpcException("MTProto message has no body length"));
		auto bodyLen = cast(size_t) readU32(payload, o);
		enforce(bodyLen == payload.length - o, new RpcException("MTProto body length mismatch"));
		msg.body = payload[o .. o + bodyLen].dup;
	}
	return msg;
}

/// Parses the body of a message that is expected to be an `rpc_result`.
///
/// Returns `false` when the body is not an `rpc_result`, in which case it is
/// a service message the caller has to handle itself.
bool parseRpcResult(const(ubyte)[] body, out RpcResponse response) @trusted
{
	enforce(body.length >= 4, new RpcException("MTProto body is too short"));

	size_t o;
	auto constructor = readU32(body, o);
	if (constructor != RpcResultId)
		return false;

	enforce(body.length >= o + 8, new RpcException("rpc_result has no req_msg_id"));
	response.requestMessageId = readI64(body, o);

	// The result is a serialized object: a constructor id followed by its
	// fields, so the remaining bytes are the raw reply body.
	response.result = body[o .. $].dup;
	return true;
}

/// Extracts the `rpc_error` payload from an `rpc_result` body.
///
/// Returns `false` when the reply is not an error.
bool parseRpcError(const(ubyte)[] result, out int errorCode, out string errorMessage) @trusted
{
	enforce(result.length >= 4, new RpcException("RPC result is too short"));

	size_t o;
	if (readU32(result, o) != RpcErrorId)
		return false;

	errorCode = cast(int) readI32(result, o);
	errorMessage = readString(result, o);
	return true;
}

/// Handles one incoming transport payload.
///
/// Returns the decoded response when the payload is an `rpc_result`. The
/// `serviceHandler` is called for every non-result message so the caller can
/// process acks, salt updates and error notifications.
bool routeIncoming(const(ubyte)[] payload,
	scope void delegate(in MtpMessage) serviceHandler,
	out RpcResponse response) @trusted
{
	auto msg = parseMessage(payload);
	if (parseRpcResult(msg.body, response))
		return true;

	serviceHandler(msg);
	return false;
}

/// Tracks outstanding requests and matches incoming results to them.
final class RpcDispatcher
{
	private long[long] _pending;

	/// Registers `messageId` as an outstanding request.
	void registerRequest(long messageId)
	{
		_pending[messageId] = messageId;
	}

	/// Removes a request from the outstanding set; returns `false` if unknown.
	bool takeResponse(ref RpcResponse response)
	{
		auto pos = response.requestMessageId in _pending;
		if (pos is null)
			return false;
		_pending.remove(response.requestMessageId);
		return true;
	}

	/// Number of requests still waiting for a reply.
	@property size_t outstanding() const
	{
		return _pending.length;
	}
}

/// Reads a little-endian `long` and advances the offset.
private long readI64(const(ubyte)[] data, ref size_t o) @trusted
{
	enforce(data.length >= o + 8, new RpcException("Truncated 64-bit field"));
	ubyte[8] raw;
	raw[] = data[o .. o + 8];
	auto v = littleEndianToNative!long(raw);
	o += 8;
	return v;
}

/// Reads a little-endian `int` and advances the offset.
private int readI32(const(ubyte)[] data, ref size_t o) @trusted
{
	return cast(int) readU32(data, o);
}

/// Reads a little-endian `uint` and advances the offset.
private uint readU32(const(ubyte)[] data, ref size_t o) @trusted
{
	enforce(data.length >= o + 4, new RpcException("Truncated 32-bit field"));
	ubyte[4] raw;
	raw[] = data[o .. o + 4];
	auto v = littleEndianToNative!uint(raw);
	o += 4;
	return v;
}

/// Reads a TL string (length prefix, bytes, padding) and advances the offset.
private string readString(const(ubyte)[] data, ref size_t o) @trusted
{
	enforce(data.length >= o + 4, new RpcException("Truncated string length"));
	auto len = cast(size_t) data[o] | (cast(size_t) data[o + 1] << 8)
		| (cast(size_t) data[o + 2] << 16) | (cast(size_t) data[o + 3] << 24);
	o += 4;

	// The length byte includes the trailing NUL and the padding.
	if (len >= 254) {
		enforce(data.length >= o + 3, new RpcException("Truncated long string length"));
		len = cast(size_t) data[o] | (cast(size_t) data[o + 1] << 8) | (cast(size_t) data[o + 2] << 16);
		o += 3;
	}

	enforce(data.length >= o + len, new RpcException("Truncated string body"));
	auto s = cast(string) data[o .. o + len].idup;
	o += len;

	// Skip the padding to a 4-byte boundary.
	o = (o + 3) & ~cast(size_t) 3;
	return s;
}
