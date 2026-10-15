/// MTProto transport: TCP connection, optionally through SOCKS5.
///
/// The transport knows nothing about encryption and obfuscation: it hands
/// over and accepts ready-made MTProto packets (framing is done by the
/// caller). Later `ObfuscatedStream` and `EncryptedStream` will wrap this
/// stream.
module tgng.mtproto.transport;

import vibe.core.net: connectTCP;
import vibe.core.stream: ConnectionStream;
import vibe.internal.interfaceproxy: asInterface;
import vibe.stream.socks: createSocks5Stream;

import core.time: Duration, seconds;
import std.exception: enforce;

@safe:

/// DC connection settings.
struct TransportConfig
{
	/// DC host name or IP address.
	string host;
	/// DC port (usually 443 or 80).
	ushort port = 443;
	/// Connection establishment timeout.
	Duration connectTimeout = 10.seconds;

	/// SOCKS5 proxy address (empty means connect directly).
	string proxyHost;
	/// SOCKS5 proxy port.
	ushort proxyPort;
	/// SOCKS5 user name (optional).
	string proxyUser;
	/// SOCKS5 password (optional).
	string proxyPassword;
}

/// Opens a connection to the DC according to the config.
///
/// When `proxyHost` is set, the connection is established through SOCKS5
/// (first TCP to the proxy, then a tunnel to the DC).
ConnectionStream connectTransport(in TransportConfig config)
{
	enforce(config.host.length > 0, "DC host must not be empty.");

	auto tcp = connectTCP(config.host, config.port, null, 0, config.connectTimeout);
	if (config.proxyHost.length == 0)
		return asInterface!ConnectionStream(tcp);

	enforce(config.proxyPort != 0, "SOCKS5 proxy port must not be zero.");
	auto proxy = connectTCP(config.proxyHost, config.proxyPort, null, 0, config.connectTimeout);
	return createSocks5Stream(proxy, config.host, config.port,
		config.proxyUser, config.proxyPassword);
}
