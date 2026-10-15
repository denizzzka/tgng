/// MTProto obfuscated2 transport wrapper.
///
/// Wraps a `ConnectionStream` so that all traffic is disguised as random
/// noise: a 64-byte header is derived from random bytes, and the payload
/// is XORed with the AES-256-CTR keystreams derived from that header.
module tgng.mtproto.obfuscated_stream;

import vibe.core.stream: ConnectionStream, IOMode, blocking;

import tgng.mtproto.crypto: AesCtr;

import core.time: Duration;
import std.exception: enforce;

@safe:

private enum HeaderSize = 64;
private enum KeyOffset = 8;
private enum KeySize = 32;
private enum IvOffset = 40;
private enum IvSize = 16;
private enum TransportOffset = 56;

/// Transport flavour encoded in the obfuscated2 header.
enum ObfuscatedTransport
{
	abridged,
	intermediate,
	full,
}

/// Stream wrapper that applies the obfuscated2 layer.
///
/// The handshake sends a single 64-byte header, half of which is plain
/// random material used only to seed the two AES-CTR keystreams; after
/// that every byte on the wire is keystream-applied.
final class ObfuscatedStream: ConnectionStream
{
	private
	{
		ConnectionStream _inner;
		AesCtr _enc;
		AesCtr _dec;
		ubyte[] _pending;
		size_t _pendingOffset;
	}

	/// Wraps `inner` and performs the obfuscated2 handshake.
	this(ConnectionStream inner, ObfuscatedTransport transport = ObfuscatedTransport.abridged)
	{
		ubyte[HeaderSize] header;
		_makeHeader(header, transport);

		_configure(inner, header);

		// The header travels in the clear: the peer reconstructs the read
		// keystream from it by reversing it.
		_inner.write(header, IOMode.all);
		_inner.flush();
	}

	private void _configure(ConnectionStream inner, const ref ubyte[HeaderSize] localHeader)
	{
		_inner = inner;
		_pending = null;
		_pendingOffset = 0;

		_enc.init(localHeader[KeyOffset .. KeyOffset + KeySize].idup,
			localHeader[IvOffset .. IvOffset + IvSize].idup);

		// Each direction consumes the header's 64 bytes of keystream.
		ubyte[HeaderSize] scratch;
		_enc.apply(scratch[]);
	}

	@property bool connected() const { return _inner.connected; }

	void close() @blocking
	{
		_enc.destroy();
		_dec.destroy();
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
		return _inner.empty;
	}

	@property ulong leastSize() @blocking
	{
		if (_pendingOffset < _pending.length) return _pending.length - _pendingOffset;
		return _inner.leastSize;
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
		if (_pendingOffset < _pending.length) {
			auto n = dst.length < _pending.length - _pendingOffset
				? dst.length : _pending.length - _pendingOffset;
			dst[0 .. n] = _pending[_pendingOffset .. _pendingOffset + n];
			_pendingOffset += n;
			if (n == dst.length || mode == IOMode.once) return n;
		}

		auto n = _inner.read(dst, mode);
		if (n == 0) return 0;
		_dec.apply(dst[0 .. n]);
		return n;
	}

	size_t write(scope const(ubyte)[] bytes, IOMode mode) @blocking
	{
		enforce(mode == IOMode.all, "ObfuscatedStream supports only IOMode.all for writes.");
		auto encrypted = new ubyte[bytes.length];
		encrypted[] = bytes;
		_enc.apply(encrypted);
		return _inner.write(encrypted, IOMode.all);
	}

	void flush() @blocking { _inner.flush(); }
	void finalize() @blocking { _inner.finalize(); }

	private static void _makeHeader(ref ubyte[HeaderSize] header, ObfuscatedTransport transport) @trusted
	{
		import tgng.mtproto.crypto: randomBytes;

		do {
			randomBytes(header[]);
		} while (header[0] == 0xef
			|| (header[4] == 0 && header[5] == 0 && header[6] == 0 && header[7] == 0));

		final switch (transport) {
			case ObfuscatedTransport.abridged:
				header[TransportOffset] = 0xef;
				break;
			case ObfuscatedTransport.intermediate:
				header[TransportOffset] = 0xee;
				header[TransportOffset + 1] = 0xee;
				header[TransportOffset + 2] = 0xee;
				header[TransportOffset + 3] = 0xee;
				break;
			case ObfuscatedTransport.full:
				foreach (i; 0 .. 8)
					header[TransportOffset + i] = 0xee;
				break;
		}
	}

