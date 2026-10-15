/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.types.help_types;

/// TL sum type `help.ConfigSimple`.
abstract class help_ConfigSimple
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_configSimple
}

/// TL sum type `help.AppUpdate`.
abstract class help_AppUpdate
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_appUpdate
    // constructor: help_noAppUpdate
}

/// TL sum type `help.InviteText`.
abstract class help_InviteText
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_inviteText
}

/// TL sum type `help.Support`.
abstract class help_Support
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_support
}

/// TL sum type `help.TermsOfService`.
abstract class help_TermsOfService
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_termsOfService
}

/// TL sum type `help.RecentMeUrls`.
abstract class help_RecentMeUrls
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_recentMeUrls
}

/// TL sum type `help.TermsOfServiceUpdate`.
abstract class help_TermsOfServiceUpdate
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_termsOfServiceUpdate
    // constructor: help_termsOfServiceUpdateEmpty
}

/// TL sum type `help.DeepLinkInfo`.
abstract class help_DeepLinkInfo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_deepLinkInfo
    // constructor: help_deepLinkInfoEmpty
}

/// TL sum type `help.PassportConfig`.
abstract class help_PassportConfig
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_passportConfig
    // constructor: help_passportConfigNotModified
}

/// TL sum type `help.SupportName`.
abstract class help_SupportName
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_supportName
}

/// TL sum type `help.UserInfo`.
abstract class help_UserInfo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_userInfo
    // constructor: help_userInfoEmpty
}

/// TL sum type `help.PromoData`.
abstract class help_PromoData
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_promoData
    // constructor: help_promoDataEmpty
}

/// TL sum type `help.CountryCode`.
abstract class help_CountryCode
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_countryCode
}

/// TL sum type `help.Country`.
abstract class help_Country
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_country
}

/// TL sum type `help.CountriesList`.
abstract class help_CountriesList
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_countriesList
    // constructor: help_countriesListNotModified
}

/// TL sum type `help.PremiumPromo`.
abstract class help_PremiumPromo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_premiumPromo
}

/// TL sum type `help.AppConfig`.
abstract class help_AppConfig
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_appConfig
    // constructor: help_appConfigNotModified
}

/// TL sum type `help.PeerColorSet`.
abstract class help_PeerColorSet
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_peerColorProfileSet
    // constructor: help_peerColorSet
}

/// TL sum type `help.PeerColorOption`.
abstract class help_PeerColorOption
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_peerColorOption
}

/// TL sum type `help.PeerColors`.
abstract class help_PeerColors
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_peerColors
    // constructor: help_peerColorsNotModified
}

/// TL sum type `help.TimezonesList`.
abstract class help_TimezonesList
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: help_timezonesList
    // constructor: help_timezonesListNotModified
}

/// TL constructor `help.configSimple`, id 0x5A592A6C.
final class help_configSimple : help_ConfigSimple
{
    enum uint tlId = 0x5A592A6C;

    int date;
    int expires;
    Vector!(AccessPointRule) rules;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.appUpdate`, id 0xCCBBCE30.
final class help_appUpdate : help_AppUpdate
{
    enum uint tlId = 0xCCBBCE30;

    uint flags;
    bool can_not_skip;
    int id;
    string version_;
    string text;
    Vector!(MessageEntity) entities;
    Document document;
    string url;
    Document sticker;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.noAppUpdate`, id 0xC45A6536.
final class help_noAppUpdate : help_AppUpdate
{
    enum uint tlId = 0xC45A6536;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.inviteText`, id 0x18CB9F78.
final class help_inviteText : help_InviteText
{
    enum uint tlId = 0x18CB9F78;

    string message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.support`, id 0x17C6B5F6.
final class help_support : help_Support
{
    enum uint tlId = 0x17C6B5F6;

    string phone_number;
    User user;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.termsOfService`, id 0x780A0310.
final class help_termsOfService : help_TermsOfService
{
    enum uint tlId = 0x780A0310;

    uint flags;
    bool popup;
    DataJSON id;
    string text;
    Vector!(MessageEntity) entities;
    int min_age_confirm;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.recentMeUrls`, id 0x0E0310D7.
final class help_recentMeUrls : help_RecentMeUrls
{
    enum uint tlId = 0x0E0310D7;

    Vector!(RecentMeUrl) urls;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.termsOfServiceUpdateEmpty`, id 0xE3309F7F.
final class help_termsOfServiceUpdateEmpty : help_TermsOfServiceUpdate
{
    enum uint tlId = 0xE3309F7F;

    int expires;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.termsOfServiceUpdate`, id 0x28ECF961.
final class help_termsOfServiceUpdate : help_TermsOfServiceUpdate
{
    enum uint tlId = 0x28ECF961;

