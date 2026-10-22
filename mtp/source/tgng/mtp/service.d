/// MTProto service messages: containers, acknowledgements, bad_msg and ping.
///
/// Reference: `td/mtproto/SessionConnection.cpp` and `mtproto_api.tl`.
module tgng.mtp.service;

import std.bitmanip: littleEndianToNative, nativeToLittleEndian;
import std.exception: enforce;

/// Raised on malformed service messages.
class ServiceException: Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		super(msg, file, line);
	}
}

enum uint msgContainerId = 0x73f1f8dc;
enum uint badMsgNotificationId = 0xa7eff811;
enum uint badServerSaltId = 0xedab447b;
enum uint pingId = 0x7abe77ec;
enum uint pongId = 0x347773c5;
enum uint vectorId = 0x1cb5c415;

/// One message inside a container.
struct ContainerMessage
{
	long messageId;
	int seqNo;
	ubyte[] body;
}

/// Builds `msg_container#73f1f8dc messages:vector<%Message>`.
ubyte[] encodeMsgContainer(const(ContainerMessage)[] msgs) @safe
{
	size_t size = 12;
	foreach (ref m; msgs)
		size += 4 + 12 + m.body.length;
	auto buf = new ubyte[size];
	buf[0 .. 4] = nativeToLittleEndian(msgContainerId)[];
	buf[4 .. 8] = nativeToLittleEndian(vectorId)[];
	buf[8 .. 12] = nativeToLittleEndian(cast(int) msgs.length)[];
	size_t off = 12;
	foreach (ref m; msgs)
	{
		buf[off .. off + 4] = nativeToLittleEndian(cast(int) (12 + m.body.length))[];
		buf[off + 4 .. off + 12] = nativeToLittleEndian(m.messageId)[];
		buf[off + 12 .. off + 16] = nativeToLittleEndian(m.seqNo)[];
		buf[off + 16 .. off + 16 + m.body.length] = m.body;
		off += 16 + m.body.length;
	}
	return buf;
}

/// Returns true when `body` starts with the msg_container constructor.
bool isMsgContainer(const(ubyte)[] body) @safe pure nothrow
{
	return body.length >= 4 && littleEndianToNative!uint(body[0 .. 4]) == msgContainerId;
}

/// Parses `msg_container`; each inner body is checked against its declared length.
ContainerMessage[] parseMsgContainer(const(ubyte)[] body) @safe
{
	enforce!ServiceException(body.length >= 12, "msg_container is truncated");
	enforce!ServiceException(isMsgContainer(body), "not a msg_container");
	ubyte[4] vecBytes = body[4 .. 8];
	enforce!ServiceException(littleEndianToNative!uint(vecBytes) == vectorId, "msg_container without vector");
	ubyte[4] countBytes = body[8 .. 12];
	immutable count = littleEndianToNative!int(countBytes);
	enforce!ServiceException(count >= 0, "negative container size");

	ContainerMessage[] out_;
	size_t off = 12;
	foreach (_; 0 .. count)
	{
		enforce!ServiceException(off + 16 <= body.length, "container message header is truncated");
		ubyte[4] lenBytes = body[off .. off + 4];
		immutable length = littleEndianToNative!int(lenBytes);
		enforce!ServiceException(length >= 8, "container message is shorter than its id");
		enforce!ServiceException(off + 4 + cast(size_t) length <= body.length, "container message is truncated");
		ContainerMessage m;
		ubyte[8] idBytes = body[off + 4 .. off + 12];
		ubyte[4] seqBytes = body[off + 12 .. off + 16];
		m.messageId = littleEndianToNative!long(idBytes);
		m.seqNo = littleEndianToNative!int(seqBytes);
		m.body = body[off + 16 .. off + 4 + cast(size_t) length].dup;
		out_ ~= m;
		off += 4 + cast(size_t) length;
	}
	enforce!ServiceException(off == body.length, "trailing bytes after container");
	return out_;
}

/// A `bad_msg_notification` or `bad_server_salt`.
struct BadMsgNotification
{
	long badMsgId;
	int badSeqNo;
	int errorCode;
	/// Only for bad_server_salt.
	bool hasSalt;
	long newSalt;
}

/// Returns true when `body` starts with either bad message constructor.
bool isBadMsg(const(ubyte)[] body) @safe pure nothrow
{
	if (body.length < 4)
		return false;
	immutable id = littleEndianToNative!uint(body[0 .. 4]);
	return id == badMsgNotificationId || id == badServerSaltId;
}

/// Parses `bad_msg_notification` or `bad_server_salt`.
BadMsgNotification parseBadMsg(const(ubyte)[] body) @safe
{
	enforce!ServiceException(body.length >= 20, "bad_msg is truncated");
	immutable id = littleEndianToNative!uint(body[0 .. 4]);
	enforce!ServiceException(id == badMsgNotificationId || id == badServerSaltId, "not a bad_msg message");
	BadMsgNotification v;
	v.badMsgId = littleEndianToNative!long(body[4 .. 12]);
	v.badSeqNo = littleEndianToNative!int(body[12 .. 16]);
	v.errorCode = littleEndianToNative!int(body[16 .. 20]);
	v.hasSalt = id == badServerSaltId;
	if (v.hasSalt)
	{
		enforce!ServiceException(body.length >= 28, "bad_server_salt is truncated");
		ubyte[8] saltBytes = body[20 .. 28].dup;
		v.newSalt = littleEndianToNative!long(saltBytes);
	}
	return v;
}

