/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.functions.account_functions;

/// TL function `account.registerDevice`, id 0xEC86017A.
final class account_registerDevice
{
    enum uint tlId = 0xEC86017A;

    uint flags;
    bool no_muted;
    int token_type;
    string token;
    bool app_sandbox;
    ubyte[] secret;
    Vector!(long) other_uids;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.unregisterDevice`, id 0x6A0D3206.
final class account_unregisterDevice
{
    enum uint tlId = 0x6A0D3206;

    int token_type;
    string token;
    Vector!(long) other_uids;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateNotifySettings`, id 0x84BE5B93.
final class account_updateNotifySettings
{
    enum uint tlId = 0x84BE5B93;

    InputNotifyPeer peer;
    InputPeerNotifySettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getNotifySettings`, id 0x12B3AD31.
final class account_getNotifySettings
{
    enum uint tlId = 0x12B3AD31;

    InputNotifyPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.resetNotifySettings`, id 0xDB7E1747.
final class account_resetNotifySettings
{
    enum uint tlId = 0xDB7E1747;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateProfile`, id 0x78515775.
final class account_updateProfile
{
    enum uint tlId = 0x78515775;

    uint flags;
    string first_name;
    string last_name;
    string about;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateStatus`, id 0x6628562C.
final class account_updateStatus
{
    enum uint tlId = 0x6628562C;

    bool offline;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getWallPapers`, id 0x07967D36.
final class account_getWallPapers
{
    enum uint tlId = 0x07967D36;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.reportPeer`, id 0xC5BA3D86.
final class account_reportPeer
{
    enum uint tlId = 0xC5BA3D86;

    InputPeer peer;
    ReportReason reason;
    string message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.checkUsername`, id 0x2714D86C.
final class account_checkUsername
{
    enum uint tlId = 0x2714D86C;

    string username;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateUsername`, id 0x3E0BDD7C.
final class account_updateUsername
{
    enum uint tlId = 0x3E0BDD7C;

    string username;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getPrivacy`, id 0xDADBC950.
final class account_getPrivacy
{
    enum uint tlId = 0xDADBC950;

    InputPrivacyKey key;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.setPrivacy`, id 0xC9F81CE8.
final class account_setPrivacy
{
    enum uint tlId = 0xC9F81CE8;

    InputPrivacyKey key;
    Vector!(InputPrivacyRule) rules;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.deleteAccount`, id 0xA2C0CF74.
final class account_deleteAccount
{
    enum uint tlId = 0xA2C0CF74;

    uint flags;
    string reason;
    InputCheckPasswordSRP password;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getAccountTTL`, id 0x08FC711D.
final class account_getAccountTTL
{
    enum uint tlId = 0x08FC711D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.setAccountTTL`, id 0x2442485E.
final class account_setAccountTTL
{
    enum uint tlId = 0x2442485E;

    AccountDaysTTL ttl;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.sendChangePhoneCode`, id 0x82574AE5.
final class account_sendChangePhoneCode
{
    enum uint tlId = 0x82574AE5;

    string phone_number;
    CodeSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.changePhone`, id 0x70C32EDB.
final class account_changePhone
{
    enum uint tlId = 0x70C32EDB;

    string phone_number;
    string phone_code_hash;
    string phone_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateDeviceLocked`, id 0x38DF3532.
final class account_updateDeviceLocked
{
    enum uint tlId = 0x38DF3532;

    int period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getAuthorizations`, id 0xE320C158.
final class account_getAuthorizations
{
    enum uint tlId = 0xE320C158;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.resetAuthorization`, id 0xDF77F3BC.
final class account_resetAuthorization
{
    enum uint tlId = 0xDF77F3BC;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getPassword`, id 0x548A30F5.
final class account_getPassword
{
    enum uint tlId = 0x548A30F5;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getPasswordSettings`, id 0x9CD4EAF9.
final class account_getPasswordSettings
{
    enum uint tlId = 0x9CD4EAF9;

