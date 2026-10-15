/// Транспорт MTProto: TCP-соединение, опционально через SOCKS5.
///
/// Транспорт не знает про шифрование и обфускацию — он отдаёт и
/// принимает уже готовые MTProto-пакеты (кадрирование выполняет
/// вызывающий). Позже поверх этого потока будут надеты обёртки
/// `ObfuscatedStream` и `EncryptedStream`.
module tgng.mtproto.transport;

import vibe.core.net: connectTCP;
import vibe.core.stream: ConnectionStream;
import vibe.internal.interfaceproxy: asInterface;
import vibe.stream.socks: createSocks5Stream;

import core.time: Duration, seconds;
import std.exception: enforce;

@safe:

/// Настройки подключения к DC.
struct TransportConfig
{
	/// Имя хоста или IP-адрес DC.
	string host;
	/// Порт DC (обычно 443 или 80).
	ushort port = 443;
	/// Таймаут установления соединения.
	Duration connectTimeout = 10.seconds;

	/// Адрес SOCKS5-прокси (пусто — подключаться напрямую).
	string proxyHost;
	/// Порт SOCKS5-прокси.
	ushort proxyPort;
	/// Имя пользователя SOCKS5 (необязательно).
	string proxyUser;
	/// Пароль SOCKS5 (необязательно).
	string proxyPassword;
}

/// Открывает соединение с DC согласно конфигу.
///
/// Если задан `proxyHost`, соединение устанавливается через SOCKS5
/// (сначала TCP до прокси, затем туннель до DC).
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
