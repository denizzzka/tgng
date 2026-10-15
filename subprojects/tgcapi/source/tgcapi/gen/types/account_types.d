/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.types.account_types;

/// TL sum type `account.PrivacyRules`.
abstract class account_PrivacyRules
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_privacyRules
}

/// TL sum type `account.Authorizations`.
abstract class account_Authorizations
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_authorizations
}

/// TL sum type `account.Password`.
abstract class account_Password
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_password
}

/// TL sum type `account.PasswordSettings`.
abstract class account_PasswordSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_passwordSettings
}

/// TL sum type `account.PasswordInputSettings`.
abstract class account_PasswordInputSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_passwordInputSettings
}

/// TL sum type `account.TmpPassword`.
abstract class account_TmpPassword
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_tmpPassword
}

/// TL sum type `account.WebAuthorizations`.
abstract class account_WebAuthorizations
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_webAuthorizations
}

/// TL sum type `account.AuthorizationForm`.
abstract class account_AuthorizationForm
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_authorizationForm
}

/// TL sum type `account.SentEmailCode`.
abstract class account_SentEmailCode
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_sentEmailCode
}

/// TL sum type `account.Takeout`.
abstract class account_Takeout
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_takeout
}

/// TL sum type `account.WallPapers`.
abstract class account_WallPapers
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_wallPapers
    // constructor: account_wallPapersNotModified
}

/// TL sum type `account.AutoDownloadSettings`.
abstract class account_AutoDownloadSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_autoDownloadSettings
}

/// TL sum type `account.Themes`.
abstract class account_Themes
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_themes
    // constructor: account_themesNotModified
}

/// TL sum type `account.ContentSettings`.
abstract class account_ContentSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_contentSettings
}

/// TL sum type `account.ResetPasswordResult`.
abstract class account_ResetPasswordResult
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_resetPasswordFailedWait
    // constructor: account_resetPasswordOk
    // constructor: account_resetPasswordRequestedWait
}

/// TL sum type `account.ChatThemes`.
abstract class account_ChatThemes
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_chatThemes
    // constructor: account_chatThemesNotModified
}

/// TL sum type `account.SavedRingtones`.
abstract class account_SavedRingtones
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_savedRingtones
    // constructor: account_savedRingtonesNotModified
}

/// TL sum type `account.SavedRingtone`.
abstract class account_SavedRingtone
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_savedRingtone
    // constructor: account_savedRingtoneConverted
}

/// TL sum type `account.EmojiStatuses`.
abstract class account_EmojiStatuses
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_emojiStatuses
    // constructor: account_emojiStatusesNotModified
}

/// TL sum type `account.EmailVerified`.
abstract class account_EmailVerified
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_emailVerified
    // constructor: account_emailVerifiedLogin
}

/// TL sum type `account.AutoSaveSettings`.
abstract class account_AutoSaveSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_autoSaveSettings
}

/// TL sum type `account.ConnectedBots`.
abstract class account_ConnectedBots
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_connectedBots
}

/// TL sum type `account.BusinessChatLinks`.
abstract class account_BusinessChatLinks
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_businessChatLinks
}

/// TL sum type `account.ResolvedBusinessChatLinks`.
abstract class account_ResolvedBusinessChatLinks
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_resolvedBusinessChatLinks
}

/// TL sum type `account.PaidMessagesRevenue`.
abstract class account_PaidMessagesRevenue
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_paidMessagesRevenue
}

/// TL sum type `account.SavedMusicIds`.
abstract class account_SavedMusicIds
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_savedMusicIds
    // constructor: account_savedMusicIdsNotModified
}

/// TL sum type `account.Passkeys`.
abstract class account_Passkeys
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_passkeys
}

/// TL sum type `account.PasskeyRegistrationOptions`.
abstract class account_PasskeyRegistrationOptions
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_passkeyRegistrationOptions
}

/// TL sum type `account.WebBrowserSettings`.
abstract class account_WebBrowserSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: account_webBrowserSettings
    // constructor: account_webBrowserSettingsNotModified
}

/// TL constructor `account.privacyRules`, id 0x50A04E45.
final class account_privacyRules : account_PrivacyRules
{
    enum uint tlId = 0x50A04E45;

    Vector!(PrivacyRule) rules;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.authorizations`, id 0x4BFF8EA0.
final class account_authorizations : account_Authorizations
{
    enum uint tlId = 0x4BFF8EA0;

    int authorization_ttl_days;
    Vector!(Authorization) authorizations;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.password`, id 0x957B50FB.
final class account_password : account_Password
{
    enum uint tlId = 0x957B50FB;