    InputCheckPasswordSRP password;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updatePasswordSettings`, id 0xA59B102F.
final class account_updatePasswordSettings
{
    enum uint tlId = 0xA59B102F;

    InputCheckPasswordSRP password;
    account_PasswordInputSettings new_settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.sendConfirmPhoneCode`, id 0x1B3FAA88.
final class account_sendConfirmPhoneCode
{
    enum uint tlId = 0x1B3FAA88;

    string hash;
    CodeSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.confirmPhone`, id 0x5F2178C3.
final class account_confirmPhone
{
    enum uint tlId = 0x5F2178C3;

    string phone_code_hash;
    string phone_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getTmpPassword`, id 0x449E0B51.
final class account_getTmpPassword
{
    enum uint tlId = 0x449E0B51;

    InputCheckPasswordSRP password;
    int period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getWebAuthorizations`, id 0x182E6D6F.
final class account_getWebAuthorizations
{
    enum uint tlId = 0x182E6D6F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.resetWebAuthorization`, id 0x2D01B9EF.
final class account_resetWebAuthorization
{
    enum uint tlId = 0x2D01B9EF;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.resetWebAuthorizations`, id 0x682D2594.
final class account_resetWebAuthorizations
{
    enum uint tlId = 0x682D2594;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getAllSecureValues`, id 0xB288BC7D.
final class account_getAllSecureValues
{
    enum uint tlId = 0xB288BC7D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getSecureValue`, id 0x73665BC2.
final class account_getSecureValue
{
    enum uint tlId = 0x73665BC2;

    Vector!(SecureValueType) types;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.saveSecureValue`, id 0x899FE31D.
final class account_saveSecureValue
{
    enum uint tlId = 0x899FE31D;

    InputSecureValue value;
    long secure_secret_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.deleteSecureValue`, id 0xB880BC4B.
final class account_deleteSecureValue
{
    enum uint tlId = 0xB880BC4B;

    Vector!(SecureValueType) types;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getAuthorizationForm`, id 0xA929597A.
final class account_getAuthorizationForm
{
    enum uint tlId = 0xA929597A;

    long bot_id;
    string scope_;
    string public_key;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.acceptAuthorization`, id 0xF3ED4C73.
final class account_acceptAuthorization
{
    enum uint tlId = 0xF3ED4C73;

    long bot_id;
    string scope_;
    string public_key;
    Vector!(SecureValueHash) value_hashes;
    SecureCredentialsEncrypted credentials;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.sendVerifyPhoneCode`, id 0xA5A356F9.
final class account_sendVerifyPhoneCode
{
    enum uint tlId = 0xA5A356F9;

    string phone_number;
    CodeSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.verifyPhone`, id 0x4DD3A7F6.
final class account_verifyPhone
{
    enum uint tlId = 0x4DD3A7F6;

    string phone_number;
    string phone_code_hash;
    string phone_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.sendVerifyEmailCode`, id 0x98E037BB.
final class account_sendVerifyEmailCode
{
    enum uint tlId = 0x98E037BB;

    EmailVerifyPurpose purpose;
    string email;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.verifyEmail`, id 0x032DA4CF.
final class account_verifyEmail
{
    enum uint tlId = 0x032DA4CF;

    EmailVerifyPurpose purpose;
    EmailVerification verification;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.initTakeoutSession`, id 0x8EF3EAB0.
final class account_initTakeoutSession
{
    enum uint tlId = 0x8EF3EAB0;

    uint flags;
    bool contacts;
    bool message_users;
    bool message_chats;
    bool message_megagroups;
    bool message_channels;
    bool files;
    long file_max_size;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.finishTakeoutSession`, id 0x1D2652EE.
final class account_finishTakeoutSession
{
    enum uint tlId = 0x1D2652EE;

    uint flags;
    bool success;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.confirmPasswordEmail`, id 0x8FDF1920.
final class account_confirmPasswordEmail
{
    enum uint tlId = 0x8FDF1920;

