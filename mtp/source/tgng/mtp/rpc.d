/// Outgoing message queue and request/response matching for MTProto RPC.
///
/// Reference: `td/mtproto/SessionConnection.cpp` (message resend, rpc_result).
module tgng.mtp.rpc;

import tgng.mtp.container: PlainMessage, decryptMessage, encryptMessage;
import tgng.mtp.service: BadMsgNotification;
import tgng.mtp.session: MessageCounter, Session, msgIdToUnixMs;

import std.algorithm: max;
import std.algorithm.searching: startsWith;
import std.array: appender;
import std.bitmanip: littleEndianToNative, nativeToLittleEndian;
import std.conv: to;
import std.exception: enforce;

/// Raised on RPC state violations.
class RpcException: Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		super(msg, file, line);
	}
}

enum uint rpcResultId = 0xf35c6d01;
enum uint rpcErrorId = 0x2144ca19;
enum uint msgsAckId = 0x62d6b459;

/// One request waiting for its answer.
struct PendingRequest
{
	long messageId;
	ubyte[] body;
	/// Milliseconds since the request was sent.
	long elapsedMs;
	/// Number of transmissions so far.
	int attempts;
}

/// RPC error returned by the server.
class RpcError: Exception
{
	int code;
	string text;

	this(int code, string text, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		this.code = code;
		this.text = text;
		super(text, file, line);
	}
}

/// Decoded `rpc_result#f35c6d01 req_msg_id:long result:Object`.
struct RpcResult
{
	long reqMsgId;
	ubyte[] result;
}

/// Decodes an RPC result body; the leading constructor id must be rpc_result.
RpcResult parseRpcResult(const(ubyte)[] body) @safe
{
	enforce!RpcException(body.length >= 12, "rpc_result is truncated");
	immutable id = littleEndianToNative!uint(body[0 .. 4]);
	enforce!RpcException(id == rpcResultId, "not an rpc_result");
	RpcResult r;
	r.reqMsgId = littleEndianToNative!long(body[4 .. 12]);
	r.result = body[12 .. $].dup;
	return r;
}

/// Returns true when `body` starts with the rpc_result constructor.
bool isRpcResult(const(ubyte)[] body) @safe pure nothrow
{
	return body.length >= 4 && littleEndianToNative!uint(body[0 .. 4]) == rpcResultId;
}

/// Returns true when `body` starts with the rpc_error constructor.
bool isRpcError(const(ubyte)[] body) @safe pure nothrow
{
	return body.length >= 4 && littleEndianToNative!uint(body[0 .. 4]) == rpcErrorId;
}

/// Decodes `rpc_error#2144ca19 error_code:int error_message:string`.
RpcError parseRpcError(const(ubyte)[] body) @safe
{
	enforce!RpcException(body.length >= 9, "rpc_error is truncated");
	immutable code = littleEndianToNative!int(body[4 .. 8]);
	immutable len = body[8];
	enforce!RpcException(9 + len <= body.length, "rpc_error message is truncated");
	return new RpcError(code, cast(string) body[9 .. 9 + len].idup);
}

/// Serialises `rpc_error`.
ubyte[] encodeRpcError(int code, string text) @safe
{
	auto buf = new ubyte[9 + text.length];
	buf[0 .. 4] = nativeToLittleEndian(rpcErrorId)[];
	buf[4 .. 8] = nativeToLittleEndian(code)[];
	buf[8] = cast(ubyte) text.length;
	buf[9 .. $] = cast(const(ubyte)[]) text;
	return buf;
}

/// Serialises an `rpc_result` wrapping `result`.
ubyte[] encodeRpcResult(long reqMsgId, const(ubyte)[] result) @safe
{
	auto buf = new ubyte[12 + result.length];
	buf[0 .. 4] = nativeToLittleEndian(rpcResultId)[];
	buf[4 .. 12] = nativeToLittleEndian(reqMsgId)[];
	buf[12 .. $] = result;
	return buf;
}

/// Returns the target DC from `PHONE_MIGRATE_x` / `NETWORK_MIGRATE_x` /
/// `USER_MIGRATE_x`, or 0 when the text is something else.
int migrationDc(string text) @safe
{
	foreach (prefix; ["PHONE_MIGRATE_", "NETWORK_MIGRATE_", "USER_MIGRATE_"])
	{
		if (!text.startsWith(prefix))
			continue;
		return _intOr0(text[prefix.length .. $]);
	}
	return 0;
}

