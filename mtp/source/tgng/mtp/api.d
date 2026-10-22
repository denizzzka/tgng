/// Minimal Telegram API layer: the query envelope and `help.getConfig`.
module tgng.mtp.api;

import tgng.mtp.tl: TlException, TlReader, TlWriter;

import std.bitmanip: nativeToLittleEndian;
import std.exception: enforce;

/// Reinterprets a byte slice as a string, the way TL strings are used here.
private string _asString(const(ubyte)[] data) @trusted
{
	return cast(string) data.idup;
}

/// Layer advertised in `invokeWithLayer`, the one TDLib sends.
enum int mtprotoLayer = 230;

enum uint helpGetConfigId = 0xC4F9186B;
enum uint configId = 0xCC1A241E;
enum uint initConnectionId = 0xC1CD5EA9;
enum uint invokeWithLayerId = 0xDA9B0D0D;
enum uint codeSettingsId = 0xAD253D78;
enum uint authSendCodeId = 0xA677244F;
enum uint authSignInId = 0x8D52A951;
enum uint authImportBotAuthorizationId = 0x67A3FF2C;
enum uint inputPeerSelfId = 0x7DA07EC9;
enum uint inputPeerUserIv = 0xDDE8A54C;
enum uint inputPeerChatId = 0x35A95CB9;
enum uint inputPeerChannelId = 0x27BCBBFC;
enum uint peerUserId = 0x59511722;
enum uint peerChatId = 0x36C6019A;
enum uint peerChannelId = 0xA2A5371E;
enum uint contactsResolveUsernameId = 0x725AFBBC;
enum uint contactsResolvedPeerId = 0x7F077AD9;
enum uint helpGetNearestDcId = 0x1FB33026;
enum uint nearestDcId = 0x8E1A1775;
enum uint authExportAuthorizationId = 0xE5BFFFCD;
enum uint authExportedAuthorizationId = 0xB434E2B8;
enum uint authImportAuthorizationId = 0xA57A7DAD;
enum uint updatesGetStateId = 0xEDD4882A;
enum uint updatesStateId = 0xA56C2A3E;
enum uint updatesGetDifferenceId = 0x25939651;
enum uint updatesDifferenceId = 0xF49CA0;
enum uint updatesDifferenceSliceId = 0xA8FB1981;
enum uint updatesDifferenceEmptyId = 0x5D75A138;
enum uint updatesTooLongId = 0xE317AF7E;
enum uint messagesGetChatsId = 0x49E9528F;
enum uint messagesChatsId = 0x64FF9FD5;
enum uint chatId = 0x41CBF256;
enum uint channelId = 0xD49F34C6;
enum uint usersGetUsersId = 0xD91A548;
enum uint inputUserSelfId = 0xF7C1B13F;
enum uint userId = 0xB1B8CC83;
enum uint messagesSendMessageId = 0xFEF48F62;
enum uint updateShortSentMessageId = 0x9015E101;
enum uint messagesEditMessageId = 0xB106E66C;
enum uint messagesDeleteMessagesId = 0xE58E95D2;
enum uint messagesSetTypingId = 0x58943EE2;
enum uint messagesAffectedMessagesId = 0x84D19185;
enum uint vectorId = 0x1CB5C415;

enum uint sendMessageTypingActionId = 0x16BF744E;
enum uint sendMessageCancelActionId = 0xFD5EC8F5;
enum uint sendMessageUploadPhotoActionId = 0x990A3C1A;
enum uint authSentCodeId = 0x5E002502;
enum uint authSentCodeSuccessId = 0x2390FE44;
enum uint authAuthorizationId = 0x2EA2C0D4;

// auth.SentCodeType variants we can skip over when looking for phone_code_hash.
enum uint sentCodeTypeAppId = 0x3DBB5986;
enum uint sentCodeTypeSmsId = 0xC000BBA2;
enum uint sentCodeTypeCallId = 0x5353E5A7;
enum uint sentCodeTypeFlashCallId = 0xAB03C6D9;
enum uint sentCodeTypeMissedCallId = 0x82006484;

/// `help.getConfig#c4f9186b = Config`
ubyte[] encodeHelpGetConfig() @safe
{
	auto w = TlWriter();
	w.putConstructor(helpGetConfigId);
	return w.data;
}

