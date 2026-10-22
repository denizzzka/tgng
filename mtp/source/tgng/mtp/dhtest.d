/// In-memory fake MTProto DH server and the handshake tests against it.
module tgng.mtp.dhtest;

import tgng.mtp.crypto: aesIgeDecrypt, aesIgeEncrypt, modPow, randomBytes, sha1, sha256;
import tgng.mtp.dh;
import tgng.mtp.rsa: RsaPublicKey;
import tgng.mtp.tl;

import std.algorithm: reverse;
import std.array: appender;
import std.exception: enforce;

/// What the fake server should do with a `set_client_DH_params` request.
enum FakeOutcome
{
	ok,
	retryOnce,
	fail
}

/// Safe prime with `g = 3`, shared by client and fake server.
private immutable ubyte[] fakePrime =
	[
		0xd2, 0x8f, 0x5f, 0xb5, 0xde, 0xc2, 0x4e, 0x3f, 0xc8, 0xa8, 0xd3, 0xf5, 0x82, 0xcd, 0x1f, 0xbd,
		0x1d, 0x26, 0x5d, 0xbd, 0xa3, 0x98, 0xb6, 0x1e, 0x80, 0xfb, 0xb0, 0x10, 0x67, 0x65, 0x89, 0xfd,
		0xfc, 0xb3, 0x07, 0x0e, 0xe4, 0xe1, 0x36, 0x2d, 0xb3, 0xe6, 0xa8, 0x92, 0x77, 0x3a, 0x10, 0xae,
		0xab, 0x3c, 0x5b, 0x55, 0xc8, 0x28, 0xe0, 0x93, 0xd0, 0xfd, 0x95, 0x2a, 0x24, 0x6c, 0x7e, 0x8d,
		0x28, 0xec, 0x62, 0x77, 0xdb, 0x41, 0xb3, 0xaf, 0xa7, 0x61, 0x1b, 0x30, 0x0a, 0x91, 0x1b, 0x69,
		0xda, 0x82, 0x82, 0xb4, 0x2d, 0xc8, 0x3a, 0x58, 0xfa, 0x6f, 0x36, 0xe3, 0xe6, 0x8a, 0xe4, 0xe4,
		0x38, 0xd1, 0x58, 0xf4, 0x49, 0x44, 0x64, 0xa4, 0x7d, 0xac, 0x4b, 0x02, 0xdb, 0x17, 0x7b, 0xd4,
		0xd1, 0xc6, 0x2a, 0x02, 0x22, 0xa0, 0xce, 0x6b, 0x91, 0x2c, 0x0f, 0x1c, 0x03, 0x1c, 0x65, 0xfa,
		0x04, 0x71, 0x37, 0xb4, 0x19, 0x84, 0x90, 0xbe, 0x40, 0xcf, 0x04, 0x99, 0xb4, 0xb3, 0x77, 0x39,
		0x31, 0x19, 0xdb, 0x8f, 0x20, 0x44, 0x82, 0x81, 0xd4, 0xb5, 0xe2, 0xbd, 0x15, 0x9c, 0xcd, 0x87,
		0x09, 0x71, 0x6c, 0xca, 0xe8, 0x5e, 0x1f, 0x0c, 0x47, 0xf3, 0x3f, 0x0a, 0x63, 0x38, 0xe6, 0x37,
		0x64, 0xc0, 0xb8, 0x05, 0x35, 0xd9, 0xf7, 0xa3, 0xa7, 0x12, 0x23, 0x2a, 0x2e, 0xb1, 0xbc, 0xd0,
		0x30, 0xfd, 0x03, 0x18, 0xdd, 0xb6, 0xa0, 0x6d, 0x59, 0x58, 0x43, 0x94, 0xd8, 0x87, 0xda, 0x0b,
		0x15, 0xa5, 0x6c, 0x60, 0xff, 0x16, 0x0d, 0xbe, 0x3e, 0xed, 0x56, 0x3f, 0x6d, 0x87, 0xfd, 0x63,
		0x1d, 0x42, 0x1b, 0x56, 0x93, 0x06, 0xf8, 0x5a, 0x81, 0x2f, 0xe9, 0x97, 0x13, 0xe2, 0x4e, 0xed,
		0x5f, 0xa7, 0xc2, 0x68, 0xfd, 0x58, 0x0c, 0xea, 0x35, 0x06, 0x6d, 0xc1, 0x9c, 0x58, 0xc0, 0xc3,
	];

