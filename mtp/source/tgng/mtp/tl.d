/// Minimal hand-written TL codec for the MTProto DH handshake messages.
///
/// Only the constructors listed in `mtproto_api.tl` are supported; generic
/// API serialization lives elsewhere (or nowhere, for now).
module tgng.mtp.tl;

import std.array: Appender, appender;
import std.conv: hexString;
import std.exception: enforce;

/// Thrown on TL framing violations.
class TlException: Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		super(msg, file, line);
	}
}

/// A cursor over a TL-encoded byte buffer.
struct TlReader
{
	const(ubyte)[] data;
	size_t pos;

	/// Reads a bare `int` (little-endian).
	int readInt() @safe
	{
		need(4);
		int v = data[pos] | data[pos + 1] << 8 | data[pos + 2] << 16 | data[pos + 3] << 24;
		pos += 4;
		return v;
	}

	/// Reads a bare `long` (little-endian).
	ulong readLong() @safe
	{
		need(8);
		ulong v = 0;
		foreach (i; 0 .. 8)
			v |= cast(ulong) data[pos + i] << (8 * i);
		pos += 8;
		return v;
	}

	/// Reads an `int128` as raw 16 bytes.
	ubyte[16] readInt128() @safe
	{
		need(16);
		ubyte[16] v = data[pos .. pos + 16];
		pos += 16;
		return v;
	}

	/// Reads an `int256` as raw 32 bytes.
	ubyte[32] readInt256() @safe
	{
		need(32);
		ubyte[32] v = data[pos .. pos + 32];
		pos += 32;
		return v;
	}

	/// Reads a TL `string` (bare byte string with padding).
	const(ubyte)[] readBytes() @safe
	{
		enforce!TlException(pos < data.length, "TL: missing string length");
		size_t len;
		size_t headerLen;
		if (data[pos] < 254)
		{
			len = data[pos];
			headerLen = 1;
		}
		else
		{
			enforce!TlException(pos + 4 <= data.length, "TL: truncated long string header");
			len = data[pos + 1] | data[pos + 2] << 8 | data[pos + 3] << 16;
			headerLen = 4;
		}
		// TL pads the whole header+payload span to 4 bytes.
		auto aligned = (headerLen + len + 3) & ~cast(size_t) 3;
		need(aligned);
		auto v = data[pos + headerLen .. pos + headerLen + len];
		pos += aligned;
		return v;
	}

	/// Reads a constructor id.
	uint readConstructor() @safe
	{
		return cast(uint) readInt();
	}

	/// Asserts that exactly `expected` bytes remain unconsumed.
	void finish() @safe
	{
		enforce!TlException(pos == data.length, "TL: trailing bytes in message");
	}

	/// Number of bytes left after the last read field.
	size_t remaining() const @safe
	{
		return data.length - pos;
	}

	private void need(size_t count) @safe
	{
		enforce!TlException(pos + count <= data.length, "TL: message truncated");
	}
}

/// A TL encoder writing into an appender.
struct TlWriter
{
	/// Appender over the encoded bytes.
	Appender!(ubyte[]) buf;

	/// Writes a bare `int` (little-endian).
	void putInt(int v) @safe
	{
		foreach (i; 0 .. 4)
			buf.put(cast(ubyte) (v >>> (8 * i)));
	}

	/// Writes a bare `long` (little-endian).
	void putLong(ulong v) @safe
	{
		foreach (i; 0 .. 8)
			buf.put(cast(ubyte) (v >>> (8 * i)));
	}

	/// Writes a bare `int128`.
	void putInt128(const ubyte[16] v) @safe
	{
		buf.put(v[]);
	}

