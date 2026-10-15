/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.channels_types;

/// TL sum type `channels.ChannelParticipants`.
abstract class channels_ChannelParticipants
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: channels_channelParticipants
    // constructor: channels_channelParticipantsNotModified
}

/// TL sum type `channels.ChannelParticipant`.
abstract class channels_ChannelParticipant
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: channels_channelParticipant
}

/// TL sum type `channels.AdminLogResults`.
abstract class channels_AdminLogResults
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: channels_adminLogResults
}

/// TL sum type `channels.SendAsPeers`.
abstract class channels_SendAsPeers
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: channels_sendAsPeers
}

/// TL sum type `channels.SponsoredMessageReportResult`.
abstract class channels_SponsoredMessageReportResult
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: channels_sponsoredMessageReportResultAdsHidden
    // constructor: channels_sponsoredMessageReportResultChooseOption
    // constructor: channels_sponsoredMessageReportResultReported
}

/// TL constructor `channels.channelParticipants`, id 0x9AB0FEAF.
final class channels_channelParticipants : channels_ChannelParticipants
{
    enum uint tlId = 0x9AB0FEAF;

    int count;
    Vector!(ChannelParticipant) participants;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channels.channelParticipantsNotModified`, id 0xF0173FE9.
final class channels_channelParticipantsNotModified : channels_ChannelParticipants
{
    enum uint tlId = 0xF0173FE9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channels.channelParticipant`, id 0xDFB80317.
final class channels_channelParticipant : channels_ChannelParticipant
{
    enum uint tlId = 0xDFB80317;

    ChannelParticipant participant;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channels.adminLogResults`, id 0xED8AF74D.
final class channels_adminLogResults : channels_AdminLogResults
{
    enum uint tlId = 0xED8AF74D;

    Vector!(ChannelAdminLogEvent) events;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channels.sendAsPeers`, id 0xF496B0C6.
final class channels_sendAsPeers : channels_SendAsPeers
{
    enum uint tlId = 0xF496B0C6;

    Vector!(SendAsPeer) peers;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channels.sponsoredMessageReportResultChooseOption`, id 0x846F9E42.
final class channels_sponsoredMessageReportResultChooseOption : channels_SponsoredMessageReportResult
{
    enum uint tlId = 0x846F9E42;

    string title;
    Vector!(SponsoredMessageReportOption) options;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channels.sponsoredMessageReportResultAdsHidden`, id 0x3E3BCF2F.
final class channels_sponsoredMessageReportResultAdsHidden : channels_SponsoredMessageReportResult
{
    enum uint tlId = 0x3E3BCF2F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channels.sponsoredMessageReportResultReported`, id 0xAD798849.
final class channels_sponsoredMessageReportResultReported : channels_SponsoredMessageReportResult
{
    enum uint tlId = 0xAD798849;

    override uint tlIdValue() const nothrow { return tlId; }
}

