/// MTProto DH handshake: req_pq_multi -> resPQ -> req_DH_params ->
/// server_DH_params_ok -> set_client_DH_params -> dh_gen_ok.
///
/// Follows core.telegram.org/mtproto/auth_key.md (section 4.1 RSA_PAD is
/// implemented in `rsa.d`). The handshake is transport-agnostic: it talks to
/// a `DhTransport` so it can run over a socket or an in-memory fake server.
module tgng.mtp.dh;

import tgng.mtp.crypto: CryptoException, aesIgeDecrypt, aesIgeEncrypt, modPow,
	randomBytes, sha1;
import tgng.mtp.pq: factorizePq;
import tgng.mtp.rsa: RsaPublicKey;
import tgng.mtp.session: MessageCounter;
import tgng.mtp.tl;

import std.algorithm.comparison: min;
import std.array: appender;
import std.bitmanip: littleEndianToNative, nativeToLittleEndian;
import std.conv: to;
import std.exception: enforce;

/// Thrown when the handshake cannot complete.
class DhException: Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		super(msg, file, line);
	}
}

/// Wraps a TL body as an unencrypted message: auth_key_id 0, msg_id, length.
ubyte[] wrapUnencrypted(const(ubyte)[] body, long msgId) @safe
{
	return nativeToLittleEndian(0L)[] ~ nativeToLittleEndian(msgId)[]
		~ nativeToLittleEndian(cast(uint) body.length)[] ~ body;
}

/// Strips the unencrypted message header and returns the TL body.
const(ubyte)[] unwrapUnencrypted(const(ubyte)[] packet) @safe
{
	enforce!DhException(packet.length >= 20, "unencrypted message is too short");
	enforce!DhException(littleEndianToNative!long(packet[0 .. 8]) == 0, "expected an unencrypted message");
	enforce!DhException(packet.length == 20 + littleEndianToNative!uint(packet[16 .. 20]),
		"unencrypted message length mismatch");
	return packet[20 .. $];
}

/// Synchronous message transport used by the handshake.
interface DhTransport
{
	/// Sends one TL-encoded handshake message.
	void send(const(ubyte)[] data) @safe;
	/// Receives one TL-encoded handshake message.
	ubyte[] receive() @safe;
}

/// Result of a successful handshake.
struct DhResult
{
	ubyte[] authKey;
	ulong authKeyId;
	ubyte[8] serverSalt;
	/// `server_time - local_time` at the moment of the handshake, seconds.
	int timeOffset;
}

