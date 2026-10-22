/// In-memory RPC server for session-level tests.
///
/// It decrypts a request with the shared auth key, answers with an
/// `rpc_result` (or `rpc_error`) encrypted the same way, and needs no sockets.
module tgng.mtp.rtest;

import tgng.mtp.api: authAuthorizationId, authImportBotAuthorizationId, encodeAuthImportBotAuthorization,
	isAuthAuthorization;
import tgng.mtp.container: PlainMessage, authKeyIdOf, decryptMessage, encryptMessage;
import tgng.mtp.connection: MtpConnection;
import tgng.mtp.dh: DhTransport;
import tgng.mtp.rpc: RpcError, encodeRpcError, encodeRpcResult;
import tgng.mtp.tl: TlReader, TlWriter;

import std.exception: enforce;

/// Replaces a real DC for one request/response exchange at a time.
final class FakeRpcTransport: DhTransport
{
	private
	{
		ubyte[] _authKey;
		long _authKeyId;
		ubyte[] _reply;
		long _replyId;
	}

	this(const(ubyte)[] authKey) @safe
	{
		_authKey = authKey.dup;
		_authKeyId = authKeyIdOf(_authKey);
	}

	void send(const(ubyte)[] data) @safe
	{
		auto msg = decryptMessage(data, _authKey, true);
		_replyId = msg.messageId;
		_reply = _handle(msg.body);
	}

	ubyte[] receive() @safe
	{
		enforce(_reply.length > 0, "fake server: no reply prepared");
		PlainMessage reply;
		reply.sessionId = 1;
		reply.messageId = 2;
		reply.seqNo = 1;
		reply.body = _reply;
		_reply = null;
		return encryptMessage(reply, _authKey, _authKeyId, false);
	}

	private ubyte[] _handle(const(ubyte)[] body) @safe
	{
		auto r = TlReader(body);
		switch (r.readConstructor())
		{
		case authImportBotAuthorizationId:
			r.readInt(); // flags
			auto apiId = r.readInt();
			auto token = r.readBytes();
			r.readBytes(); // api_hash
			if (apiId != 1)
				return encodeRpcError(400, "API_ID_INVALID");
			if (token != cast(const(ubyte)[]) "valid")
				return encodeRpcError(400, "ACCESS_TOKEN_INVALID");
			// Minimal auth.authorization#2ea2c0d4 body; tests check the constructor.
			auto w = TlWriter();
			w.putConstructor(authAuthorizationId);
			w.putInt(0);
			return encodeRpcResult(_replyId, w.data());
		default:
			return encodeRpcError(400, "UNKNOWN_METHOD");
		}
	}
}

@safe unittest // a bot token is accepted and yields auth.authorization
{
	auto key = new ubyte[256];
	foreach (i; 0 .. key.length)
		key[i] = cast(ubyte) i;
	ubyte[8] salt;
	auto conn = new MtpConnection(new FakeRpcTransport(key), key, authKeyIdOf(key), salt, 0);

	auto auth = conn.invoke(encodeAuthImportBotAuthorization(1, "valid", "hash"));
	enforce(isAuthAuthorization(auth), "auth.authorization is returned");
}

@safe unittest // a wrong token and a wrong api_id are reported as rpc errors
{
	auto key = new ubyte[256];
	foreach (i; 0 .. key.length)
		key[i] = cast(ubyte) (i + 1);
	ubyte[8] salt;
	auto conn = new MtpConnection(new FakeRpcTransport(key), key, authKeyIdOf(key), salt, 0);

	bool badToken;
	try
		conn.invoke(encodeAuthImportBotAuthorization(1, "bad", "hash"));
	catch (RpcError e)
		badToken = e.text == "ACCESS_TOKEN_INVALID";
	enforce(badToken, "wrong token is rejected");

	bool badApiId;
	try
		conn.invoke(encodeAuthImportBotAuthorization(2, "valid", "hash"));
	catch (RpcError e)
		badApiId = e.text == "API_ID_INVALID";
	enforce(badApiId, "wrong api_id is rejected");
}
