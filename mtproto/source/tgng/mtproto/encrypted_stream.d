/// MTProto encrypted transport wrapper (MTProto 2.0).
///
/// Sits above framing in the chain
/// TCP -> SOCKS5 -> obfuscated2 -> framing -> encryption.
/// `write` accepts one assembled plaintext MTProto message and produces a
/// complete encrypted packet. `read` returns one decrypted plaintext message.
module tgng.mtproto.encrypted_stream;

import vibe.core.stream: ConnectionStream, IOMode, blocking;

import tgng.mtproto.crypto: aesIgeDecrypt, aesIgeEncrypt, randomBytes, sha256;

import core.time: Duration;
import std.bitmanip: littleEndianToNative, nativeToLittleEndian;
import std.datetime: Clock;
import std.exception: enforce;

@safe:

/// Error raised for malformed encrypted packets.
class EncryptedStreamException : Exception
{
	this(string msg) @safe pure nothrow
	{
		super(msg);
	}
}

/// Size of the auth key material (256 bits).
private enum AuthKeySize = 256;
/// Length of `auth_key_id`, `msg_key`, `salt` and `session_id` fields.
private enum AuthKeyIdSize = 8;
private enum MsgKeySize = 16;
private enum SaltSize = 8;
private enum SessionIdSize = 8;

/// AES block size.
private enum BlockSize = 16;

/// Result of one AES-IGE key derivation for a message.
private struct MessageKeys
{
	ubyte[32] aesKey;
	ubyte[32] aesIv;
}

/// Derives the AES key and IV from `authKey` and `msgKey` (KDF2).
///
/// `x` is 0 for client-to-server messages and 8 for server-to-client ones.
private MessageKeys deriveKeys(const(ubyte)[AuthKeySize] authKey, const(ubyte)[] msgKey, uint x) @trusted
{
	enforce(msgKey.length == MsgKeySize, new EncryptedStreamException("msg_key must be 16 bytes."));

	ubyte[MsgKeySize + 36] buf;
	buf[0 .. MsgKeySize] = msgKey[];
	buf[MsgKeySize .. $] = authKey[88 + x .. 88 + x + 36];
	auto sha = sha256(buf);

	MessageKeys keys;
	keys.aesKey[0 .. 8] = sha[0 .. 8];
	keys.aesIv[0 .. 8] = sha[8 .. 16];

	// sha256(auth_key[96+x .. 96+x+32] + msg_key + auth_key[128+x .. 128+x+32])
	ubyte[32 + MsgKeySize + 32] buf2;
	buf2[0 .. 32] = authKey[96 + x .. 96 + x + 32];
	buf2[32 .. 32 + MsgKeySize] = msgKey[];
	buf2[32 + MsgKeySize .. $] = authKey[128 + x .. 128 + x + 32];
	auto sha2 = sha256(buf2);
	keys.aesKey[8 .. 32] = sha2[0 .. 24];
	keys.aesIv[8 .. 24] = sha2[24 .. 40];
	return keys;
}

/// Computes `msg_key` for `toEncrypt` (from `salt` through the padding).
///
/// `x` selects the auth key slice: 0 for client-to-server, 8 otherwise.
private ubyte[MsgKeySize] computeMsgKey(const(ubyte)[AuthKeySize] authKey, const(ubyte)[] toEncrypt, uint x) @trusted
{
	enforce(toEncrypt.length >= 32, new EncryptedStreamException("Encrypted payload is too short."));
	enforce(authKey.length >= 88 + x + 32, new EncryptedStreamException("Auth key is too short."));
	auto buf = new ubyte[32 + toEncrypt.length];
	buf[0 .. 32] = authKey[88 + x .. 88 + x + 32];
	buf[32 .. $] = toEncrypt[];
	auto digest = sha256(buf);
	ubyte[MsgKeySize] msgKey;
	msgKey[] = digest[8 .. 24];
	return msgKey;
}