/// `initConnection#c1cd5ea9` with empty flags, without proxy and params.
ubyte[] encodeInitConnection(int apiId, string deviceModel, string systemVersion,
	string appVersion, string systemLangCode, string langPack, string langCode,
	const(ubyte)[] query) @safe
{
	auto w = TlWriter();
	w.putConstructor(initConnectionId);
	w.putInt(0);
	w.putInt(apiId);
	foreach (s; [deviceModel, systemVersion, appVersion, systemLangCode, langPack, langCode])
		w.putBytes(cast(const(ubyte)[]) s);
	w.buf.put(query);
	return w.data;
}

/// `invokeWithLayer#da9b0d0d {X:Type} layer:int query:!X = X`
ubyte[] encodeInvokeWithLayer(int layer, const(ubyte)[] query) @safe
{
	auto w = TlWriter();
	w.putConstructor(invokeWithLayerId);
	w.putInt(layer);
	w.buf.put(query);
	return w.data;
}

/// Reads a little-endian uint from the first four bytes of `b`.
uint uintAt(const(ubyte)[] b) @safe pure nothrow
{
	return cast(uint) b[0] | cast(uint) b[1] << 8 | cast(uint) b[2] << 16
		| cast(uint) b[3] << 24;
}

/// Returns true when a body starts with `config#cc1a241e`.
bool isConfig(const(ubyte)[] body) @safe pure nothrow
{
	return body.length >= 4 && body.uintAt == configId;
}

/// `codeSettings#ad253d78` with no flags set.
ubyte[] encodeCodeSettings() @safe
{
	auto w = TlWriter();
	w.putConstructor(codeSettingsId);
	w.putInt(0);
	return w.data;
}

/// `auth.sendCode#a677244f phone_number api_id api_hash settings`
ubyte[] encodeAuthSendCode(string phone, int apiId, string apiHash) @safe
{
	auto w = TlWriter();
	w.putConstructor(authSendCodeId);
	w.putBytes(cast(const(ubyte)[]) phone);
	w.putInt(apiId);
	w.putBytes(cast(const(ubyte)[]) apiHash);
	w.buf.put(encodeCodeSettings());
	return w.data;
}

/// `auth.signIn#8d52a951` with the phone code set.
ubyte[] encodeAuthSignIn(string phone, string phoneCodeHash, string code) @safe
{
	auto w = TlWriter();
	w.putConstructor(authSignInId);
	w.putInt(1); // phone_code is present
	w.putBytes(cast(const(ubyte)[]) phone);
	w.putBytes(cast(const(ubyte)[]) phoneCodeHash);
	w.putBytes(cast(const(ubyte)[]) code);
	return w.data;
}

/// Peer flavour as it appears in `peer*` constructors.
enum PeerKind
{
	user,
	chat,
	channel,
}

/// A chat identifier plus its kind.
struct PeerInfo
{
	long id;
	PeerKind kind;
}

/// `inputPeerSelf#7da07ec9 = InputPeer`
ubyte[] encodeInputPeerSelf() @safe
{
	auto w = TlWriter();
	w.putConstructor(inputPeerSelfId);
	return w.data;
}

/// `inputPeerUser#dde8a54c user_id access_hash = InputPeer`
ubyte[] encodeInputPeerUser(long userId, long accessHash) @safe
{
	auto w = TlWriter();
	w.putConstructor(inputPeerUserIv);
	w.putLong(cast(ulong) userId);
	w.putLong(cast(ulong) accessHash);
	return w.data;
}

/// `inputPeerChat#35a95cb9 chat_id = InputPeer`
ubyte[] encodeInputPeerChat(long chatId) @safe
{
	auto w = TlWriter();
	w.putConstructor(inputPeerChatId);
	w.putLong(cast(ulong) chatId);
	return w.data;
}

/// `inputPeerChannel#27bcbbfc channel_id access_hash = InputPeer`
ubyte[] encodeInputPeerChannel(long channelId, long accessHash) @safe
{
	auto w = TlWriter();
	w.putConstructor(inputPeerChannelId);
	w.putLong(cast(ulong) channelId);
	w.putLong(cast(ulong) accessHash);
	return w.data;
}

