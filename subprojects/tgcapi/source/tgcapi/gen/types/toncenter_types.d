/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.toncenter_types;

/// TL sum type `toncenter.ApiResponse`.
abstract class toncenter_ApiResponse
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: toncenter_apiResponse
}

/// TL sum type `toncenter.StreamingUrl`.
abstract class toncenter_StreamingUrl
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: toncenter_streamingUrl
}

/// TL constructor `toncenter.apiResponse`, id 0xAC8DFE19.
final class toncenter_apiResponse : toncenter_ApiResponse
{
    enum uint tlId = 0xAC8DFE19;

    DataJSON response;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `toncenter.streamingUrl`, id 0x19887601.
final class toncenter_streamingUrl : toncenter_StreamingUrl
{
    enum uint tlId = 0x19887601;

    string url;
    int expires;

    override uint tlIdValue() const nothrow { return tlId; }
}