/// Chooses the smallest legal padded size of the encrypted part.
///
/// `dataSize` is the plaintext message length. The encrypted part holds
/// salt + session_id + msg_id + seq_no + length + data + padding.
private size_t calcPaddedSize(size_t dataSize)
{
	enum prefixSize = SaltSize + SessionIdSize + 8 + 4 + 4;
	enum minPadding = 12;
	auto encryptedSize = (prefixSize + dataSize + minPadding + 15) & ~cast(size_t) 15;

	static immutable size_t[] basicSizes = [64, 128, 192, 256, 384, 512, 768, 1024, 1280];
	foreach (size; basicSizes)
		if (encryptedSize <= size)
			return size;

	return (encryptedSize - 1280 + 447) / 448 * 448 + 1280;
}

/// Stream wrapper that encrypts/decrypts MTProto messages.
final class EncryptedStream: ConnectionStream
{
	private
	{
		ConnectionStream _inner;
		ubyte[AuthKeySize] _authKey;
		bool _server;
		ubyte[AuthKeyIdSize] _authKeyId;
		long _salt;
		long _sessionId;
		ubyte[] _pending;
		size_t _pendingOffset;
		long _lastMsgId;
		uint _seqNo;
	}

	/// Wraps `inner` with MTProto 2.0 encryption.
	///
	/// `authKey` is the negotiated 256-byte key, `authKeyId` its identifier
	/// (low 64 bits of `sha256(authKey)`), `server` selects the direction:
	/// `false` for client-to-server, `true` for server-to-client.
	this(ConnectionStream inner, const(ubyte)[] authKey, long authKeyId,
		long salt, long sessionId, bool server = false)
	{
		enforce(authKey.length == AuthKeySize, new EncryptedStreamException("Auth key must be 256 bytes."));
		_inner = inner;
		_authKey[] = authKey[];
		_authKeyId[] = nativeToLittleEndian(authKeyId)[0 .. 8];
		_salt = salt;
		_sessionId = sessionId;
		_server = server;
	}

	/// Updates the salt sent with outgoing messages.
	void setSalt(long salt) { _salt = salt; }

	/// Updates the session identifier.
	void setSessionId(long sessionId) { _sessionId = sessionId; }

	@property bool connected() const { return _inner.connected; }

	void close() @blocking { _inner.close(); }

	bool waitForData(Duration timeout = Duration.max) @blocking
	{
		if (_pendingOffset < _pending.length) return true;
		return _inner.waitForData(timeout);
	}

	@property bool empty() @blocking
	{
		if (_pendingOffset < _pending.length) return false;
		return !_readFrame();
	}

	@property ulong leastSize() @blocking
	{
		if (_pendingOffset < _pending.length) return _pending.length - _pendingOffset;
		if (!_readFrame()) return 0;
		return _pending.length - _pendingOffset;
	}

	@property bool dataAvailableForRead()
	{
		return _pendingOffset < _pending.length || _inner.dataAvailableForRead;
	}

	const(ubyte)[] peek()
	{
		if (_pendingOffset < _pending.length)
			return _pending[_pendingOffset .. $];
		return null;
	}

	size_t read(scope ubyte[] dst, IOMode mode) @blocking
	{
		size_t total;
		while (total < dst.length)
		{
			if (_pendingOffset >= _pending.length && !_readFrame()) break;
			auto n = dst.length - total;
			auto avail = _pending.length - _pendingOffset;
			if (n > avail) n = avail;
			dst[total .. total + n] = _pending[_pendingOffset .. _pendingOffset + n];
			_pendingOffset += n;
			total += n;
			if (mode == IOMode.once) break;
		}
		return total;
	}

	/// Encrypts a body using transport-managed counters.
	///
	/// Prefer `writeMessage` when the `msg_id`/`seq_no` come from the RPC
	/// layer; this overload exists to satisfy `ConnectionStream`.
	size_t write(scope const(ubyte)[] bytes, IOMode mode) @blocking
	{
		return writeMessage(_nextMsgId(), cast(int) _nextSeqNo(), bytes, mode);
	}

