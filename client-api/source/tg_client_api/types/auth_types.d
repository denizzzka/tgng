/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.types.auth_types;

/// TL sum type `auth.SentCode`.
abstract class auth_SentCode
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: auth_sentCode
    // constructor: auth_sentCodePaymentRequired
    // constructor: auth_sentCodeSuccess
}

/// TL sum type `auth.Authorization`.
abstract class auth_Authorization
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: auth_authorization
    // constructor: auth_authorizationSignUpRequired
}

/// TL sum type `auth.ExportedAuthorization`.
abstract class auth_ExportedAuthorization
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: auth_exportedAuthorization
}

/// TL sum type `auth.PasswordRecovery`.
abstract class auth_PasswordRecovery
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: auth_passwordRecovery
}

/// TL sum type `auth.CodeType`.
abstract class auth_CodeType
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: auth_codeTypeCall
    // constructor: auth_codeTypeFlashCall
    // constructor: auth_codeTypeFragmentSms
    // constructor: auth_codeTypeMissedCall
    // constructor: auth_codeTypeSms
}

/// TL sum type `auth.SentCodeType`.
abstract class auth_SentCodeType
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: auth_sentCodeTypeApp
    // constructor: auth_sentCodeTypeCall
    // constructor: auth_sentCodeTypeEmailCode
    // constructor: auth_sentCodeTypeFirebaseSms
    // constructor: auth_sentCodeTypeFlashCall
    // constructor: auth_sentCodeTypeFragmentSms
    // constructor: auth_sentCodeTypeMissedCall
    // constructor: auth_sentCodeTypeSetUpEmailRequired
    // constructor: auth_sentCodeTypeSms
    // constructor: auth_sentCodeTypeSmsPhrase
    // constructor: auth_sentCodeTypeSmsWord
}

/// TL sum type `auth.LoginToken`.
abstract class auth_LoginToken
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: auth_loginToken
    // constructor: auth_loginTokenMigrateTo
    // constructor: auth_loginTokenSuccess
}

/// TL sum type `auth.LoggedOut`.
abstract class auth_LoggedOut
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: auth_loggedOut
}

/// TL sum type `auth.PasskeyLoginOptions`.
abstract class auth_PasskeyLoginOptions
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: auth_passkeyLoginOptions
}

/// TL sum type `auth.FirebasePnvIntent`.
abstract class auth_FirebasePnvIntent
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: auth_firebasePnvIntent
}

/// TL constructor `auth.sentCode`, id 0x5E002502.
final class auth_sentCode : auth_SentCode
{
    enum uint tlId = 0x5E002502;

    uint flags;
    auth_SentCodeType type;
    string phone_code_hash;
    auth_CodeType next_type;
    int timeout;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodeSuccess`, id 0x2390FE44.
final class auth_sentCodeSuccess : auth_SentCode
{
    enum uint tlId = 0x2390FE44;

    auth_Authorization authorization;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodePaymentRequired`, id 0xF8827EBF.
final class auth_sentCodePaymentRequired : auth_SentCode
{
    enum uint tlId = 0xF8827EBF;

    string store_product;
    string phone_code_hash;
    string support_email_address;
    string support_email_subject;
    int premium_days;
    string currency;
    long amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.authorization`, id 0x2EA2C0D4.
final class auth_authorization : auth_Authorization
{
    enum uint tlId = 0x2EA2C0D4;

    uint flags;
    bool setup_password_required;
    int otherwise_relogin_days;
    int tmp_sessions;
    ubyte[] future_auth_token;
    User user;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.authorizationSignUpRequired`, id 0x44747E9A.
final class auth_authorizationSignUpRequired : auth_Authorization
{
    enum uint tlId = 0x44747E9A;

    uint flags;
    help_TermsOfService terms_of_service;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.exportedAuthorization`, id 0xB434E2B8.
final class auth_exportedAuthorization : auth_ExportedAuthorization
{
    enum uint tlId = 0xB434E2B8;

    long id;
    ubyte[] bytes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.passwordRecovery`, id 0x137948A5.
final class auth_passwordRecovery : auth_PasswordRecovery
{
    enum uint tlId = 0x137948A5;