    string code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.resendPasswordEmail`, id 0x7A7F2A15.
final class account_resendPasswordEmail
{
    enum uint tlId = 0x7A7F2A15;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.cancelPasswordEmail`, id 0xC1CBD5B6.
final class account_cancelPasswordEmail
{
    enum uint tlId = 0xC1CBD5B6;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getContactSignUpNotification`, id 0x9F07C728.
final class account_getContactSignUpNotification
{
    enum uint tlId = 0x9F07C728;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.setContactSignUpNotification`, id 0xCFF43F61.
final class account_setContactSignUpNotification
{
    enum uint tlId = 0xCFF43F61;

    bool silent;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getNotifyExceptions`, id 0x53577479.
final class account_getNotifyExceptions
{
    enum uint tlId = 0x53577479;

    uint flags;
    bool compare_sound;
    bool compare_stories;
    InputNotifyPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getWallPaper`, id 0xFC8DDBEA.
final class account_getWallPaper
{
    enum uint tlId = 0xFC8DDBEA;

    InputWallPaper wallpaper;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.uploadWallPaper`, id 0xE39A8F03.
final class account_uploadWallPaper
{
    enum uint tlId = 0xE39A8F03;

    uint flags;
    bool for_chat;
    InputFile file;
    string mime_type;
    WallPaperSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.saveWallPaper`, id 0x6C5A5B37.
final class account_saveWallPaper
{
    enum uint tlId = 0x6C5A5B37;

    InputWallPaper wallpaper;
    bool unsave;
    WallPaperSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.installWallPaper`, id 0xFEED5769.
final class account_installWallPaper
{
    enum uint tlId = 0xFEED5769;

    InputWallPaper wallpaper;
    WallPaperSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.resetWallPapers`, id 0xBB3B9804.
final class account_resetWallPapers
{
    enum uint tlId = 0xBB3B9804;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getAutoDownloadSettings`, id 0x56DA0B3F.
final class account_getAutoDownloadSettings
{
    enum uint tlId = 0x56DA0B3F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.saveAutoDownloadSettings`, id 0x76F36233.
final class account_saveAutoDownloadSettings
{
    enum uint tlId = 0x76F36233;

    uint flags;
    bool low;
    bool high;
    AutoDownloadSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.uploadTheme`, id 0x1C3DB333.
final class account_uploadTheme
{
    enum uint tlId = 0x1C3DB333;

    uint flags;
    InputFile file;
    InputFile thumb;
    string file_name;
    string mime_type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.createTheme`, id 0x652E4400.
final class account_createTheme
{
    enum uint tlId = 0x652E4400;

    uint flags;
    string slug;
    string title;
    InputDocument document;
    Vector!(InputThemeSettings) settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateTheme`, id 0x2BF40CCC.
final class account_updateTheme
{
    enum uint tlId = 0x2BF40CCC;

    uint flags;
    string format;
    InputTheme theme;
    string slug;
    string title;
    InputDocument document;
    Vector!(InputThemeSettings) settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.saveTheme`, id 0xF257106C.
final class account_saveTheme
{
    enum uint tlId = 0xF257106C;

    InputTheme theme;
    bool unsave;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.installTheme`, id 0xC727BB3B.
final class account_installTheme
{
    enum uint tlId = 0xC727BB3B;

    uint flags;
    bool dark;
    InputTheme theme;
    string format;
    BaseTheme base_theme;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getTheme`, id 0x3A5869EC.
final class account_getTheme
{
    enum uint tlId = 0x3A5869EC;

    string format;
    InputTheme theme;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getThemes`, id 0x7206E458.
final class account_getThemes
{
    enum uint tlId = 0x7206E458;

    string format;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.setContentSettings`, id 0xB574B16B.
final class account_setContentSettings
{
    enum uint tlId = 0xB574B16B;

