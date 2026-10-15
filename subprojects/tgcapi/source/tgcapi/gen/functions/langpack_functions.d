/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.functions.langpack_functions;

/// TL function `langpack.getLangPack`, id 0xF2F2330A.
final class langpack_getLangPack
{
    enum uint tlId = 0xF2F2330A;

    string lang_pack;
    string lang_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `langpack.getStrings`, id 0xEFEA3803.
final class langpack_getStrings
{
    enum uint tlId = 0xEFEA3803;

    string lang_pack;
    string lang_code;
    Vector!(string) keys;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `langpack.getDifference`, id 0xCD984AA5.
final class langpack_getDifference
{
    enum uint tlId = 0xCD984AA5;

    string lang_pack;
    string lang_code;
    int from_version;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `langpack.getLanguages`, id 0x42C6978F.
final class langpack_getLanguages
{
    enum uint tlId = 0x42C6978F;

    string lang_pack;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `langpack.getLanguage`, id 0x6A596502.
final class langpack_getLanguage
{
    enum uint tlId = 0x6A596502;

    string lang_pack;
    string lang_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

