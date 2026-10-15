/// Cryptographic primitives used by MTProto: AES-256-IGE, SHA-256, HMAC-SHA256,
/// RSA (raw BN/`mod_exp`) and random bytes.
///
/// Thin wrappers over Deimos OpenSSL bindings that turn C error codes into
/// exceptions and manage C resources with `scope(exit)`.
module tgng.mtproto.crypto;

import deimos.openssl.aes: AES_DECRYPT, AES_ENCRYPT, AES_KEY, AES_ige_encrypt,
	AES_set_decrypt_key, AES_set_encrypt_key;
import deimos.openssl.bn: BIGNUM, BN_CTX, BN_CTX_free, BN_CTX_new, BN_bin2bn,
	BN_bn2bin, BN_free, BN_mod_exp, BN_new, BN_num_bytes;
import deimos.openssl.evp: EVP_CIPHER_CTX, EVP_CIPHER_CTX_free, EVP_CIPHER_CTX_new,
	EVP_EncryptInit_ex, EVP_EncryptUpdate, EVP_aes_256_ctr, EVP_sha256;
import deimos.openssl.hmac: HMAC_CTX_free, HMAC_CTX_new, HMAC_Final,
	HMAC_Init_ex, HMAC_Update;
import deimos.openssl.rand: RAND_bytes;
import deimos.openssl.sha: SHA256_CTX, SHA256_Final, SHA256_Init, SHA256_Update;

import std.conv: hexString, to;
import std.exception: enforce;

/// Raised when an OpenSSL primitive reports failure.
class CryptoException : Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		super(msg, file, line);
	}
}

private void check(int rc, string what) @safe
{
	enforce!CryptoException(rc == 1, what ~ " failed");
}

// AES_set_*_key return 0 on success, unlike most OpenSSL functions.
private void checkZero(int rc, string what) @safe
{
	enforce!CryptoException(rc == 0, what ~ " failed");
}

/// Encrypts `data` in place with AES-256 in IGE mode.
///
/// `key` must be 32 bytes and `iv` 32 bytes. `data.length` must be a
/// multiple of the block size.
void aesIgeEncrypt(ubyte[] data, const(ubyte)[32] key, ubyte[32] iv) @trusted
{
	aesIge(data, key, iv, AES_ENCRYPT);
}

/// Decrypts `data` in place with AES-256 in IGE mode.
void aesIgeDecrypt(ubyte[] data, const(ubyte)[32] key, ubyte[32] iv) @trusted
{
	aesIge(data, key, iv, AES_DECRYPT);
}

private void aesIge(ubyte[] data, const(ubyte)[32] key, ref ubyte[32] iv, int enc) @trusted
{
	enforce!CryptoException(data.length % 16 == 0, "IGE data length must be a multiple of 16");

	AES_KEY aesKey = void;
	// AES_set_*_key return 0 on success, unlike most OpenSSL functions.
	if (enc)
		checkZero(AES_set_encrypt_key(&key[0], 256, &aesKey), "AES_set_encrypt_key");
	else
		checkZero(AES_set_decrypt_key(&key[0], 256, &aesKey), "AES_set_decrypt_key");

	if (data.length != 0)
		AES_ige_encrypt(&data[0], &data[0], data.length, &aesKey, &iv[0], enc);
}

/// Returns the SHA-256 digest of `data`.
ubyte[32] sha256(const(ubyte)[] data) @trusted
{
	SHA256_CTX ctx = void;
	check(SHA256_Init(&ctx), "SHA256_Init");
	if (data.length != 0)
		check(SHA256_Update(&ctx, &data[0], data.length), "SHA256_Update");

	ubyte[32] digest = void;
	check(SHA256_Final(&digest[0], &ctx), "SHA256_Final");
	return digest;
}

