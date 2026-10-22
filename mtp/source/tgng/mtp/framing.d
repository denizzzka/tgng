/// MTProto framing over a stream: abridged, intermediate and full.
///
/// The wrapper implements `ConnectionStream`, so it fits into the chain
/// TCP -> SOCKS5 -> obfuscated2 -> framing unchanged.
module tgng.mtp.framing;

import vibe.core.stream: ConnectionStream, IOMode, blocking;

import core.time: Duration;
import std.bitmanip: littleEndianToNative, nativeToLittleEndian;
import std.conv: to;
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

/// Raised when the server sends a transport-level error such as -404.
class TransportError: Exception
{
	/// The error code as sent, for example -404.
	int code;

	this(int code, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		this.code = code;
		super("transport error " ~ code.to!string, file, line);
	}
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

		auto head = _readHead();
		if (head.isQuickAck)
		{
			_pending = head.quickAck.dup;
			_pendingOffset = 0;
			return true;
		}
		if (head.payloadLength == 0) return false;

		auto buf = new ubyte[head.payloadLength];
		size_t got;
		while (got < buf.length)
		{
			auto n = _inner.read(buf[got .. $], IOMode.all);
			if (n == 0) return false;
			got += n;
		}

		// A four-byte payload is a transport error: -404 and friends.
		if (_kind == FramingKind.intermediate && buf.length == 4)
		{
			immutable code = cast(int) (cast(uint) buf[0] | cast(uint) buf[1] << 8
				| cast(uint) buf[2] << 16 | cast(uint) buf[3] << 24);
			if (code < 0)
				throw new TransportError(code);
		}

