/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.functions.updates_functions;

/// TL function `updates.getState`, id 0xEDD4882A.
final class updates_getState
{
    enum uint tlId = 0xEDD4882A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `updates.getDifference`, id 0x19C2F763.
final class updates_getDifference
{
    enum uint tlId = 0x19C2F763;

    uint flags;
    int pts;
    int pts_limit;
    int pts_total_limit;
    int date;
    int qts;
    int qts_limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `updates.getChannelDifference`, id 0x03173D78.
final class updates_getChannelDifference
{
    enum uint tlId = 0x03173D78;

    uint flags;
    bool force;
    InputChannel channel;
    ChannelMessagesFilter filter;
    int pts;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

