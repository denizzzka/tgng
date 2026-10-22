/// TCP → SOCKS5 → obfuscated2 → framing as `ConnectionStream` plus a
/// `DhTransport` adapter for the DH handshake.
module tgng.mtp.transport;

import tgng.mtp.dh: DhTransport;
import tgng.mtp.framing: FramedStream, FramingKind, frameAbridged;
import tgng.mtp.obfuscated: ObfuscatedStream, ObfuscatedTransport;

import vibe.core.net: connectTCP;
import vibe.core.stream: ConnectionStream, IOMode, blocking;
import vibe.stream.socks: createSocks5Stream;

import core.time: Duration;
import std.exception: enforce;

@safe:

/// Adapter that turns a duck-typed stream (a struct such as `TCPConnection`
/// or `Socks5Stream`) into the `ConnectionStream` interface the wrappers need.
final class StreamAdapter(T): ConnectionStream
{
	private T _inner;

	this(T inner)
	{
		_inner = inner;
	}

	@property bool connected() const { return _inner.connected; }
	void close() @blocking { _inner.close(); }

	bool waitForData(Duration timeout = Duration.max) @blocking
	{
		return _inner.waitForData(timeout);
	}

	@property bool empty() @blocking { return _inner.empty; }
	@property ulong leastSize() @blocking { return _inner.leastSize; }
	@property bool dataAvailableForRead() { return _inner.dataAvailableForRead; }
	const(ubyte)[] peek() { return _inner.peek(); }

	size_t read(scope ubyte[] dst, IOMode mode) @blocking
	{
		return _inner.read(dst, mode);
	}

	size_t write(scope const(ubyte)[] bytes, IOMode mode) @blocking
	{
		return _inner.write(bytes, mode);
	}

	void flush() @blocking { _inner.flush(); }
	void finalize() @blocking { _inner.finalize(); }
}

/// Handshake transport: send/receive one MTProto message over a framed stream.
final class HandshakeTransport: DhTransport
{
	private FramedStream _stream;

	this(FramedStream stream)
	{
		_stream = stream;
	}

	void send(const(ubyte)[] data) @safe
	{
		enforce(_stream !is null, "HandshakeTransport: closed");
		_stream.write(data, IOMode.all);
		_stream.flush();
	}

	ubyte[] receive() @safe
	{
		enforce(_stream !is null, "HandshakeTransport: closed");
		auto len = _stream.leastSize;
		enforce(len > 0, "HandshakeTransport: connection closed");
		enforce(len <= MaxFrameSize, "HandshakeTransport: frame is too large");
		auto buf = new ubyte[len];
		_stream.read(buf, IOMode.all);
		return buf;
	}
}

private enum MaxFrameSize = 4 * 1024 * 1024;

/// Connect to TCP host, tunnel through SOCKS5 at `socksHost:socksPort`,
/// wrap with obfuscated2 (abridged/intermediate by `obf`) and framing.
FramedStream connectMtproto(string host, ushort port,
	string socksHost = null, ushort socksPort = 0,
	string socksUser = null, string socksPass = null,
	ObfuscatedTransport obf = ObfuscatedTransport.abridged,
	FramingKind kind = FramingKind.abridged,
	short dcId = 0,
	Duration timeout = Duration.max) @blocking
{
	ConnectionStream s;

	if (socksHost !is null && socksHost.length > 0)
	{
		enforce(socksPort != 0, "SOCKS5 port must be set when a proxy host is given");
		auto proxy = connectTCP(socksHost, socksPort, null, 0, timeout);
		auto socks = createSocks5Stream(proxy, host, port, socksUser, socksPass);
		s = new StreamAdapter!(typeof(socks))(socks);
	}
	else
	{
		auto tcp = connectTCP(host, port, null, 0, timeout);
		s = new StreamAdapter!(typeof(tcp))(tcp);
	}

	s = new ObfuscatedStream(s, obf, dcId);
	return new FramedStream(s, kind);
}

/// Build a `DhTransport` over `connectMtproto` chain for handshake.
HandshakeTransport handshakeTransport(string host, ushort port,
	string socksHost = null, ushort socksPort = 0,
	string socksUser = null, string socksPass = null,
	ObfuscatedTransport obf = ObfuscatedTransport.abridged,
	FramingKind kind = FramingKind.intermediate,
	short dcId = 0,
	Duration timeout = Duration.max) @blocking
{
	return new HandshakeTransport(
		connectMtproto(host, port, socksHost, socksPort, socksUser, socksPass, obf, kind, dcId, timeout));
}

@safe unittest // handshake transport wraps framed messages over in-memory wire
{
	import tgng.mtp.framing: BufferStream;
	import vibe.core.stream: IOMode;

	// Send through framed buffer
	auto sink = new BufferStream();
	auto framed = frameAbridged(sink);
	auto t = new HandshakeTransport(framed);
	t.send([1, 2, 3, 4]);
	auto wire = sink.output;
	enforce(wire.length == 4 + 1, "abridged frame prefix");

	// Receive back through a second buffer fed with the same wire
	auto source = new BufferStream(wire);
	auto rt = new HandshakeTransport(frameAbridged(source));
	enforce(rt.receive() == [1, 2, 3, 4], "handshake transport round-trip");
}
