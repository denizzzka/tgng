/// Live MTProto integration test. Skipped when the credential file is absent.
module integration;

import tgng.mtp.transport: connectMtproto, HandshakeTransport;
import tgng.mtp.obfuscated: ObfuscatedTransport;
import tgng.mtp.framing: FramingKind;
import tgng.mtp.dh: performHandshake;
import tgng.mtp.rsa: RsaPublicKey, mainPem;
import tgng.mtp.connection: MtpConnection;
import tgng.mtp.rpc: RpcError, migrationDc;
import tgng.mtp.api: decodeAuthSentCode, decodeFirstUser, encodeAuthSendCode,
    encodeAuthSignIn, encodeInitConnection, encodeInvokeWithLayer, encodeUsersGetUsersSelf,
    mtprotoLayer;

import core.time: seconds;
import std.conv: to;
import std.file: exists, readText;
import std.process: environment;
import std.stdio: readln, stderr, stdout, writeln;
import std.string: indexOf, lastIndexOf, splitLines, strip;

private enum defaultDcHost = "149.154.167.50";
private enum defaultDcId = 2;

private immutable string[string] dcHosts = [
    "1": "149.154.175.53",
    "2": "149.154.167.51",
    "3": "149.154.175.100",
    "4": "149.154.167.91",
    "5": "91.108.56.130",
];

/// Credentials from the environment, or null when the env file is absent.
private struct Credentials
{
    int apiId;
    string apiHash;
    string phone;
    string proxy;
}

void main()
{
    auto envFile = environment.get("TG_ENV_FILE");
    if (envFile.length == 0)
        envFile = exists("mtp/.env") ? "mtp/.env" : ".env";

    if (!loadEnv(envFile))
    {
        stderr.writeln("integration test skipped: ", envFile, " not found");
        return;
    }

    auto creds = readCredentials();
    if (creds.apiId == 0 || creds.apiHash.length == 0 || creds.phone.length == 0)
    {
        stderr.writeln("integration test skipped: TG_API_ID, TG_API_HASH or TG_PHONE is empty");
        return;
    }

    auto proxy = splitProxy(creds.proxy);
    auto code = environment.get("TG_CODE");

    int dcId = defaultDcId;
    string host = defaultDcHost;

    foreach (attempt; 0 .. 3)
    {
        try
        {
            auto conn = connect(dcId, host, proxy);
            auto sent = conn.invoke(encodeInvokeWithLayer(mtprotoLayer,
                encodeInitConnection(creds.apiId, "desktop", "linux", "1.0", "en", "", "en",
                    encodeAuthSendCode(creds.phone, creds.apiId, creds.apiHash))));
            auto sentCode = decodeAuthSentCode(sent);
            writeln("code sent, type ", sentCode.typeId, ", hash ", sentCode.phoneCodeHash);
            stdout.flush();

            if (code.length == 0)
            {
                stderr.write("code: ");
                stderr.flush();
                code = readln().strip;
            }
            if (code.length == 0)
            {
                writeln("no code given, stopping after sendCode");
                return;
            }

            conn.invoke(encodeAuthSignIn(creds.phone, sentCode.phoneCodeHash, code));
            auto me = decodeFirstUser(conn.invoke(encodeUsersGetUsersSelf()));
            writeln("signed in as ", me.username, " (id ", me.id, ")");
            return;
        }
        catch (RpcError e)
        {
            auto target = migrationDc(e.text);
            if (target == 0)
            {
                stderr.writeln("integration test failed: ", e.msg);
                return;
            }
            dcId = target;
            host = dcHosts.get(target.to!string, defaultDcHost);
            writeln("migrating to DC ", target);
        }
        catch (Exception e)
        {
            stderr.writeln("integration test failed: ", e.msg);
            return;
        }
    }

    stderr.writeln("integration test failed: too many DC migrations");
}

/// Reads KEY=VALUE lines, leaving already set variables untouched.
private bool loadEnv(string path)
{
    if (!exists(path))
        return false;

    foreach (line; readText(path).splitLines)
    {
        auto text = line.strip;
        if (text.length == 0 || text[0] == '#')
            continue;
        auto eq = text.indexOf('=');
        if (eq <= 0)
            continue;
        auto key = text[0 .. eq].strip;
        if (environment.get(key).length == 0)
            environment[key] = text[eq + 1 .. $].strip;
    }
    return true;
}

private Credentials readCredentials()
{
    Credentials creds;
    auto apiId = environment.get("TG_API_ID");
    if (apiId.length > 0)
        creds.apiId = apiId.to!int;
    creds.apiHash = environment.get("TG_API_HASH");
    creds.phone = environment.get("TG_PHONE");
    creds.proxy = environment.get("TG_PROXY");
    return creds;
}

/// Splits `host:port`; an empty value means a direct connection.
private struct Proxy
{
    string host;
    ushort port;
}

private Proxy splitProxy(string value)
{
    Proxy proxy;
    if (value.length == 0)
        return proxy;
    auto colon = value.lastIndexOf(':');
    if (colon < 0)
        return proxy;
    proxy.host = value[0 .. colon];
    proxy.port = value[colon + 1 .. $].to!ushort;
    return proxy;
}

private MtpConnection connect(int dcId, string host, Proxy proxy)
{
    auto framed = connectMtproto(host, 443, proxy.host, proxy.port, null, null,
        ObfuscatedTransport.intermediate, FramingKind.intermediate, cast(short) dcId, 20.seconds);
    auto transport = new HandshakeTransport(framed);
    auto key = RsaPublicKey.fromPem(mainPem);
    auto result = performHandshake(transport, key, dcId);
    return new MtpConnection(transport, result.authKey, cast(long) result.authKeyId,
        result.serverSalt, result.timeOffset);
}