	/// Writes a TL `string`.
	void putBytes(const(ubyte)[] v) @safe
	{
		enforce!TlException(v.length < (1 << 24), "TL: byte string is too long");
		size_t headerLen;
		if (v.length < 254)
		{
			buf.put(cast(ubyte) v.length);
			headerLen = 1;
		}
		else
		{
			headerLen = 4;
			buf.put(cast(ubyte) 254);
			buf.put(cast(ubyte) (v.length & 0xFF));
			buf.put(cast(ubyte) ((v.length >> 8) & 0xFF));
			buf.put(cast(ubyte) ((v.length >> 16) & 0xFF));
		}
		buf.put(v);
		// Alignment counts the length header too: TL strings pad the whole
		// header+payload span to 4 bytes.
		foreach (_; 0 .. (4 - (headerLen + v.length) % 4) % 4)
			buf.put(cast(ubyte) 0);
	}

	/// Writes a constructor id.
	void putConstructor(uint id) @safe
	{
		putInt(cast(int) id);
	}

	/// Returns the encoded bytes.
	ubyte[] data() @safe
	{
		return buf.data;
	}
}

/// TL constructor ids of the handshake, from mtproto_api.tl.
enum uint reqPqMultiId = 0xBE7E8EF1;
enum uint resPQId = 0x05162463;
enum uint pQInnerDataDcId = 0xA9F55F95;
enum uint reqDhParamsId = 0xD712E4BE;
enum uint serverDhParamsOkId = 0xD0E8075C;
enum uint serverDhParamsFailId = 0xF2ECE23D;
enum uint serverDhInnerDataId = 0xB5890DBA;
enum uint clientDhInnerDataId = 0x6643B654;
enum uint setClientDhParamsId = 0xF5045F1F;
enum uint vectorId = 0x1CB5C415;
enum uint dhGenOkId = 0x3BCBF734;
enum uint dhGenRetryId = 0x46DC1FB9;
enum uint dhGenFailId = 0xA69DAE02;

/// `req_pq_multi#be7e8ef1 nonce:int128 = ResPQ`
ubyte[] encodeReqPqMulti(const ubyte[16] nonce) @safe
{
	TlWriter w;
	w.putConstructor(reqPqMultiId);
	w.putInt128(nonce);
	return w.data;
}

/// `resPQ#05162463 nonce:int128 server_nonce:int128 pq:string server_public_key_fingerprints:Vector long = ResPQ`
struct ResPq
{
	ubyte[16] nonce;
	ubyte[16] serverNonce;
	const(ubyte)[] pq;
	ulong[] fingerprints;
}

/// Decodes a `resPQ` message.
ResPq decodeResPq(const(ubyte)[] data) @safe
{
	auto r = TlReader(data);
	enforce!TlException(r.readConstructor() == resPQId, "TL: not resPQ");
	ResPq v;
	v.nonce = r.readInt128();
	v.serverNonce = r.readInt128();
	v.pq = r.readBytes();
	enforce!TlException(r.readConstructor() == vectorId, "TL: fingerprints are not a vector");
	auto count = r.readInt();
	enforce!TlException(count >= 0 && count <= 64, "TL: absurd fingerprint count");
	v.fingerprints = new ulong[count];
	foreach (ref f; v.fingerprints)
		f = r.readLong();
	r.finish();
	return v;
}

/// `p_q_inner_data_dc#a9f55f95 pq:string p:string q:string nonce:int128 server_nonce:int128 new_nonce:int256 dc:int = P_Q_inner_data`
ubyte[] encodePQInnerDataDc(const(ubyte)[] pq, const(ubyte)[] p, const(ubyte)[] q,
	const ubyte[16] nonce, const ubyte[16] serverNonce, const ubyte[32] newNonce, int dc) @safe
{
	TlWriter w;
	w.putConstructor(pQInnerDataDcId);
	w.putBytes(pq);
	w.putBytes(p);
	w.putBytes(q);
	w.putInt128(nonce);
	w.putInt128(serverNonce);
	w.buf.put(newNonce[]);
	w.putInt(dc);
	return w.data;
}

