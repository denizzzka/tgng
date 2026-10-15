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
		_inner = inner;
		_pending = null;
		_pendingOffset = 0;

		ubyte[HeaderSize] header;
		_makeHeader(header, transport);

		// The two directions use the header as-is and its reversed copy.
		ubyte[HeaderSize] reversedHeader = _reverseHeader(header);

		_enc.init(header[KeyOffset .. KeyOffset + KeySize].idup,
			header[IvOffset .. IvOffset + IvSize].idup);
		_dec.init(reversedHeader[KeyOffset .. KeyOffset + KeySize].idup,
			reversedHeader[IvOffset .. IvOffset + IvSize].idup);

		// Both peers discard one block of keystream before real data flows.
		_enc.apply(header[0 .. 0]);
		_dec.apply(header[0 .. 0]);

		_inner.write(header, IOMode.all);
		_inner.flush();
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