/// Decodes `peerUser` / `peerChat` / `peerChannel`.
PeerInfo decodePeer(const(ubyte)[] body) @safe
{
	auto r = TlReader(body);
	PeerInfo v;
	switch (r.readConstructor())
	{
	case peerUserId:
		v.kind = PeerKind.user;
		break;
	case peerChatId:
		v.kind = PeerKind.chat;
		break;
	case peerChannelId:
		v.kind = PeerKind.channel;
		break;
	default:
		throw new TlException("TL: not a peer");
	}
	v.id = cast(long) r.readLong();
	r.finish();
	return v;
}

/// `contacts.resolveUsername#725afbbc` without the optional referer.
ubyte[] encodeContactsResolveUsername(string username) @safe
{
	auto w = TlWriter();
	w.putConstructor(contactsResolveUsernameId);
	w.putInt(0);
	w.putBytes(cast(const(ubyte)[]) username);
	return w.data;
}

/// Reads the `peer` of `contacts.resolvedPeer#7f077ad9`.
PeerInfo decodeResolvedPeer(const(ubyte)[] body) @safe
{
	auto r = TlReader(body);
	enforce!TlException(r.readConstructor() == contactsResolvedPeerId,
		"TL: not contacts.resolvedPeer");
	PeerInfo v;
	switch (r.readConstructor())
	{
	case peerUserId:
		v.kind = PeerKind.user;
		break;
	case peerChatId:
		v.kind = PeerKind.chat;
		break;
	case peerChannelId:
		v.kind = PeerKind.channel;
		break;
	default:
		throw new TlException("TL: not a peer");
	}
	v.id = cast(long) r.readLong();
	return v;
}

/// `help.getNearestDc#1fb33026`.
ubyte[] encodeHelpGetNearestDc() @safe
{
	auto w = TlWriter();
	w.putConstructor(helpGetNearestDcId);
	return w.data;
}

/// Decodes `nearestDc#8e1a1775 country this_dc nearest_dc`.
struct NearestDc
{
	string country;
	int thisDc;
	int nearestDc;
}

/// Reads `nearestDc#8e1a1775`.
NearestDc decodeNearestDc(const(ubyte)[] body) @safe
{
	auto r = TlReader(body);
	enforce!TlException(r.readConstructor() == nearestDcId, "TL: not nearestDc");
	NearestDc v;
	v.country = _asString(r.readBytes());
	v.thisDc = r.readInt();
	v.nearestDc = r.readInt();
	r.finish();
	return v;
}

/// `auth.exportAuthorization#e5bfffcd dc_id:int`.
ubyte[] encodeAuthExportAuthorization(int dcId) @safe
{
	auto w = TlWriter();
	w.putConstructor(authExportAuthorizationId);
	w.putInt(dcId);
	return w.data;
}

/// The payload of `auth.exportedAuthorization#b434e2b8`.
struct ExportedAuthorization
{
	long id;
	ubyte[] bytes;
}

/// Reads `auth.exportedAuthorization`.
ExportedAuthorization decodeExportedAuthorization(const(ubyte)[] body) @safe
{
	auto r = TlReader(body);
	enforce!TlException(r.readConstructor() == authExportedAuthorizationId,
		"TL: not auth.exportedAuthorization");
	ExportedAuthorization v;
	v.id = cast(long) r.readLong();
	v.bytes = r.readBytes().dup;
	r.finish();
	return v;
}

/// `auth.importAuthorization#a57a7dad id:long bytes:bytes`.
ubyte[] encodeAuthImportAuthorization(long id, const(ubyte)[] bytes) @safe
{
	auto w = TlWriter();
	w.putConstructor(authImportAuthorizationId);
	w.putLong(cast(ulong) id);
	w.putBytes(bytes);
	return w.data;
}

/// `updates.getState#edd4882a`.
ubyte[] encodeUpdatesGetState() @safe
{
	auto w = TlWriter();
	w.putConstructor(updatesGetStateId);
	return w.data;
}

/// Update sequence counters.
struct UpdatesState
{
	int pts;
	int qts;
	int date;
	int seq;
}

/// Decodes `updates.state#a56c2a3e`.
UpdatesState decodeUpdatesState(const(ubyte)[] body) @safe
{
	auto r = TlReader(body);
	enforce!TlException(r.readConstructor() == updatesStateId, "TL: not updates.state");
	UpdatesState v;
	v.pts = r.readInt();
	v.qts = r.readInt();
	v.date = r.readInt();
	v.seq = r.readInt();
	r.finish();
	return v;
}

