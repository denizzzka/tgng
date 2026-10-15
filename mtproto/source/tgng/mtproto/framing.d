/// Кадрирование MTProto поверх потока: abridged и intermediate.
///
/// Обёртка реализует `ConnectionStream`, поэтому встраивается в цепочку
/// TCP → SOCKS5 → obfuscated2 → шифрование → framing без изменений выше.
module tgng.mtproto.framing;

import vibe.core.stream: ConnectionStream, IOMode, blocking;

import core.time: Duration;
import std.bitmanip: littleEndianToNative, nativeToLittleEndian;
import std.exception: enforce;

@safe:

/// Формат кадрирования.
enum FramingKind
{
	/// Длина — 1 байт в 4-байтовых словах; `0x7f` — escape на 3 байта.
	abridged,
	/// Длина — 4 байта little-endian, включает префикс.
	intermediate,
	/// Длина — 4 байта little-endian, включает префикс и seqno.
	full,
}

/// Обёртка над потоком, добавляющая MTProto-кадрирование.
///
/// Все пакеты нижележащего потока — это отдельные MTProto-сообщения.
/// `read` возвращает данные одного пакета; `write` отправляет пакет.
final class FramedStream: ConnectionStream
{
	private
	{
		ConnectionStream _inner;
		FramingKind _kind;
		// Буфер недопрочитанного пакета: один физический пакет
		// может разойтись на несколько вызовов read.
		ubyte[] _pending;
		size_t _pendingOffset;
	}

	/// Оборачивает `inner` выбранным форматом кадрирования.
	this(ConnectionStream inner, FramingKind kind)
	{
		_inner = inner;
		_kind = kind;
	}

	@property bool connected() const { return _inner.connected; }

	void close() @blocking
	{
		_inner.close();
	}

	bool waitForData(Duration timeout = Duration.max) @blocking
	{
		if (_pendingOffset < _pending.length) return true;
		return _inner.waitForData(timeout);
	}

	@property bool empty() @blocking
	{
		if (_pendingOffset < _pending.length) return false;
		return !_readFrame();
	}

	@property ulong leastSize() @blocking
	{
		if (_pendingOffset < _pending.length) return _pending.length - _pendingOffset;
		if (!_readFrame()) return 0;
		return _pending.length - _pendingOffset;
	}

	@property bool dataAvailableForRead()
	{
		return _pendingOffset < _pending.length || _inner.dataAvailableForRead;
	}

	const(ubyte)[] peek()
	{
		if (_pendingOffset < _pending.length)
			return _pending[_pendingOffset .. $];
		return null;
	}

	size_t read(scope ubyte[] dst, IOMode mode) @blocking
	{
		size_t total;
		while (total < dst.length) {
			if (_pendingOffset >= _pending.length && !_readFrame()) break;
			auto n = dst.length - total;
			auto avail = _pending.length - _pendingOffset;
			if (n > avail) n = avail;
			dst[total .. total + n] = _pending[_pendingOffset .. _pendingOffset + n];
			_pendingOffset += n;
			total += n;
			if (mode == IOMode.once) break;
		}
		return total;
	}

	size_t write(scope const(ubyte)[] bytes, IOMode mode) @blocking
	{
		// MTProto отправляет сообщения целиком; `IOMode.once` не имеет смысла.
		enforce(mode == IOMode.all, "FramedStream supports only IOMode.all for writes.");
		enforce(bytes.length > 0, "Cannot frame an empty MTProto message.");

		ubyte[] header = _encodeLength(bytes.length);
		_inner.write(header, IOMode.all);
		_inner.write(bytes, IOMode.all);
		return bytes.length;
	}

	void flush() @blocking { _inner.flush(); }
	void finalize() @blocking { _inner.finalize(); }

	/// Читает одно физическое сообщение в `_pending`.
	/// Возвращает `false`, если нижележащий поток закрылся до начала пакета.
	private bool _readFrame() @blocking
	{
		if (_inner.empty) return false;
		auto len = _decodeLength();
		if (len == 0) return false;
		_pending = new ubyte[len];
		_pendingOffset = 0;
		_inner.read(_pending);
		return true;
	}

	/// Читает префикс длины и возвращает длину полезной нагрузки.
	private size_t _decodeLength() @blocking @trusted
	{
		final switch (_kind) {
			case FramingKind.abridged:
				ubyte[1] first;
				_inner.read(first[]);
				if (first[0] < 0x7f) return cast(size_t)first[0] * 4;
				// Escape: 3 байта длины в словах, little-endian.
				ubyte[4] ext;
				_inner.read(ext[0 .. 3]);
				ext[3] = 0;
				return littleEndianToNative!uint(ext) * 4;
			case FramingKind.intermediate:
			case FramingKind.full:
				ubyte[4] raw;
				_inner.read(raw[]);
				auto v = littleEndianToNative!uint(raw);
				// Длина включает сам префикс (и seqno для full).
				auto overhead = (_kind == FramingKind.full) ? 8 : 4;
				enforce(v >= overhead, "Malformed MTProto frame length.");
				if (_kind == FramingKind.full) {
					// Пропускаем seqno: он не относится к полезной нагрузке.
					ubyte[4] seq;
					_inner.read(seq[]);
				}
				return v - overhead;
		}
	}

	/// Кодирует длину полезной нагрузки в префикс.
	private ubyte[] _encodeLength(size_t len)
	{
		final switch (_kind) {
			case FramingKind.abridged:
				enforce(len % 4 == 0, "Abridged frame payload must be a multiple of 4 bytes.");
				auto words = len / 4;
				if (words < 0x7f) return [cast(ubyte)words];
				enforce(words < (1 << 24), "Abridged frame is too long.");
				return [cast(ubyte)0x7f, cast(ubyte)(words & 0xff),
					cast(ubyte)((words >> 8) & 0xff), cast(ubyte)((words >> 16) & 0xff)];
			case FramingKind.intermediate:
				return nativeToLittleEndian(cast(uint)(len + 4))[0 .. 4].dup;
			case FramingKind.full:
				return nativeToLittleEndian(cast(uint)(len + 8))[0 .. 4].dup;
		}
	}
}

/// Оборачивает поток abridged-кадрированием.
FramedStream frameAbridged(ConnectionStream inner)
{
	return new FramedStream(inner, FramingKind.abridged);
}

/// Оборачивает поток intermediate-кадрированием.
FramedStream frameIntermediate(ConnectionStream inner)
{
	return new FramedStream(inner, FramingKind.intermediate);
}
