/// RSA public-key operations used by the MTProto DH handshake.
///
/// Payloads are wrapped with the official RSA_PAD scheme (core.telegram.org/
/// mtproto/auth_key.md, section 4.1) before the raw `m^e mod n` primitive.
module tgng.mtp.rsa;

import tgng.mtp.crypto: CryptoException, aesIgeEncrypt, modPow, randomBytes, sha1, sha256;

import std.algorithm.iteration: filter;
import std.algorithm.mutation: reverse;
import std.array: appender, array;
import std.ascii: isWhite;
import std.base64: Base64;
import std.conv: hexString;
import std.exception: enforce;
import std.string: indexOf, strip;

/// RSA_PAD data block size; payload must leave room for random padding.
private enum rsaPadDataSize = 192;

/// A 2048-bit RSA public key (modulus and exponent, big-endian).
struct RsaPublicKey
{
	ubyte[] n;
	ubyte[] e;

	/// Parses a `BEGIN RSA PUBLIC KEY` (PKCS#1) PEM block.
	static RsaPublicKey fromPem(string pem) @safe
	{
		immutable beginMarker = "-----BEGIN RSA PUBLIC KEY-----";
		immutable endMarker = "-----END RSA PUBLIC KEY-----";
		auto header = pem.indexOf(beginMarker);
		auto footer = pem.indexOf(endMarker);
		enforce!CryptoException(header >= 0 && footer > header, "RSA public key PEM markers not found");

		// Telegram ships keys wrapped at 64 columns; Base64.decode rejects whitespace.
		auto body = pem[header + beginMarker.length .. footer]
			.filter!(c => !isWhite(c)).array;
		auto der = Base64.decode(body);

		auto seq = DerReader(der).readSequence();
		auto inner = DerReader(seq);
		auto modulus = inner.readInteger();
		auto exponent = inner.readInteger();

		return RsaPublicKey(modulus, exponent);
	}

	/// Returns the Telegram key fingerprint: the last 8 bytes of SHA-1 over the
	/// TL-serialised n and e, without a constructor id.
	ulong fingerprint() const @safe
	{
		auto buf = appender!(ubyte[])();
		buf.put(tlBytes(n));
		buf.put(tlBytes(e));

		auto digest = sha1(buf.data);
		ulong result = 0;
		foreach (i; 0 .. 8)
			result |= cast(ulong) digest[12 + i] << (8 * i);
		return result;
	}

	/// Wraps a handshake payload with RSA_PAD (spec section 4.1) and
	/// encrypts it: the result is `key_aes_encrypted^e mod n`, 256 bytes.
	ubyte[] encrypt(const(ubyte)[] payload) const @safe
	{
		while (true)
		{
			ubyte[] dataWithPadding = new ubyte[rsaPadDataSize];
			dataWithPadding[0 .. payload.length] = payload[];
			randomBytes(dataWithPadding[payload.length .. $]);

			ubyte[] reversed = dataWithPadding.dup;
			reversed.reverse();

			ubyte[32] tempKey = void;
			randomBytes(tempKey[]);

			ubyte[] dataWithHash = new ubyte[rsaPadDataSize + 32];
			dataWithHash[0 .. rsaPadDataSize] = reversed[];
			dataWithHash[rsaPadDataSize .. $] = sha256(tempKey ~ dataWithPadding)[];

			ubyte[32] zeroIv;
			aesIgeEncrypt(dataWithHash, tempKey, zeroIv);

			auto encryptedHash = sha256(dataWithHash);
			ubyte[] keyAesEncrypted = new ubyte[256];
			foreach (i; 0 .. 32)
				keyAesEncrypted[i] = tempKey[i] ^ encryptedHash[i];
			keyAesEncrypted[32 .. $] = dataWithHash[];

			// The spec: retry with a fresh temp_key if the block is not
			// strictly below the RSA modulus.
			if (compareBigEndian(keyAesEncrypted, n) < 0)
				return encryptRaw(keyAesEncrypted);
		}
	}

	/// Raw RSA: pads `payload` to 256 bytes and returns `payload^e mod n`.
	///
	/// `payload` must be shorter than the modulus; the caller is responsible
	/// for the Telegram-specific fingerprint and random padding prefix.
	ubyte[] encryptRaw(const(ubyte)[] payload) const @safe
	{
		enforce!CryptoException(n.length == 256, "RSA modulus must be 256 bytes");
		enforce!CryptoException(payload.length <= 256, "RSA payload is too long");

		ubyte[] block = new ubyte[256];
		block[256 - payload.length .. $] = payload;
		return modPow(block, e, n);
	}
}

/// Compares two big-endian byte strings as unsigned integers.
private int compareBigEndian(const(ubyte)[] a, const(ubyte)[] b) @safe
{
	size_t i = 0;
	while (i < a.length && i < b.length && a[i] == b[i])
		i++;
	if (i == a.length && i == b.length)
		return 0;
	// Missing leading bytes mean zeroes.
	auto av = i < a.length ? a[i] : 0;
	auto bv = i < b.length ? b[i] : 0;
	return av < bv ? -1 : 1;
}

