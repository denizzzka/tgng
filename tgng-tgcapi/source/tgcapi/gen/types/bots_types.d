/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.types.bots_types;

/// TL sum type `bots.BotInfo`.
abstract class bots_BotInfo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: bots_botInfo
}

/// TL sum type `bots.PopularAppBots`.
abstract class bots_PopularAppBots
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: bots_popularAppBots
}

/// TL sum type `bots.PreviewInfo`.
abstract class bots_PreviewInfo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: bots_previewInfo
}

/// TL sum type `bots.ExportedBotToken`.
abstract class bots_ExportedBotToken
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: bots_exportedBotToken
}

/// TL sum type `bots.RequestedButton`.
abstract class bots_RequestedButton
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: bots_requestedButton
}

/// TL sum type `bots.AccessSettings`.
abstract class bots_AccessSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: bots_accessSettings
}

/// TL constructor `bots.botInfo`, id 0xE8A775B0.
final class bots_botInfo : bots_BotInfo
{
    enum uint tlId = 0xE8A775B0;

    string name;
    string about;
    string description;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `bots.popularAppBots`, id 0x1991B13B.
final class bots_popularAppBots : bots_PopularAppBots
{
    enum uint tlId = 0x1991B13B;

    uint flags;
    string next_offset;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `bots.previewInfo`, id 0x0CA71D64.
final class bots_previewInfo : bots_PreviewInfo
{
    enum uint tlId = 0x0CA71D64;

    Vector!(BotPreviewMedia) media;
    Vector!(string) lang_codes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `bots.exportedBotToken`, id 0x3C60B621.
final class bots_exportedBotToken : bots_ExportedBotToken
{
    enum uint tlId = 0x3C60B621;

    string token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `bots.requestedButton`, id 0xF13BBCD7.
final class bots_requestedButton : bots_RequestedButton
{
    enum uint tlId = 0xF13BBCD7;

    string webapp_req_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `bots.accessSettings`, id 0xDD1FBF93.
final class bots_accessSettings : bots_AccessSettings
{
    enum uint tlId = 0xDD1FBF93;

    uint flags;
    bool restricted;
    Vector!(User) add_users;

    override uint tlIdValue() const nothrow { return tlId; }
}