/// `updates.getDifference#25939651` without pts_total_limit.
ubyte[] encodeUpdatesGetDifference(int pts, int date, int qts) @safe
{
	auto w = TlWriter();
	w.putConstructor(updatesGetDifferenceId);
	w.putInt(0);
	w.putInt(pts);
	w.putInt(date);
	w.putInt(qts);
	return w.data;
}

/// What `updates.getDifference` answered, without the contained objects.
enum DifferenceKind
{
	none,
	slice,
	full,
	tooLong,
}

/// Reads the head of a `updates.Difference`: the kind and, when present, pts/date/seq.
DifferenceKind decodeDifferenceHead(const(ubyte)[] body, out int date, out int seq) @safe
{
	auto r = TlReader(body);
	switch (r.readConstructor())
	{
	case updatesDifferenceEmptyId:
		date = r.readInt();
		seq = r.readInt();
		return DifferenceKind.none;
	case updatesTooLongId:
		r.readInt(); // pts
		return DifferenceKind.tooLong;
	case updatesDifferenceSliceId:
		return DifferenceKind.slice;
	case updatesDifferenceId:
		return DifferenceKind.full;
	default:
		throw new TlException("TL: not updates.Difference");
	}
}

/// `messages.getChats#49e9528f id:Vector<long>`.
ubyte[] encodeMessagesGetChats(const(long)[] chatIds) @safe
{
	auto w = TlWriter();
	w.putConstructor(messagesGetChatsId);
	w.putConstructor(vectorId);
	w.putInt(cast(int) chatIds.length);
	foreach (id; chatIds)
		w.putLong(cast(ulong) id);
	return w.data;
}

/// The chat fields the Bot API's getChat needs at its most basic.
struct ChatInfo
{
	long id;
	string title;
	bool isChannel;
}

/// Decodes the first `chat#41cbf256` / `channel#d49f34c6` of `messages.chats`.
ChatInfo decodeFirstChat(const(ubyte)[] body) @safe
{
	auto r = TlReader(body);
	enforce!TlException(r.readConstructor() == messagesChatsId, "TL: not messages.chats");
	enforce!TlException(r.readConstructor() == vectorId, "TL: chats are not a vector");
	enforce!TlException(r.readInt() > 0, "TL: empty chat vector");
	auto id = r.readConstructor();
	ChatInfo v;
	if (id == chatId)
	{
		r.readInt(); // flags
	}
	else if (id == channelId)
	{
		v.isChannel = true;
		auto flags = r.readInt();
		r.readInt(); // flags2
		v.id = cast(long) r.readLong();
		if (flags & (1 << 13))
			r.readLong(); // access_hash
		v.title = _asString(r.readBytes());
		return v;
	}
	else
		throw new TlException("TL: not a chat");
	v.id = cast(long) r.readLong();
	v.title = _asString(r.readBytes());
	return v;
}

/// `users.getUsers#d91a548` for the current user (`inputUserSelf`).
ubyte[] encodeUsersGetUsersSelf() @safe
{
	auto w = TlWriter();
	w.putConstructor(usersGetUsersId);
	w.putConstructor(vectorId);
	w.putInt(1);
	w.putConstructor(inputUserSelfId);
	return w.data;
}

/// The user fields the Bot API's getMe needs.
struct UserInfo
{
	long id;
	string firstName;
	string lastName;
	string username;
	bool isBot;
	bool isSelf;
}

/// Decodes the first `user#b1b8cc83` of a `Vector<User>` result.
UserInfo decodeFirstUser(const(ubyte)[] body) @safe
{
	auto r = TlReader(body);
	enforce!TlException(r.readConstructor() == vectorId, "TL: users are not a vector");
	enforce!TlException(r.readInt() > 0, "TL: empty user vector");
	enforce!TlException(r.readConstructor() == userId, "TL: not a user");
	auto flags = r.readInt();
	r.readInt(); // flags2
	UserInfo v;
	v.id = cast(long) r.readLong();
	if (flags & (1 << 0))
		r.readLong(); // access_hash
	if (flags & (1 << 1))
		v.firstName = _asString(r.readBytes());
	if (flags & (1 << 2))
		v.lastName = _asString(r.readBytes());
	if (flags & (1 << 3))
		v.username = _asString(r.readBytes());
	v.isSelf = (flags & (1 << 10)) != 0;
	v.isBot = (flags & (1 << 14)) != 0;
	return v;
}