    uint flags;
    bool sensitive_enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getContentSettings`, id 0x8B9B4DAE.
final class account_getContentSettings
{
    enum uint tlId = 0x8B9B4DAE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getMultiWallPapers`, id 0x65AD71DC.
final class account_getMultiWallPapers
{
    enum uint tlId = 0x65AD71DC;

    Vector!(InputWallPaper) wallpapers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getGlobalPrivacySettings`, id 0xEB2B4CF6.
final class account_getGlobalPrivacySettings
{
    enum uint tlId = 0xEB2B4CF6;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.setGlobalPrivacySettings`, id 0x1EDAAAC2.
final class account_setGlobalPrivacySettings
{
    enum uint tlId = 0x1EDAAAC2;

    GlobalPrivacySettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.reportProfilePhoto`, id 0xFA8CC6F5.
final class account_reportProfilePhoto
{
    enum uint tlId = 0xFA8CC6F5;

    InputPeer peer;
    InputPhoto photo_id;
    ReportReason reason;
    string message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.resetPassword`, id 0x9308CE1B.
final class account_resetPassword
{
    enum uint tlId = 0x9308CE1B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.declinePasswordReset`, id 0x4C9409F6.
final class account_declinePasswordReset
{
    enum uint tlId = 0x4C9409F6;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getChatThemes`, id 0xD638DE89.
final class account_getChatThemes
{
    enum uint tlId = 0xD638DE89;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.setAuthorizationTTL`, id 0xBF899AA0.
final class account_setAuthorizationTTL
{
    enum uint tlId = 0xBF899AA0;

    int authorization_ttl_days;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.changeAuthorizationSettings`, id 0x40F48462.
final class account_changeAuthorizationSettings
{
    enum uint tlId = 0x40F48462;

    uint flags;
    bool confirmed;
    long hash;
    bool encrypted_requests_disabled;
    bool call_requests_disabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getSavedRingtones`, id 0xE1902288.
final class account_getSavedRingtones
{
    enum uint tlId = 0xE1902288;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.saveRingtone`, id 0x3DEA5B03.
final class account_saveRingtone
{
    enum uint tlId = 0x3DEA5B03;

    InputDocument id;
    bool unsave;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.uploadRingtone`, id 0x831A83A2.
final class account_uploadRingtone
{
    enum uint tlId = 0x831A83A2;

    InputFile file;
    string file_name;
    string mime_type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateEmojiStatus`, id 0xFBD3DE6B.
final class account_updateEmojiStatus
{
    enum uint tlId = 0xFBD3DE6B;

    EmojiStatus emoji_status;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getDefaultEmojiStatuses`, id 0xD6753386.
final class account_getDefaultEmojiStatuses
{
    enum uint tlId = 0xD6753386;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getRecentEmojiStatuses`, id 0x0F578105.
final class account_getRecentEmojiStatuses
{
    enum uint tlId = 0x0F578105;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.clearRecentEmojiStatuses`, id 0x18201AAE.
final class account_clearRecentEmojiStatuses
{
    enum uint tlId = 0x18201AAE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.reorderUsernames`, id 0xEF500EAB.
final class account_reorderUsernames
{
    enum uint tlId = 0xEF500EAB;

    Vector!(string) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.toggleUsername`, id 0x58D6B376.
final class account_toggleUsername
{
    enum uint tlId = 0x58D6B376;

    string username;
    bool active;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getDefaultProfilePhotoEmojis`, id 0xE2750328.
final class account_getDefaultProfilePhotoEmojis
{
    enum uint tlId = 0xE2750328;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getDefaultGroupPhotoEmojis`, id 0x915860AE.
final class account_getDefaultGroupPhotoEmojis
{
    enum uint tlId = 0x915860AE;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getAutoSaveSettings`, id 0xADCBBCDA.
final class account_getAutoSaveSettings
{
    enum uint tlId = 0xADCBBCDA;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.saveAutoSaveSettings`, id 0xD69B8361.
final class account_saveAutoSaveSettings
{
    enum uint tlId = 0xD69B8361;

    uint flags;
    bool users;
    bool chats;
    bool broadcasts;
    InputPeer peer;
    AutoSaveSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.deleteAutoSaveExceptions`, id 0x53BC0020.
final class account_deleteAutoSaveExceptions
{
    enum uint tlId = 0x53BC0020;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.invalidateSignInCodes`, id 0xCA8AE8BA.
final class account_invalidateSignInCodes
{
    enum uint tlId = 0xCA8AE8BA;

    Vector!(string) codes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateColor`, id 0x684D214E.
final class account_updateColor
{
    enum uint tlId = 0x684D214E;