/// Returns the wait in seconds from `FLOOD_WAIT_x` / `FLOOD_PREMIUM_WAIT_x`,
/// or 0 when the text is something else.
int floodWaitSeconds(string text) @safe
{
	foreach (prefix; ["FLOOD_WAIT_", "FLOOD_PREMIUM_WAIT_"])
	{
		if (!text.startsWith(prefix))
			continue;
		return _intOr0(text[prefix.length .. $]);
	}
	return 0;
}

/// Parses a non-negative integer, returning 0 for anything else.
private int _intOr0(string text) @safe
{
	if (text.length == 0)
		return 0;
	foreach (c; text)
		if (c < '0' || c > '9')
			return 0;
	return to!int(text);
}

/// Serialises `msgs_ack#62d6b459 msg_ids:Vector long`.
ubyte[] encodeMsgsAck(const(long)[] msgIds) @safe
{
	auto buf = new ubyte[8 + 8 * msgIds.length];
	buf[0 .. 4] = nativeToLittleEndian(msgsAckId)[];
	buf[4 .. 8] = nativeToLittleEndian(0x1cb5c415)[]; // vector
	foreach (i, id; msgIds)
		buf[8 + 8 * i .. 16 + 8 * i] = nativeToLittleEndian(id)[];
	return buf;
}

/// Incremental RPC (time, seq_no windows, replay) and duplicate tracker.
///
/// Reference: `td/mtproto/AuthData.cpp` (`check_packet`, `MessageIdDuplicateChecker`).
struct MessageIdDuplicateChecker(size_t maxSize = 1000)
{
	/// Saved ids are kept sorted; the oldest half is dropped once full.
	long[2 * maxSize] saved;
	size_t end;

	/// Returns true when `msgId` is new and stores it; false on a duplicate or an old id.
	bool check(long msgId) @safe
	{
		if (end == 2 * maxSize)
		{
			saved[0 .. maxSize] = saved[maxSize .. 2 * maxSize];
			end = maxSize;
		}
		if (end == 0 || msgId > saved[end - 1])
		{
			saved[end++] = msgId;
			return true;
		}
		if (end >= maxSize && msgId < saved[0])
			return false;
		size_t lo = 0, hi = end;
		while (lo < hi)
		{
			immutable mid = (lo + hi) / 2;
			if (saved[mid] < msgId)
				lo = mid + 1;
			else
				hi = mid;
		}
		if (saved[lo] == msgId)
			return false;
		saved[lo + 1 .. end + 1] = saved[lo .. end];
		saved[lo] = msgId;
		++end;
		return true;
	}
}

/// Validates incoming plain messages: session, parity and time windows.
struct IncomingFilter
{
	long sessionId;
	/// Server time minus local time, in seconds; 0 means not synchronised yet.
	long timeOffset;
	MessageIdDuplicateChecker!1000 duplicates;

	/// Returns true when the message is fresh and passes the checks.
	bool accept(ref const PlainMessage msg, long nowSeconds) @safe
	{
		if (msg.sessionId != sessionId)
			return false;
		// Server ids are odd, client ids are divisible by 4.
		if ((msg.messageId & 1) == 0)
			return false;
		if (!duplicates.check(msg.messageId))
			return false;
		// Over 30 s in the future or over 300 s in the past is ignored.
		immutable idTime = msgIdToUnixMs(msg.messageId);
		immutable serverTime = nowSeconds + timeOffset;
		return idTime > serverTime - 300 && idTime < serverTime + 30;
	}
}

/// Builds outgoing messages, tracks pending RPC calls and resends them.
struct RpcQueue
{
	Session session;
	PendingRequest[] pending;
	/// Resend timeout; TDLib retries every 10 seconds.
	long resendTimeoutMs = 10_000;
	/// Acks owed to the server, batched on the next outgoing message.
	long[] pendingAcks;