/// The 2048-bit prime from the spec; accepted without primality checks.
private immutable ubyte[] knownDhPrime = (() @trusted => cast(immutable ubyte[])
	[
		0xC7, 0x1C, 0xAE, 0xB9, 0xC7, 0x0E, 0x55, 0x90, 0x1A, 0xC6, 0xE0, 0x1E, 0x0A, 0x4B, 0xA7, 0x6F,
		0xC5, 0xB4, 0xBB, 0x8B, 0x4D, 0x5E, 0xA7, 0xA0, 0xA6, 0x4F, 0x0D, 0x19, 0xE8, 0xB6, 0x6A, 0xD1,
		0xC7, 0x73, 0xC9, 0x4E, 0x9B, 0x8C, 0x66, 0xE1, 0x6D, 0x5A, 0x9B, 0x5C, 0x5E, 0x6D, 0x6E, 0x6C,
		0x55, 0x3B, 0x40, 0x80, 0xE7, 0xA3, 0xD8, 0x4C, 0x64, 0xE0, 0xA0, 0x5C, 0x21, 0x55, 0x84, 0x39,
		0x4B, 0x1C, 0x15, 0x9C, 0x9C, 0x62, 0x22, 0x2B, 0x0F, 0x5B, 0x31, 0x64, 0x47, 0xC3, 0xAA, 0x1F,
		0x69, 0xA5, 0x7C, 0xD2, 0xC1, 0x38, 0x36, 0x2E, 0x88, 0x3D, 0x0A, 0xEA, 0x9C, 0xBB, 0x4A, 0xA7,
		0xBB, 0x6D, 0x5C, 0xF0, 0x8E, 0xD7, 0x7D, 0x8B, 0x9B, 0x11, 0x5D, 0x36, 0x13, 0xC7, 0xB8, 0x64,
		0x03, 0xF9, 0xF3, 0x50, 0xC1, 0xF8, 0x4B, 0xA5, 0x1E, 0xB3, 0xA5, 0x4A, 0x1A, 0x09, 0x0E, 0x37,
		0x66, 0xA9, 0x94, 0x6A, 0x72, 0x39, 0x50, 0x15, 0x7E, 0x96, 0x41, 0x8F, 0xFB, 0x97, 0xB0, 0x54,
		0xCD, 0x94, 0xF7, 0x9D, 0x2A, 0xF4, 0xF1, 0x35, 0xD4, 0x71, 0x22, 0x67, 0x49, 0x2B, 0xA1, 0xA5,
		0x0B, 0xCD, 0x27, 0x54, 0xF0, 0xB5, 0xD9, 0xAA, 0x59, 0x1A, 0x0A, 0xB5, 0xC8, 0x0C, 0x1B, 0xA9,
		0x52, 0x63, 0xDA, 0x41, 0x96, 0xFD, 0x19, 0x2F, 0x1A, 0x80, 0x35, 0xC9, 0xB7, 0x19, 0x4E, 0x91,
		0x8B, 0x13, 0x88, 0xA2, 0x26, 0x60, 0x7B, 0x36, 0x51, 0xC0, 0x9F, 0x11, 0x66, 0x87, 0x16, 0x0F,
		0x92, 0x69, 0x95, 0x4C, 0x2D, 0x5B, 0x1E, 0x47, 0xB9, 0xB5, 0xDF, 0x0F, 0x35, 0xB4, 0x61, 0x89,
		0x5E, 0x21, 0x56, 0x19, 0xB7, 0xAB, 0x11, 0x72, 0x9C, 0x2B, 0xBB, 0x94, 0xE7, 0x78, 0x82, 0x75,
		0x8A, 0x64, 0x89, 0xE0, 0x4C, 0x33, 0x4E, 0x23, 0xB8, 0x3F, 0x4A, 0x5C, 0x28, 0x2C, 0xBC, 0xF8,
	])();

/// One handshake attempt with its own random material.
private struct Attempt
{
	ubyte[16] nonce;
	ubyte[16] serverNonce;
	ubyte[32] newNonce;
	ubyte[] dhPrime;
	int g;
	ubyte[] gA;
	ubyte[] gB;
	ubyte[] privateB;
	/// Temp key and IV are consumed by AES-IGE; keep pristine copies.
	ubyte[32] tmpKey;
	ubyte[32] tmpIv;
	int serverTime;
	ulong retryId;
}