    uint flags;
    bool for_profile;
    PeerColor color;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getDefaultBackgroundEmojis`, id 0xA60AB9CE.
final class account_getDefaultBackgroundEmojis
{
    enum uint tlId = 0xA60AB9CE;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getChannelDefaultEmojiStatuses`, id 0x7727A7D5.
final class account_getChannelDefaultEmojiStatuses
{
    enum uint tlId = 0x7727A7D5;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getChannelRestrictedStatusEmojis`, id 0x35A9E0D5.
final class account_getChannelRestrictedStatusEmojis
{
    enum uint tlId = 0x35A9E0D5;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateBusinessWorkHours`, id 0x4B00E066.
final class account_updateBusinessWorkHours
{
    enum uint tlId = 0x4B00E066;

    uint flags;
    BusinessWorkHours business_work_hours;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateBusinessLocation`, id 0x9E6B131A.
final class account_updateBusinessLocation
{
    enum uint tlId = 0x9E6B131A;

    uint flags;
    InputGeoPoint geo_point;
    string address;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateBusinessGreetingMessage`, id 0x66CDAFC4.
final class account_updateBusinessGreetingMessage
{
    enum uint tlId = 0x66CDAFC4;

    uint flags;
    InputBusinessGreetingMessage message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateBusinessAwayMessage`, id 0xA26A7FA5.
final class account_updateBusinessAwayMessage
{
    enum uint tlId = 0xA26A7FA5;

    uint flags;
    InputBusinessAwayMessage message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateConnectedBot`, id 0x66A08C7E.
final class account_updateConnectedBot
{
    enum uint tlId = 0x66A08C7E;

    uint flags;
    bool deleted;
    BusinessBotRights rights;
    InputUser bot;
    InputBusinessBotRecipients recipients;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getConnectedBots`, id 0x4EA4C80F.
final class account_getConnectedBots
{
    enum uint tlId = 0x4EA4C80F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getBotBusinessConnection`, id 0x76A86270.
final class account_getBotBusinessConnection
{
    enum uint tlId = 0x76A86270;

    string connection_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateBusinessIntro`, id 0xA614D034.
final class account_updateBusinessIntro
{
    enum uint tlId = 0xA614D034;

    uint flags;
    InputBusinessIntro intro;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.toggleConnectedBotPaused`, id 0x646E1097.
final class account_toggleConnectedBotPaused
{
    enum uint tlId = 0x646E1097;

    InputPeer peer;
    bool paused;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.disablePeerConnectedBot`, id 0x5E437ED9.
final class account_disablePeerConnectedBot
{
    enum uint tlId = 0x5E437ED9;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateBirthday`, id 0xCC6E0C11.
final class account_updateBirthday
{
    enum uint tlId = 0xCC6E0C11;

    uint flags;
    Birthday birthday;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.createBusinessChatLink`, id 0x8851E68E.
final class account_createBusinessChatLink
{
    enum uint tlId = 0x8851E68E;

    InputBusinessChatLink link;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.editBusinessChatLink`, id 0x8C3410AF.
final class account_editBusinessChatLink
{
    enum uint tlId = 0x8C3410AF;