/// Fake server over a request/response pair, with fault injection knobs.
final class FakeServer : DhTransport
{
	RsaPublicKey publicKey;
	ubyte[] privateExponent;
	FakeOutcome outcome;
	int serverTime = 1_700_000_000;

	/// Number of `set_client_DH_params` seen.
	int setClientCalls;

	/// Fault injection for negative tests.
	bool corruptAnswerSha1;
	bool corruptDhPrime;
	int badG;
	bool badGA;
	bool badNonce;

	// Nonces negotiated during the exchange.
	ubyte[16] nonce;
	ubyte[16] serverNonce;
	ubyte[32] newNonce;
	ubyte[] privateB;
	/// The client's g_b from the last set_client_DH_params.
	ubyte[] serverB;
	ubyte[] authKey;

	private ubyte[] response;

	void send(const(ubyte)[] data) @safe
	{
		auto r = TlReader(unwrapUnencrypted(data));
		switch (r.readConstructor())
		{
		case reqPqMultiId:
			handleReqPq(r);
			break;
		case reqDhParamsId:
			handleReqDhParams(r);
			break;
		case setClientDhParamsId:
			setClientCalls++;
			handleSetClientDhParams(r);
			break;
		default:
			throw new Exception("fake server: unexpected constructor");
		}
	}

	ubyte[] receive() @safe
	{
		return wrapUnencrypted(response, 0);
	}

	private ubyte[32] tmpKey() @safe
	{
		ubyte[32] key = void;
		ubyte[32] iv = void;
		deriveTmpKeyIv(newNonce, serverNonce, key, iv);
		return key;
	}

	private ubyte[32] tmpIv() @safe
	{
		ubyte[32] key = void;
		ubyte[32] iv = void;
		deriveTmpKeyIv(newNonce, serverNonce, key, iv);
		return iv;
	}

	private void handleReqPq(ref TlReader r) @safe
	{
		nonce = r.readInt128();
		r.finish();
		randomBytes(serverNonce[]);

		auto w = TlWriter();
		w.putConstructor(resPQId);
		w.putInt128(nonce);
		w.putInt128(serverNonce);
		w.putBytes(cast(const(ubyte)[]) "\x17\xED\x48\x94\x1A\x08\xF9\x81");
		w.putConstructor(vectorId);
		w.putInt(1);
		w.putLong(publicKey.fingerprint());
		response = w.data;
	}