private ubyte[] tlBytes(const(ubyte)[] data) @safe
{
	auto buf = appender!(ubyte[])();

	// TL byte strings: 254+ bytes use a 0xfe marker and three length bytes.
	if (data.length < 254)
	{
		buf.put(cast(ubyte) data.length);
		buf.put(data);
		// Padding counts the length header: the span 1+len is 4-aligned.
		foreach (_; 0 .. (4 - (1 + data.length) % 4) % 4)
			buf.put(cast(ubyte) 0);
	}
	else
	{
		enforce(data.length < (1 << 24), "TL byte string is too long");
		buf.put(cast(ubyte) 254);
		buf.put(cast(ubyte) (data.length & 0xFF));
		buf.put(cast(ubyte) ((data.length >> 8) & 0xFF));
		buf.put(cast(ubyte) ((data.length >> 16) & 0xFF));
		buf.put(data);
		foreach (_; 0 .. (4 - (4 + data.length) % 4) % 4)
			buf.put(cast(ubyte) 0);
	}
	return buf.data;
}

private struct DerReader
{
	const(ubyte)[] data;
	size_t pos;

	this(const(ubyte)[] data) @safe
	{
		this.data = data;
		this.pos = 0;
	}

	const(ubyte)[] readSequence() @safe
	{
		enforce!CryptoException(tag() == 0x30, "DER: expected SEQUENCE");
		return readValue();
	}

	ubyte[] readInteger() @safe
	{
		enforce!CryptoException(tag() == 0x02, "DER: expected INTEGER");
		auto value = readValue();
		// Drop the DER sign byte.
		return value.length > 1 && value[0] == 0 ? value[1 .. $].dup : value.dup;
	}

	private ubyte tag() @safe
	{
		enforce!CryptoException(pos < data.length, "DER: unexpected end");
		return data[pos];
	}

	private const(ubyte)[] readValue() @safe
	{
		pos++; // tag
		enforce!CryptoException(pos < data.length, "DER: missing length");
		size_t len = data[pos++];
		if (len & 0x80)
		{
			auto count = len & 0x7F;
			enforce!CryptoException(count > 0 && count <= 4, "DER: bad length encoding");
			len = 0;
			foreach (_; 0 .. count)
			{
				enforce!CryptoException(pos < data.length, "DER: truncated length");
				len = (len << 8) | data[pos++];
			}
		}
		enforce!CryptoException(pos + len <= data.length, "DER: truncated value");
		auto value = data[pos .. pos + len];
		pos += len;
		return value;
	}
}

/// Test DC RSA public key (TDLib PublicRsaKeySharedMain.cpp, is_test branch).
immutable string mainPem = "-----BEGIN RSA PUBLIC KEY-----\nMIIBCgKCAQEA6LszBcC1LGzyr992NzE0ieY+BSaOW622Aa9Bd4ZHLl+TuFQ4lo4g5nKaMBwK/BIb9xUfg0Q29/2mgIR6Zr9krM7HjuIcCzFvDtr+L0GQjae9H0pRB2OO62cECs5HKhT5DZ98K33vmWiLowc621dQuwKWSQKjWf50XYFw42h21P2KXUGyp2y/+aEyZ+uVgLLQbRA1dEjSDZ2iGRy12Mk5gpYc397aYp438fsJoHIgJ2lgMv5h7WY9t6N/byY9Nw9p21Og3AoXSL2q/2IJ1WRUhebgAdGVMlV1fkuOQoEzR7EdpqtQD9Cs5+bfo3Nhmcyvk5ftB0WkJ9z6bNZ7yxrP8wIDAQAB\n-----END RSA PUBLIC KEY-----";

/// Production key, same shape as `testPem`.
immutable string testPem = "-----BEGIN RSA PUBLIC KEY-----\nMIIBCgKCAQEAyMEdY1aR+sCR3ZSJrtztKTKqigvO/vBfqACJLZtS7QMgCGXJ6XIRyy7mx66W0/sOFa7/1mAZtEoIokDP3ShoqF4fVNb6XeqgQfaUHd8wJpDWHcR2OFwvplUUI1PLTktZ9uW2WE23b+ixNwJjJGwBDJPQEQFBE+vfmH0JP503wr5INS1poWg/j25sIWeYPHYeOrFp/eXaqhISP6G+q2IeTaWTXpwZj4LzXq5YOpk4bYEQ6mvRq7D1aHWfYmlEGepfaYR8Q0YqvvhYtMte3ITnuSJs171+GDqpdKcSwHnd6FudwGO4pcCOj4WcDuXc2CTHgH8gFTNhp/Y8/SpDOhvn9QIDAQAB\n-----END RSA PUBLIC KEY-----";

