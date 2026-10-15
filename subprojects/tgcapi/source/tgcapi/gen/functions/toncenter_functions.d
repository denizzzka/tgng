/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.toncenter_functions;

/// TL function `toncenter.performApiRequest`, id 0x8D7BDD61.
final class toncenter_performApiRequest
{
    enum uint tlId = 0x8D7BDD61;

    uint flags;
    bool post;
    string endpoint;
    string query;
    string payload;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `toncenter.getStreamingUrl`, id 0xCDAF63C7.
final class toncenter_getStreamingUrl
{
    enum uint tlId = 0xCDAF63C7;

    override uint tlIdValue() const nothrow { return tlId; }
}