/// `req_DH_params#d712e4be nonce:int128 server_nonce:int128 p:string q:string public_key_fingerprint:long encrypted_data:string = Server_DH_Params`
ubyte[] encodeReqDhParams(const ubyte[16] nonce, const ubyte[16] serverNonce,
	const(ubyte)[] p, const(ubyte)[] q, ulong publicKeyFingerprint, const(ubyte)[] encryptedData) @safe
{
	TlWriter w;
	w.putConstructor(reqDhParamsId);
	w.putInt128(nonce);
	w.putInt128(serverNonce);
	w.putBytes(p);
	w.putBytes(q);
	w.putLong(publicKeyFingerprint);
	w.putBytes(encryptedData);
	return w.data;
}

/// `server_DH_params_ok#d0e8075c nonce:int128 server_nonce:int128 encrypted_answer:string = Server_DH_Params`
///
/// `server_DH_params_fail#f2ece23d` shares the same fields plus a reason.
struct ServerDhParams
{
	bool ok;
	ubyte[16] nonce;
	ubyte[16] serverNonce;
	const(ubyte)[] encryptedAnswer;
}

/// Decodes a `server_DH_params_ok` or `server_DH_params_fail` message.
ServerDhParams decodeServerDhParams(const(ubyte)[] data) @safe
{
	auto r = TlReader(data);
	auto id = r.readConstructor();
	enforce!TlException(id == serverDhParamsOkId || id == serverDhParamsFailId,
		"TL: not a server_DH_params message");
	ServerDhParams v;
	v.ok = id == serverDhParamsOkId;
	v.nonce = r.readInt128();
	v.serverNonce = r.readInt128();
	v.encryptedAnswer = r.readBytes();
	r.finish();
	return v;
}

/// `server_DH_inner_data#b5890dba nonce:int128 server_nonce:int128 g:int dh_prime:string g_a:string server_time:int = Server_DH_inner_data`
struct ServerDhInnerData
{
	ubyte[16] nonce;
	ubyte[16] serverNonce;
	int g;
	const(ubyte)[] dhPrime;
	const(ubyte)[] gA;
	int serverTime;
}

/// Decodes a `server_DH_inner_data` message.
ServerDhInnerData decodeServerDhInnerData(const(ubyte)[] data) @safe
{
	auto r = TlReader(data);
	enforce!TlException(r.readConstructor() == serverDhInnerDataId, "TL: not server_DH_inner_data");
	ServerDhInnerData v;
	v.nonce = r.readInt128();
	v.serverNonce = r.readInt128();
	v.g = r.readInt();
	v.dhPrime = r.readBytes();
	v.gA = r.readBytes();
	v.serverTime = r.readInt();
	// The plaintext is padded up to the AES block, so trailing bytes are expected.
	enforce!TlException(r.remaining() < 16, "TL: trailing bytes in server_DH_inner_data");
	return v;
}

/// `client_DH_inner_data#6643b654 nonce:int128 server_nonce:int128 retry_id:long g_b:string = Client_DH_inner_data`
ubyte[] encodeClientDhInnerData(const ubyte[16] nonce, const ubyte[16] serverNonce,
	ulong retryId, const(ubyte)[] gB) @safe
{
	TlWriter w;
	w.putConstructor(clientDhInnerDataId);
	w.putInt128(nonce);
	w.putInt128(serverNonce);
	w.putLong(retryId);
	w.putBytes(gB);
	return w.data;
}

/// `set_client_DH_params#f5045f1f nonce:int128 server_nonce:int128 encrypted_data:string = Set_client_DH_params_answer`
ubyte[] encodeSetClientDhParams(const ubyte[16] nonce, const ubyte[16] serverNonce,
	const(ubyte)[] encryptedData) @safe
{
	TlWriter w;
	w.putConstructor(setClientDhParamsId);
	w.putInt128(nonce);
	w.putInt128(serverNonce);
	w.putBytes(encryptedData);
	return w.data;
}

/// `dh_gen_ok` / `dh_gen_retry` / `dh_gen_fail`: nonce, server_nonce, new_nonce_hash.
struct DhGenResult
{
	/// Which of the three constructors was decoded.
	uint id;
	ubyte[16] nonce;
	ubyte[16] serverNonce;
	ubyte[16] newNonceHash;
}