	/// Registers a request and returns its outgoing plain message.
	PlainMessage push(const(ubyte)[] body, bool contentRelated = true) @safe
	{
		PlainMessage msg;
		msg.salt = session.salt;
		msg.sessionId = session.sessionId;
		msg.messageId = session.counter.nextMsgId();
		msg.seqNo = session.counter.nextSeqNo(contentRelated);
		msg.body = body.dup;

		PendingRequest p;
		p.messageId = msg.messageId;
		p.body = body.dup;
		pending ~= p;
		return msg;
	}

	/// Queues an incoming server msg_id to be acknowledged.
	void acknowledge(long serverMsgId) @safe
	{
		pendingAcks ~= serverMsgId;
	}

	/// Drains the queued acks into one `msgs_ack` body, or null when empty.
	ubyte[] takeAcks() @safe
	{
		if (pendingAcks.length == 0)
			return null;
		auto body = encodeMsgsAck(pendingAcks);
		pendingAcks = null;
		return body;
	}

	/// Finds the pending request matched by an incoming `rpc_result`.
	ref PendingRequest requestFor(long reqMsgId) @safe
	{
		foreach (ref p; pending)
			if (p.messageId == reqMsgId)
				return p;
		throw new RpcException("no pending request for rpc_result");
	}

	/// Removes and returns the request answered by `reqMsgId`.
	PendingRequest take(long reqMsgId) @safe
	{
		foreach (i, ref p; pending)
			if (p.messageId == reqMsgId)
			{
				auto result = pending[i];
				pending = pending[0 .. i] ~ pending[i + 1 .. $];
				return result;
			}
		throw new RpcException("no pending request for rpc_result");
	}

	/// Applies a server complaint: adopts the salt and corrects the clock,
	/// then keeps or drops the offending request depending on the code.
	void applyBadMsg(const BadMsgNotification n) @safe
	{
		switch (n.errorCode)
		{
		case 16: // msg_id too low
			session.counter.timeOffset += 1;
			break;
		case 17: // msg_id too high
			session.counter.timeOffset -= 1;
			break;
		case 32: // seq_no too low
			session.counter.contentRelated = max(0, n.badSeqNo / 2 + 1);
			break;
		case 48: // incorrect server salt
			break;
		default:
			break;
		}
		if (n.hasSalt)
			session.salt = n.newSalt;

		foreach (i, ref p; pending)
			if (p.messageId == n.badMsgId)
			{
				if (n.errorCode == 32)
				{
					p.elapsedMs = resendTimeoutMs;
					p.attempts = 0;
				}
				else
					pending = pending[0 .. i] ~ pending[i + 1 .. $];
				break;
			}
	}

	/// Advances timers and returns requests due for a resend.
	PlainMessage[] dueResends(long deltaMs) @safe
	{
		auto out_ = appender!(PlainMessage[])();
		foreach (ref p; pending)
		{
			p.elapsedMs += deltaMs;
			if (p.elapsedMs < resendTimeoutMs)
				continue;
			p.elapsedMs = 0;
			++p.attempts;
			PlainMessage msg;
			msg.salt = session.salt;
			msg.sessionId = session.sessionId;
			msg.messageId = p.messageId; // resends keep the original id
			msg.seqNo = session.counter.nextSeqNo(true);
			msg.body = p.body.dup;
			out_.put(msg);
		}
		return out_.data;
	}

	/// Number of unanswered requests.
	size_t length() const @safe pure nothrow
	{
		return pending.length;
	}
}

@safe unittest // migration and flood hints are read from the error text
{
	enforce(migrationDc("PHONE_MIGRATE_1") == 1, "phone migrate");
	enforce(migrationDc("NETWORK_MIGRATE_4") == 4, "network migrate");
	enforce(migrationDc("USER_MIGRATE_2") == 2, "user migrate");
	enforce(migrationDc("FLOOD_WAIT_3") == 0, "not a migration");

	enforce(floodWaitSeconds("FLOOD_WAIT_12") == 12, "flood wait");
	enforce(floodWaitSeconds("FLOOD_PREMIUM_WAIT_7") == 7, "premium flood wait");
	enforce(floodWaitSeconds("PHONE_MIGRATE_1") == 0, "not a flood wait");
	enforce(floodWaitSeconds("FLOOD_WAIT_") == 0, "missing number");
}