    uint flags;
    bool has_recovery;
    bool has_secure_values;
    bool has_password;
    PasswordKdfAlgo current_algo;
    ubyte[] srp_B;
    long srp_id;
    string hint;
    string email_unconfirmed_pattern;
    PasswordKdfAlgo new_algo;
    SecurePasswordKdfAlgo new_secure_algo;
    ubyte[] secure_random;
    int pending_reset_date;
    string login_email_pattern;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.passwordSettings`, id 0x9A5C33E5.
final class account_passwordSettings : account_PasswordSettings
{
    enum uint tlId = 0x9A5C33E5;

    uint flags;
    string email;
    SecureSecretSettings secure_settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.passwordInputSettings`, id 0xC23727C9.
final class account_passwordInputSettings : account_PasswordInputSettings
{
    enum uint tlId = 0xC23727C9;

    uint flags;
    PasswordKdfAlgo new_algo;
    ubyte[] new_password_hash;
    string hint;
    string email;
    SecureSecretSettings new_secure_settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.tmpPassword`, id 0xDB64FD34.
final class account_tmpPassword : account_TmpPassword
{
    enum uint tlId = 0xDB64FD34;

    ubyte[] tmp_password;
    int valid_until;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.webAuthorizations`, id 0xED56C9FC.
final class account_webAuthorizations : account_WebAuthorizations
{
    enum uint tlId = 0xED56C9FC;

    Vector!(WebAuthorization) authorizations;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.authorizationForm`, id 0xAD2E1CD8.
final class account_authorizationForm : account_AuthorizationForm
{
    enum uint tlId = 0xAD2E1CD8;

    uint flags;
    Vector!(SecureRequiredType) required_types;
    Vector!(SecureValue) values;
    Vector!(SecureValueError) errors;
    Vector!(User) users;
    string privacy_policy_url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.sentEmailCode`, id 0x811F854F.
final class account_sentEmailCode : account_SentEmailCode
{
    enum uint tlId = 0x811F854F;

    string email_pattern;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.takeout`, id 0x4DBA4501.
final class account_takeout : account_Takeout
{
    enum uint tlId = 0x4DBA4501;

    long id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.wallPapersNotModified`, id 0x1C199183.
final class account_wallPapersNotModified : account_WallPapers
{
    enum uint tlId = 0x1C199183;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.wallPapers`, id 0xCDC3858C.
final class account_wallPapers : account_WallPapers
{
    enum uint tlId = 0xCDC3858C;

    long hash;
    Vector!(WallPaper) wallpapers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.autoDownloadSettings`, id 0x63CACF26.
final class account_autoDownloadSettings : account_AutoDownloadSettings
{
    enum uint tlId = 0x63CACF26;

    AutoDownloadSettings low;
    AutoDownloadSettings medium;
    AutoDownloadSettings high;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.themesNotModified`, id 0xF41EB622.
final class account_themesNotModified : account_Themes
{
    enum uint tlId = 0xF41EB622;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.themes`, id 0x9A3D8C6D.
final class account_themes : account_Themes
{
    enum uint tlId = 0x9A3D8C6D;

    long hash;
    Vector!(Theme) themes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.contentSettings`, id 0x57E28221.
final class account_contentSettings : account_ContentSettings
{
    enum uint tlId = 0x57E28221;

    uint flags;
    bool sensitive_enabled;
    bool sensitive_can_change;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.resetPasswordFailedWait`, id 0xE3779861.
final class account_resetPasswordFailedWait : account_ResetPasswordResult
{
    enum uint tlId = 0xE3779861;

    int retry_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.resetPasswordRequestedWait`, id 0xE9EFFC7D.
final class account_resetPasswordRequestedWait : account_ResetPasswordResult
{
    enum uint tlId = 0xE9EFFC7D;

    int until_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.resetPasswordOk`, id 0xE926D63E.
final class account_resetPasswordOk : account_ResetPasswordResult
{
    enum uint tlId = 0xE926D63E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.chatThemesNotModified`, id 0xE011E1C4.
final class account_chatThemesNotModified : account_ChatThemes
{
    enum uint tlId = 0xE011E1C4;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.chatThemes`, id 0xBE098173.
final class account_chatThemes : account_ChatThemes
{
    enum uint tlId = 0xBE098173;

