/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.types.photos_types;

/// TL sum type `photos.Photos`.
abstract class photos_Photos
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: photos_photos
    // constructor: photos_photosSlice
}

/// TL sum type `photos.Photo`.
abstract class photos_Photo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: photos_photo
}

/// TL constructor `photos.photos`, id 0x8DCA6AA5.
final class photos_photos : photos_Photos
{
    enum uint tlId = 0x8DCA6AA5;

    Vector!(Photo) photos;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `photos.photosSlice`, id 0x15051F54.
final class photos_photosSlice : photos_Photos
{
    enum uint tlId = 0x15051F54;

    int count;
    Vector!(Photo) photos;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `photos.photo`, id 0x20212CA8.
final class photos_photo : photos_Photo
{
    enum uint tlId = 0x20212CA8;

    Photo photo;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