/// `messages.sendMessage#fef48f62` with no optional flags.
ubyte[] encodeMessagesSendMessage(const(ubyte)[] peer, string message, long randomId) @safe
{
	auto w = TlWriter();
	w.putConstructor(messagesSendMessageId);
	w.putInt(0);
	w.buf.put(peer);
	w.putBytes(cast(const(ubyte)[]) message);
	w.putLong(cast(ulong) randomId);
	return w.data;
}

/// Returns true for `updateShortSentMessage#9015e101`.
bool isUpdateShortSentMessage(const(ubyte)[] body) @safe pure nothrow
{
	return body.length >= 4 && body.uintAt == updateShortSentMessageId;
}

/// Reads the message id from `updateShortSentMessage#9015e101`.
int decodeSentMessageId(const(ubyte)[] body) @safe
{
	auto r = TlReader(body);
	enforce!TlException(r.readConstructor() == updateShortSentMessageId,
		"TL: not updateShortSentMessage");
	r.readInt(); // flags
	return r.readInt();
}

/// `messages.editMessage#b106e66c` with only the new text (flag 11).
ubyte[] encodeMessagesEditMessage(const(ubyte)[] peer, int messageId, string message) @safe
{
	auto w = TlWriter();
	w.putConstructor(messagesEditMessageId);
	w.putInt(1 << 11);
	w.buf.put(peer);
	w.putInt(messageId);
	w.putBytes(cast(const(ubyte)[]) message);
	return w.data;
}

/// `messages.deleteMessages#e58e95d2` with an optional revoke flag.
ubyte[] encodeMessagesDeleteMessages(const(int)[] ids, bool revoke = false) @safe
{
	auto w = TlWriter();
	w.putConstructor(messagesDeleteMessagesId);
	w.putInt(revoke ? 1 : 0);
	w.putConstructor(vectorId);
	w.putInt(cast(int) ids.length);
	foreach (id; ids)
		w.putInt(id);
	return w.data;
}

/// `messages.setTyping#58943ee2` with a `SendMessageAction` constructor id.
ubyte[] encodeMessagesSetTyping(const(ubyte)[] peer, uint actionId) @safe
{
	auto w = TlWriter();
	w.putConstructor(messagesSetTypingId);
	w.putInt(0);
	w.buf.put(peer);
	w.putConstructor(actionId);
	return w.data;
}

/// Returned by `messages.deleteMessages`.
struct AffectedMessages
{
	int pts;
	int ptsCount;
}

/// Decodes `messages.affectedMessages#84d19185`.
AffectedMessages decodeAffectedMessages(const(ubyte)[] body) @safe
{
	auto r = TlReader(body);
	enforce!TlException(r.readConstructor() == messagesAffectedMessagesId,
		"TL: not messages.affectedMessages");
	AffectedMessages v;
	v.pts = r.readInt();
	v.ptsCount = r.readInt();
	r.finish();
	return v;
}

/// `auth.importBotAuthorization#67a3ff2c` logs a bot in without a phone.
ubyte[] encodeAuthImportBotAuthorization(int apiId, string botToken, string apiHash) @safe
{
	auto w = TlWriter();
	w.putConstructor(authImportBotAuthorizationId);
	w.putInt(0);
	w.putInt(apiId);
	w.putBytes(cast(const(ubyte)[]) botToken);
	w.putBytes(cast(const(ubyte)[]) apiHash);
	return w.data;
}

/// The part of `auth.sentCode` the call flow needs.
struct SentCode
{
	uint typeId;
	string phoneCodeHash;
}

/// Decodes `auth.sentCode`; throws on `auth.sentCodeSuccess` and unknown types.
SentCode decodeAuthSentCode(const(ubyte)[] body) @safe
{
	auto r = TlReader(body);
	auto id = r.readConstructor();
	enforce!TlException(id == authSentCodeId, "TL: not auth.sentCode");
	r.readInt(); // flags
	auto typeId = r.readConstructor();
	switch (typeId) {
		case sentCodeTypeAppId, sentCodeTypeSmsId, sentCodeTypeCallId:
			r.readInt(); // length
			break;
		case sentCodeTypeFlashCallId:
			r.readBytes(); // pattern
			break;
		case sentCodeTypeMissedCallId:
			r.readBytes(); // prefix
			r.readInt(); // length
			break;
		default:
			throw new TlException("TL: unsupported auth.SentCodeType");
	}
	SentCode v;
	v.typeId = typeId;
	v.phoneCodeHash = _asString(r.readBytes());
	return v;
}