/// Returns HMAC-SHA256 of `data` under `key`.
ubyte[32] hmacSha256(const(ubyte)[] key, const(ubyte)[] data) @trusted
{
	auto ctx = HMAC_CTX_new();
	enforce!CryptoException(ctx !is null, "HMAC_CTX_new failed");
	scope(exit) HMAC_CTX_free(ctx);

	check(HMAC_Init_ex(ctx, key.ptr, cast(int) key.length, EVP_sha256(), null), "HMAC_Init_ex");
	if (data.length != 0)
		check(HMAC_Update(ctx, &data[0], data.length), "HMAC_Update");

	ubyte[32] mac = void;
	uint len = 32;
	check(HMAC_Final(ctx, &mac[0], &len), "HMAC_Final");
	enforce!CryptoException(len == 32, "HMAC_Final returned unexpected length");
	return mac;
}

/// Stateful AES-256-CTR keystream that can be consumed across many buffers.
///
/// `obfuscated2` needs exactly this: one continuous CTR stream split over the
/// 64-byte header, the inner transport bytes and everything after them.
struct AesCtr
{
	private EVP_CIPHER_CTX* _ctx;

	/// Initialises the stream; `key` must be 32 bytes and `iv` 16 bytes.
	void init(const(ubyte)[] key, const(ubyte)[] iv) @trusted
	{
		enforce!CryptoException(key.length == 32 && iv.length == 16, "AES-CTR key/iv length mismatch");
		_ctx = EVP_CIPHER_CTX_new();
		enforce!CryptoException(_ctx !is null, "EVP_CIPHER_CTX_new failed");
		check(EVP_EncryptInit_ex(_ctx, EVP_aes_256_ctr(), null, &key[0], &iv[0]), "EVP_EncryptInit_ex");
	}

	/// Applies the keystream to `data` in place.
	void apply(ubyte[] data) @trusted
	{
		if (data.length == 0 || _ctx is null)
			return;

		int outLen = 0;
		check(EVP_EncryptUpdate(_ctx, &data[0], &outLen, &data[0], cast(int) data.length), "EVP_EncryptUpdate");
		enforce!CryptoException(outLen == data.length, "AES-CTR length mismatch");
	}

	/// Releases the OpenSSL context.
	void destroy() @trusted
	{
		if (_ctx !is null)
		{
			EVP_CIPHER_CTX_free(_ctx);
			_ctx = null;
		}
	}
}

/// Fills `buf` with cryptographically secure random bytes.
void randomBytes(ubyte[] buf) @trusted
{
	if (buf.length == 0)
		return;
	check(RAND_bytes(&buf[0], cast(int) buf.length), "RAND_bytes");
}

/// Returns `size` cryptographically secure random bytes.
ubyte[] randomBytes(size_t size) @safe
{
	auto buf = new ubyte[size];
	randomBytes(buf);
	return buf;
}

/// Raises `base` to the power `exp` modulo `mod` (big-endian byte strings).
///
/// Used by the DH handshake and RSA helpers. Inputs and output are
/// big-endian, as MTProto expects.
ubyte[] modPow(const(ubyte)[] base, const(ubyte)[] exp, const(ubyte)[] mod) @trusted
{
	auto ctx = BN_CTX_new();
	enforce!CryptoException(ctx !is null, "BN_CTX_new failed");
	scope(exit) BN_CTX_free(ctx);

	BIGNUM* b = BN_bin2bn(base.ptr, cast(int) base.length, null);
	enforce!CryptoException(b !is null, "BN_bin2bn failed");
	scope(exit) BN_free(b);

	BIGNUM* e = BN_bin2bn(exp.ptr, cast(int) exp.length, null);
	enforce!CryptoException(e !is null, "BN_bin2bn failed");
	scope(exit) BN_free(e);

	BIGNUM* m = BN_bin2bn(mod.ptr, cast(int) mod.length, null);
	enforce!CryptoException(m !is null, "BN_bin2bn failed");
	scope(exit) BN_free(m);

	BIGNUM* r = BN_new();
	enforce!CryptoException(r !is null, "BN_new failed");
	scope(exit) BN_free(r);

	check(BN_mod_exp(r, b, e, m, ctx), "BN_mod_exp");

	auto outLen = BN_num_bytes(r);
	auto result = new ubyte[mod.length];
	BN_bn2bin(r, result.ptr + (result.length - outLen));
	return result;
}