	private void handleReqDhParams(ref TlReader r) @safe
	{
		auto reqNonce = r.readInt128();
		auto reqServerNonce = r.readInt128();
		r.readBytes();
		r.readBytes();
		auto fingerprint = r.readLong();
		auto encrypted = r.readBytes();
		r.finish();

		enforce(reqNonce == nonce, "fake server: req_DH_params nonce");
		enforce(reqServerNonce == serverNonce, "fake server: req_DH_params server_nonce");
		enforce(fingerprint == publicKey.fingerprint(), "fake server: fingerprint");

		auto plain = modPow(encrypted, privateExponent, publicKey.n);
		// modPow trims leading zero bytes; the RSA block is always 256 bytes.
		if (plain.length < 256)
		{
			auto padded = new ubyte[256];
			padded[256 - plain.length .. $] = plain[];
			plain = padded;
		}
		auto tempKeyXor = plain[0 .. 32];
		auto aesEncrypted = plain[32 .. $];
		auto hash = sha256(aesEncrypted);
		ubyte[32] tempKey = void;
		foreach (i; 0 .. 32)
			tempKey[i] = tempKeyXor[i] ^ hash[i];

		auto dataWithHash = aesEncrypted.dup;
		ubyte[32] zeroIv;
		aesIgeDecrypt(dataWithHash, tempKey, zeroIv);
		// Undo the reversal done by RSA_PAD.
		auto dataWithPadding = dataWithHash[0 .. 192].dup;
		dataWithPadding.reverse();

		auto inner = TlReader(dataWithPadding);
		enforce(inner.readConstructor() == pQInnerDataDcId, "fake server: not p_q_inner_data_dc");
		inner.readBytes();
		inner.readBytes();
		inner.readBytes();
		enforce(inner.readInt128() == nonce, "fake server: inner nonce");
		enforce(inner.readInt128() == serverNonce, "fake server: inner server_nonce");
		newNonce = inner.readInt256();

		auto key = tmpKey();
		auto iv = tmpIv();

		// The server's half of the DH exchange: g_a = g^b mod p.
		ubyte[256] freshB = void;
		randomBytes(freshB[]);
		freshB[0] |= 0x80;
		privateB = freshB.dup;
		ubyte[256] gA = void;
		auto gAbytes = modPow([cast(ubyte) 3], privateB, fakePrime);
		enforce(gAbytes.length <= 256, "fake server: g_a too long");
		gA[256 - gAbytes.length .. $] = gAbytes[];

		ubyte[] prime = fakePrime.dup;
		int g = 3;
		if (corruptDhPrime)
			prime[255] ^= 1;
		if (badG != 0)
			g = badG;
		if (badGA)
			gA[255] = 0;

		auto w = TlWriter();
		w.putConstructor(serverDhInnerDataId);
		ubyte[16] innerNonce = nonce;
		if (badNonce)
			innerNonce[] = 0xAA;
		w.putInt128(innerNonce);
		w.putInt128(serverNonce);
		w.putInt(g);
		w.putBytes(prime);
		w.putBytes(gA[]);
		w.putInt(serverTime);
		auto answer = w.data;

		size_t padded = (20 + answer.length + 15) & ~cast(size_t) 15;
		auto block = new ubyte[padded];
		block[20 .. 20 + answer.length] = answer[];
		if (padded > 20 + answer.length)
			randomBytes(block[20 + answer.length .. $]);
		// The hash covers the payload together with its padding.
		ubyte[20] body = sha1(block[20 .. $]);
		if (corruptAnswerSha1)
			body[0] ^= 1;
		block[0 .. 20] = body[];
		ubyte[32] ivCopy = iv;
		aesIgeEncrypt(block, key, ivCopy);

		auto reply = TlWriter();
		reply.putConstructor(serverDhParamsOkId);
		reply.putInt128(nonce);
		reply.putInt128(serverNonce);
		reply.putBytes(block);
		response = reply.data;
	}

	private void handleSetClientDhParams(ref TlReader r) @safe
	{
		auto reqNonce = r.readInt128();
		auto reqServerNonce = r.readInt128();
		auto encrypted = r.readBytes();
		r.finish();

		enforce(reqNonce == nonce, "fake server: set_client nonce");
		enforce(reqServerNonce == serverNonce, "fake server: set_client server_nonce");

		auto key = tmpKey();
		auto iv = tmpIv();
		ubyte[32] ivCopy = iv;
		auto plain = encrypted.dup;
		aesIgeDecrypt(plain, key, ivCopy);

		auto inner = TlReader(plain[20 .. $]);
		enforce(inner.readConstructor() == clientDhInnerDataId, "fake server: not client_DH_inner_data");
		inner.readInt128();
		inner.readInt128();
		auto retryId = inner.readLong();
		auto gB = inner.readBytes();
		// The client hashes the payload without its trailing random padding.
		enforce(sha1(plain[20 .. 20 + inner.pos]) == plain[0 .. 20], "fake server: client SHA-1");

		// The auth key comes from the b shared with g_a, whichever call arrives.
		static immutable ubyte[] g = [3];
		auto secret = modPow(gB, privateB, fakePrime);
		ubyte[256] sharedKey = void;
		sharedKey[256 - secret.length .. $] = secret[];
		authKey = sharedKey.dup;

		// The aux hash is the first 8 bytes of SHA-1(auth_key), as in the client.
		auto aux = sha1(authKey);
		ubyte n = 1;
		if (outcome == FakeOutcome.retryOnce && retryId == 0)
			n = 2;
		else if (outcome == FakeOutcome.fail)
			n = 3;

		auto buf = appender!(ubyte[])();
		buf.put(newNonce[]);
		buf.put(n);
		buf.put(aux[0 .. 8]);
		auto digest = sha1(buf.data);

		ubyte[16] nonceHash = void;
		nonceHash[] = digest[4 .. 20];

		auto reply = TlWriter();
		reply.putConstructor(n == 1 ? dhGenOkId : n == 2 ? dhGenRetryId : dhGenFailId);
		reply.putInt128(nonce);
		reply.putInt128(serverNonce);
		reply.putInt128(nonceHash);
		response = reply.data;
	}
}