/// Returns true for `auth.authorization` (a successful sign-in).
bool isAuthAuthorization(const(ubyte)[] body) @safe pure nothrow
{
	return body.length >= 4 && body.uintAt == authAuthorizationId;
}

@safe unittest // help.getConfig is a bare constructor id
{
	auto body = encodeHelpGetConfig();
	enforce(body.length == 4, "help.getConfig is one constructor");
	enforce(body.uintAt == helpGetConfigId, "help.getConfig id");
}

@safe unittest // the envelope nests initConnection inside invokeWithLayer
{
	auto query = encodeHelpGetConfig();
	auto init = encodeInitConnection(1, "dev", "sys", "app", "en", "", "en", query);
	auto layer = encodeInvokeWithLayer(mtprotoLayer, init);

	enforce(layer[0 .. 4].uintAt == invokeWithLayerId, "outer id");
	enforce(layer[4 .. 8].uintAt == mtprotoLayer, "layer number");
	enforce(layer[8 .. 12].uintAt == initConnectionId, "inner id");
	enforce(layer[12 .. 16].uintAt == 0, "empty flags");
	enforce(layer[16 .. 20].uintAt == 1, "api_id follows flags");
	enforce(layer[$ - 4 .. $] == query, "query is appended verbatim");
}

@safe unittest // auth.sendCode carries phone, api id and hash with empty settings
{
	auto body = encodeAuthSendCode("+10000000000", 94575, "hash");
	enforce(body[0 .. 4].uintAt == authSendCodeId, "auth.sendCode id");
	enforce(body[5 .. 5 + 12] == "+10000000000", "phone number");
	enforce(body[20 .. 24].uintAt == 94575, "api_id");
	enforce(body[25 .. 29] == "hash", "api_hash");
	enforce(body[$ - 8 .. $ - 4].uintAt == codeSettingsId, "settings constructor");
}

@safe unittest // auth.signIn sets the phone_code flag and carries the code
{
	auto body = encodeAuthSignIn("+1", "pc", "12345");
	enforce(body[0 .. 4].uintAt == authSignInId, "auth.signIn id");
	enforce(body[4 .. 8].uintAt == 1, "phone_code flag");
}

@safe unittest // peer inputs encode their constructor and decode back
{
	enforce(encodeInputPeerSelf()[0 .. 4].uintAt == inputPeerSelfId, "inputPeerSelf");
	auto user = encodeInputPeerUser(7, 99);
	enforce(user[0 .. 4].uintAt == inputPeerUserIv, "inputPeerUser");
	enforce(user[4 .. 12] == nativeToLittleEndian(7L)[], "user id");
	auto chat = encodeInputPeerChat(5);
	enforce(chat[4 .. 12] == nativeToLittleEndian(5L)[], "chat id");
	enforce(encodeInputPeerChannel(3, 4)[0 .. 4].uintAt == inputPeerChannelId, "inputPeerChannel");

	auto w = TlWriter();
	w.putConstructor(peerChannelId);
	w.putLong(42);
	auto peer = decodePeer(w.data);
	enforce(peer.kind == PeerKind.channel && peer.id == 42, "peerChannel");
}

@safe unittest // resolveUsername carries empty flags and the name; resolvedPeer yields the peer
{
	auto req = encodeContactsResolveUsername("durov");
	enforce(req[0 .. 4].uintAt == contactsResolveUsernameId, "resolveUsername id");
	enforce(req[4 .. 8].uintAt == 0, "empty flags");
	enforce(req[9 .. 14] == "durov", "username");

	auto w = TlWriter();
	w.putConstructor(contactsResolvedPeerId);
	w.putConstructor(peerUserId);
	w.putLong(42);
	auto peer = decodeResolvedPeer(w.data);
	enforce(peer.kind == PeerKind.user && peer.id == 42, "resolved peer");
}

