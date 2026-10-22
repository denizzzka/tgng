/// Schema-driven decoders for the message and update objects a bot needs.
module tgng.mtp.objects;

import tgng.mtp.schema: SchemaConstructor, schemaFind;
import tgng.mtp.tlwalk: TlWalker, TlWalkException;

import std.exception: enforce;

/// The message fields the Bot API exposes first.
struct MessageInfo
{
	int id;
	int date;
	string text;
}

/// A decoded bot-relevant update.
struct UpdateInfo
{
	enum Kind
	{
		other,
		newMessage,
		editMessage,
		deleteMessages,
		messageId,
	}

	Kind kind;
	MessageInfo message;
	int[] deletedIds;
	int messageId;
	long randomId;
	int pts;
	int ptsCount;
	int date;
}

/// Checks that a constructor is the one we expect.
private void needConstructor(ref TlWalker w, uint expected, string what) @safe
{
	enforce!TlWalkException(w.readUint() == expected, "TL: not " ~ what);
}

/// Reads one whole object and returns its bytes.
private const(ubyte)[] takeObject(ref TlWalker w) @safe
{
	auto start = w.pos;
	w.skipObject();
	return w.data[start .. w.pos];
}

/// Reinterprets bytes as a string.
private string asString(const(ubyte)[] bytes) @trusted
{
	return cast(string) bytes.idup;
}

/// Decodes one message object; only id, date and text are captured.
MessageInfo decodeMessage(const(ubyte)[] body) @safe
{
	auto w = TlWalker(body);
	auto id = w.readUint();
	auto c = schemaFind(id);
	enforce!TlWalkException(c !is null, "TL: unknown message constructor");

	MessageInfo msg;
	int flags;
	int flags2;
	foreach (f; c.fields)
	{
		if (f.name == "flags")
		{
			flags = w.readInt();
			continue;
		}
		if (f.name == "flags2")
		{
			flags2 = w.readInt();
			continue;
		}
		if (f.flag >= 0 && ((f.flagsIndex == 0 ? flags : flags2) & (1 << f.flag)) == 0)
			continue;
		switch (f.name)
		{
		case "id":
			msg.id = w.readInt();
			break;
		case "date":
			msg.date = w.readInt();
			break;
		case "message":
			msg.text = asString(w.readBytes());
			break;
		default:
			w.skipValue(f.type);
			break;
		}
	}
	return msg;
}

/// Decodes one `Update` object.
UpdateInfo decodeUpdate(const(ubyte)[] body) @safe
{
	auto w = TlWalker(body);
	UpdateInfo v;
	switch (w.readUint())
	{
	case 0x1F2B0AFD: // updateNewMessage
		v.kind = UpdateInfo.Kind.newMessage;
		v.message = decodeMessage(takeObject(w));
		v.pts = w.readInt();
		v.ptsCount = w.readInt();
		break;
	case 0xE40370A3: // updateEditMessage
		v.kind = UpdateInfo.Kind.editMessage;
		v.message = decodeMessage(takeObject(w));
		v.pts = w.readInt();
		v.ptsCount = w.readInt();
		break;
	case 0x4E90BFD6: // updateMessageID
		v.kind = UpdateInfo.Kind.messageId;
		v.messageId = w.readInt();
		v.randomId = w.readLong();
		break;
	case 0xA20DB0E5: // updateDeleteMessages
	{
		v.kind = UpdateInfo.Kind.deleteMessages;
		needConstructor(w, 0x1CB5C415, "vector");
		auto count = w.readInt();
		enforce!TlWalkException(count >= 0, "TL: negative vector size");
		foreach (_; 0 .. count)
			v.deletedIds ~= w.readInt();
		v.pts = w.readInt();
		v.ptsCount = w.readInt();
		break;
	}
	default:
		v.kind = UpdateInfo.Kind.other;
		break;
	}
	return v;
}

/// Decodes `updateShort#78d4dec1 update:Update date:int`.
UpdateInfo decodeUpdateShort(const(ubyte)[] body) @safe
{
	auto w = TlWalker(body);
	needConstructor(w, 0x78D4DEC1, "updateShort");
	auto update = takeObject(w);
	auto v = decodeUpdate(update);
	v.date = w.readInt();
	return v;
}

/// A batch of updates from `updates#74ae4240` / `updatesCombined`.
struct UpdatesInfo
{
	UpdateInfo[] updates;
	int date;
	int seq;
	bool tooLong;
}

