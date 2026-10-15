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

import std.exception: enforce;

/// Raised when an OpenSSL primitive reports failure.
class CryptoException : Exception
{
	this(string msg) @safe pure nothrow
	{
		super(msg);
	}
}

private void check(int rc, string what) @safe
{
	enforce(rc == 1, new CryptoException(what ~ " failed"));
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
	enforce(data.length % 16 == 0, new CryptoException("IGE data length must be a multiple of 16"));

	AES_KEY aesKey = void;
	if (enc)
		check(AES_set_encrypt_key(&key[0], 256, &aesKey), "AES_set_encrypt_key");
	else
		check(AES_set_decrypt_key(&key[0], 256, &aesKey), "AES_set_decrypt_key");

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
	enforce(ctx !is null, new CryptoException("HMAC_CTX_new failed"));
	scope(exit) HMAC_CTX_free(ctx);

	check(HMAC_Init_ex(ctx, key.ptr, cast(int) key.length, EVP_sha256(), null), "HMAC_Init_ex");
	if (data.length != 0)
		check(HMAC_Update(ctx, &data[0], data.length), "HMAC_Update");

	ubyte[32] mac = void;
	uint len = 32;
	check(HMAC_Final(ctx, &mac[0], &len), "HMAC_Final");
	enforce(len == 32, new CryptoException("HMAC_Final returned unexpected length"));
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
		enforce(key.length == 32 && iv.length == 16, new CryptoException("AES-CTR key/iv length mismatch"));
		_ctx = EVP_CIPHER_CTX_new();
		enforce(_ctx !is null, new CryptoException("EVP_CIPHER_CTX_new failed"));
		check(EVP_EncryptInit_ex(_ctx, EVP_aes_256_ctr(), null, &key[0], &iv[0]), "EVP_EncryptInit_ex");
	}

	/// Applies the keystream to `data` in place.
	void apply(ubyte[] data) @trusted
	{
		if (data.length == 0 || _ctx is null)
			return;

		int outLen = 0;
		check(EVP_EncryptUpdate(_ctx, &data[0], &outLen, &data[0], cast(int) data.length), "EVP_EncryptUpdate");
		enforce(outLen == data.length, new CryptoException("AES-CTR length mismatch"));
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
	enforce(ctx !is null, new CryptoException("BN_CTX_new failed"));
	scope(exit) BN_CTX_free(ctx);

	BIGNUM* b = BN_bin2bn(base.ptr, cast(int) base.length, null);
	enforce(b !is null, new CryptoException("BN_bin2bn failed"));
	scope(exit) BN_free(b);

	BIGNUM* e = BN_bin2bn(exp.ptr, cast(int) exp.length, null);
	enforce(e !is null, new CryptoException("BN_bin2bn failed"));
	scope(exit) BN_free(e);

	BIGNUM* m = BN_bin2bn(mod.ptr, cast(int) mod.length, null);
	enforce(m !is null, new CryptoException("BN_bin2bn failed"));
	scope(exit) BN_free(m);

	BIGNUM* r = BN_new();
	enforce(r !is null, new CryptoException("BN_new failed"));
	scope(exit) BN_free(r);

	check(BN_mod_exp(r, b, e, m, ctx), "BN_mod_exp");

	auto outLen = BN_num_bytes(r);
	auto result = new ubyte[mod.length];
	BN_bn2bin(r, result.ptr + (result.length - outLen));
	return result;
}
