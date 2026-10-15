/// MTProto encrypted transport layer (MTProto 2.0, AES-256-IGE).
///
/// Sits directly above framing: `write` receives a whole assembled frame
/// (the payload of one MTProto packet) and turns it into the encrypted v2
/// envelope; `read` accepts one encrypted packet and returns the decrypted
/// payload. Framing stays below encryption in the stack, so this layer never
/// sees length prefixes.
module tgng.mtproto.encrypted_stream;

import vibe.core.stream: ConnectionStream, IOMode, blocking;

import tgng.mtproto.crypto: aesIgeDecrypt, aesIgeEncrypt, randomBytes, sha256;

import core.time: Duration;
import std.bitmanip: littleEndianToNative, nativeToLittleEndian;
import std.exception: enforce;

@safe:

/// Size of the two keys derived from the auth key.
private enum AuthKeySize = 256;
/// Offset of the message key material inside the auth key (`88 + X`).
private enum MsgKeyOffset = 88;
/// Number of bytes of the SHA-256 digest used as the message key.
private enum MsgKeySize = 16;
/// Size of the v2 fixed header written before the encrypted payload.
private enum EnvelopeHeaderSize = 24;
/// Size of the salt/session/msg_id/seq_no/length prefix inside the packet.
private enum InnerHeaderSize = 32;
/// Padding is random, so it never falls below 12 bytes.
private enum MinPadding = 12;
/// Block size of AES.
private enum BlockSize = 16;

/// Which side of the connection this stream encrypts for.
///
/// The `X` selector in the message-key derivation differs per direction:
/// zero for packets the client sends, eight for packets it receives.
enum EncryptedDirection
{
	clientToServer,
	serverToClient,
}

/// Stream wrapper that applies the MTProto 2.0 encryption layer.
///
/// The wrapper expects whole frames: `write` takes one framed MTProto
/// packet and `read` returns the payload of one encrypted packet.
final class EncryptedStream: ConnectionStream
{
	private
	{
		ConnectionStream _inner;
		ubyte[AuthKeySize] _authKey;
		long _authKeyId;
		long _sessionId;
		ubyte[32] _sendKey;
		ubyte[32] _sendIv;
		ubyte[32] _recvKey;
		ubyte[32] _recvIv;
		ulong _sendCounter;
		ulong _recvCounter;
	}

	/// Wraps `inner` with the message keys derived from `authKey`.
	///
	/// `authKeyId` is the key identifier carried in every packet and
	/// `sessionId` is the current session identifier.
	this(ConnectionStream inner, const(ubyte)[] authKey, long authKeyId, long sessionId)
	{
		enforce(authKey.length == AuthKeySize, "Auth key must be 256 bytes.");
		_inner = inner;
		_authKey[] = authKey[];
		_authKeyId = authKeyId;
		_sessionId = sessionId;

		// The two halves are reversed for the opposite direction.
		ubyte[AuthKeySize] reversed = void;
		foreach (i; 0 .. AuthKeySize)
			reversed[i] = authKey[AuthKeySize - 1 - i];

		Kdf2(_sendKey, _sendIv, _authKey, 0);
		Kdf2(_recvKey, _recvIv, reversed, 8);
		_sendCounter = 0;
		_recvCounter = 0;
	}

	@property bool connected() const { return _inner.connected; }

	void close() @blocking { _inner.close(); }

	bool waitForData(Duration timeout = Duration.max) @blocking
	{
		return _inner.waitForData(timeout);
	}

	@property bool empty() @blocking { return _inner.empty; }

	@property ulong leastSize() @blocking { return _inner.leastSize; }

	@property bool dataAvailableForRead() { return _inner.dataAvailableForRead; }

	const(ubyte)[] peek() { return null; }