/// Runs the full DH handshake over `transport` and returns the auth key.
///
/// Retries with a fresh `b` when the server answers `dh_gen_retry`.
DhResult performHandshake(DhTransport transport, RsaPublicKey serverKey, int dcId) @safe
{
	enforce!DhException(dcId > 0, "DC id must be positive");

	auto attempt = Attempt();
	attempt.retryId = 0;

	ubyte[16] nonce = void;
	randomBytes(nonce[]);
	attempt.nonce = nonce;

	MessageCounter counter;

	// req_pq_multi -> resPQ
	transport.send(wrapUnencrypted(encodeReqPqMulti(nonce), counter.nextMsgId()));
	auto resPq = decodeResPq(unwrapUnencrypted(transport.receive()));
	enforce!DhException(resPq.nonce == nonce, "resPQ: nonce mismatch");
	attempt.serverNonce = resPq.serverNonce;

	auto fingerprint = serverKey.fingerprint();
	enforce!DhException(resPq.fingerprints.length > 0, "resPQ: no public keys");
	bool found;
	foreach (f; resPq.fingerprints)
		if (f == fingerprint)
			found = true;
	enforce!DhException(found, "resPQ: server public key fingerprint is unknown");

	auto pq = factorizePq(resPq.pq);

	// p_q_inner_data_dc -> RSA_PAD -> req_DH_params
	ubyte[32] newNonce = void;
	randomBytes(newNonce[]);
	attempt.newNonce = newNonce;

	// Test DCs live in a separate id space.
	int dc = dcId >= 10000 ? dcId : dcId + 10000;
	auto inner = encodePQInnerDataDc(resPq.pq, toBigEndian(pq.p), toBigEndian(pq.q),
		nonce, resPq.serverNonce, newNonce, dc);
	auto encrypted = serverKey.encrypt(inner);
	transport.send(wrapUnencrypted(encodeReqDhParams(nonce, resPq.serverNonce, toBigEndian(pq.p),
		toBigEndian(pq.q), fingerprint, encrypted), counter.nextMsgId()));

	// server_DH_params_ok -> tmp_aes -> server_DH_inner_data
	auto params = decodeServerDhParams(unwrapUnencrypted(transport.receive()));
	enforce!DhException(params.ok, "server_DH_params_fail received");
	enforce!DhException(params.nonce == nonce, "server_DH_params: nonce mismatch");
	enforce!DhException(params.serverNonce == resPq.serverNonce,
		"server_DH_params: server_nonce mismatch");

	deriveTmpKeyIv(attempt);
	auto answer = decryptAnswer(params.encryptedAnswer, attempt.tmpKey, attempt.tmpIv);
	auto innerData = decodeServerDhInnerData(answer);
	enforce!DhException(innerData.nonce == nonce, "server_DH_inner_data: nonce mismatch");
	enforce!DhException(innerData.serverNonce == resPq.serverNonce,
		"server_DH_inner_data: server_nonce mismatch");

	// The TL layer keeps only the real bytes; the length itself is aligned.
	attempt.dhPrime = innerData.dhPrime.dup;
	attempt.g = innerData.g;
	attempt.gA = innerData.gA.dup;
	attempt.serverTime = innerData.serverTime;
	validateDhParams(attempt.dhPrime, attempt.g, attempt.gA);

	// set_client_DH_params -> dh_gen_*
	while (true)
	{
		attempt.gB = generateGB(attempt);
		auto clientInner = encodeClientDhInnerData(nonce, resPq.serverNonce, attempt.retryId, attempt.gB);
		auto encryptedData = encryptClientData(clientInner, attempt.tmpKey, attempt.tmpIv);
		transport.send(wrapUnencrypted(encodeSetClientDhParams(nonce, resPq.serverNonce, encryptedData),
			counter.nextMsgId()));

		auto gen = decodeDhGen(unwrapUnencrypted(transport.receive()));
		enforce!DhException(gen.nonce == nonce, "dh_gen: nonce mismatch");
		enforce!DhException(gen.serverNonce == resPq.serverNonce, "dh_gen: server_nonce mismatch");

		auto authKey = computeAuthKey(attempt.gA, attempt.privateB, attempt.dhPrime);
		auto authKeyDigest = sha1(authKey);
		const(ubyte)[] authKeyAuxHash = authKeyDigest[0 .. 8];

		if (gen.id == dhGenOkId)
		{
			checkNonceHash(gen.newNonceHash, newNonce, 1, authKeyAuxHash);
			return finish(attempt, authKey);
		}
		if (gen.id == dhGenRetryId)
		{
			checkNonceHash(gen.newNonceHash, newNonce, 2, authKeyAuxHash);
			attempt.retryId = cast(ulong) authKeyAuxHash[0]
				| cast(ulong) authKeyAuxHash[1] << 8
				| cast(ulong) authKeyAuxHash[2] << 16
				| cast(ulong) authKeyAuxHash[3] << 24
				| cast(ulong) authKeyAuxHash[4] << 32
				| cast(ulong) authKeyAuxHash[5] << 40
				| cast(ulong) authKeyAuxHash[6] << 48
				| cast(ulong) authKeyAuxHash[7] << 56;
			continue;
		}
		checkNonceHash(gen.newNonceHash, newNonce, 3, authKeyAuxHash);
		throw new DhException("dh_gen_fail: server rejected the DH params");
	}
}