@safe unittest // test key PEM parses to the expected fingerprint
{
	auto key = RsaPublicKey.fromPem(testPem);
	enforce(key.n.length == 256, "test key modulus length");
	enforce(key.e.length == 3 && key.e[0] == 0x01 && key.e[1] == 0x00 && key.e[2] == 0x01,
		"test key exponent is 65537");
	enforce(key.fingerprint() == 0xb25898df208d2603UL, "test key fingerprint mismatch");
}

@safe unittest // a PEM body wrapped at 64 columns parses to the same key
{
	auto key = RsaPublicKey.fromPem(testPem);
	auto k = key.n; // keep the reference for the fingerprint below

	immutable begin = "-----BEGIN RSA PUBLIC KEY-----";
	immutable end = "-----END RSA PUBLIC KEY-----";
	auto body = testPem[testPem.indexOf(begin) + begin.length .. testPem.indexOf(end)].strip;

	string wrapped = begin ~ "\n";
	foreach (i, c; body)
	{
		wrapped ~= c;
		if ((i + 1) % 64 == 0)
			wrapped ~= "\n";
	}
	if (wrapped[$ - 1] != '\n')
		wrapped ~= "\n";
	wrapped ~= end;

	auto parsed = RsaPublicKey.fromPem(wrapped);
	enforce(parsed.n == k, "wrapped PEM modulus");
	enforce(parsed.e == key.e, "wrapped PEM exponent");
}

@safe unittest // raw RSA output always fills the 256-byte modulus
{
	auto key = RsaPublicKey.fromPem(testPem);
	auto block = key.encryptRaw(cast(const(ubyte)[]) "abc");
	enforce(block.length == 256, "encryptRaw output length");
}

// RSA_PAD round trip: encrypt with a throwaway key, then undo every step of
// spec section 4.1 by hand and recover the payload.
unittest
{
	import deimos.openssl.bn: BIGNUM, BN_bn2bin, BN_free, BN_new, BN_num_bytes, BN_set_word;
	import deimos.openssl.rsa: RSA_free, RSA_generate_key_ex, RSA_get0_key, RSA_new;
	import deimos.openssl.types: RSA;
	import tgng.mtp.crypto: aesIgeDecrypt, sha256;

	RSA* rsa = RSA_new();
	enforce(rsa !is null, "RSA_new failed");
	scope(exit) RSA_free(rsa);

	BIGNUM* e = BN_new();
	scope(exit) BN_free(e);
	enforce(BN_set_word(e, 65537) == 1, "BN_set_word failed");
	enforce(RSA_generate_key_ex(rsa, 2048, e, null) == 1, "RSA_generate_key_ex failed");

	BIGNUM* nBn = null;
	BIGNUM* eBn = null;
	BIGNUM* dBn = null;
	RSA_get0_key(rsa, &nBn, &eBn, &dBn);
	enforce(dBn !is null, "RSA_get0_key: no private exponent");

	ubyte[] toBytes(const(BIGNUM)* bn) @trusted
	{
		auto len = BN_num_bytes(bn);
		auto buf = new ubyte[len];
		BN_bn2bin(bn, buf.ptr);
		return buf;
	}

	auto n = toBytes(nBn);
	auto d = toBytes(dBn);
	auto pub = RsaPublicKey(n, toBytes(eBn));

	ubyte[] payload = new ubyte[100];
	foreach (i; 0 .. payload.length)
		payload[i] = cast(ubyte) i;

	auto encrypted = pub.encrypt(payload);
	enforce(encrypted.length == 256, "RSA_PAD output length");

	// Server side: raw RSA decrypt.
	auto plain = modPow(encrypted, d, n);

	// Undo key_aes_encrypted = temp_key_xor ~ aes_encrypted.
	auto tempKeyXor = plain[0 .. 32];
	auto aesEncrypted = plain[32 .. $];
	auto hash = sha256(aesEncrypted);
	ubyte[32] tempKey = void;
	foreach (i; 0 .. 32)
		tempKey[i] = tempKeyXor[i] ^ hash[i];

	// Undo AES-IGE with the zero IV.
	auto dataWithHash = aesEncrypted.dup;
	ubyte[32] zeroIv;
	aesIgeDecrypt(dataWithHash, tempKey, zeroIv);
	auto digest = dataWithHash[192 .. $];
	auto reversed = dataWithHash[0 .. 192];

	// Undo SHA256(temp_key + data_with_padding).
	auto dataWithPadding = reversed.dup;
	dataWithPadding.reverse();
	ubyte[32] expectedDigest = sha256(tempKey ~ dataWithPadding);
	enforce(digest == expectedDigest[], "RSA_PAD digest mismatch");

	// Undo the random padding.
	enforce(dataWithPadding[0 .. payload.length] == payload, "RSA_PAD payload mismatch");
}