	/// Reads one encrypted packet and returns its decrypted payload.
	///
	/// The payload is a single message: salt and the fixed header are
	/// stripped, the padding is removed and the plaintext is written to
	/// `dst`. When `dst` is too small, the excess is dropped.
	size_t read(scope ubyte[] dst, IOMode mode) @blocking
	{
		// Each call consumes exactly one encrypted frame, so the
		// underlying stream must deliver whole packets.
		auto packet = new ubyte[_inner.leastSize];
		if (packet.length == 0)
			return 0;
		_inner.read(packet);

		auto plain = _decryptPacket(packet);
		auto n = dst.length < plain.length ? dst.length : plain.length;
		dst[0 .. n] = plain[0 .. n];
		return n;
	}

	/// Encrypts one MTProto frame and writes it to the underlying stream.
	size_t write(scope const(ubyte)[] bytes, IOMode mode) @blocking
	{
		enforce(mode == IOMode.all, "EncryptedStream supports only IOMode.all for writes.");
		enforce(bytes.length > 0, "Cannot encrypt an empty MTProto message.");

		auto packet = _encryptPacket(bytes);
		_inner.write(packet, IOMode.all);
		return bytes.length;
	}

	void flush() @blocking { _inner.flush(); }
	void finalize() @blocking { _inner.finalize(); }

	/// Builds the complete encrypted packet for `payload`.
	private ubyte[] _encryptPacket(scope const(ubyte)[] payload) @trusted
	{
		// The salted plaintext starts with the salt and ends with the
		// random padding; the salt is derived from the packet counter.
		auto padding = _paddingLength(payload.length);
		auto saltedLength = InnerHeaderSize + payload.length + padding;
		auto total = EnvelopeHeaderSize + saltedLength;

		auto packet = new ubyte[total];
		_sendCounter++;
		long salt = cast(long) _sendCounter;

		size_t o = 0;
		packet[o .. o + 8] = nativeToLittleEndian(_authKeyId)[0 .. 8];
		o += 8;
		// The message key placeholder: filled after the plaintext exists.
		o += MsgKeySize;

		auto plain = packet[o .. o + saltedLength];
		size_t p = 0;
		plain[p .. p + 8] = nativeToLittleEndian(salt)[0 .. 8];
		p += 8;
		plain[p .. p + 8] = nativeToLittleEndian(_sessionId)[0 .. 8];
		p += 8;
		plain[p .. p + 8] = nativeToLittleEndian(_nextMessageId())[0 .. 8];
		p += 8;
		plain[p .. p + 4] = nativeToLittleEndian(0)[0 .. 4];
		p += 4;
		plain[p .. p + 4] = nativeToLittleEndian(cast(uint) payload.length)[0 .. 4];
		p += 4;
		plain[p .. p + payload.length] = payload[];
		p += payload.length;

		randomBytes(plain[p .. $]);

		auto msgKey = _messageKey(plain, EncryptedDirection.clientToServer);
		packet[8 .. 8 + MsgKeySize] = msgKey[];

		auto aesKey = _aesKey(msgKey, false);
		auto aesIv = _aesIv(msgKey, plain, false);
		aesIgeEncrypt(plain, aesKey, aesIv);
		return packet;
	}

	/// Decrypts one packet and returns the MTProto payload it carries.
	private ubyte[] _decryptPacket(scope const(ubyte)[] packet) @trusted
	{
		enforce(packet.length >= EnvelopeHeaderSize + InnerHeaderSize,
			"Encrypted packet is too short.");

		size_t o = 0;
		auto authKeyId = _readI64(packet, o);
		enforce(authKeyId == _authKeyId, "Encrypted packet has an unknown auth_key_id.");

		auto msgKey = packet[o .. o + MsgKeySize].idup;
		o += MsgKeySize;

		enforce((packet.length - o) % BlockSize == 0,
			"Encrypted payload is not block aligned.");
		auto plain = packet[o .. $].dup;
		auto aesKey = _aesKey(msgKey, true);
		auto aesIv = _aesIv(msgKey, plain, true);
		aesIgeDecrypt(plain, aesKey, aesIv);

		// The received key must match, otherwise the packet is corrupt.
		auto check = _messageKey(plain, EncryptedDirection.serverToClient);
		enforce(check[] == msgKey[], "Encrypted packet has a wrong message key.");

		size_t p = 8;
		p += 8;
		p += 8;
		p += 4;
		ubyte[4] bodyRaw;
		bodyRaw[] = plain[p .. p + 4];
		auto bodyLen = cast(size_t) littleEndianToNative!uint(bodyRaw);
		p += 4;
		enforce(p + bodyLen <= plain.length, "Encrypted packet body length is out of range.");
		return plain[p .. p + bodyLen].dup;
	}