@safe unittest // sendMessage nests the peer and ends with random_id
{
	auto peer = encodeInputPeerUser(7, 99);
	auto body = encodeMessagesSendMessage(peer, "hi", 0x1122334455667788);
	enforce(body[0 .. 4].uintAt == messagesSendMessageId, "sendMessage id");
	enforce(body[4 .. 8].uintAt == 0, "empty flags");
	enforce(body[8 .. 8 + peer.length] == peer, "peer is embedded");
	enforce(body[$ - 8 .. $] == nativeToLittleEndian(0x1122334455667788UL)[], "random_id");
}

@safe unittest // updateShortSentMessage exposes its message id
{
	auto w = TlWriter();
	w.putConstructor(updateShortSentMessageId);
	w.putInt(0);
	w.putInt(77);
	enforce(isUpdateShortSentMessage(w.data), "constructor");
	enforce(decodeSentMessageId(w.data) == 77, "message id");
}

@safe unittest // nearest DC and authorization export/import
{
	enforce(encodeHelpGetNearestDc()[0 .. 4].uintAt == helpGetNearestDcId, "nearestDc request");

	auto w = TlWriter();
	w.putConstructor(nearestDcId);
	w.putBytes(cast(const(ubyte)[]) "DE");
	w.putInt(2);
	w.putInt(4);
	auto nd = decodeNearestDc(w.data);
	enforce(nd.country == "DE" && nd.thisDc == 2 && nd.nearestDc == 4, "nearestDc");

	enforce(encodeAuthExportAuthorization(4)[4 .. 8].uintAt == 4, "export dc");

	auto w2 = TlWriter();
	w2.putConstructor(authExportedAuthorizationId);
	w2.putLong(9);
	w2.putBytes(cast(const(ubyte)[]) "ticket");
	auto ex = decodeExportedAuthorization(w2.data);
	enforce(ex.id == 9 && ex.bytes == cast(const(ubyte)[]) "ticket", "exported");

	auto imp = encodeAuthImportAuthorization(9, cast(const(ubyte)[]) "ticket");
	enforce(imp[0 .. 4].uintAt == authImportAuthorizationId, "import id");
	enforce(imp[4 .. 12] == nativeToLittleEndian(9L)[], "import id value");
}

@safe unittest // update state and difference heads
{
	enforce(encodeUpdatesGetState()[0 .. 4].uintAt == updatesGetStateId, "getState id");

	auto w = TlWriter();
	w.putConstructor(updatesStateId);
	w.putInt(10);
	w.putInt(20);
	w.putInt(30);
	w.putInt(40);
	auto state = decodeUpdatesState(w.data);
	enforce(state.pts == 10 && state.qts == 20 && state.date == 30 && state.seq == 40, "state");

	auto req = encodeUpdatesGetDifference(10, 30, 20);
	enforce(req[0 .. 4].uintAt == updatesGetDifferenceId, "getDifference id");
	enforce(req[8 .. 12].uintAt == 10 && req[12 .. 16].uintAt == 30 && req[16 .. 20].uintAt == 20,
		"difference arguments");

	auto w2 = TlWriter();
	w2.putConstructor(updatesDifferenceEmptyId);
	w2.putInt(31);
	w2.putInt(41);
	int date, seq;
	enforce(decodeDifferenceHead(w2.data, date, seq) == DifferenceKind.none, "empty kind");
	enforce(date == 31 && seq == 41, "empty counters");

	auto w3 = TlWriter();
	w3.putConstructor(updatesTooLongId);
	w3.putInt(12);
	enforce(decodeDifferenceHead(w3.data, date, seq) == DifferenceKind.tooLong, "too long");
}

@safe unittest // getChats carries a vector of ids; chat and channel titles decode
{
	auto req = encodeMessagesGetChats([5, 6]);
	enforce(req[0 .. 4].uintAt == messagesGetChatsId, "getChats id");
	enforce(req[8 .. 12].uintAt == 2, "two ids");
	enforce(req[12 .. 20] == nativeToLittleEndian(5L)[], "first id");

	auto w = TlWriter();
	w.putConstructor(messagesChatsId);
	w.putConstructor(vectorId);
	w.putInt(1);
	w.putConstructor(chatId);
	w.putInt(0);
	w.putLong(7);
	w.putBytes(cast(const(ubyte)[]) "Group");
	auto chat = decodeFirstChat(w.data);
	enforce(chat.id == 7 && chat.title == "Group" && !chat.isChannel, "basic chat");

	auto w2 = TlWriter();
	w2.putConstructor(messagesChatsId);
	w2.putConstructor(vectorId);
	w2.putInt(1);
	w2.putConstructor(channelId);
	w2.putInt(1 << 13);
	w2.putInt(0);
	w2.putLong(8);
	w2.putLong(0xABCD);
	w2.putBytes(cast(const(ubyte)[]) "Channel");
	auto channel = decodeFirstChat(w2.data);
	enforce(channel.id == 8 && channel.title == "Channel" && channel.isChannel, "channel");
}