	private static ubyte[HeaderSize] _reverseHeader(const ref ubyte[HeaderSize] header)
	{
		ubyte[HeaderSize] reversed = void;
		foreach (i; 0 .. HeaderSize)
			reversed[i] = header[HeaderSize - 1 - i];
		return reversed;
	}
}

@safe unittest // the transport marker occupies the documented header offsets
{
	foreach (transport; [ObfuscatedTransport.abridged, ObfuscatedTransport.intermediate,
		ObfuscatedTransport.full]) {
		ubyte[HeaderSize] header;
		ObfuscatedStream._makeHeader(header, transport);

		enforce(header[0] != 0xef, "the first byte must not collide with the abridged marker");
		final switch (transport) {
			case ObfuscatedTransport.abridged:
				enforce(header[TransportOffset] == 0xef, "abridged marker");
				break;
			case ObfuscatedTransport.intermediate:
				enforce(header[TransportOffset .. TransportOffset + 4] == [0xee, 0xee, 0xee, 0xee],
					"intermediate marker");
				break;
			case ObfuscatedTransport.full:
				enforce(header[TransportOffset .. TransportOffset + 8] == [0xee, 0xee, 0xee, 0xee, 0xee, 0xee, 0xee, 0xee],
					"full marker");
				break;
		}
	}
}

@safe unittest // _makeHeader rejects headers that could be mistaken for a frame prefix
{
	foreach (_; 0 .. 8) {
		ubyte[HeaderSize] header;
		ObfuscatedStream._makeHeader(header, ObfuscatedTransport.abridged);
		// `header[4 .. 8]` must not be an all-zero prefix, and `header[0]` is never 0xef.
		enforce(header[0] != 0xef, "rejected first byte");
		enforce(!(header[4] == 0 && header[5] == 0 && header[6] == 0 && header[7] == 0),
			"rejected all-zero length prefix");
	}
}

@safe unittest // _reverseHeader inverts byte order
{
	ubyte[HeaderSize] header;
	foreach (i; 0 .. HeaderSize) header[i] = cast(ubyte) i;
	auto reversed = ObfuscatedStream._reverseHeader(header);
	foreach (i; 0 .. HeaderSize)
		enforce(reversed[i] == cast(ubyte) (HeaderSize - 1 - i), "reversed byte order");
}


@safe unittest // write rejects IOMode.once, matching the whole-message contract
{
	auto wire = new LoopbackStream();
	auto stream = new ObfuscatedStream(wire);
	scope(exit) stream.close();

	bool thrown;
	try
		stream.write([1, 2, 3, 4], IOMode.once);
	catch (Exception)
		thrown = true;
	enforce(thrown, "ObfuscatedStream must reject IOMode.once on writes");
}

/// One-ended in-memory stream. Writes append to `output`; reads consume
/// `input`, which may be handed in from another instance to link the ends.
private final class LoopbackStream: ConnectionStream
{
	private ubyte[] _input;
	private size_t _offset;
	private ubyte[] _output;

	this(ubyte[] input = null)
	{
		_input = input;
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
		auto avail = _input.length - _offset;
		auto n = dst.length < avail ? dst.length : avail;
		enforce(n > 0 || mode != IOMode.all, "LoopbackStream is out of data.");
		dst[0 .. n] = _input[_offset .. _offset + n];
		_offset += n;
		return n;
	}

	size_t write(scope const(ubyte)[] bytes, IOMode mode) @blocking
	{
		enforce(mode == IOMode.all, "LoopbackStream supports only IOMode.all for writes.");
		_output ~= bytes;
		return bytes.length;
	}

	void flush() @blocking {}
	void finalize() @blocking {}
}