// Generates a throwaway 2048-bit RSA key, as in rsa.d: nothing secret is
// checked into the repository.
private RsaPublicKey makeTestKey(out ubyte[] privateExponent) @trusted
{
	import deimos.openssl.bn: BIGNUM, BN_bn2bin, BN_free, BN_new, BN_num_bytes, BN_set_word;
	import deimos.openssl.rsa: RSA_free, RSA_generate_key_ex, RSA_get0_key, RSA_new;
	import deimos.openssl.types: RSA;

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

	ubyte[] toBytes(const(BIGNUM)* bn)
	{
		auto buf = new ubyte[BN_num_bytes(bn)];
		BN_bn2bin(bn, buf.ptr);
		return buf;
	}

	privateExponent = toBytes(dBn);
	return RsaPublicKey(toBytes(nBn), toBytes(eBn));
}

private FakeServer makeServer(FakeOutcome outcome = FakeOutcome.ok) @safe
{
	ubyte[] d;
	auto key = makeTestKey(d);
	auto server = new FakeServer;
	server.publicKey = key;
	server.privateExponent = d;
	server.outcome = outcome;
	return server;
}

@safe unittest // dh_gen_ok: both sides derive the same auth key
{
	auto server = makeServer();
	auto result = performHandshake(server, server.publicKey, 2);

	enforce(server.setClientCalls == 1, "one set_client_DH_params expected");
	enforce(result.authKey.length == 256, "auth key length");
	enforce(server.authKey == result.authKey, "auth keys differ");

	auto digest = sha1(result.authKey);
	ulong expectedId = 0;
	foreach (i; 0 .. 8)
		expectedId |= cast(ulong) digest[12 + i] << (8 * i);
	enforce(result.authKeyId == expectedId, "auth_key_id");

	foreach (i; 0 .. 8)
		enforce(result.serverSalt[i] == (server.newNonce[i] ^ server.serverNonce[i]),
			"server_salt");
}

@safe unittest // dh_gen_retry: a fresh b is sent with a non-zero retry_id
{
	auto server = makeServer(FakeOutcome.retryOnce);
	auto result = performHandshake(server, server.publicKey, 2);

	enforce(server.setClientCalls == 2, "two set_client_DH_params expected");
	enforce(server.authKey == result.authKey, "auth keys differ after retry");
}

@safe unittest // dh_gen_fail aborts the handshake
{
	auto server = makeServer(FakeOutcome.fail);
	bool thrown;
	try
		performHandshake(server, server.publicKey, 2);
	catch (DhException)
		thrown = true;
	enforce(thrown, "dh_gen_fail must throw");
}

@safe unittest // a mistyped SHA-1 over encrypted_answer is rejected
{
	auto server = makeServer();
	server.corruptAnswerSha1 = true;
	bool thrown;
	try
		performHandshake(server, server.publicKey, 2);
	catch (DhException)
		thrown = true;
	enforce(thrown, "corrupt answer hash must throw");
}

@safe unittest // nonces are checked
{
	auto server = makeServer();
	server.badNonce = true;
	bool thrown;
	try
		performHandshake(server, server.publicKey, 2);
	catch (DhException)
		thrown = true;
	enforce(thrown, "inner nonce mismatch must throw");
}

@safe unittest // an unknown RSA key fingerprint is rejected
{
	auto server = makeServer();
	ubyte[] otherD;
	auto otherKey = makeTestKey(otherD);
	bool thrown;
	try
		performHandshake(server, otherKey, 2);
	catch (DhException)
		thrown = true;
	enforce(thrown, "unknown fingerprint must throw");
}

@safe unittest // validateDhParams accepts the reference prime and rejects damage
{
	import tgng.mtp.tl: pQInnerDataDcId;
	static immutable ubyte[] gA = () {
		auto a = new ubyte[256];
		a[0] = 0x80;
		a[255] = 7;
		return a;
	}();

	validateDhParams(fakePrime, 3, gA);

	auto badPrime = fakePrime.dup;
	badPrime[255] ^= 1;
	void delegate() @safe[] bads = [
		() { auto p = badPrime; validateDhParams(p, 3, gA); },
		() { validateDhParams(fakePrime, 1, gA); },
		() { validateDhParams(fakePrime, 8, gA); },
	];
	foreach (bad; bads)
	{
		bool thrown;
		try
			bad();
		catch (DhException)
			thrown = true;
		enforce(thrown, "invalid DH params must throw");
	}
}
