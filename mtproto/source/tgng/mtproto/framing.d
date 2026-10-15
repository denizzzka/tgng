/// MTProto framing over a stream: abridged and intermediate.
///
/// The wrapper implements `ConnectionStream`, so it fits into the chain
/// TCP -> SOCKS5 -> obfuscated2 -> encryption -> framing unchanged above.
module tgng.mtproto.framing;

import vibe.core.stream: ConnectionStream, IOMode, blocking;

import core.time: Duration;
import std.bitmanip: littleEndianToNative, nativeToLittleEndian;
import std.exception: enforce;

@safe:

/// Framing format.
enum FramingKind
{
	/// Length is 1 byte in 4-byte words; `0x7f` escapes to 3 bytes.
	abridged,
	/// Length is 4 bytes little-endian, includes the prefix.
	intermediate,
	/// Length is 4 bytes little-endian, includes the prefix and seqno.
	full,
}

/// Stream wrapper that adds MTProto framing.
///
/// Every packet of the underlying stream is a separate MTProto message.
/// `read` returns the data of one packet; `write` sends a packet.
final class FramedStream: ConnectionStream
{
	private
	{
		ConnectionStream _inner;
		FramingKind _kind;
		// Buffer of a partially read packet: one physical packet may
		// arrive split across several read calls.
		ubyte[] _pending;
		size_t _pendingOffset;
	}

	/// Wraps `inner` with the chosen framing format.
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
		// MTProto sends messages whole; `IOMode.once` makes no sense.
		enforce(mode == IOMode.all, "FramedStream supports only IOMode.all for writes.");
		enforce(bytes.length > 0, "Cannot frame an empty MTProto message.");

		ubyte[] header = _encodeLength(bytes.length);
		_inner.write(header, IOMode.all);
		_inner.write(bytes, IOMode.all);
		return bytes.length;
	}

	void flush() @blocking { _inner.flush(); }
	void finalize() @blocking { _inner.finalize(); }

	/// Reads one physical message into `_pending`.
	/// Returns `false` when the underlying stream closed before the packet.
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

	/// Reads the length prefix and returns the payload length.
	private size_t _decodeLength() @blocking @trusted
	{
		final switch (_kind) {
			case FramingKind.abridged:
				ubyte[1] first;
				_inner.read(first[]);
				if (first[0] < 0x7f) return cast(size_t)first[0] * 4;
				// Escape: 3 bytes of length in words, little-endian.
				ubyte[4] ext;
				_inner.read(ext[0 .. 3]);
				ext[3] = 0;
				return littleEndianToNative!uint(ext) * 4;
			case FramingKind.intermediate:
			case FramingKind.full:
				ubyte[4] raw;
				_inner.read(raw[]);
				auto v = littleEndianToNative!uint(raw);
				// The length includes the prefix itself (and seqno for full).
				auto overhead = (_kind == FramingKind.full) ? 8 : 4;
				enforce(v >= overhead, "Malformed MTProto frame length.");
				if (_kind == FramingKind.full) {
					// Skip seqno: it is not part of the payload.
					ubyte[4] seq;
					_inner.read(seq[]);
				}
				return v - overhead;
		}
	}

	/// Encodes the payload length into a prefix.
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

/// Wraps a stream with abridged framing.
FramedStream frameAbridged(ConnectionStream inner)
{
	return new FramedStream(inner, FramingKind.abridged);
}

/// Wraps a stream with intermediate framing.
FramedStream frameIntermediate(ConnectionStream inner)
{
	return new FramedStream(inner, FramingKind.intermediate);
}
