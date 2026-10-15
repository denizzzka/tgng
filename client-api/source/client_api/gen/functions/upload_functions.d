/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.functions.upload_functions;

/// TL function `upload.saveFilePart`, id 0xB304A621.
final class upload_saveFilePart
{
    enum uint tlId = 0xB304A621;

    long file_id;
    int file_part;
    ubyte[] bytes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `upload.getFile`, id 0xBE5335BE.
final class upload_getFile
{
    enum uint tlId = 0xBE5335BE;

    uint flags;
    bool precise;
    bool cdn_supported;
    InputFileLocation location;
    long offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `upload.saveBigFilePart`, id 0xDE7B673D.
final class upload_saveBigFilePart
{
    enum uint tlId = 0xDE7B673D;

    long file_id;
    int file_part;
    int file_total_parts;
    ubyte[] bytes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `upload.getWebFile`, id 0x24E6818D.
final class upload_getWebFile
{
    enum uint tlId = 0x24E6818D;

    InputWebFileLocation location;
    int offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `upload.getCdnFile`, id 0x395F69DA.
final class upload_getCdnFile
{
    enum uint tlId = 0x395F69DA;

    ubyte[] file_token;
    long offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `upload.reuploadCdnFile`, id 0x9B2754A8.
final class upload_reuploadCdnFile
{
    enum uint tlId = 0x9B2754A8;

    ubyte[] file_token;
    ubyte[] request_token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `upload.getCdnFileHashes`, id 0x91DC3F31.
final class upload_getCdnFileHashes
{
    enum uint tlId = 0x91DC3F31;

    ubyte[] file_token;
    long offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `upload.getFileHashes`, id 0x9156982A.
final class upload_getFileHashes
{
    enum uint tlId = 0x9156982A;

    InputFileLocation location;
    long offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

