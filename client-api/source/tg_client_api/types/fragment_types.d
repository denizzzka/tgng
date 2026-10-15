/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.types.fragment_types;

/// TL sum type `fragment.CollectibleInfo`.
abstract class fragment_CollectibleInfo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: fragment_collectibleInfo
}

/// TL constructor `fragment.collectibleInfo`, id 0x6EBDFF91.
final class fragment_collectibleInfo : fragment_CollectibleInfo
{
    enum uint tlId = 0x6EBDFF91;

    int purchase_date;
    string currency;
    long amount;
    string crypto_currency;
    long crypto_amount;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

