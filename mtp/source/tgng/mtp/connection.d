/// Encrypted MTProto session on top of an authenticated connection.
///
/// Sends one query and waits for its `rpc_result`, handling message
/// containers, `bad_server_salt` and `msgs_ack` on the way.
module tgng.mtp.connection;

import tgng.mtp.container: PlainMessage, decryptMessage, encryptMessage;
import tgng.mtp.dh: DhTransport;
import tgng.mtp.rpc: RpcError, RpcQueue, isRpcError, isRpcResult, parseRpcError,
	parseRpcResult;
import tgng.mtp.service: isBadMsg, parseBadMsg;
import tgng.mtp.session: Session;

import std.bitmanip: littleEndianToNative;
import std.conv: hexString;
import std.exception: enforce;
import std.zlib: uncompress;

/// Reads a little-endian uint from the first four bytes of `b`.
private uint uintAt(const(ubyte)[] b) @safe pure nothrow
{
	return cast(uint) b[0] | cast(uint) b[1] << 8 | cast(uint) b[2] << 16
		| cast(uint) b[3] << 24;
}

/// Raised when the session cannot get an answer.
class ConnectionException: Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		super(msg, file, line);
	}
}

enum uint messageContainerId = 0x73F1F8DC;
enum uint gzipPackedId = 0x3072CFA1;
enum uint msgsAckReceivedId = 0x62D6B459;

/// Inflates a gzip or zlib stream; `winbits` 47 auto-detects the header.
private ubyte[] _gunzip(const(ubyte)[] data) @trusted
{
	return cast(ubyte[]) uncompress(data, 0, 47);
}

/// Unpacks the TL string inside a `gzip_packed#3072cfa1` body.
ubyte[] gzipPayload(const(ubyte)[] body) @safe
{
	enforce!ConnectionException(body.length >= 5, "truncated gzip_packed");
	size_t length;
	size_t offset;
	if (body[4] < 0xfe)
	{
		length = body[4];
		offset = 5;
	}
	else
	{
		enforce!ConnectionException(body.length >= 8, "truncated gzip_packed length");
		length = body[5] | cast(size_t) body[6] << 8 | cast(size_t) body[7] << 16;
		offset = 8;
	}
	enforce!ConnectionException(offset + length <= body.length, "truncated gzip_packed data");
	return _gunzip(body[offset .. offset + length]);
}

/// One query/answer exchange over a shared framed transport.
final class MtpConnection
{
	private
	{
		DhTransport _transport;
		ubyte[] _authKey;
		long _authKeyId;
		Session _session;
		RpcQueue _queue;
	}

	this(DhTransport transport, const(ubyte)[] authKey, long authKeyId,
		const(ubyte)[8] serverSalt, int timeOffset) @safe
	{
		_transport = transport;
		_authKey = authKey.dup;
		_authKeyId = authKeyId;
		_session = Session.random();
		_session.salt = littleEndianToNative!long(serverSalt[]);
		_session.counter.timeOffset = timeOffset;
		_queue.session = _session;
	}

	/// Sends `query` and returns its result body.
	///
	/// Server packets may carry acks, session and salt notices before the
	/// answer, so the loop keeps reading until the matching rpc_result.
	ubyte[] invoke(const(ubyte)[] query) @safe
	{
		auto msg = _queue.push(query);
		_send(msg);

		foreach (round; 0 .. 100)
		{
			foreach (body; _receiveAll())
			{
				if (isRpcResult(body))
				{
					auto r = parseRpcResult(body);
					if (r.reqMsgId != msg.messageId)
						continue;
					_queue.take(r.reqMsgId);
					if (isRpcError(r.result))
						throw parseRpcError(r.result);
					// Large results may arrive packed.
					if (r.result.length >= 4 && r.result.uintAt == gzipPackedId)
						return r.result.gzipPayload;
					return r.result;
				}
				if (isRpcError(body))
					throw parseRpcError(body);
				if (isBadMsg(body))
				{
					auto n = parseBadMsg(body);
					if (n.badMsgId != msg.messageId)
						continue;
					_queue.applyBadMsg(n);
					_session.salt = _queue.session.salt;
					msg = _queue.push(query);
					_send(msg);
				}
			}
		}
		throw new ConnectionException("no rpc_result for the query");
	}

	private void _send(ref const PlainMessage msg) @safe
	{
		_transport.send(encryptMessage(msg, _authKey, _authKeyId, true));
	}

	/// Receives one packet, decrypts it and flattens containers.
	private ubyte[][] _receiveAll() @safe
	{
		while (true)
		{
			auto packet = _transport.receive();
			// Transport errors throw in the frame layer; a 4-byte payload is a quick ack.
			if (packet.length == 4)
				continue;

			auto msg = decryptMessage(packet, _authKey, false);
			_queue.acknowledge(msg.messageId);

			ubyte[][] out_;
			_expand(msg.body, out_);
			return out_;
		}
	}

	private static void _expand(const(ubyte)[] body, ref ubyte[][] out_) @safe
	{
		enforce!ConnectionException(body.length >= 4, "empty MTProto body");
		switch (body.uintAt)
		{
		case messageContainerId:
			enforce!ConnectionException(body.length >= 8, "truncated container");
			immutable count = littleEndianToNative!uint(body[4 .. 8]);
			auto rest = body[8 .. $];
			foreach (_; 0 .. count)
			{
				enforce!ConnectionException(rest.length >= 16, "truncated container message");
				immutable length = littleEndianToNative!uint(rest[12 .. 16]);
				enforce!ConnectionException(rest.length >= 16 + length, "truncated container body");
				out_ ~= rest[16 .. 16 + length].dup;
				rest = rest[16 + length .. $];
			}
			break;
		case gzipPackedId:
			_expand(body.gzipPayload, out_);
			break;
		default:
			out_ ~= body.dup;
			break;
		}
	}
}

@safe unittest // a container is flattened into its messages
{
	ubyte[] msg1 = [1, 2, 3, 4];
	ubyte[] msg2 = [5, 6, 7, 8];
	auto body = new ubyte[8 + 16 + msg1.length + 16 + msg2.length];
	body[0 .. 4] = [0xDC, 0xF8, 0xF1, 0x73];
	body[4 .. 8] = [2, 0, 0, 0];

	// Each inner message is msg_id (8), seq_no (4), length (4), body.
	size_t at = 8;
	body[at + 12 .. at + 16] = [4, 0, 0, 0];
	body[at + 16 .. at + 20] = msg1;
	at += 16 + msg1.length;
	body[at + 12 .. at + 16] = [4, 0, 0, 0];
	body[at + 16 .. at + 20] = msg2;

	ubyte[][] out_;
	MtpConnection._expand(body, out_);
	enforce(out_.length == 2, "two messages");
	enforce(out_[0] == msg1, "first message");
	enforce(out_[1] == msg2, "second message");
}

@safe unittest // gzip_packed is unpacked and expanded
{
	// gzip of [1, 2, 3, 4], produced by `gzip -c`.
	immutable ubyte[29] packed = cast(immutable ubyte[])
		hexString!"1f8b08000000000002ff636462660100cdfb3cb604000000";
	auto body = new ubyte[5 + packed.length];
	body[0 .. 4] = [0xa1, 0xcf, 0x72, 0x30]; // gzip_packed#3072cfa1
	body[4] = packed.length;
	body[5 .. $] = packed[];

	ubyte[][] out_;
	MtpConnection._expand(body, out_);
	enforce(out_.length == 1, "one unpacked message");
	enforce(out_[0] == [1, 2, 3, 4], "gzip payload");
}
