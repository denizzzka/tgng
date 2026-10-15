/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.auth_functions;

/// TL function `auth.sendCode`, id 0xA677244F.
final class auth_sendCode
{
    enum uint tlId = 0xA677244F;

    string phone_number;
    int api_id;
    string api_hash;
    CodeSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.signUp`, id 0xAAC7B717.
final class auth_signUp
{
    enum uint tlId = 0xAAC7B717;

    uint flags;
    bool no_joined_notifications;
    string phone_number;
    string phone_code_hash;
    string first_name;
    string last_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.signIn`, id 0x8D52A951.
final class auth_signIn
{
    enum uint tlId = 0x8D52A951;

    uint flags;
    string phone_number;
    string phone_code_hash;
    string phone_code;
    EmailVerification email_verification;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.logOut`, id 0x3E72BA19.
final class auth_logOut
{
    enum uint tlId = 0x3E72BA19;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.resetAuthorizations`, id 0x9FAB0D1A.
final class auth_resetAuthorizations
{
    enum uint tlId = 0x9FAB0D1A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.exportAuthorization`, id 0xE5BFFFCD.
final class auth_exportAuthorization
{
    enum uint tlId = 0xE5BFFFCD;

    int dc_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.importAuthorization`, id 0xA57A7DAD.
final class auth_importAuthorization
{
    enum uint tlId = 0xA57A7DAD;

    long id;
    ubyte[] bytes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.bindTempAuthKey`, id 0xCDD42A05.
final class auth_bindTempAuthKey
{
    enum uint tlId = 0xCDD42A05;

    long perm_auth_key_id;
    long nonce;
    int expires_at;
    ubyte[] encrypted_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.importBotAuthorization`, id 0x67A3FF2C.
final class auth_importBotAuthorization
{
    enum uint tlId = 0x67A3FF2C;

    int flags;
    int api_id;
    string api_hash;
    string bot_auth_token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.checkPassword`, id 0xD18B4D16.
final class auth_checkPassword
{
    enum uint tlId = 0xD18B4D16;

    InputCheckPasswordSRP password;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.requestPasswordRecovery`, id 0xD897BC66.
final class auth_requestPasswordRecovery
{
    enum uint tlId = 0xD897BC66;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.recoverPassword`, id 0x37096C70.
final class auth_recoverPassword
{
    enum uint tlId = 0x37096C70;

    uint flags;
    string code;
    account_PasswordInputSettings new_settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.resendCode`, id 0xCAE47523.
final class auth_resendCode
{
    enum uint tlId = 0xCAE47523;

    uint flags;
    string phone_number;
    string phone_code_hash;
    string reason;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.cancelCode`, id 0x1F040578.
final class auth_cancelCode
{
    enum uint tlId = 0x1F040578;

    string phone_number;
    string phone_code_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.dropTempAuthKeys`, id 0x8E48A188.
final class auth_dropTempAuthKeys
{
    enum uint tlId = 0x8E48A188;

    Vector!(long) except_auth_keys;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.exportLoginToken`, id 0xB7E085FE.
final class auth_exportLoginToken
{
    enum uint tlId = 0xB7E085FE;

    int api_id;
    string api_hash;
    Vector!(long) except_ids;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.importLoginToken`, id 0x95AC5CE4.
final class auth_importLoginToken
{
    enum uint tlId = 0x95AC5CE4;

    ubyte[] token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.acceptLoginToken`, id 0xE894AD4D.
final class auth_acceptLoginToken
{
    enum uint tlId = 0xE894AD4D;

    ubyte[] token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.checkRecoveryPassword`, id 0x0D36BF79.
final class auth_checkRecoveryPassword
{
    enum uint tlId = 0x0D36BF79;

    string code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.importWebTokenAuthorization`, id 0x2DB873A9.
final class auth_importWebTokenAuthorization
{
    enum uint tlId = 0x2DB873A9;

    int api_id;
    string api_hash;
    string web_auth_token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.requestFirebaseSms`, id 0x8E39261E.
final class auth_requestFirebaseSms
{
    enum uint tlId = 0x8E39261E;

    uint flags;
    string phone_number;
    string phone_code_hash;
    string safety_net_token;
    string play_integrity_token;
    string ios_push_secret;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.resetLoginEmail`, id 0x7E960193.
final class auth_resetLoginEmail
{
    enum uint tlId = 0x7E960193;

    string phone_number;
    string phone_code_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.reportMissingCode`, id 0xCB9DEFF6.
final class auth_reportMissingCode
{
    enum uint tlId = 0xCB9DEFF6;

    string phone_number;
    string phone_code_hash;
    string mnc;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.checkPaidAuth`, id 0x56E59F9C.
final class auth_checkPaidAuth
{
    enum uint tlId = 0x56E59F9C;

    string phone_number;
    string phone_code_hash;
    long form_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.initPasskeyLogin`, id 0x518AD0B7.
final class auth_initPasskeyLogin
{
    enum uint tlId = 0x518AD0B7;

    int api_id;
    string api_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.finishPasskeyLogin`, id 0x9857AD07.
final class auth_finishPasskeyLogin
{
    enum uint tlId = 0x9857AD07;

    uint flags;
    InputPasskeyCredential credential;
    int from_dc_id;
    long from_auth_key_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.cancelWebTokenAuthorization`, id 0x490DADA1.
final class auth_cancelWebTokenAuthorization
{
    enum uint tlId = 0x490DADA1;

    string web_auth_token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.initFirebasePnvLogin`, id 0x644F15C0.
final class auth_initFirebasePnvLogin
{
    enum uint tlId = 0x644F15C0;

    uint flags;
    Vector!(long) except_ids;
    int api_id;
    string api_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.finishFirebasePnvLogin`, id 0x2C85094C.
final class auth_finishFirebasePnvLogin
{
    enum uint tlId = 0x2C85094C;

    string google_token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `auth.firebasePnvSignUp`, id 0x783F6B56.
final class auth_firebasePnvSignUp
{
    enum uint tlId = 0x783F6B56;

    uint flags;
    bool no_joined_notifications;
    string first_name;
    string last_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

