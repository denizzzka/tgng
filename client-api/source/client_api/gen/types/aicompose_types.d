/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.types.aicompose_types;

/// TL sum type `aicompose.Tones`.
abstract class aicompose_Tones
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: aicompose_tones
    // constructor: aicompose_tonesNotModified
}

/// TL constructor `aicompose.tonesNotModified`, id 0xC1F46103.
final class aicompose_tonesNotModified : aicompose_Tones
{
    enum uint tlId = 0xC1F46103;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `aicompose.tones`, id 0x6C9D0EFE.
final class aicompose_tones : aicompose_Tones
{
    enum uint tlId = 0x6C9D0EFE;

    long hash;
    Vector!(AiComposeTone) tones;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

