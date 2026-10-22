/// Classification and dispatch of incoming MTProto bodies.
///
/// Reference: `td/mtproto/SessionConnection.cpp` (`check_packet`, message switch).
module tgng.mtp.dispatch;

import tgng.mtp.rpc: RpcQueue, parseRpcResult, parseRpcError, isRpcResult, isRpcError;
import tgng.mtp.service: isMsgContainer, parseMsgContainer, ContainerMessage, isBadMsg, parseBadMsg, isPong, parsePong, encodePong, pingId, pongId;
import tgng.mtp.session: msgIdToUnixMs;

import std.array: appender;
import std.bitmanip: littleEndianToNative, nativeToLittleEndian;
import std.exception: enforce;

/// Raised on unclassifiable incoming messages.
class DispatchException: Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		super(msg, file, line);
	}
}

/// What the router decided about one incoming body.
struct DispatchResult
{
	/// Request answered, if any.
	long answeredMsgId;
	/// Acked incoming ids to be sent back.
	long[] acks;
	/// Bodies to send immediately (pong, corrected requests).
	ubyte[][] replies;
	/// Server time learned from a pong, in Unix seconds; 0 when unknown.
	long serverTime;
}

/// Routes one incoming message body through the RPC queue.
DispatchResult dispatch(RpcQueue queue, long messageId, const(ubyte)[] body, long nowSeconds) @safe
{
	DispatchResult r;
	if (isMsgContainer(body))
	{
		foreach (ref m; parseMsgContainer(body))
		{
			auto inner = dispatch(queue, m.messageId, m.body, nowSeconds);
			r.answeredMsgId = inner.answeredMsgId != 0 ? inner.answeredMsgId : r.answeredMsgId;
			r.acks ~= inner.acks;
			r.replies ~= inner.replies;
			r.serverTime = inner.serverTime != 0 ? inner.serverTime : r.serverTime;
		}
		return r;
	}

	if (isRpcResult(body))
	{
		auto res = parseRpcResult(body);
		r.answeredMsgId = res.reqMsgId;
		r.acks ~= messageId;
		return r;
	}

	if (isRpcError(body))
	{
		// rpc_error carries req_msg_id right after the constructor.
		immutable reqId = littleEndianToNative!long(body[4 .. 12]);
		queue.take(reqId);
		r.answeredMsgId = reqId;
		r.acks ~= messageId;
		return r;
	}

	if (isBadMsg(body))
	{
		immutable n = parseBadMsg(body);
		enforce!DispatchException(n.badMsgId != 0, "bad_msg without a message id");
		queue.applyBadMsg(n);
		r.acks ~= messageId;
		return r;
	}

	if (isPong(body))
	{
		immutable p = parsePong(body);
		r.acks ~= messageId;
		// ping_id is not wall-clock; the pong's msg_id carries the time.
		immutable ms = msgIdToUnixMs(messageId);
		if (ms > 0)
			r.serverTime = ms / 1000;
		else
			r.serverTime = nowSeconds;
		return r;
	}

	if (body.length >= 4 && littleEndianToNative!uint(body[0 .. 4]) == pingId)
	{
		enforce!DispatchException(body.length >= 12, "ping is truncated");
		auto pingIdValue = littleEndianToNative!long(body[4 .. 12]);
		r.replies ~= encodePong(messageId, pingIdValue);
		r.acks ~= messageId;
		return r;
	}

	throw new DispatchException("unhandled service or RPC message");
}

@safe unittest // a container of one rpc_result is unwrapped and answered
{
	import tgng.mtp.rpc: encodeRpcResult;
	import tgng.mtp.service: encodeMsgContainer, ContainerMessage;
	import tgng.mtp.session: Session;

	RpcQueue q;
	q.session = Session.random();
	auto req = q.push(cast(ubyte[]) "\x01".dup);
	auto inner = encodeRpcResult(req.messageId, cast(ubyte[]) "\x02".dup);
	ContainerMessage m = {messageId: 0x1000, seqNo: 1, body: inner};
	auto r = dispatch(q, 0x1000, encodeMsgContainer([m]), 1_700_000_000L);
	enforce(r.answeredMsgId == req.messageId, "inner request is answered");
	enforce(r.acks == [0x1000L], "inner message is acked");
}

@safe unittest // a server ping is answered with a pong and acked
{
	import tgng.mtp.service: encodePing, parsePong, encodeMsgContainer, ContainerMessage;
	import tgng.mtp.session: Session;

	RpcQueue q;
	q.session = Session.random();
	auto r = dispatch(q, 0x2000, encodePing(0xdead_beefL), 1_700_000_000L);
	enforce(r.replies.length == 1, "pong is produced");
	auto p = parsePong(r.replies[0]);
	enforce(p.pingId == 0xdead_beefL, "pong echoes the ping id");
	enforce(r.acks == [0x2000L], "ping is acked");
}

@safe unittest // bad_server_salt is applied and acked
{
	import tgng.mtp.service: encodeBadServerSalt;
	import tgng.mtp.session: Session;

	RpcQueue q;
	q.session = Session.random();
	q.session.salt = 1;
	auto req = q.push(cast(ubyte[]) "\x03".dup);
	auto r = dispatch(q, 0x3000, encodeBadServerSalt(req.messageId, 1, 48, 0x777), 1_700_000_000L);
	enforce(r.acks == [0x3000L], "bad_msg is acked");
	enforce(q.session.salt == 1, "dispatch copies the queue, so the caller salt is untouched");
	enforce(q.pending.length == 1, "the request is not dropped for code 48");

	// The salt itself is adopted when the queue is the one being updated.
	q.applyBadMsg(parseBadMsg(encodeBadServerSalt(req.messageId, 1, 48, 0x777)));
	enforce(q.session.salt == 0x777, "new salt is adopted");
	q.applyBadMsg(parseBadMsg(encodeBadServerSalt(req.messageId, 1, 48, 0x888)));
	enforce(q.session.salt == 0x888, "a later bad_server_salt replaces the salt");
}
