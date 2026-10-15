/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.types.smsjobs_types;

/// TL sum type `smsjobs.EligibilityToJoin`.
abstract class smsjobs_EligibilityToJoin
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: smsjobs_eligibleToJoin
}

/// TL sum type `smsjobs.Status`.
abstract class smsjobs_Status
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: smsjobs_status
}

/// TL constructor `smsjobs.eligibleToJoin`, id 0xDC8B44CF.
final class smsjobs_eligibleToJoin : smsjobs_EligibilityToJoin
{
    enum uint tlId = 0xDC8B44CF;

    string terms_url;
    int monthly_sent_sms;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `smsjobs.status`, id 0x2AEE9191.
final class smsjobs_status : smsjobs_Status
{
    enum uint tlId = 0x2AEE9191;

    uint flags;
    bool allow_international;
    int recent_sent;
    int recent_since;
    int recent_remains;
    int total_sent;
    int total_since;
    string last_gift_slug;
    string terms_url;

    override uint tlIdValue() const nothrow { return tlId; }
}

