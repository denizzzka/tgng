/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.premium_functions;

/// TL function `premium.getBoostsList`, id 0x60F67660.
final class premium_getBoostsList
{
    enum uint tlId = 0x60F67660;

    uint flags;
    bool gifts;
    InputPeer peer;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `premium.getMyBoosts`, id 0x0BE77B4A.
final class premium_getMyBoosts
{
    enum uint tlId = 0x0BE77B4A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `premium.applyBoost`, id 0x6B7DA746.
final class premium_applyBoost
{
    enum uint tlId = 0x6B7DA746;

    uint flags;
    Vector!(int) slots;
    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `premium.getBoostsStatus`, id 0x042F1F61.
final class premium_getBoostsStatus
{
    enum uint tlId = 0x042F1F61;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `premium.getUserBoosts`, id 0x39854D1F.
final class premium_getUserBoosts
{
    enum uint tlId = 0x39854D1F;

    InputPeer peer;
    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

