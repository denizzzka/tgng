/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.types.storage_types;

/// TL sum type `storage.FileType`.
abstract class storage_FileType
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: storage_fileGif
    // constructor: storage_fileJpeg
    // constructor: storage_fileMov
    // constructor: storage_fileMp3
    // constructor: storage_fileMp4
    // constructor: storage_filePartial
    // constructor: storage_filePdf
    // constructor: storage_filePng
    // constructor: storage_fileUnknown
    // constructor: storage_fileWebp
}

/// TL constructor `storage.fileUnknown`, id 0xAA963B05.
final class storage_fileUnknown : storage_FileType
{
    enum uint tlId = 0xAA963B05;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storage.filePartial`, id 0x40BC6F52.
final class storage_filePartial : storage_FileType
{
    enum uint tlId = 0x40BC6F52;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storage.fileJpeg`, id 0x007EFE0E.
final class storage_fileJpeg : storage_FileType
{
    enum uint tlId = 0x007EFE0E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storage.fileGif`, id 0xCAE1AADF.
final class storage_fileGif : storage_FileType
{
    enum uint tlId = 0xCAE1AADF;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storage.filePng`, id 0x0A4F63C0.
final class storage_filePng : storage_FileType
{
    enum uint tlId = 0x0A4F63C0;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storage.filePdf`, id 0xAE1E508D.
final class storage_filePdf : storage_FileType
{
    enum uint tlId = 0xAE1E508D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storage.fileMp3`, id 0x528A0677.
final class storage_fileMp3 : storage_FileType
{
    enum uint tlId = 0x528A0677;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storage.fileMov`, id 0x4B09EBBC.
final class storage_fileMov : storage_FileType
{
    enum uint tlId = 0x4B09EBBC;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storage.fileMp4`, id 0xB3CEA0E4.
final class storage_fileMp4 : storage_FileType
{
    enum uint tlId = 0xB3CEA0E4;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storage.fileWebp`, id 0x1081464C.
final class storage_fileWebp : storage_FileType
{
    enum uint tlId = 0x1081464C;

    override uint tlIdValue() const nothrow { return tlId; }
}