    string email_pattern;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.codeTypeSms`, id 0x72A3158C.
final class auth_codeTypeSms : auth_CodeType
{
    enum uint tlId = 0x72A3158C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.codeTypeCall`, id 0x741CD3E3.
final class auth_codeTypeCall : auth_CodeType
{
    enum uint tlId = 0x741CD3E3;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.codeTypeFlashCall`, id 0x226CCEFB.
final class auth_codeTypeFlashCall : auth_CodeType
{
    enum uint tlId = 0x226CCEFB;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.codeTypeMissedCall`, id 0xD61AD6EE.
final class auth_codeTypeMissedCall : auth_CodeType
{
    enum uint tlId = 0xD61AD6EE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.codeTypeFragmentSms`, id 0x06ED998C.
final class auth_codeTypeFragmentSms : auth_CodeType
{
    enum uint tlId = 0x06ED998C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodeTypeApp`, id 0x3DBB5986.
final class auth_sentCodeTypeApp : auth_SentCodeType
{
    enum uint tlId = 0x3DBB5986;

    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodeTypeSms`, id 0xC000BBA2.
final class auth_sentCodeTypeSms : auth_SentCodeType
{
    enum uint tlId = 0xC000BBA2;

    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodeTypeCall`, id 0x5353E5A7.
final class auth_sentCodeTypeCall : auth_SentCodeType
{
    enum uint tlId = 0x5353E5A7;

    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodeTypeFlashCall`, id 0xAB03C6D9.
final class auth_sentCodeTypeFlashCall : auth_SentCodeType
{
    enum uint tlId = 0xAB03C6D9;

    string pattern;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodeTypeMissedCall`, id 0x82006484.
final class auth_sentCodeTypeMissedCall : auth_SentCodeType
{
    enum uint tlId = 0x82006484;

    string prefix;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodeTypeEmailCode`, id 0xF450F59B.
final class auth_sentCodeTypeEmailCode : auth_SentCodeType
{
    enum uint tlId = 0xF450F59B;

    uint flags;
    bool apple_signin_allowed;
    bool google_signin_allowed;
    string email_pattern;
    int length;
    int reset_available_period;
    int reset_pending_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodeTypeSetUpEmailRequired`, id 0xA5491DEA.
final class auth_sentCodeTypeSetUpEmailRequired : auth_SentCodeType
{
    enum uint tlId = 0xA5491DEA;

    uint flags;
    bool apple_signin_allowed;
    bool google_signin_allowed;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodeTypeFragmentSms`, id 0xD9565C39.
final class auth_sentCodeTypeFragmentSms : auth_SentCodeType
{
    enum uint tlId = 0xD9565C39;

    string url;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodeTypeFirebaseSms`, id 0x009FD736.
final class auth_sentCodeTypeFirebaseSms : auth_SentCodeType
{
    enum uint tlId = 0x009FD736;

    uint flags;
    ubyte[] nonce;
    long play_integrity_project_id;
    ubyte[] play_integrity_nonce;
    string receipt;
    int push_timeout;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodeTypeSmsWord`, id 0xA416AC81.
final class auth_sentCodeTypeSmsWord : auth_SentCodeType
{
    enum uint tlId = 0xA416AC81;

    uint flags;
    string beginning;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.sentCodeTypeSmsPhrase`, id 0xB37794AF.
final class auth_sentCodeTypeSmsPhrase : auth_SentCodeType
{
    enum uint tlId = 0xB37794AF;

    uint flags;
    string beginning;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.loginToken`, id 0x629F1980.
final class auth_loginToken : auth_LoginToken
{
    enum uint tlId = 0x629F1980;

    int expires;
    ubyte[] token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.loginTokenMigrateTo`, id 0x068E9916.
final class auth_loginTokenMigrateTo : auth_LoginToken
{
    enum uint tlId = 0x068E9916;

    int dc_id;
    ubyte[] token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.loginTokenSuccess`, id 0x390D5C5E.
final class auth_loginTokenSuccess : auth_LoginToken
{
    enum uint tlId = 0x390D5C5E;

    auth_Authorization authorization;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.loggedOut`, id 0xC3A2835F.
final class auth_loggedOut : auth_LoggedOut
{
    enum uint tlId = 0xC3A2835F;

    uint flags;
    ubyte[] future_auth_token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.passkeyLoginOptions`, id 0xE2037789.
final class auth_passkeyLoginOptions : auth_PasskeyLoginOptions
{
    enum uint tlId = 0xE2037789;

    DataJSON options;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auth.firebasePnvIntent`, id 0xDF5AC00C.
final class auth_firebasePnvIntent : auth_FirebasePnvIntent
{
    enum uint tlId = 0xDF5AC00C;

    string nonce;
    string digital_credential_payload;

    override uint tlIdValue() const nothrow { return tlId; }
}