	/// Returns the random padding length that aligns the message.
	private static size_t _paddingLength(size_t payloadLength) @trusted
	{
		auto unaligned = InnerHeaderSize + payloadLength;
		auto padding = BlockSize - (unaligned % BlockSize);
		if (padding < MinPadding)
			padding += BlockSize;
		// The padding is random, so its length is the only bound.
		return padding;
	}

	/// Returns the next outgoing `msg_id`.
	private long _nextMessageId() @trusted
	{
		import std.datetime.systime: Clock;
		auto now = Clock.currTime().toUnixTime * 1_000_000_000L;
		return (now & 0xffffffff_00000000L) | (++_sendCounter & 0xffffffffL);
	}

	/// Derives the message key from the salted plaintext.
	private ubyte[MsgKeySize] _messageKey(scope const(ubyte)[] plain, EncryptedDirection direction) @trusted
	{
		auto x = direction == EncryptedDirection.clientToServer ? 0 : 8;
		auto material = new ubyte[32 + plain.length];
		material[0 .. 32] = _authKey[MsgKeyOffset + x .. MsgKeyOffset + x + 32];
		material[32 .. $] = plain[];
		auto digest = sha256(material);
		ubyte[MsgKeySize] key = void;
		key[] = digest[8 .. 8 + MsgKeySize];
		return key;
	}

	/// Derives the AES-IGE key from the message key.
	private ubyte[32] _aesKey(scope const(ubyte)[] msgKey, bool incoming) @trusted
	{
		ubyte[48] material = void;
		material[0 .. 16] = msgKey[0 .. 16];
		material[16 .. 48] = _authKey[(incoming ? 8 : 0) .. (incoming ? 8 : 0) + 32];
		auto digest = sha256(material);
		ubyte[32] key = void;
		key[] = digest[];
		return key;
	}

	/// Derives the AES-IGE IV from the message key.
	private ubyte[32] _aesIv(scope const(ubyte)[] msgKey, scope const(ubyte)[] plain, bool incoming) @trusted
	{
		ubyte[48] material = void;
		material[0 .. 32] = _authKey[(incoming ? 8 : 0) .. (incoming ? 8 : 0) + 32];
		material[32 .. 48] = msgKey[0 .. 16];
		auto digest = sha256(material);
		ubyte[32] iv = void;
		iv[] = digest[];
		return iv;
	}

	/// Reads a little-endian `long` and advances the offset.
	private static long _readI64(scope const(ubyte)[] data, ref size_t o) @trusted
	{
		enforce(data.length >= o + 8, "Truncated 64-bit field.");
		ubyte[8] raw;
		raw[] = data[o .. o + 8];
		o += 8;
		return littleEndianToNative!long(raw);
	}
}

/// Derives the key and IV for one direction (`kdf2`).
///
/// `x` selects the half of the auth key to use: zero for the sending
/// direction, eight for the receiving one.
private void Kdf2(ref ubyte[32] key, ref ubyte[32] iv, scope const(ubyte)[256] authKey, int x) @trusted
{
	ubyte[36] material = void;
	material[0 .. 32] = authKey[x .. x + 32];
	material[32 .. 36] = [0, 0, 0, 0];

	ubyte[68] buffer = void;
	size_t o = 0;
	auto a = sha256(material);
	buffer[o .. o + 32] = a[];
	o += 32;
	material[0 .. 32] = a[];
	material[32 .. 36] = [1, 0, 0, 0];
	auto b = sha256(material);
	buffer[o .. o + 32] = b[];
	o += 32;
	material[32 .. 36] = [2, 0, 0, 0];
	auto c = sha256(material);
	buffer[o .. o + 4] = c[0 .. 4];

	iv[] = buffer[0 .. 32];
	key[] = buffer[32 .. 64];
}
