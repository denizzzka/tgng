/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.types.stickers_types;

/// TL sum type `stickers.SuggestedShortName`.
abstract class stickers_SuggestedShortName
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stickers_suggestedShortName
}

/// TL constructor `stickers.suggestedShortName`, id 0x85FEA03F.
final class stickers_suggestedShortName : stickers_SuggestedShortName
{
    enum uint tlId = 0x85FEA03F;

    string short_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