@safe unittest // rpc_result round trip and matching
{
	RpcQueue q;
	q.session = Session.random();
	auto body = cast(ubyte[]) "\x01\x02\x03\x04".dup;
	auto msg = q.push(body);
	enforce((msg.messageId & 3) == 0, "request msg_id is divisible by 4");
	enforce(q.length == 1, "request is pending");

	auto reply = encodeRpcResult(msg.messageId, body);
	auto parsed = parseRpcResult(reply);
	enforce(parsed.reqMsgId == msg.messageId, "req_msg_id round trip");
	enforce(parsed.result == body, "result round trip");
	enforce(q.requestFor(msg.messageId).messageId == msg.messageId, "request is found");
	enforce(q.take(msg.messageId).body == body, "request is taken");
	enforce(q.length == 0, "queue is empty after the answer");
}

@safe unittest // rpc_error encoding and parsing
{
	auto body = encodeRpcError(420, "FLOOD_WAIT_5");
	enforce(isRpcError(body), "rpc_error id is recognised");
	auto e = parseRpcError(body);
	enforce(e.code == 420, "error code round trip");
	enforce(e.text == "FLOOD_WAIT_5", "error text round trip");
}

@safe unittest // msgs_ack layout
{
	auto body = encodeMsgsAck([1L, 2L]);
	enforce(body.length == 8 + 16, "ack length");
	enforce(littleEndianToNative!uint(body[0 .. 4]) == msgsAckId, "ack id");
	enforce(littleEndianToNative!long(body[8 .. 16]) == 1, "first ack");
}

@safe unittest // resend keeps the msg_id and fires after the timeout
{
	RpcQueue q;
	q.session = Session.random();
	q.resendTimeoutMs = 100;
	auto msg = q.push(cast(ubyte[]) "x".dup);
	enforce(q.dueResends(50).length == 0, "not due yet");
	auto due = q.dueResends(60);
	enforce(due.length == 1, "one resend is due");
	enforce(due[0].messageId == msg.messageId, "resend keeps the msg_id");
	enforce(q.pending[0].attempts == 1, "attempt is counted");
}

@safe unittest // duplicate checker keeps fresh ids and drops repeats and very old ones
{
	MessageIdDuplicateChecker!4 c;
	enforce(c.check(10), "first id is new");
	enforce(c.check(30), "higher id is new");
	enforce(c.check(20), "out-of-order id is still new");
	enforce(!c.check(20), "repeat is dropped");
	enforce(c.check(40), "next id is new");
	enforce(c.check(50), "next id is new");
	enforce(c.check(60), "next id is new");
	enforce(c.check(70), "next id is new");
	enforce(!c.check(5), "very old id is dropped");
}

@safe unittest // incoming filter rejects foreign sessions, odd ids and stale times
{
	IncomingFilter f;
	f.sessionId = 42;
	f.timeOffset = 0;
	immutable now = 1_700_000_000L;

	PlainMessage msg;
	msg.sessionId = 42;
	msg.messageId = (now << 32) | 1; // odd, current time
	enforce(f.accept(msg, now), "fresh server message is accepted");
	enforce(!f.accept(msg, now), "duplicate is rejected");

	msg.messageId = (now << 32) | 2; // even: client parity
	enforce(!f.accept(msg, now), "client parity is rejected");

	msg.messageId = ((now - 400) << 32) | 1;
	enforce(!f.accept(msg, now), "too old message is rejected");

	msg.messageId = ((now + 60) << 32) | 1;
	enforce(!f.accept(msg, now), "too future message is rejected");

	msg.sessionId = 7;
	msg.messageId = (now << 32) | 4;
	enforce(!f.accept(msg, now), "foreign session is rejected");
}

@safe unittest // acks are batched and drained once
{
	RpcQueue q;
	q.session = Session.random();
	enforce(q.takeAcks() is null, "no acks initially");
	q.acknowledge(2);
	q.acknowledge(4);
	auto body = q.takeAcks();
	enforce(body !is null, "acks are produced");
	enforce(littleEndianToNative!uint(body[0 .. 4]) == msgsAckId, "ack constructor");
	enforce(q.takeAcks() is null, "acks are drained");
}