/// tmp_aes_key / tmp_aes_iv from new_nonce and server_nonce (spec, section 4).
void deriveTmpKeyIv(const ubyte[32] newNonce, const ubyte[16] serverNonce,
	ref ubyte[32] key, ref ubyte[32] iv) @safe
{
	auto h1 = sha1(newNonce[] ~ serverNonce[]);
	auto h2 = sha1(serverNonce[] ~ newNonce[]);
	auto h3 = sha1(newNonce[] ~ newNonce[]);

	key[0 .. 20] = h1[];
	key[20 .. 32] = h2[0 .. 12];
	iv[0 .. 8] = h2[12 .. 20];
	iv[8 .. 28] = h3[];
	iv[28 .. 32] = newNonce[0 .. 4];
}

private void deriveTmpKeyIv(ref Attempt a) @safe
{
	deriveTmpKeyIv(a.newNonce, a.serverNonce, a.tmpKey, a.tmpIv);
}

/// Decrypts `encrypted_answer` and strips the leading SHA-1 hash.
private ubyte[] decryptAnswer(const(ubyte)[] encrypted, ref ubyte[32] key, ref ubyte[32] iv) @safe
{
	enforce!DhException(encrypted.length % 16 == 0 && encrypted.length >= 20 + 16,
		"encrypted_answer: bad length");

	ubyte[32] ivCopy = iv;
	auto plain = encrypted.dup;
	aesIgeDecrypt(plain, key, ivCopy);

	auto expected = plain[0 .. 20];
	auto body = plain[20 .. $];
	foreach (padding; 0 .. min(16, body.length + 1))
	{
		auto answer = body[0 .. $ - padding];
		if (sha1(answer) == expected)
			return answer.dup;
	}
	throw new DhException("encrypted_answer: SHA-1 mismatch");
}

/// Pads `client_DH_inner_data` with SHA-1 and random bytes, then encrypts it.
private ubyte[] encryptClientData(const(ubyte)[] data, ref ubyte[32] key, ref ubyte[32] iv) @safe
{
	auto digest = sha1(data);
	size_t padded = (20 + data.length + 15) & ~cast(size_t) 15;
	auto block = new ubyte[padded];
	block[0 .. 20] = digest[];
	block[20 .. 20 + data.length] = data[];
	if (padded > 20 + data.length)
		randomBytes(block[20 + data.length .. $]);

	ubyte[32] ivCopy = iv;
	aesIgeEncrypt(block, key, ivCopy);
	return block;
}

/// `g_b = g^b mod p` with a random 2048-bit `b`, kept for the auth key.
private ubyte[] generateGB(ref Attempt a) @safe
{
	ubyte[256] b = void;
	randomBytes(b[]);
	// Force the top bit so the exponent is close to 2^2047.
	b[0] |= 0x80;
	a.privateB = b.dup;

	ubyte[] g = [cast(ubyte) a.g];
	return modPow(g, b[], a.dhPrime);
}

/// `auth_key = g_a^b mod p`, big-endian, exactly 256 bytes.
private ubyte[] computeAuthKey(const(ubyte)[] gA, const(ubyte)[] exponent,
	const(ubyte)[] p) @safe
{
	auto key = modPow(gA, exponent, p);
	enforce!DhException(key.length <= 256, "auth_key: too long");
	if (key.length == 256)
		return key;

	// modPow trims leading zeros; the key is always 256 bytes.
	auto padded = new ubyte[256];
	padded[256 - key.length .. $] = key[];
	return padded;
}

/// Builds the final result from a verified `dh_gen_ok`.
private DhResult finish(ref Attempt a, ubyte[] authKey) @safe
{
	DhResult r;
	r.authKey = authKey;
	auto digest = sha1(authKey);
	ulong id = 0;
	foreach (i; 0 .. 8)
		id |= cast(ulong) digest[12 + i] << (8 * i);
	r.authKeyId = id;

	foreach (i; 0 .. 8)
		r.serverSalt[i] = a.newNonce[i] ^ a.serverNonce[i];

	import std.datetime.systime: Clock;
	r.timeOffset = a.serverTime - cast(int) Clock.currTime().toUnixTime();
	return r;
}

