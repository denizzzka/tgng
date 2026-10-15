/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.ephemeral_functions;

/// TL function `ephemeral.sendMessage`, id 0xBA8D5F35.
final class ephemeral_sendMessage
{
    enum uint tlId = 0xBA8D5F35;

    uint flags;
    bool invert_media;
    bool welcome;
    bool anchor;
    bool noforwards;
    InputPeer peer;
    InputUser receiver_id;
    long query_id;
    string message;
    Vector!(MessageEntity) entities;
    InputMedia media;
    ReplyMarkup reply_markup;
    InputRichMessage rich_message;
    long random_id;
    InputReplyTo reply_to;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `ephemeral.deleteMessage`, id 0x92F6E797.
final class ephemeral_deleteMessage
{
    enum uint tlId = 0x92F6E797;

    uint flags;
    InputPeer peer;
    InputUser receiver_id;
    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `ephemeral.reportMessage`, id 0x8704F2BF.
final class ephemeral_reportMessage
{
    enum uint tlId = 0x8704F2BF;

    InputPeer peer;
    int id;
    ubyte[] option;
    string message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `ephemeral.getCallbackAnswer`, id 0x3FA464C8.
final class ephemeral_getCallbackAnswer
{
    enum uint tlId = 0x3FA464C8;

    uint flags;
    InputPeer peer;
    int id;
    ubyte[] data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `ephemeral.editMessage`, id 0xCF9C725B.
final class ephemeral_editMessage
{
    enum uint tlId = 0xCF9C725B;

    uint flags;
    bool invert_media;
    bool welcome;
    InputPeer peer;
    InputUser receiver_id;
    int id;
    string message;
    InputMedia media;
    Vector!(MessageEntity) entities;
    ReplyMarkup reply_markup;
    InputRichMessage rich_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `ephemeral.deleteWelcomeMessage`, id 0xE882A9E1.
final class ephemeral_deleteWelcomeMessage
{
    enum uint tlId = 0xE882A9E1;

    InputPeer peer;
    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `ephemeral.deleteAllWelcomeMessages`, id 0x734F9721.
final class ephemeral_deleteAllWelcomeMessages
{
    enum uint tlId = 0x734F9721;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `ephemeral.getWelcomeMessages`, id 0xDB9AC18D.
final class ephemeral_getWelcomeMessages
{
    enum uint tlId = 0xDB9AC18D;

    InputPeer peer;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