    int expires;
    help_TermsOfService terms_of_service;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.deepLinkInfoEmpty`, id 0x66AFA166.
final class help_deepLinkInfoEmpty : help_DeepLinkInfo
{
    enum uint tlId = 0x66AFA166;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.deepLinkInfo`, id 0x6A4EE832.
final class help_deepLinkInfo : help_DeepLinkInfo
{
    enum uint tlId = 0x6A4EE832;

    uint flags;
    bool update_app;
    string message;
    Vector!(MessageEntity) entities;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.passportConfigNotModified`, id 0xBFB9F457.
final class help_passportConfigNotModified : help_PassportConfig
{
    enum uint tlId = 0xBFB9F457;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.passportConfig`, id 0xA098D6AF.
final class help_passportConfig : help_PassportConfig
{
    enum uint tlId = 0xA098D6AF;

    int hash;
    DataJSON countries_langs;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.supportName`, id 0x8C05F1C9.
final class help_supportName : help_SupportName
{
    enum uint tlId = 0x8C05F1C9;

    string name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.userInfoEmpty`, id 0xF3AE2EED.
final class help_userInfoEmpty : help_UserInfo
{
    enum uint tlId = 0xF3AE2EED;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.userInfo`, id 0x01EB3758.
final class help_userInfo : help_UserInfo
{
    enum uint tlId = 0x01EB3758;

    string message;
    Vector!(MessageEntity) entities;
    string author;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.promoDataEmpty`, id 0x98F6AC75.
final class help_promoDataEmpty : help_PromoData
{
    enum uint tlId = 0x98F6AC75;

    int expires;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.promoData`, id 0x08A4D87A.
final class help_promoData : help_PromoData
{
    enum uint tlId = 0x08A4D87A;

    uint flags;
    bool proxy;
    int expires;
    Peer peer;
    string psa_type;
    string psa_message;
    Vector!(string) pending_suggestions;
    Vector!(string) dismissed_suggestions;
    PendingSuggestion custom_pending_suggestion;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.countryCode`, id 0x4203C5EF.
final class help_countryCode : help_CountryCode
{
    enum uint tlId = 0x4203C5EF;

    uint flags;
    string country_code;
    Vector!(string) prefixes;
    Vector!(string) patterns;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.country`, id 0xC3878E23.
final class help_country : help_Country
{
    enum uint tlId = 0xC3878E23;

    uint flags;
    bool hidden;
    string iso2;
    string default_name;
    string name;
    Vector!(help_CountryCode) country_codes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.countriesListNotModified`, id 0x93CC1F32.
final class help_countriesListNotModified : help_CountriesList
{
    enum uint tlId = 0x93CC1F32;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.countriesList`, id 0x87D0759E.
final class help_countriesList : help_CountriesList
{
    enum uint tlId = 0x87D0759E;

    Vector!(help_Country) countries;
    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.premiumPromo`, id 0x5334759C.
final class help_premiumPromo : help_PremiumPromo
{
    enum uint tlId = 0x5334759C;

    string status_text;
    Vector!(MessageEntity) status_entities;
    Vector!(string) video_sections;
    Vector!(Document) videos;
    Vector!(PremiumSubscriptionOption) period_options;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.appConfigNotModified`, id 0x7CDE641D.
final class help_appConfigNotModified : help_AppConfig
{
    enum uint tlId = 0x7CDE641D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.appConfig`, id 0xDD18782E.
final class help_appConfig : help_AppConfig
{
    enum uint tlId = 0xDD18782E;

    int hash;
    JSONValue config;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.peerColorSet`, id 0x26219A58.
final class help_peerColorSet : help_PeerColorSet
{
    enum uint tlId = 0x26219A58;

    Vector!(int) colors;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.peerColorProfileSet`, id 0x767D61EB.
final class help_peerColorProfileSet : help_PeerColorSet
{
    enum uint tlId = 0x767D61EB;

    Vector!(int) palette_colors;
    Vector!(int) bg_colors;
    Vector!(int) story_colors;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.peerColorOption`, id 0xADEC6EBE.
final class help_peerColorOption : help_PeerColorOption
{
    enum uint tlId = 0xADEC6EBE;

    uint flags;
    bool hidden;
    int color_id;
    help_PeerColorSet colors;
    help_PeerColorSet dark_colors;
    int channel_min_level;
    int group_min_level;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.peerColorsNotModified`, id 0x2BA1F5CE.
final class help_peerColorsNotModified : help_PeerColors
{
    enum uint tlId = 0x2BA1F5CE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.peerColors`, id 0x00F8ED08.
final class help_peerColors : help_PeerColors
{
    enum uint tlId = 0x00F8ED08;

    int hash;
    Vector!(help_PeerColorOption) colors;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.timezonesListNotModified`, id 0x970708CC.
final class help_timezonesListNotModified : help_TimezonesList
{
    enum uint tlId = 0x970708CC;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `help.timezonesList`, id 0x7B74ED71.
final class help_timezonesList : help_TimezonesList
{
    enum uint tlId = 0x7B74ED71;

    Vector!(Timezone) timezones;
    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