/// Verifies `new_nonce_hashN = SHA1(new_nonce + [0x0N] + aux_hash)[4..20]`.
private void checkNonceHash(const ubyte[16] hash, const ubyte[32] newNonce, ubyte n,
	const(ubyte)[] auxHash) @safe
{
	auto buf = newNnoceBuf(newNonce, n, auxHash);
	auto digest = sha1(buf);
	enforce!DhException(digest[4 .. 20] == hash[], "dh_gen: new_nonce_hash mismatch");
}

private ubyte[] newNnoceBuf(const ubyte[32] newNonce, ubyte n, const(ubyte)[] auxHash) @safe
{
	auto buf = appender!(ubyte[])();
	buf.put(newNonce[]);
	buf.put(n);
	buf.put(auxHash);
	return buf.data;
}

/// Validates `dh_prime`, `g` and `g_a` against the spec's checklist.
void validateDhParams(const(ubyte)[] dhPrime, int g, const(ubyte)[] gA) @safe
{
	enforce!DhException(g >= 2 && g <= 7, "dh_prime: g out of range");
	enforce!DhException(dhPrime.length == 256, "dh_prime: must be 2048 bits");
	enforce!DhException(dhPrime[0] != 0, "dh_prime: leading zero byte");
	enforce!DhException((dhPrime[0] & 0x80) != 0, "dh_prime: must be 2048 bits");

	auto p = dhPrime.dup;
	validatePrime(p, g);

	enforce!DhException(gA.length == 256, "g_a: must be 2048 bits");
	enforce!DhException(gA[0] != 0, "g_a: leading zero byte");

	// g_a in [2^1984, p - 2^1984]
	ubyte[248] lower;
	lower[0] = 0x80;
	enforce!DhException(compareBigEndian(gA, lower[]) > 0, "g_a: too small");

	auto upper = subtractBigEndian(p, lower[]);
	enforce!DhException(compareBigEndian(gA, upper) < 0, "g_a: too large");
}

private void validatePrime(const(ubyte)[] p, int g) @safe
{
	enforce!DhException(compareBigEndian(p, knownDhPrime) == 0
		|| (isProbablePrime(p) && isProbablePrime(shr1(sub1(p)))),
		"dh_prime: not a safe prime");

	switch (g)
	{
	case 2:
		enforce!DhException(modWord(p, 8) == 7, "dh_prime: p mod 8 must be 7 for g=2");
		break;
	case 3:
		enforce!DhException(modWord(p, 3) == 2, "dh_prime: p mod 3 must be 2 for g=3");
		break;
	case 4:
		break;
	case 5:
		auto r = modWord(p, 5);
		enforce!DhException(r == 1 || r == 4, "dh_prime: p mod 5 must be 1 or 4 for g=5");
		break;
	case 6:
		auto r = modWord(p, 24);
		enforce!DhException(r == 19 || r == 23, "dh_prime: p mod 24 must be 19 or 23 for g=6");
		break;
	case 7:
		auto r = modWord(p, 7);
		enforce!DhException(r == 3 || r == 5 || r == 6, "dh_prime: p mod 7 must be 3, 5 or 6 for g=7");
		break;
	default:
		assert(false);
	}
}

/// Miller-Rabin with 64 rounds, matching TDLib's `BN_is_prime_ex` usage.
private bool isProbablePrime(const(ubyte)[] n) @safe
{
	if (n.length == 1 && n[0] % 2 == 0)
		return n[0] == 2;

	if (n.length == 0)
		return false;
	if (n.length == 1)
	{
		ubyte v = n[0];
		if (v < 2)
			return false;
		foreach (d; 2 .. v)
			if (v % d == 0)
				return false;
		return true;
	}

	auto one = new ubyte[n.length];
	one[$ - 1] = 1;

	auto nMinus1 = sub1(n);

	// n - 1 = d * 2^s with d odd.
	auto d = nMinus1.dup;
	size_t s = 0;
	while (d[$ - 1] % 2 == 0)
	{
		d = shr1(d);
		s++;
	}

	enforce!DhException(d[$ - 1] % 2 == 1, "prime: even number");

	auto two = new ubyte[n.length];
	two[$ - 1] = 2;

	// Base range [2, n-2]; a random 2048-bit value is dominated by high
	// bytes, so start from `two` and add a random offset instead.
	ubyte[] range = subtractBigEndian(sub1(nMinus1), two);

	foreach (round; 0 .. 64)
	{
		ubyte[] a = new ubyte[n.length];
		randomBytes(a);
		a = modPow(a, one, range);
		a = addMod(a, two.dup, n);
		a = modPow(a, d, n);

		if (compareBigEndian(a, one) == 0 || compareBigEndian(a, nMinus1) == 0)
			continue;

		// Composite unless some a^(2^i * d) hits n-1 before the last step.
		bool composite = true;
		foreach (_; 1 .. s)
		{
			a = modPow(a, two, n);
			if (compareBigEndian(a, nMinus1) == 0)
			{
				composite = false;
				break;
			}
		}
		if (composite)
			return false;
	}
	return true;
}

