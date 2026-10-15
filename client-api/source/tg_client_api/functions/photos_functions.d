/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.photos_functions;

import tg_client_api.functions.tl_function;
import tg_client_api.types.common_types;
import tg_client_api.types.vector;

/// TL function `photos.updateProfilePhoto`, id 0x09E82039.
final class photos_updateProfilePhoto : TlFunction
{
    enum uint tlId = 0x09E82039;

    uint flags;
    bool fallback;
    InputUser bot;
    InputPhoto id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `photos.uploadProfilePhoto`, id 0x0388A3B5.
final class photos_uploadProfilePhoto : TlFunction
{
    enum uint tlId = 0x0388A3B5;

    uint flags;
    bool fallback;
    InputUser bot;
    InputFile file;
    InputFile video;
    double video_start_ts;
    VideoSize video_emoji_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `photos.deletePhotos`, id 0x87CF7F2F.
final class photos_deletePhotos : TlFunction
{
    enum uint tlId = 0x87CF7F2F;

    Vector!(InputPhoto) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `photos.getUserPhotos`, id 0x91CD32A8.
final class photos_getUserPhotos : TlFunction
{
    enum uint tlId = 0x91CD32A8;

    InputUser user_id;
    int offset;
    long max_id;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `photos.uploadContactProfilePhoto`, id 0xE14C4A71.
final class photos_uploadContactProfilePhoto : TlFunction
{
    enum uint tlId = 0xE14C4A71;

    uint flags;
    bool suggest;
    bool save;
    InputUser user_id;
    InputFile file;
    InputFile video;
    double video_start_ts;
    VideoSize video_emoji_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

