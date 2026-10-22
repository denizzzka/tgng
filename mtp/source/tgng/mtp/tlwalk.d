/// Generic TL object walker driven by the generated schema table.
///
/// It can skip any constructor found in `telegram_api.tl`, including the
/// nested objects and vectors that message and update decoding runs into.
module tgng.mtp.tlwalk;

import tgng.mtp.schema: SchemaConstructor, SchemaField, schemaFind;

import std.algorithm.searching: startsWith;
import std.exception: enforce;
import std.string: indexOf;

/// Raised when the wire does not match the schema.
class TlWalkException: Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		super(msg, file, line);
	}
}

private enum vectorId = 0x1CB5C415;

/// A cursor that knows how to skip TL objects using the schema table.
struct TlWalker
{
	const(ubyte)[] data;
	size_t pos;

	/// Ensures `count` more bytes are available.
	void need(size_t count) @safe
	{
		enforce!TlWalkException(pos + count <= data.length, "TL walk: truncated");
	}

	/// Reads a bare uint.
	uint readUint() @safe
	{
		need(4);
		uint v = data[pos] | cast(uint) data[pos + 1] << 8
			| cast(uint) data[pos + 2] << 16 | cast(uint) data[pos + 3] << 24;
		pos += 4;
		return v;
	}

	/// Reads a bare int.
	int readInt() @safe
	{
		return cast(int) readUint();
	}

	/// Reads a bare long.
	long readLong() @safe
	{
		need(8);
		ulong v;
		foreach (i; 0 .. 8)
			v |= cast(ulong) data[pos + i] << (8 * i);
		pos += 8;
		return cast(long) v;
	}

	/// Reads a TL string or bytes field.
	const(ubyte)[] readBytes() @safe
	{
		need(1);
		size_t length;
		size_t header;
		if (data[pos] < 0xfe)
		{
			length = data[pos];
			header = 1;
		}
		else
		{
			need(4);
			length = data[pos + 1] | cast(size_t) data[pos + 2] << 8
				| cast(size_t) data[pos + 3] << 16;
			header = 4;
		}
		auto aligned = (header + length + 3) & ~cast(size_t) 3;
		need(aligned);
		auto value = data[pos + header .. pos + header + length];
		pos += aligned;
		return value;
	}

	/// Skips one object: its constructor id and all present fields.
	void skipObject() @safe
	{
		auto id = readUint();
		auto c = schemaFind(id);
		enforce!TlWalkException(c !is null, "TL walk: unknown constructor");
		skipFields(*c);
	}

	/// Skips the fields of an already read constructor.
	void skipFields(ref const SchemaConstructor c) @safe
	{
		int flags;
		int flags2;
		foreach (f; c.fields)
		{
			if (f.name == "flags")
			{
				flags = readInt();
				continue;
			}
			if (f.name == "flags2")
			{
				flags2 = readInt();
				continue;
			}
			if (f.flag >= 0 && ((f.flagsIndex == 0 ? flags : flags2) & (1 << f.flag)) == 0)
				continue;
			skipValue(f.type);
		}
	}

	/// Skips a value of the given schema type.
	void skipValue(string type) @safe
	{
		switch (type)
		{
		case "int", "Bool", "true", "false":
			need(4);
			pos += 4;
			return;
		case "long", "double":
			need(8);
			pos += 8;
			return;
		case "int128":
			need(16);
			pos += 16;
			return;
		case "int256":
			need(32);
			pos += 32;
			return;
		case "string", "bytes":
			readBytes();
			return;
		case "Object":
			skipObject();
			return;
		default:
			break;
		}

		if (type.startsWith("Vector<") || type.startsWith("vector<"))
		{
			auto inner = type[type.indexOf('<' ) + 1 .. $ - 1];
			auto id = readUint();
			enforce!TlWalkException(id == vectorId, "TL walk: expected a vector");
			auto count = readInt();
			enforce!TlWalkException(count >= 0, "TL walk: negative vector size");
			foreach (_; 0 .. count)
				skipValue(inner);
			return;
		}

		enforce!TlWalkException(!type.startsWith("!"), "TL walk: generic type is not supported");
		skipObject();
	}
}

@safe unittest // a synthetic message is skipped exactly to its end
{
	import tgng.mtp.tl: TlWriter;

	auto w = TlWriter();
	w.putConstructor(0x7600B9D3); // message#7600b9d3
	w.putInt(0); // flags
	w.putInt(0); // flags2
	w.putInt(5); // id
	w.putConstructor(0x59511722); // peerUser
	w.putLong(7); // peer id
	w.putInt(100); // date
	w.putBytes(cast(const(ubyte)[]) "hello");

	TlWalker walker;
	walker.data = w.data;
	walker.skipObject();
	enforce(walker.pos == w.data.length, "message is fully skipped");
}

@safe unittest // a vector of users is skipped
{
	import tgng.mtp.tl: TlWriter;

	auto w = TlWriter();
	w.putConstructor(0x1CB5C415);
	w.putInt(2);
	foreach (id; [1, 2])
	{
		w.putConstructor(0xB1B8CC83); // user#b1b8cc83
		w.putInt(0); // flags
		w.putInt(0); // flags2
		w.putLong(id);
	}

	TlWalker walker;
	walker.data = w.data;
	walker.skipValue("Vector<User>");
	enforce(walker.pos == w.data.length, "vector is fully skipped");
}

@safe unittest // an unknown constructor is reported
{
	import tgng.mtp.tl: TlWriter;

	auto w = TlWriter();
	w.putConstructor(0xDEADBEEF);
	TlWalker walker;
	walker.data = w.data;
	bool thrown;
	try
		walker.skipObject();
	catch (TlWalkException)
		thrown = true;
	enforce(thrown, "unknown constructor must throw");
}
