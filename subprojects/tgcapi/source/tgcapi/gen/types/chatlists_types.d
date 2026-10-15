/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.types.chatlists_types;

/// TL sum type `chatlists.ExportedChatlistInvite`.
abstract class chatlists_ExportedChatlistInvite
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatlists_exportedChatlistInvite
}

/// TL sum type `chatlists.ExportedInvites`.
abstract class chatlists_ExportedInvites
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatlists_exportedInvites
}

/// TL sum type `chatlists.ChatlistInvite`.
abstract class chatlists_ChatlistInvite
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatlists_chatlistInvite
    // constructor: chatlists_chatlistInviteAlready
}

/// TL sum type `chatlists.ChatlistUpdates`.
abstract class chatlists_ChatlistUpdates
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatlists_chatlistUpdates
}

/// TL constructor `chatlists.exportedChatlistInvite`, id 0x10E6E3A6.
final class chatlists_exportedChatlistInvite : chatlists_ExportedChatlistInvite
{
    enum uint tlId = 0x10E6E3A6;

    DialogFilter filter;
    ExportedChatlistInvite invite;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatlists.exportedInvites`, id 0x10AB6DC7.
final class chatlists_exportedInvites : chatlists_ExportedInvites
{
    enum uint tlId = 0x10AB6DC7;

    Vector!(ExportedChatlistInvite) invites;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatlists.chatlistInviteAlready`, id 0xFA87F659.
final class chatlists_chatlistInviteAlready : chatlists_ChatlistInvite
{
    enum uint tlId = 0xFA87F659;

    int filter_id;
    Vector!(Peer) missing_peers;
    Vector!(Peer) already_peers;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatlists.chatlistInvite`, id 0xF10ECE2F.
final class chatlists_chatlistInvite : chatlists_ChatlistInvite
{
    enum uint tlId = 0xF10ECE2F;

    uint flags;
    bool title_noanimate;
    TextWithEntities title;
    string emoticon;
    Vector!(Peer) peers;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatlists.chatlistUpdates`, id 0x93BD878D.
final class chatlists_chatlistUpdates : chatlists_ChatlistUpdates
{
    enum uint tlId = 0x93BD878D;

    Vector!(Peer) missing_peers;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

