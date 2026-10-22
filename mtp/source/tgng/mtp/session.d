/// MTProto session state: message ids, sequence numbers, salt and session id.
///
/// Reference: `td/mtproto/SessionConnection.cpp` and the MTProto 2.0 docs.
module tgng.mtp.session;

import tgng.mtp.crypto: randomBytes;

import std.bitmanip: littleEndianToNative;
import std.datetime.systime: Clock;
import std.exception: enforce;

/// Raised on session state violations.
class SessionException: Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		super(msg, file, line);
	}
}

/// Returns the current time in Unix seconds.
alias unixNow = () @trusted { return Clock.currTime.toUnixTime; };

/// Converts a message id to whole milliseconds since the Unix epoch.
///
/// A msg_id is `(time * 2^32) | fractional part in the lower 32 bits`;
/// the low 32 bits are ignored when converting back.
long msgIdToUnixMs(long msgId) @safe pure nothrow
{
	return msgId >>> 32;
}

/// Tracks outgoing message ids and sequence numbers.
struct MessageCounter
{
	/// Last emitted message id.
	long lastMsgId;
	/// Time correction against the server, in seconds.
	int timeOffset;
	/// Content-related messages sent so far.
	int contentRelated;
	/// Explicit clock override for tests, in Unix seconds; 0 means wall clock.
	long fixedNow;

	private long nowSeconds() const @safe
	{
		return (fixedNow != 0 ? fixedNow : unixNow()) + timeOffset;
	}

	/// Returns the next client message id: divisible by 4, monotonic,
	/// `time * 2^32` based.
	long nextMsgId() @safe
	{
		ubyte[4] rnd = void;
		randomBytes(rnd[]);
		long candidate = (nowSeconds() << 32) | (littleEndianToNative!uint(rnd[]) & ~3L);
		if (candidate <= lastMsgId)
			candidate = (lastMsgId + 4) & ~3L;
		lastMsgId = candidate;
		return candidate;
	}

	/// Returns the next seq_no for an outgoing message.
	int nextSeqNo(bool contentRelatedMessage) @safe
	{
		if (contentRelatedMessage)
		{
			immutable v = 2 * contentRelated + 1;
			++contentRelated;
			return v;
		}
		return 2 * contentRelated;
	}

	/// Registers a server message id seen on the wire.
	void observeServerMsgId(long msgId) @safe
	{
		// Server ids are even; the client only rejects its own parity.
	}

	/// Returns true if a msg_id has the server parity (odd).
	static bool isServerMsgId(long msgId) @safe pure nothrow
	{
		return (msgId & 1) == 1;
	}

	/// Applies a server time in Unix seconds to the local clock.
	void syncTime(int serverTime) @safe
	{
		timeOffset = serverTime - cast(int) (fixedNow != 0 ? fixedNow : unixNow());
	}
}

/// Per-connection session: session id, salt and counter.
struct Session
{
	long sessionId;
	long salt;
	MessageCounter counter;

	/// Creates a session with a random id.
	static Session random() @safe
	{
		Session s;
		ubyte[8] raw = void;
		randomBytes(raw[]);
		s.sessionId = littleEndianToNative!long(raw[]);
		return s;
	}
}

@safe unittest // msg_id is divisible by 4, monotonic and time-based
{
	MessageCounter c;
	c.fixedNow = 1_700_000_000;
	c.lastMsgId = 1_700_000_000_000L << 32;
	immutable prev = c.lastMsgId;
	immutable id = c.nextMsgId();
	enforce((id & 3) == 0, "client msg_id is divisible by 4");
	enforce(id > prev, "msg_id is monotonic");
	enforce(msgIdToUnixMs(id) >= 1_700_000_000L, "msg_id carries the time");
}

@safe unittest // seq_no alternates around content-related messages
{
	MessageCounter c;
	enforce(c.nextSeqNo(false) == 0, "first non-content seq_no");
	enforce(c.nextSeqNo(true) == 1, "first content seq_no");
	enforce(c.nextSeqNo(false) == 2, "second non-content seq_no");
	enforce(c.nextSeqNo(true) == 3, "second content seq_no");
}

@safe unittest // server msg_id parity
{
	enforce(MessageCounter.isServerMsgId(1), "odd ids are server ids");
	enforce(!MessageCounter.isServerMsgId(2), "even ids are client ids");
}

@safe unittest // time sync shifts the clock
{
	MessageCounter c;
	c.fixedNow = 1_000_000;
	c.syncTime(1_000_100);
	enforce(c.timeOffset == 100, "offset from server time");
}
