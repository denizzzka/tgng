/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.smsjobs_functions;

/// TL function `smsjobs.isEligibleToJoin`, id 0x0EDC39D0.
final class smsjobs_isEligibleToJoin
{
    enum uint tlId = 0x0EDC39D0;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `smsjobs.join`, id 0xA74ECE2D.
final class smsjobs_join
{
    enum uint tlId = 0xA74ECE2D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `smsjobs.leave`, id 0x9898AD73.
final class smsjobs_leave
{
    enum uint tlId = 0x9898AD73;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `smsjobs.updateSettings`, id 0x093FA0BF.
final class smsjobs_updateSettings
{
    enum uint tlId = 0x093FA0BF;

    uint flags;
    bool allow_international;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `smsjobs.getStatus`, id 0x10A698E8.
final class smsjobs_getStatus
{
    enum uint tlId = 0x10A698E8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `smsjobs.getSmsJob`, id 0x778D902F.
final class smsjobs_getSmsJob
{
    enum uint tlId = 0x778D902F;

    string job_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `smsjobs.finishJob`, id 0x4F1EBF24.
final class smsjobs_finishJob
{
    enum uint tlId = 0x4F1EBF24;

    uint flags;
    string job_id;
    string error;

    override uint tlIdValue() const nothrow { return tlId; }
}