@safe unittest // getUsers asks for inputUserSelf; the first user is decoded
{
	auto req = encodeUsersGetUsersSelf();
	enforce(req[0 .. 4].uintAt == usersGetUsersId, "getUsers id");
	enforce(req[4 .. 8].uintAt == vectorId, "vector constructor");
	enforce(req[8 .. 12].uintAt == 1, "one user");
	enforce(req[12 .. 16].uintAt == inputUserSelfId, "inputUserSelf");

	auto w = TlWriter();
	w.putConstructor(vectorId);
	w.putInt(1);
	w.putConstructor(userId);
	w.putInt((1 << 1) | (1 << 3) | (1 << 10) | (1 << 14)); // first_name, username, self, bot
	w.putInt(0); // flags2
	w.putLong(42);
	w.putBytes(cast(const(ubyte)[]) "Bot");
	w.putBytes(cast(const(ubyte)[]) "my_bot");
	auto user = decodeFirstUser(w.data);
	enforce(user.id == 42, "id");
	enforce(user.firstName == "Bot" && user.username == "my_bot", "names");
	enforce(user.isSelf && user.isBot, "flags");
}

@safe unittest // edit, delete and typing requests
{
	auto peer = encodeInputPeerSelf();
	auto edit = encodeMessagesEditMessage(peer, 9, "new");
	enforce(edit[0 .. 4].uintAt == messagesEditMessageId, "editMessage id");
	enforce(edit[4 .. 8].uintAt == (1 << 11), "message flag");
	enforce(edit[8 + peer.length .. 12 + peer.length].uintAt == 9, "message id");

	auto del = encodeMessagesDeleteMessages([3, 4], true);
	enforce(del[0 .. 4].uintAt == messagesDeleteMessagesId, "deleteMessages id");
	enforce(del[4 .. 8].uintAt == 1, "revoke flag");
	enforce(del[8 .. 12].uintAt == vectorId, "vector constructor");
	enforce(del[12 .. 16].uintAt == 2, "vector size");

	auto typing = encodeMessagesSetTyping(peer, sendMessageCancelActionId);
	enforce(typing[$ - 4 .. $].uintAt == sendMessageCancelActionId, "action id");
}

@safe unittest // affectedMessages exposes pts and pts_count
{
	auto w = TlWriter();
	w.putConstructor(messagesAffectedMessagesId);
	w.putInt(11);
	w.putInt(2);
	auto v = decodeAffectedMessages(w.data);
	enforce(v.pts == 11 && v.ptsCount == 2, "pts pair");
}

@safe unittest // auth.importBotAuthorization has empty flags and carries the token
{
	auto body = encodeAuthImportBotAuthorization(94575, "1:abc", "hash");
	enforce(body[0 .. 4].uintAt == authImportBotAuthorizationId, "importBotAuthorization id");
	enforce(body[4 .. 8].uintAt == 0, "empty flags");
	enforce(body[8 .. 12].uintAt == 94575, "api_id");
	enforce(body[13 .. 18] == "1:abc", "bot token");
}

@safe unittest // auth.sentCode yields the phone_code_hash
{
	auto w = TlWriter();
	w.putConstructor(authSentCodeId);
	w.putInt(0);
	w.putConstructor(sentCodeTypeSmsId);
	w.putInt(5);
	w.putBytes(cast(const(ubyte)[]) "abc123");
	auto parsed = decodeAuthSentCode(w.data);
	enforce(parsed.typeId == sentCodeTypeSmsId, "sent code type");
	enforce(parsed.phoneCodeHash == "abc123", "phone_code_hash");
}

@safe unittest // config is recognised by its constructor
{
	enforce(isConfig(cast(const(ubyte)[]) "\x1e\x24\x1a\xcc"), "config id");
	enforce(!isConfig(cast(const(ubyte)[]) "\x00\x00\x00\x00"), "other id");
}