    uint flags;
    long hash;
    Vector!(ChatTheme) themes;
    Vector!(Chat) chats;
    Vector!(User) users;
    string next_offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.savedRingtonesNotModified`, id 0xFBF6E8B1.
final class account_savedRingtonesNotModified : account_SavedRingtones
{
    enum uint tlId = 0xFBF6E8B1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.savedRingtones`, id 0xC1E92CC5.
final class account_savedRingtones : account_SavedRingtones
{
    enum uint tlId = 0xC1E92CC5;

    long hash;
    Vector!(Document) ringtones;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.savedRingtone`, id 0xB7263F6D.
final class account_savedRingtone : account_SavedRingtone
{
    enum uint tlId = 0xB7263F6D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.savedRingtoneConverted`, id 0x1F307EB7.
final class account_savedRingtoneConverted : account_SavedRingtone
{
    enum uint tlId = 0x1F307EB7;

    Document document;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.emojiStatusesNotModified`, id 0xD08CE645.
final class account_emojiStatusesNotModified : account_EmojiStatuses
{
    enum uint tlId = 0xD08CE645;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.emojiStatuses`, id 0x90C467D1.
final class account_emojiStatuses : account_EmojiStatuses
{
    enum uint tlId = 0x90C467D1;

    long hash;
    Vector!(EmojiStatus) statuses;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.emailVerified`, id 0x2B96CD1B.
final class account_emailVerified : account_EmailVerified
{
    enum uint tlId = 0x2B96CD1B;

    string email;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.emailVerifiedLogin`, id 0xE1BB0D61.
final class account_emailVerifiedLogin : account_EmailVerified
{
    enum uint tlId = 0xE1BB0D61;

    string email;
    auth_SentCode sent_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.autoSaveSettings`, id 0x4C3E069D.
final class account_autoSaveSettings : account_AutoSaveSettings
{
    enum uint tlId = 0x4C3E069D;

    AutoSaveSettings users_settings;
    AutoSaveSettings chats_settings;
    AutoSaveSettings broadcasts_settings;
    Vector!(AutoSaveException) exceptions;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.connectedBots`, id 0x17D7F87B.
final class account_connectedBots : account_ConnectedBots
{
    enum uint tlId = 0x17D7F87B;

    Vector!(ConnectedBot) connected_bots;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.businessChatLinks`, id 0xEC43A2D1.
final class account_businessChatLinks : account_BusinessChatLinks
{
    enum uint tlId = 0xEC43A2D1;

    Vector!(BusinessChatLink) links;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.resolvedBusinessChatLinks`, id 0x9A23AF21.
final class account_resolvedBusinessChatLinks : account_ResolvedBusinessChatLinks
{
    enum uint tlId = 0x9A23AF21;

    uint flags;
    Peer peer;
    string message;
    Vector!(MessageEntity) entities;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.paidMessagesRevenue`, id 0x1E109708.
final class account_paidMessagesRevenue : account_PaidMessagesRevenue
{
    enum uint tlId = 0x1E109708;

    long stars_amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.savedMusicIdsNotModified`, id 0x4FC81D6E.
final class account_savedMusicIdsNotModified : account_SavedMusicIds
{
    enum uint tlId = 0x4FC81D6E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.savedMusicIds`, id 0x998D6636.
final class account_savedMusicIds : account_SavedMusicIds
{
    enum uint tlId = 0x998D6636;

    Vector!(long) ids;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.passkeys`, id 0xF8E0AA1C.
final class account_passkeys : account_Passkeys
{
    enum uint tlId = 0xF8E0AA1C;

    Vector!(Passkey) passkeys;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.passkeyRegistrationOptions`, id 0xE16B5CE1.
final class account_passkeyRegistrationOptions : account_PasskeyRegistrationOptions
{
    enum uint tlId = 0xE16B5CE1;

    DataJSON options;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.webBrowserSettingsNotModified`, id 0xC31C8F4E.
final class account_webBrowserSettingsNotModified : account_WebBrowserSettings
{
    enum uint tlId = 0xC31C8F4E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `account.webBrowserSettings`, id 0x79EB8CB3.
final class account_webBrowserSettings : account_WebBrowserSettings
{
    enum uint tlId = 0x79EB8CB3;

    uint flags;
    bool open_external_browser;
    bool display_close_button;
    Vector!(WebDomainException) external_exceptions;
    Vector!(WebDomainException) inapp_exceptions;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

