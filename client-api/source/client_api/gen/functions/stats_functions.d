/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.functions.stats_functions;

/// TL function `stats.getBroadcastStats`, id 0xAB42441A.
final class stats_getBroadcastStats
{
    enum uint tlId = 0xAB42441A;

    uint flags;
    bool dark;
    InputChannel channel;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stats.loadAsyncGraph`, id 0x621D5FA0.
final class stats_loadAsyncGraph
{
    enum uint tlId = 0x621D5FA0;

    uint flags;
    string token;
    long x;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stats.getMegagroupStats`, id 0xDCDF8607.
final class stats_getMegagroupStats
{
    enum uint tlId = 0xDCDF8607;

    uint flags;
    bool dark;
    InputChannel channel;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stats.getMessagePublicForwards`, id 0x5F150144.
final class stats_getMessagePublicForwards
{
    enum uint tlId = 0x5F150144;

    InputChannel channel;
    int msg_id;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stats.getMessageStats`, id 0xB6E0A3F5.
final class stats_getMessageStats
{
    enum uint tlId = 0xB6E0A3F5;

    uint flags;
    bool dark;
    InputChannel channel;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stats.getStoryStats`, id 0x374FEF40.
final class stats_getStoryStats
{
    enum uint tlId = 0x374FEF40;

    uint flags;
    bool dark;
    InputPeer peer;
    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stats.getStoryPublicForwards`, id 0xA6437EF6.
final class stats_getStoryPublicForwards
{
    enum uint tlId = 0xA6437EF6;

    InputPeer peer;
    int id;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stats.getPollStats`, id 0xC27DFA68.
final class stats_getPollStats
{
    enum uint tlId = 0xC27DFA68;

    uint flags;
    bool dark;
    InputPeer peer;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

