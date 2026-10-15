/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.help_functions;

/// TL function `help.getConfig`, id 0xC4F9186B.
final class help_getConfig
{
    enum uint tlId = 0xC4F9186B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getNearestDc`, id 0x1FB33026.
final class help_getNearestDc
{
    enum uint tlId = 0x1FB33026;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getAppUpdate`, id 0x522D5A7D.
final class help_getAppUpdate
{
    enum uint tlId = 0x522D5A7D;

    string source;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getInviteText`, id 0x4D392343.
final class help_getInviteText
{
    enum uint tlId = 0x4D392343;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getSupport`, id 0x9CDF08CD.
final class help_getSupport
{
    enum uint tlId = 0x9CDF08CD;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.setBotUpdatesStatus`, id 0xEC22CFCD.
final class help_setBotUpdatesStatus
{
    enum uint tlId = 0xEC22CFCD;

    int pending_updates_count;
    string message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getCdnConfig`, id 0x52029342.
final class help_getCdnConfig
{
    enum uint tlId = 0x52029342;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getRecentMeUrls`, id 0x3DC0F114.
final class help_getRecentMeUrls
{
    enum uint tlId = 0x3DC0F114;

    string referer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getTermsOfServiceUpdate`, id 0x2CA51FD1.
final class help_getTermsOfServiceUpdate
{
    enum uint tlId = 0x2CA51FD1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.acceptTermsOfService`, id 0xEE72F79A.
final class help_acceptTermsOfService
{
    enum uint tlId = 0xEE72F79A;

    DataJSON id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getDeepLinkInfo`, id 0x3FEDC75F.
final class help_getDeepLinkInfo
{
    enum uint tlId = 0x3FEDC75F;

    string path;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getAppConfig`, id 0x61E3F854.
final class help_getAppConfig
{
    enum uint tlId = 0x61E3F854;

    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.saveAppLog`, id 0x6F02F748.
final class help_saveAppLog
{
    enum uint tlId = 0x6F02F748;

    Vector!(InputAppEvent) events;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getPassportConfig`, id 0xC661AD08.
final class help_getPassportConfig
{
    enum uint tlId = 0xC661AD08;

    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getSupportName`, id 0xD360E72C.
final class help_getSupportName
{
    enum uint tlId = 0xD360E72C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getUserInfo`, id 0x038A08D3.
final class help_getUserInfo
{
    enum uint tlId = 0x038A08D3;

    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.editUserInfo`, id 0x66B91B70.
final class help_editUserInfo
{
    enum uint tlId = 0x66B91B70;

    InputUser user_id;
    string message;
    Vector!(MessageEntity) entities;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getPromoData`, id 0xC0977421.
final class help_getPromoData
{
    enum uint tlId = 0xC0977421;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.hidePromoData`, id 0x1E251C95.
final class help_hidePromoData
{
    enum uint tlId = 0x1E251C95;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.dismissSuggestion`, id 0xF50DBAA1.
final class help_dismissSuggestion
{
    enum uint tlId = 0xF50DBAA1;

    InputPeer peer;
    string suggestion;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getCountriesList`, id 0x735787A8.
final class help_getCountriesList
{
    enum uint tlId = 0x735787A8;

    string lang_code;
    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getPremiumPromo`, id 0xB81B93D4.
final class help_getPremiumPromo
{
    enum uint tlId = 0xB81B93D4;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getPeerColors`, id 0xDA80F42F.
final class help_getPeerColors
{
    enum uint tlId = 0xDA80F42F;

    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getPeerProfileColors`, id 0xABCFA9FD.
final class help_getPeerProfileColors
{
    enum uint tlId = 0xABCFA9FD;

    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `help.getTimezonesList`, id 0x49B30240.
final class help_getTimezonesList
{
    enum uint tlId = 0x49B30240;

    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