		_pending = buf;
		_pendingOffset = 0;
		return true;
	}

	/// A length prefix, or an intermediate quick-ack token that is a packet itself.
	private struct FrameHead
	{
		size_t payloadLength;
		ubyte[4] quickAck;
		bool isQuickAck;
	}

	private FrameHead _readHead() @blocking @trusted
	{
		FrameHead head;
		final switch (_kind) {
			case FramingKind.abridged:
				ubyte[1] first;
				_inner.read(first[]);
				if (first[0] < 0x7f)
				{
					head.payloadLength = cast(size_t) first[0] * 4;
					return head;
				}
				// Escape: 3 bytes of length in words, little-endian.
				ubyte[4] ext;
				_inner.read(ext[0 .. 3]);
				ext[3] = 0;
				head.payloadLength = littleEndianToNative!uint(ext) * 4;
				return head;
			case FramingKind.intermediate:
				ubyte[4] raw;
				_inner.read(raw[]);
				auto v = littleEndianToNative!uint(raw);
				// Quick ack tokens have the high bit set and are not lengths.
				if (v & 0x8000_0000)
				{
					head.isQuickAck = true;
					head.quickAck = raw;
					return head;
				}
				head.payloadLength = v;
				return head;
			case FramingKind.full:
				ubyte[4] raw;
				_inner.read(raw[]);
				auto v = littleEndianToNative!uint(raw);
				// The length includes the prefix itself and seqno.
				enforce(v >= 8, "Malformed MTProto frame length.");
				ubyte[4] seq;
				_inner.read(seq[]);
				head.payloadLength = v - 8;
				return head;
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
				return nativeToLittleEndian(cast(uint) len)[0 .. 4].dup;
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

@safe unittest // abridged round-trip, short and escaped lengths
{
	foreach (payload; [new ubyte[4], new ubyte[252], new ubyte[256], new ubyte[1020]]) {
		auto sink = new BufferStream();
		frameAbridged(sink).write(payload, IOMode.all);

		auto wire = sink.output;
		if (payload.length / 4 < 0x7f)
			enforce(wire.length == payload.length + 1, "abridged short prefix is one byte");
		else
			enforce(wire.length == payload.length + 4, "abridged escaped prefix is four bytes");

		auto source = new BufferStream(sink.output);
		ubyte[] got = new ubyte[payload.length];
		enforce(frameAbridged(source).read(got, IOMode.all) == payload.length, "abridged read length");
		enforce(got == payload, "abridged payload round-trip");
	}
}

@safe unittest // abridged escape encodes the word count little-endian
{
	auto sink = new BufferStream();
	frameAbridged(sink).write(new ubyte[0x7f * 4], IOMode.all);

	enforce(sink.output[0] == 0x7f, "escape marker");
	enforce(sink.output[1] == 0x7f && sink.output[2] == 0 && sink.output[3] == 0,
		"escaped length is little-endian word count");
}

@safe unittest // intermediate round-trip
{
	foreach (payload; [new ubyte[4], new ubyte[16], new ubyte[1024]]) {
		auto sink = new BufferStream();
		frameIntermediate(sink).write(payload, IOMode.all);

		auto wire = sink.output;
		enforce(wire.length == payload.length + 4, "intermediate prefix is four bytes");
		auto declared = littleEndianToNative!uint(wire[0 .. 4]);
		enforce(declared == payload.length, "intermediate length is the payload length");

		auto source = new BufferStream(wire);
		ubyte[] got = new ubyte[payload.length];
		enforce(frameIntermediate(source).read(got, IOMode.all) == payload.length, "intermediate read length");
		enforce(got == payload, "intermediate payload round-trip");
	}
}

@safe unittest // a frame split across inner reads is reassembled
{
	auto sink = new BufferStream();
	auto payload = new ubyte[64];
	foreach (i; 0 .. payload.length) payload[i] = cast(ubyte) i;
	frameIntermediate(sink).write(payload, IOMode.all);

	// Drip the bytes one at a time, so no inner read ever sees a whole frame.
	auto source = new BufferStream(sink.output, 1);
	auto framed = frameIntermediate(source);
	ubyte[] got = new ubyte[payload.length];
	enforce(framed.read(got, IOMode.all) == payload.length, "split frame read length");
	enforce(got == payload, "split frame payload");
}

@safe unittest // one read call returns at most one frame
{
	auto sink = new BufferStream();
	frameIntermediate(sink).write(new ubyte[8], IOMode.all);
	frameIntermediate(sink).write(new ubyte[12], IOMode.all);

	auto source = new BufferStream(sink.output);
	auto framed = frameIntermediate(source);
	ubyte[] got = new ubyte[64];
	auto n = framed.read(got, IOMode.once);
	enforce(n == 8, "IOMode.once stops at the frame boundary");
	enforce(framed.leastSize == 12, "the second frame is buffered");
}

@safe unittest // empty and leastSize agree with the buffered frame
{
	auto sink = new BufferStream();
	frameAbridged(sink).write(new ubyte[16], IOMode.all);

	auto source = new BufferStream(sink.output);
	auto framed = frameAbridged(source);
	enforce(!framed.empty, "a buffered frame is not empty");
	enforce(framed.leastSize == 16, "leastSize reports the payload");
	enforce(framed.peek.length == 16, "peek exposes the payload without consuming it");
}

@safe unittest // a closed inner stream yields empty
{
	auto source = new BufferStream();
	enforce(frameAbridged(source).empty, "no frame means empty");
}

@safe unittest // abridged rejects a payload that is not a multiple of four
{
	auto sink = new BufferStream();
	bool thrown;
	try
		frameAbridged(sink).write(new ubyte[6], IOMode.all);
	catch (Exception)
		thrown = true;
	enforce(thrown, "abridged must reject a non-word-aligned payload");
}

@safe unittest // intermediate rejects a length below the prefix overhead
{
	auto source = new BufferStream([cast(ubyte) 0x02, 0, 0, 0]);
	bool thrown;
	try
		frameIntermediate(source).leastSize;
	catch (Exception)
		thrown = true;
	enforce(thrown, "intermediate must reject a length below the prefix");
}

/// In-memory `ConnectionStream` used by the framing tests.
/// Reads from `input`, writes are appended to `output`; `chunk` limits
/// how many bytes a single read may return, emulating a split packet.
final class BufferStream: ConnectionStream
{
	private ubyte[] _input;
	private size_t _offset;
	private ubyte[] _output;
	private size_t _chunk;

	this(ubyte[] input = null, size_t chunk = size_t.max)
	{
		_input = input;
		_chunk = chunk;
	}

	@property ubyte[] output() { return _output; }

	@property bool connected() const { return true; }

	void close() @blocking {}

	bool waitForData(Duration timeout = Duration.max) @blocking
	{
		return _offset < _input.length;
	}

	@property bool empty() @blocking { return _offset >= _input.length; }

	@property ulong leastSize() @blocking { return _input.length - _offset; }

	@property bool dataAvailableForRead() { return _offset < _input.length; }

	const(ubyte)[] peek() { return _input[_offset .. $]; }

	size_t read(scope ubyte[] dst, IOMode mode) @blocking
	{
		// Mimics a real blocking stream: `IOMode.all` keeps pulling past
		// `chunk` until `dst` is full, so callers never see a short read.
		size_t total;
		while (total < dst.length) {
			auto avail = _input.length - _offset;
			if (avail == 0) break;
			auto n = dst.length - total;
			if (n > avail) n = avail;
			if (n > _chunk) n = _chunk;
			dst[total .. total + n] = _input[_offset .. _offset + n];
			_offset += n;
			total += n;
			if (mode == IOMode.once) break;
		}
		if (mode == IOMode.all)
			enforce(total == dst.length, "BufferStream is out of data.");
		return total;
	}

	size_t write(scope const(ubyte)[] bytes, IOMode mode) @blocking
	{
		enforce(mode == IOMode.all, "BufferStream supports only IOMode.all for writes.");
		_output ~= bytes;
		return bytes.length;
	}

	void flush() @blocking {}
	void finalize() @blocking {}
}
