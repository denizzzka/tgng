module probe;

import tgng.mtp.transport: connectMtproto, HandshakeTransport;
import tgng.mtp.obfuscated: ObfuscatedTransport;
import tgng.mtp.framing: FramingKind;
import tgng.mtp.dh: DhTransport, DhResult, performHandshake;
import tgng.mtp.rsa: RsaPublicKey, testPem;
import tgng.mtp.api: decodeAuthSentCode, encodeAuthImportBotAuthorization,
	encodeAuthSendCode, encodeAuthSignIn, encodeHelpGetConfig, encodeInitConnection,
	encodeInvokeWithLayer, isAuthAuthorization, mtprotoLayer, uintAt;
import tgng.mtp.connection: MtpConnection;
import testcreds: testApiHash, testApiId;

import core.time: seconds;
import std.conv: to;
import std.format: format;
import std.stdio: File;

/// Logs every MTProto message the handshake and the session exchange.
class LoggingTransport: DhTransport
{
	private DhTransport _inner;
	private File _log;

	this(DhTransport inner, File log)
	{
		_inner = inner;
		_log = log;
	}

	void send(const(ubyte)[] data) @trusted
	{
		_log.writeln(format("send %d: %(%02x%)", data.length, data));
		_log.flush();
		_inner.send(data);
	}

	ubyte[] receive() @trusted
	{
		auto data = _inner.receive();
		_log.writeln(format("recv %d: %(%02x%)", data.length, data));
		_log.flush();
		return data;
	}
}

void main()
{
	auto log = File("/tmp/opencode/probe4.log", "w");
	void say(string s) { log.writeln(s); log.flush(); }

	say("start");
	try
	{
		// The test account lives on DC 1; DC 2 answers PHONE_MIGRATE_1.
		auto framed = connectMtproto("149.154.175.10", 443, "127.0.0.1", 9050, null, null,
			ObfuscatedTransport.intermediate, FramingKind.intermediate, 10001, 15.seconds);
		say("connected");

		auto transport = new LoggingTransport(new HandshakeTransport(framed), log);
		auto key = RsaPublicKey.fromPem(testPem);
		auto result = performHandshake(transport, key, 10001);
		say("authKeyId=" ~ result.authKeyId.to!string);
		say("timeOffset=" ~ result.timeOffset.to!string);

		auto conn = new MtpConnection(transport, result.authKey, cast(long) result.authKeyId,
			result.serverSalt, result.timeOffset);
		auto query = encodeInvokeWithLayer(mtprotoLayer,
			encodeInitConnection(testApiId, "desktop", "linux", "1.0", "en", "", "en",
				encodeHelpGetConfig()));
		auto config = conn.invoke(query);
		say(format("config %d bytes, constructor %08x", config.length, config[0 .. 4].uintAt));

		// A bot token avoids the phone code entirely; without it, try sendCode.
		import std.process: environment;
		auto token = environment.get("MTP_BOT_TOKEN");
		ubyte[] authBody;
		if (token.length > 0)
			authBody = conn.invoke(encodeAuthImportBotAuthorization(testApiId, token, testApiHash));
		else
		{
			enum phone = "+15550100001";
			auto sent = conn.invoke(encodeAuthSendCode(phone, testApiId, testApiHash));
			auto sentCode = decodeAuthSentCode(sent);
			say(format("sentCode type %08x hash %s", sentCode.typeId, sentCode.phoneCodeHash));
			authBody = conn.invoke(encodeAuthSignIn(phone, sentCode.phoneCodeHash, "12345"));
		}
		say(format("authorization %08x, accepted=%s", authBody[0 .. 4].uintAt,
			isAuthAuthorization(authBody) ? "yes" : "no"));
		say("ok");
	}
	catch (Exception e)
	{
		say("FAILED: " ~ e.classinfo.name ~ ": " ~ e.msg);
	}
}
