/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.types.upload_types;

/// TL sum type `upload.File`.
abstract class upload_File
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: upload_file
    // constructor: upload_fileCdnRedirect
}

/// TL sum type `upload.WebFile`.
abstract class upload_WebFile
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: upload_webFile
}

/// TL sum type `upload.CdnFile`.
abstract class upload_CdnFile
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: upload_cdnFile
    // constructor: upload_cdnFileReuploadNeeded
}

/// TL constructor `upload.file`, id 0x096A18D5.
final class upload_file : upload_File
{
    enum uint tlId = 0x096A18D5;

    storage_FileType type;
    int mtime;
    ubyte[] bytes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `upload.fileCdnRedirect`, id 0xF18CDA44.
final class upload_fileCdnRedirect : upload_File
{
    enum uint tlId = 0xF18CDA44;

    int dc_id;
    ubyte[] file_token;
    ubyte[] encryption_key;
    ubyte[] encryption_iv;
    Vector!(FileHash) file_hashes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `upload.webFile`, id 0x21E753BC.
final class upload_webFile : upload_WebFile
{
    enum uint tlId = 0x21E753BC;

    int size;
    string mime_type;
    storage_FileType file_type;
    int mtime;
    ubyte[] bytes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `upload.cdnFileReuploadNeeded`, id 0xEEA8E46E.
final class upload_cdnFileReuploadNeeded : upload_CdnFile
{
    enum uint tlId = 0xEEA8E46E;

    ubyte[] request_token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `upload.cdnFile`, id 0xA99FCA4F.
final class upload_cdnFile : upload_CdnFile
{
    enum uint tlId = 0xA99FCA4F;

    ubyte[] bytes;

    override uint tlIdValue() const nothrow { return tlId; }
}

