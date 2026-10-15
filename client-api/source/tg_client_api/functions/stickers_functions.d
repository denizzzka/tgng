/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.stickers_functions;

/// TL function `stickers.createStickerSet`, id 0x9021AB67.
final class stickers_createStickerSet
{
    enum uint tlId = 0x9021AB67;

    uint flags;
    bool masks;
    bool emojis;
    bool text_color;
    InputUser user_id;
    string title;
    string short_name;
    InputDocument thumb;
    Vector!(InputStickerSetItem) stickers;
    string software;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stickers.removeStickerFromSet`, id 0xF7760F51.
final class stickers_removeStickerFromSet
{
    enum uint tlId = 0xF7760F51;

    InputDocument sticker;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stickers.changeStickerPosition`, id 0xFFB6D4CA.
final class stickers_changeStickerPosition
{
    enum uint tlId = 0xFFB6D4CA;

    InputDocument sticker;
    int position;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stickers.addStickerToSet`, id 0x8653FEBE.
final class stickers_addStickerToSet
{
    enum uint tlId = 0x8653FEBE;

    InputStickerSet stickerset;
    InputStickerSetItem sticker;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stickers.setStickerSetThumb`, id 0xA76A5392.
final class stickers_setStickerSetThumb
{
    enum uint tlId = 0xA76A5392;

    uint flags;
    InputStickerSet stickerset;
    InputDocument thumb;
    long thumb_document_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stickers.checkShortName`, id 0x284B3639.
final class stickers_checkShortName
{
    enum uint tlId = 0x284B3639;

    string short_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stickers.suggestShortName`, id 0x4DAFC503.
final class stickers_suggestShortName
{
    enum uint tlId = 0x4DAFC503;

    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stickers.changeSticker`, id 0xF5537EBC.
final class stickers_changeSticker
{
    enum uint tlId = 0xF5537EBC;

    uint flags;
    InputDocument sticker;
    string emoji;
    MaskCoords mask_coords;
    string keywords;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stickers.renameStickerSet`, id 0x124B1C00.
final class stickers_renameStickerSet
{
    enum uint tlId = 0x124B1C00;

    InputStickerSet stickerset;
    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stickers.deleteStickerSet`, id 0x87704394.
final class stickers_deleteStickerSet
{
    enum uint tlId = 0x87704394;

    InputStickerSet stickerset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stickers.replaceSticker`, id 0x4696459A.
final class stickers_replaceSticker
{
    enum uint tlId = 0x4696459A;

    InputDocument sticker;
    InputStickerSetItem new_sticker;

    override uint tlIdValue() const nothrow { return tlId; }
}