@safe unittest // AES-256-IGE round-trips
{
	import std.algorithm: map;
	import std.array: array;
	import std.range: iota;

	const(ubyte)[32] key = iota(32).map!(i => cast(ubyte) i).array;
	ubyte[32] iv = iota(32).map!(i => cast(ubyte) (i + 7)).array;
	auto plain = iota(64).map!(i => cast(ubyte) (i + 1)).array;
	immutable expected = plain.idup;

	auto ivCopy = iv;
	aesIgeEncrypt(plain, key, ivCopy);
	enforce(plain != expected, "IGE encryption left the plaintext unchanged");

	auto ivBack = iv;
	aesIgeDecrypt(plain, key, ivBack);
	enforce(plain == expected, "IGE decryption did not restore the plaintext");
	enforce(ivBack == iv, "IGE consumed the IV");
}

@safe unittest // IGE rejects non-block-aligned lengths
{
	const(ubyte)[32] key = 0;
	ubyte[32] iv = 0;
	auto data = new ubyte[15];

	bool thrown;
	try
		aesIgeEncrypt(data, key, iv);
	catch (CryptoException)
		thrown = true;
	enforce(thrown, "IGE accepted a non-multiple-of-16 length");
}

@safe unittest // SHA-256 known vectors
{
	enforce(sha256(null) == cast(ubyte[32]) hexString!"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
		"SHA-256 of the empty string");
	enforce(sha256(cast(const(ubyte)[]) "abc") == cast(ubyte[32]) hexString!"ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad",
		"SHA-256 of \"abc\"");
}

@safe unittest // HMAC-SHA256 known vectors (RFC 4231)
{
	{
		auto key = cast(const(ubyte)[]) "\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b\x0b";
		auto mac = hmacSha256(key, cast(const(ubyte)[]) "Hi There");
		enforce(mac == cast(ubyte[32]) hexString!"b0344c61d8db38535ca8afceaf0bf12b881dc200c9833da726e9376c2e32cff7",
			"HMAC-SHA256 RFC 4231 case 1");
	}
	{
		auto mac = hmacSha256(cast(const(ubyte)[]) "Jefe", cast(const(ubyte)[]) "what do ya want for nothing?");
		enforce(mac == cast(ubyte[32]) hexString!"5bdcc146bf60754e6a042426089575c75a003f089d2739839dec58b964ec3843",
			"HMAC-SHA256 RFC 4231 case 2");
	}
}

@safe unittest // AES-CTR keystream is continuous across buffers
{
	const(ubyte)[32] key = 0;
	const(ubyte)[16] iv = 0;
	ubyte[16] plain = 0;

	AesCtr split;
	split.init(key, iv);
	scope(exit) split.destroy();
	split.apply(plain[0 .. 7]);
	split.apply(plain[7 .. $]);

	AesCtr whole;
	whole.init(key, iv);
	scope(exit) whole.destroy();
	ubyte[16] expected = 0;
	whole.apply(expected);

	enforce(plain == expected, "split CTR differs from a single call");
	enforce(plain[0] != 0, "CTR with a zero IV produced a zero keystream");
}

@safe unittest // randomBytes returns distinct non-zero output
{
	import std.algorithm: any;

	auto a = randomBytes(32);
	auto b = randomBytes(32);
	enforce(a != b, "two random draws collided");
	enforce(a.any!(x => x != 0), "randomBytes returned all zeroes");
}

@safe unittest // modPow matches a known vector
{
	// 4^13 mod 497 = 445, from Wikipedia's modular exponentiation example.
	// 497 does not fit in one byte, so it is encoded big-endian.
	auto result = modPow([cast(ubyte) 4], [cast(ubyte) 13], [cast(ubyte) 0x01, cast(ubyte) 0xF1]);
	enforce(result.length == 2 && result[0] == 0x01 && result[1] == 0xBD,
		"modPow(4, 13, 497) != 445");
}