	/// Encrypts one plaintext message body with an explicit message id.
	///
	/// `msgId` and `seqNo` are supplied by the RPC layer (`RpcContext`); the
	/// body is the serialised message without the transport header.
	size_t writeMessage(long msgId, int seqNo, scope const(ubyte)[] body, IOMode mode) @blocking
	{
		enforce(mode == IOMode.all, "EncryptedStream supports only IOMode.all for writes.");
		enforce(body.length > 0, "Cannot encrypt an empty MTProto message.");

		enum prefixSize = SaltSize + SessionIdSize + 8 + 4 + 4;
		auto paddedSize = calcPaddedSize(body.length);
		enforce(paddedSize >= prefixSize + body.length, new EncryptedStreamException("Padded size is smaller than the payload."));

		auto plain = new ubyte[paddedSize];
		size_t o;
		plain[o .. o + 8] = nativeToLittleEndian(_salt)[0 .. 8];
		o += 8;
		plain[o .. o + 8] = nativeToLittleEndian(_sessionId)[0 .. 8];
		o += 8;
		plain[o .. o + 8] = nativeToLittleEndian(msgId)[0 .. 8];
		o += 8;
		plain[o .. o + 4] = nativeToLittleEndian(cast(uint) seqNo)[0 .. 4];
		o += 4;
		plain[o .. o + 4] = nativeToLittleEndian(cast(uint) body.length)[0 .. 4];
		o += 4;
		plain[o .. o + body.length] = body[];
		o += body.length;
		randomBytes(plain[o .. paddedSize]);

		auto x = _server ? 8 : 0;
		auto msgKey = computeMsgKey(_authKey, plain, x);
		auto keys = deriveKeys(_authKey, msgKey, x);

		auto out_ = new ubyte[AuthKeyIdSize + MsgKeySize + paddedSize];
		out_[0 .. 8] = _authKeyId[];
		out_[8 .. 8 + MsgKeySize] = msgKey[];
		out_[AuthKeyIdSize + MsgKeySize .. $] = plain[];
		aesIgeEncrypt(out_[AuthKeyIdSize + MsgKeySize .. $], keys.aesKey, keys.aesIv);

		_inner.write(out_, IOMode.all);
		return body.length;
	}

	void flush() @blocking { _inner.flush(); }
	void finalize() @blocking { _inner.finalize(); }

	/// Reads and decrypts one packet into `_pending`.
	private bool _readFrame() @blocking
	{
		if (_inner.empty) return false;

		// Header: auth_key_id + msg_key. The encrypted part follows as one
		// physical packet delivered by the framing layer below.
		ubyte[AuthKeyIdSize + MsgKeySize] header;
		_inner.read(header[]);

		enforce(_inner.leastSize > 0, new EncryptedStreamException("Encrypted part is missing."));
		auto encrypted = new ubyte[_inner.leastSize];
		_inner.read(encrypted[], IOMode.all);
		enforce(encrypted.length % BlockSize == 0, new EncryptedStreamException("Encrypted part is not a multiple of 16."));

		auto x = _server ? 8 : 0;
		ubyte[MsgKeySize] msgKey;
		msgKey[] = header[AuthKeyIdSize .. $];
		auto keys = deriveKeys(_authKey, msgKey[], x);
		aesIgeDecrypt(encrypted, keys.aesKey, keys.aesIv);

		enum prefixSize = SaltSize + SessionIdSize + 8 + 4 + 4;
		enforce(encrypted.length >= prefixSize, new EncryptedStreamException("Decrypted part is too short."));
		auto expectedKey = computeMsgKey(_authKey, encrypted, x);
		enforce(msgKey[] == expectedKey[], new EncryptedStreamException("msg_key mismatch."));

		size_t o = SaltSize + SessionIdSize + 8 + 4;
		auto dataLength = cast(uint) encrypted[o]
			| (cast(uint) encrypted[o + 1] << 8)
			| (cast(uint) encrypted[o + 2] << 16)
			| (cast(uint) encrypted[o + 3] << 24);
		o += 4;
		enforce(o + dataLength <= encrypted.length, new EncryptedStreamException("Declared length exceeds the packet."));
		_pending = encrypted[o .. o + dataLength].dup;
		_pendingOffset = 0;
		return true;
	}

	/// Client message identifier: Unix time in 2^-32 s, monotonic.
	private long _nextMsgId()
	{
		auto t = Clock.currTime.stdTime;
		auto now = (cast(long) t / 1_000_000_000L) << 32
			| cast(long) ((t % 1_000_000_000L) & 0xffff_ffffL);
		if (_lastMsgId >= now)
			now = _lastMsgId + 4;
		_lastMsgId = now;
		return now;
	}

	/// Client sequence number: content messages always have the low bit set.
	private uint _nextSeqNo()
	{
		_seqNo += 2;
		return _seqNo;
	}
}
