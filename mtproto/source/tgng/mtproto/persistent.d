/// Persistent MTProto connection: assembles the transport stack and keeps it
/// alive across reconnects.
///
/// The stack built here is `TCP -> SOCKS5 -> obfuscated2 -> framing ->
/// encryption`, so the connection above sees whole MTProto payloads in both
/// directions. The module also owns the reconnect policy: a broken socket is
/// re-established lazily on the next send.
module tgng.mtproto.persistent;

import vibe.core.stream: ConnectionStream, IOMode, blocking;

import tgng.mtproto.encrypted_stream: EncryptedStream;
import tgng.mtproto.framing: FramedStream, FramingKind, frameAbridged;
import tgng.mtproto.obfuscated_stream: ObfuscatedStream, ObfuscatedTransport;
import tgng.mtproto.rpc: RpcContext;
import tgng.mtproto.transport: TransportConfig, connectTransport;

import core.time: Duration, msecs, seconds;
import std.exception: enforce;

@safe:

/// How the connection disguises itself and frames its traffic.
struct PersistenceConfig
{
	/// Where to connect (DC plus optional SOCKS5 proxy).
	TransportConfig transport;
	/// Whether to wrap the socket with `obfuscated2`.
	bool obfuscated = true;
	/// Framing used above the obfuscated transport.
	FramingKind framing = FramingKind.abridged;
	/// Delay before the first reconnect attempt.
	Duration reconnectDelay = 1.seconds;
	/// Upper bound for the exponential reconnect backoff.
	Duration maxReconnectDelay = 30.seconds;
}

/// A connection that survives a dropped socket by reconnecting.
///
/// The auth key and session identifier are fixed at construction, so the
/// stream can be rebuilt without re-running the handshake. `session` owns the
/// policy, this class only knows how to build and rebuild the stack.
final class PersistentConnection
{
	private
	{
		PersistenceConfig _config;
		ubyte[] _authKey;
		long _authKeyId;
		long _sessionId;
		TransportConfig _target;

		ConnectionStream _stream;
		ulong _connectAttempts;
	}

	/// Creates an unconnected instance bound to `authKey`.
	this(in PersistenceConfig config, const(ubyte)[] authKey, long authKeyId, long sessionId)
	{
		enforce(authKey.length == 256, "Auth key must be 256 bytes.");
		_config = config;
		_target = config.transport;
		_authKey = authKey.dup;
		_authKeyId = authKeyId;
		_sessionId = sessionId;
	}

	/// Whether the underlying socket is currently usable.
	@property bool connected() const
	{
		return _stream !is null && _stream.connected;
	}

	/// Number of successful connections made so far.
	@property ulong connectAttempts() const { return _connectAttempts; }

	/// Ensures a live stream, reconnecting when the old one is gone.
	///
	/// The stack is built from scratch, so a reconnected socket gets fresh
	/// obfuscation keys, which is what the DC expects.
	void ensureConnected() @blocking
	{
		if (connected)
			return;

		// Drop the stale stream before opening a new socket so the old
		// descriptor is not kept around by the wrapper chain.
		close();

		auto base = connectTransport(_target);
		scope (failure) base.close();

		ConnectionStream stream = base;
		if (_config.obfuscated)
			stream = obfuscateStream(stream, _obfuscatedKind());
		stream = _frame(stream);
		stream = new EncryptedStream(stream, _authKey, _authKeyId, _sessionId);

		_stream = stream;
		_connectAttempts++;
	}

	/// Sends one already serialised MTProto payload.
	size_t send(scope const(ubyte)[] payload) @blocking
	{
		ensureConnected();
		return _stream.write(payload, IOMode.all);
	}

	/// Receives one MTProto payload, waiting up to `timeout`.
	///
	/// Returns an empty slice when the socket has nothing to offer.
	ubyte[] receive(Duration timeout = Duration.max) @blocking
	{
		ensureConnected();
		if (!_stream.waitForData(timeout))
			return null;

		auto buf = new ubyte[_stream.leastSize];
		if (buf.length == 0)
			return null;
		_stream.read(buf);
		return buf;
	}

	/// Closes the socket and forgets the stream.
	void close() @blocking
	{
		if (_stream !is null)
		{
			_stream.close();
			_stream = null;
		}
	}

	/// Returns the delay before the next reconnect attempt.
	///
	/// The delay doubles per consecutive failure and is capped by
	/// `maxReconnectDelay`.
	Duration nextReconnectDelay() const
	{
		// `Duration` is immutable, so the doubling happens in milliseconds.
		long delayMs = _config.reconnectDelay.total!"msecs";
		long maxMs = _config.maxReconnectDelay.total!"msecs";
		auto factor = _connectAttempts == 0 ? 0 : _connectAttempts - 1;
		foreach (_; 0 .. factor)
		{
			if (delayMs >= maxMs)
				return _config.maxReconnectDelay;
			delayMs *= 2;
		}
		return delayMs > maxMs ? _config.maxReconnectDelay : delayMs.msecs;
	}

	/// Resets the backoff after a successful exchange.
	void resetBackoff()
	{
		_connectAttempts = 0;
	}

	/// Keeps the auth/session state in sync with the live stream.
	void attachContext(in RpcContext context)
	{
		enforce(context.sessionId == _sessionId,
			"Connection session id does not match the RPC context.");
	}

	private FramingKind _framing() const
	{
		return _config.framing;
	}

	private ObfuscatedTransport _obfuscatedKind() const
	{
		final switch (_config.framing)
		{
			case FramingKind.abridged:
				return ObfuscatedTransport.abridged;
			case FramingKind.intermediate:
				return ObfuscatedTransport.intermediate;
			case FramingKind.full:
				return ObfuscatedTransport.full;
		}
	}

	private ConnectionStream _frame(ConnectionStream inner) const
	{
		final switch (_config.framing)
		{
			case FramingKind.abridged:
				return frameAbridged(inner);
			case FramingKind.intermediate:
				return new FramedStream(inner, FramingKind.intermediate);
			case FramingKind.full:
				return new FramedStream(inner, FramingKind.full);
		}
	}
}

/// Wraps `inner` with `obfuscated2` in the requested transport flavour.
ObfuscatedStream obfuscateStream(ConnectionStream inner, ObfuscatedTransport kind)
{
	return new ObfuscatedStream(inner, kind);
}