/// Decodes a `dh_gen_ok`, `dh_gen_retry` or `dh_gen_fail` message.
DhGenResult decodeDhGen(const(ubyte)[] data) @safe
{
	auto r = TlReader(data);
	auto id = r.readConstructor();
	enforce!TlException(id == dhGenOkId || id == dhGenRetryId || id == dhGenFailId,
		"TL: not a dh_gen message");
	DhGenResult v;
	v.id = id;
	v.nonce = r.readInt128();
	v.serverNonce = r.readInt128();
	v.newNonceHash = r.readInt128();
	r.finish();
	return v;
}

@safe unittest // req_pq_multi / resPQ round trip
{
	ubyte[16] nonce = void;
	foreach (i; 0 .. 16)
		nonce[i] = cast(ubyte) i;

	auto req = encodeReqPqMulti(nonce);
	enforce(req.length == 20, "req_pq_multi length");
	auto wire = cast(uint[]) req[0 .. 4];
	enforce(wire[0] == reqPqMultiId, "req_pq_multi id");

	auto w = TlWriter();
	w.putConstructor(resPQId);
	w.putInt128(nonce);
	ubyte[16] serverNonce = void;
	foreach (i; 0 .. 16)
		serverNonce[i] = cast(ubyte) (0xF0 + i);
	w.putInt128(serverNonce);
	w.putBytes(cast(const(ubyte)[]) "\x17\xED\x48\x94\x1A\x08\xF9\x81");
	w.putConstructor(vectorId);
	w.putInt(2);
	w.putLong(0xC3B42B026CE86B21);
	w.putLong(0xE77010B98C347B21);

	auto res = decodeResPq(w.data);
	enforce(res.nonce == nonce, "resPQ nonce");
	enforce(res.serverNonce == serverNonce, "resPQ server_nonce");
	enforce(res.pq == cast(const(ubyte)[]) "\x17\xED\x48\x94\x1A\x08\xF9\x81", "resPQ pq");
	enforce(res.fingerprints == [0xC3B42B026CE86B21UL, 0xE77010B98C347B21UL], "resPQ fingerprints");
}

@safe unittest // long TL strings keep 4-byte alignment
{
	auto payload = new ubyte[256];
	foreach (i; 0 .. payload.length)
		payload[i] = cast(ubyte) i;

	TlWriter w;
	w.putBytes(payload);
	auto r = TlReader(w.data());
	auto back = r.readBytes();
	enforce(back == payload, "long string round trip");
	r.finish();
}

@safe unittest // server_DH_params and dh_gen decode
{
	ubyte[16] nonce = void;
	ubyte[16] serverNonce = void;
	foreach (i; 0 .. 16)
	{
		nonce[i] = cast(ubyte) i;
		serverNonce[i] = cast(ubyte) (i + 100);
	}

	auto w = TlWriter();
	w.putConstructor(serverDhParamsOkId);
	w.putInt128(nonce);
	w.putInt128(serverNonce);
	w.putBytes(cast(const(ubyte)[]) "encrypted-answer");

	auto params = decodeServerDhParams(w.data());
	enforce(params.ok, "server_DH_params_ok flag");
	enforce(params.nonce == nonce && params.serverNonce == serverNonce, "server_DH_params nonces");
	enforce(params.encryptedAnswer == cast(const(ubyte)[]) "encrypted-answer", "encrypted_answer");

	auto w2 = TlWriter();
	w2.putConstructor(dhGenOkId);
	w2.putInt128(nonce);
	w2.putInt128(serverNonce);
	ubyte[16] hash = void;
	foreach (i; 0 .. 16)
		hash[i] = cast(ubyte) (0x80 + i);
	w2.putInt128(hash);

	auto gen = decodeDhGen(w2.data());
	enforce(gen.id == dhGenOkId, "dh_gen_ok id");
	enforce(gen.newNonceHash == hash, "dh_gen hash");
}