    string slug;
    InputBusinessChatLink link;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.deleteBusinessChatLink`, id 0x60073674.
final class account_deleteBusinessChatLink
{
    enum uint tlId = 0x60073674;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getBusinessChatLinks`, id 0x6F70DDE1.
final class account_getBusinessChatLinks
{
    enum uint tlId = 0x6F70DDE1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.resolveBusinessChatLink`, id 0x5492E5EE.
final class account_resolveBusinessChatLink
{
    enum uint tlId = 0x5492E5EE;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updatePersonalChannel`, id 0xD94305E0.
final class account_updatePersonalChannel
{
    enum uint tlId = 0xD94305E0;

    InputChannel channel;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.toggleSponsoredMessages`, id 0xB9D9A38D.
final class account_toggleSponsoredMessages
{
    enum uint tlId = 0xB9D9A38D;

    bool enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getReactionsNotifySettings`, id 0x06DD654C.
final class account_getReactionsNotifySettings
{
    enum uint tlId = 0x06DD654C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.setReactionsNotifySettings`, id 0x316CE548.
final class account_setReactionsNotifySettings
{
    enum uint tlId = 0x316CE548;

    ReactionsNotifySettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getCollectibleEmojiStatuses`, id 0x2E7B4543.
final class account_getCollectibleEmojiStatuses
{
    enum uint tlId = 0x2E7B4543;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getPaidMessagesRevenue`, id 0x19BA4A67.
final class account_getPaidMessagesRevenue
{
    enum uint tlId = 0x19BA4A67;

    uint flags;
    InputPeer parent_peer;
    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.toggleNoPaidMessagesException`, id 0xFE2EDA76.
final class account_toggleNoPaidMessagesException
{
    enum uint tlId = 0xFE2EDA76;

    uint flags;
    bool refund_charged;
    bool require_payment;
    InputPeer parent_peer;
    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.setMainProfileTab`, id 0x5DEE78B0.
final class account_setMainProfileTab
{
    enum uint tlId = 0x5DEE78B0;

    ProfileTab tab;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.saveMusic`, id 0xB26732A9.
final class account_saveMusic
{
    enum uint tlId = 0xB26732A9;

    uint flags;
    bool unsave;
    InputDocument id;
    InputDocument after_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getSavedMusicIds`, id 0xE09D5FAF.
final class account_getSavedMusicIds
{
    enum uint tlId = 0xE09D5FAF;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getUniqueGiftChatThemes`, id 0xE42CE9C9.
final class account_getUniqueGiftChatThemes
{
    enum uint tlId = 0xE42CE9C9;

    string offset;
    int limit;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.initPasskeyRegistration`, id 0x429547E8.
final class account_initPasskeyRegistration
{
    enum uint tlId = 0x429547E8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.registerPasskey`, id 0x55B41FD6.
final class account_registerPasskey
{
    enum uint tlId = 0x55B41FD6;

    InputPasskeyCredential credential;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getPasskeys`, id 0xEA1F0C52.
final class account_getPasskeys
{
    enum uint tlId = 0xEA1F0C52;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.deletePasskey`, id 0xF5B5563F.
final class account_deletePasskey
{
    enum uint tlId = 0xF5B5563F;

    string id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.confirmBotConnection`, id 0x67ED1F68.
final class account_confirmBotConnection
{
    enum uint tlId = 0x67ED1F68;

    InputUser bot_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.getWebBrowserSettings`, id 0x56655768.
final class account_getWebBrowserSettings
{
    enum uint tlId = 0x56655768;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.updateWebBrowserSettings`, id 0x9ADF82FE.
final class account_updateWebBrowserSettings
{
    enum uint tlId = 0x9ADF82FE;

    uint flags;
    bool open_external_browser;
    bool display_close_button;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.toggleWebBrowserSettingsException`, id 0x60ED4229.
final class account_toggleWebBrowserSettingsException
{
    enum uint tlId = 0x60ED4229;

    uint flags;
    bool delete_;
    bool open_external_browser;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `account.deleteWebBrowserSettingsExceptions`, id 0x86A0765D.
final class account_deleteWebBrowserSettingsExceptions
{
    enum uint tlId = 0x86A0765D;

    override uint tlIdValue() const nothrow { return tlId; }
}