/// `a + b` reduced modulo `m`; `b` must be smaller than `m`.
private ubyte[] addMod(ubyte[] a, const(ubyte)[] b, const(ubyte)[] m) @safe
{
	size_t len = min(a.length, b.length);
	uint carry = 0;
	for (size_t i = 0; i < len; i++)
	{
		a[$ - 1 - i] = cast(ubyte) (carry + a[$ - 1 - i] + b[$ - 1 - i]);
		if (carry + a[$ - 1 - i] > 255)
			carry = 1;
	}
	if (compareBigEndian(a, m) >= 0)
		a = subtractBigEndian(a, m);
	return a;
}

/// `a - 1` on a big-endian byte string.
private ubyte[] sub1(const(ubyte)[] a) @safe
{
	auto r = a.dup;
	foreach_reverse (i; 0 .. r.length)
	{
		if (r[i] != 0)
		{
			r[i]--;
			break;
		}
		r[i] = 0xFF;
	}
	return r;
}

/// `a >> 1` on a big-endian byte string.
private ubyte[] shr1(const(ubyte)[] a) @safe
{
	auto r = a.dup;
	ubyte carry = 0;
	foreach (i; 0 .. r.length)
	{
		ubyte next = r[i] & 1;
		r[i] = cast(ubyte) ((r[i] >> 1) | (carry << 7));
		carry = next;
	}
	return r;
}

/// Encodes an unsigned integer as a big-endian byte string without leading zeros.
private ubyte[] toBigEndian(ulong v) @safe
{
	ubyte[8] buf = void;
	foreach_reverse (i; 0 .. 8)
	{
		buf[i] = cast(ubyte) v;
		v >>= 8;
	}
	size_t start = 0;
	while (start < 7 && buf[start] == 0)
		start++;
	return buf[start .. $].dup;
}

/// `a mod m` where `m` fits in a machine word.
private uint modWord(const(ubyte)[] a, uint m) @safe
{
	ulong rem = 0;
	foreach (b; a)
		rem = (rem << 8 | b) % m;
	return cast(uint) rem;
}

/// Big-endian subtraction `a - b` (assumes `a >= b`).
private ubyte[] subtractBigEndian(const(ubyte)[] a, const(ubyte)[] b) @safe
{
	size_t len = a.length > b.length ? a.length : b.length;
	auto r = new ubyte[len];
	int borrow = 0;
	foreach_reverse (i; 0 .. len)
	{
		int ai = i < a.length ? a[a.length - 1 - i] : 0;
		int bi = i < b.length ? b[b.length - 1 - i] : 0;
		int v = ai - bi - borrow;
		if (v < 0)
		{
			v += 256;
			borrow = 1;
		}
		else
			borrow = 0;
		r[len - 1 - i] = cast(ubyte) v;
	}
	return r;
}

/// Compares two big-endian byte strings as unsigned integers.
private int compareBigEndian(const(ubyte)[] a, const(ubyte)[] b) @safe
{
	size_t len = a.length > b.length ? a.length : b.length;
	foreach_reverse (i; 0 .. len)
	{
		int ai = i < a.length ? a[a.length - 1 - i] : 0;
		int bi = i < b.length ? b[b.length - 1 - i] : 0;
		if (ai != bi)
			return ai < bi ? -1 : 1;
	}
	return 0;
}