/// Serialises `bad_msg_notification`.
ubyte[] encodeBadMsgNotification(long badMsgId, int badSeqNo, int errorCode) @safe
{
	auto buf = new ubyte[20];
	buf[0 .. 4] = nativeToLittleEndian(badMsgNotificationId)[];
	buf[4 .. 12] = nativeToLittleEndian(badMsgId)[];
	buf[12 .. 16] = nativeToLittleEndian(badSeqNo)[];
	buf[16 .. 20] = nativeToLittleEndian(errorCode)[];
	return buf;
}

/// Serialises `bad_server_salt`.
ubyte[] encodeBadServerSalt(long badMsgId, int badSeqNo, int errorCode, long newSalt) @safe
{
	auto buf = new ubyte[28];
	buf[0 .. 4] = nativeToLittleEndian(badServerSaltId)[];
	buf[4 .. 12] = nativeToLittleEndian(badMsgId)[];
	buf[12 .. 16] = nativeToLittleEndian(badSeqNo)[];
	buf[16 .. 20] = nativeToLittleEndian(errorCode)[];
	buf[20 .. 28] = nativeToLittleEndian(newSalt)[];
	return buf;
}

/// `ping#7abe77ec ping_id:long`; the server answers with `pong`.
ubyte[] encodePing(long pingId) @safe
{
	auto buf = new ubyte[12];
	buf[0 .. 4] = nativeToLittleEndian(cast(uint) 0x7abe77ec)[];
	buf[4 .. 12] = nativeToLittleEndian(pingId)[];
	return buf;
}

/// `ping_delay_disconnect#f3427b8c ping_id:long disconnect_delay:int`.
ubyte[] encodePingDelayDisconnect(long pingId, int disconnectDelay) @safe
{
	auto buf = new ubyte[16];
	buf[0 .. 4] = nativeToLittleEndian(0xf3427b8c)[];
	buf[4 .. 12] = nativeToLittleEndian(pingId)[];
	buf[12 .. 16] = nativeToLittleEndian(disconnectDelay)[];
	return buf;
}

/// A decoded `pong`.
struct Pong
{
	long messageId;
	long pingId;
}

/// Returns true when `body` starts with the pong constructor.
bool isPong(const(ubyte)[] body) @safe pure nothrow
{
	return body.length >= 4 && littleEndianToNative!uint(body[0 .. 4]) == pongId;
}

/// Parses `pong#347773c5 msg_id:long ping_id:long`.
Pong parsePong(const(ubyte)[] body) @safe
{
	enforce!ServiceException(body.length >= 20, "pong is truncated");
	enforce!ServiceException(isPong(body), "not a pong");
	Pong v;
	v.messageId = littleEndianToNative!long(body[4 .. 12]);
	v.pingId = littleEndianToNative!long(body[12 .. 20]);
	return v;
}

/// Serialises `pong`.
ubyte[] encodePong(long messageId, long pingId) @safe
{
	auto buf = new ubyte[20];
	buf[0 .. 4] = nativeToLittleEndian(pongId)[];
	buf[4 .. 12] = nativeToLittleEndian(messageId)[];
	buf[12 .. 20] = nativeToLittleEndian(pingId)[];
	return buf;
}

@safe unittest // container round trip
{
	ContainerMessage a = {messageId: 11, seqNo: 1, body: cast(ubyte[]) "abc".dup};
	ContainerMessage b = {messageId: 22, seqNo: 2, body: new ubyte[5]};
	auto wire = encodeMsgContainer([a, b]);
	enforce(isMsgContainer(wire), "container constructor");
	auto parsed = parseMsgContainer(wire);
	enforce(parsed.length == 2, "container size");
	enforce(parsed[0].messageId == 11 && parsed[0].seqNo == 1, "first header");
	enforce(parsed[0].body == a.body, "first body");
	enforce(parsed[1].messageId == 22 && parsed[1].body.length == 5, "second message");
}

@safe unittest // truncated container is rejected
{
	ContainerMessage a = {messageId: 11, seqNo: 1, body: cast(ubyte[]) "abc".dup};
	auto wire = encodeMsgContainer([a]);
	bool thrown = false;
	try
		parseMsgContainer(wire[0 .. $ - 1]);
	catch (ServiceException)
		thrown = true;
	enforce(thrown, "short container must fail");
}

@safe unittest // bad_msg variants round trip
{
	auto n = parseBadMsg(encodeBadMsgNotification(5, 3, 16));
	enforce(n.badMsgId == 5 && n.badSeqNo == 3 && n.errorCode == 16, "bad_msg_notification fields");
	enforce(!n.hasSalt, "notification has no salt");

	auto s = parseBadMsg(encodeBadServerSalt(7, 1, 48, 0x1122334455667788L));
	enforce(s.errorCode == 48 && s.hasSalt, "bad_server_salt fields");
	enforce(s.newSalt == 0x1122334455667788L, "new salt");
	enforce(isBadMsg(encodeBadServerSalt(7, 1, 48, 0)), "bad_server_salt is recognised");
}

@safe unittest // ping and pong round trip
{
	auto ping = encodePing(0x1234_5678L);
	enforce(littleEndianToNative!uint(ping[0 .. 4]) == pingId, "ping constructor");
	enforce(littleEndianToNative!long(ping[4 .. 12]) == 0x1234_5678L, "ping id");

	auto pong = parsePong(encodePong(99, 0x1234_5678L));
	enforce(pong.messageId == 99 && pong.pingId == 0x1234_5678L, "pong fields");
	enforce(isPong(encodePong(99, 1)), "pong is recognised");
}
