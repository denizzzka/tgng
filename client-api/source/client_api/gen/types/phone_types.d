/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.types.phone_types;

/// TL sum type `phone.PhoneCall`.
abstract class phone_PhoneCall
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: phone_phoneCall
}

/// TL sum type `phone.GroupCall`.
abstract class phone_GroupCall
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: phone_groupCall
}

/// TL sum type `phone.GroupParticipants`.
abstract class phone_GroupParticipants
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: phone_groupParticipants
}

/// TL sum type `phone.JoinAsPeers`.
abstract class phone_JoinAsPeers
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: phone_joinAsPeers
}

/// TL sum type `phone.ExportedGroupCallInvite`.
abstract class phone_ExportedGroupCallInvite
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: phone_exportedGroupCallInvite
}

/// TL sum type `phone.GroupCallStreamChannels`.
abstract class phone_GroupCallStreamChannels
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: phone_groupCallStreamChannels
}

/// TL sum type `phone.GroupCallStreamRtmpUrl`.
abstract class phone_GroupCallStreamRtmpUrl
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: phone_groupCallStreamRtmpUrl
}

/// TL sum type `phone.GroupCallStars`.
abstract class phone_GroupCallStars
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: phone_groupCallStars
}

/// TL constructor `phone.phoneCall`, id 0xEC82E140.
final class phone_phoneCall : phone_PhoneCall
{
    enum uint tlId = 0xEC82E140;

    PhoneCall phone_call;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phone.groupCall`, id 0x9E727AAD.
final class phone_groupCall : phone_GroupCall
{
    enum uint tlId = 0x9E727AAD;

    GroupCall call;
    Vector!(GroupCallParticipant) participants;
    string participants_next_offset;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phone.groupParticipants`, id 0xF47751B6.
final class phone_groupParticipants : phone_GroupParticipants
{
    enum uint tlId = 0xF47751B6;

    int count;
    Vector!(GroupCallParticipant) participants;
    string next_offset;
    Vector!(Chat) chats;
    Vector!(User) users;
    int version_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phone.joinAsPeers`, id 0xAFE5623F.
final class phone_joinAsPeers : phone_JoinAsPeers
{
    enum uint tlId = 0xAFE5623F;

    Vector!(Peer) peers;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phone.exportedGroupCallInvite`, id 0x204BD158.
final class phone_exportedGroupCallInvite : phone_ExportedGroupCallInvite
{
    enum uint tlId = 0x204BD158;

    string link;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phone.groupCallStreamChannels`, id 0xD0E482B2.
final class phone_groupCallStreamChannels : phone_GroupCallStreamChannels
{
    enum uint tlId = 0xD0E482B2;

    Vector!(GroupCallStreamChannel) channels;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phone.groupCallStreamRtmpUrl`, id 0x2DBF3432.
final class phone_groupCallStreamRtmpUrl : phone_GroupCallStreamRtmpUrl
{
    enum uint tlId = 0x2DBF3432;

    string url;
    string key;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phone.groupCallStars`, id 0x9D1DBD26.
final class phone_groupCallStars : phone_GroupCallStars
{
    enum uint tlId = 0x9D1DBD26;

    long total_stars;
    Vector!(GroupCallDonor) top_donors;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

