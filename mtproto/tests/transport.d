module transport_tests;

import core.time: seconds;
import std;

import tgng.mtproto.transport: TransportConfig, connectTransport;

import vibe.core.log: logInfo;
import vibe.core.net: listenTCP, resolveHost;

/// Проверяет полный цикл: локальный эхо-сервер -> connectTransport -> обмен.
void testRoundtrip(string host, ushort targetPort,
	string proxyHost = null, ushort proxyPort = 0)
{
	TransportConfig config;
	config.host = host;
	config.port = targetPort;
	config.connectTimeout = 10.seconds;
	config.proxyHost = proxyHost;
	config.proxyPort = proxyPort;

	auto conn = connectTransport(config);
	scope(exit) conn.close();

	ubyte[4] request = [1, 2, 3, 4];
	ubyte[4] response;
	conn.write(request[]);
	conn.read(response[]);

	enforce(response[] == request[], "Эхо-сервер вернул искажённые данные.");
}

void main()
{
	// Слушаем на "::", чтобы адрес был доступен и по IPv4, и по IPv6.
	auto echoServer = listenTCP(0, (conn) @safe nothrow {
		try {
			while (!conn.empty) {
				ubyte[4] buf;
				conn.read(buf[]);
				conn.write(buf[]);
			}
		} catch (Exception e) assert(false, e.msg);
	}, "::");
	scope(exit) echoServer.stopListening;

	auto echoPort = echoServer.bindAddress.port;

	logInfo("Проверка прямого соединения (без прокси)");
	testRoundtrip("127.0.0.1", echoPort);

	logInfo("Проверка соединения с несуществующим хостом");
	{
		TransportConfig bad;
		bad.host = "nonexistent.invalid";
		bad.port = 443;
		bad.connectTimeout = 5.seconds;
		assertThrown(connectTransport(bad));
	}

	auto proxyHost = environment.get("SOCKS5_PROXY_HOST", null);
	if (proxyHost.length > 0) {
		auto proxyPort = environment.get("SOCKS5_PROXY_PORT", "1080").to!ushort;
		logInfo("Проверка соединения через SOCKS5-прокси");
		testRoundtrip("127.0.0.1", echoPort, proxyHost, proxyPort);
	} else {
		logInfo("SOCKS5_PROXY_HOST не задан — проверка прокси пропущена");
	}

	logInfo("Тест транспорта завершён успешно.");
}