/// Reads the update vector plus the users and chats that follow it.
private void readUpdateBatch(ref TlWalker w, ref UpdatesInfo v) @safe
{
	needConstructor(w, 0x1CB5C415, "updates vector");
	auto count = w.readInt();
	enforce!TlWalkException(count >= 0, "TL: negative update count");
	foreach (_; 0 .. count)
		v.updates ~= decodeUpdate(takeObject(w));
	w.skipValue("Vector<User>");
	w.skipValue("Vector<Chat>");
}

/// Decodes `updates`, `updatesCombined`, `updateShort` or `updatesTooLong`.
UpdatesInfo decodeUpdates(const(ubyte)[] body) @safe
{
	auto w = TlWalker(body);
	UpdatesInfo v;
	switch (w.readUint())
	{
	case 0xE317AF7E: // updatesTooLong
		v.tooLong = true;
		return v;
	case 0x78D4DEC1: // updateShort
		v.updates ~= decodeUpdateShort(body);
		return v;
	case 0x74AE4240: // updates
		readUpdateBatch(w, v);
		v.date = w.readInt();
		v.seq = w.readInt();
		return v;
	case 0x725B04C3: // updatesCombined
		readUpdateBatch(w, v);
		v.date = w.readInt();
		w.readInt(); // seq_start
		v.seq = w.readInt();
		return v;
	default:
		return v;
	}
}

@safe unittest // a text message yields id, date and text
{
	import tgng.mtp.tl: TlWriter;

	auto w = TlWriter();
	w.putConstructor(0x7600B9D3); // message
	w.putInt(0); // flags
	w.putInt(0); // flags2
	w.putInt(5); // id
	w.putConstructor(0x59511722); // peerUser
	w.putLong(7);
	w.putInt(100); // date
	w.putBytes(cast(const(ubyte)[]) "hello");

	auto msg = decodeMessage(w.data);
	enforce(msg.id == 5 && msg.date == 100 && msg.text == "hello", "message fields");
}

@safe unittest // updateNewMessage and updateShort are decoded
{
	import tgng.mtp.tl: TlWriter;

	auto msg = TlWriter();
	msg.putConstructor(0x7600B9D3);
	msg.putInt(0);
	msg.putInt(0);
	msg.putInt(5);
	msg.putConstructor(0x59511722);
	msg.putLong(7);
	msg.putInt(100);
	msg.putBytes(cast(const(ubyte)[]) "hello");

	auto update = TlWriter();
	update.putConstructor(0x1F2B0AFD); // updateNewMessage
	update.buf.put(msg.data);
	update.putInt(11);
	update.putInt(1);

	auto v = decodeUpdate(update.data);
	enforce(v.kind == UpdateInfo.Kind.newMessage, "new message kind");
	enforce(v.message.text == "hello" && v.pts == 11 && v.ptsCount == 1, "new message fields");

	auto short_ = TlWriter();
	short_.putConstructor(0x78D4DEC1);
	short_.buf.put(update.data);
	short_.putInt(101);
	auto s = decodeUpdateShort(short_.data);
	enforce(s.kind == UpdateInfo.Kind.newMessage && s.message.id == 5 && s.date == 101,
		"short update");
}

@safe unittest // updates and updatesCombined batches are decoded
{
	import tgng.mtp.tl: TlWriter;

	auto idUpdate = TlWriter();
	idUpdate.putConstructor(0x4E90BFD6); // updateMessageID
	idUpdate.putInt(9);
	idUpdate.putLong(0xAA);

	foreach (combined; [false, true])
	{
		auto w = TlWriter();
		w.putConstructor(combined ? 0x725B04C3 : 0x74AE4240);
		w.putConstructor(0x1CB5C415);
		w.putInt(1);
		w.buf.put(idUpdate.data);
		w.putConstructor(0x1CB5C415);
		w.putInt(0); // users
		w.putConstructor(0x1CB5C415);
		w.putInt(0); // chats
		w.putInt(102); // date
		if (combined)
			w.putInt(7); // seq_start
		w.putInt(8); // seq

		auto u = decodeUpdates(w.data);
		enforce(u.updates.length == 1 && u.updates[0].messageId == 9, "update list");
		enforce(u.date == 102 && u.seq == 8, "batch counters");
	}
}

@safe unittest // deleted message ids are collected
{
	import tgng.mtp.tl: TlWriter;

	auto w = TlWriter();
	w.putConstructor(0xA20DB0E5); // updateDeleteMessages
	w.putConstructor(0x1CB5C415);
	w.putInt(2);
	w.putInt(3);
	w.putInt(4);
	w.putInt(12);
	w.putInt(2);

	auto v = decodeUpdate(w.data);
	enforce(v.kind == UpdateInfo.Kind.deleteMessages, "delete kind");
	enforce(v.deletedIds == [3, 4], "deleted ids");
	enforce(v.pts == 12 && v.ptsCount == 2, "delete counters");
}
