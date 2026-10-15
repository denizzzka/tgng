/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.users_functions;

import tg_client_api.functions.tl_function;
import tg_client_api.types.common_types;
import tg_client_api.types.vector;

/// TL function `users.getUsers`, id 0x0D91A548.
final class users_getUsers : TlFunction
{
    enum uint tlId = 0x0D91A548;

    Vector!(InputUser) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `users.getFullUser`, id 0xB60F5918.
final class users_getFullUser : TlFunction
{
    enum uint tlId = 0xB60F5918;

    InputUser id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `users.setSecureValueErrors`, id 0x90C894B5.
final class users_setSecureValueErrors : TlFunction
{
    enum uint tlId = 0x90C894B5;

    InputUser id;
    Vector!(SecureValueError) errors;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `users.getRequirementsToContact`, id 0xD89A83A3.
final class users_getRequirementsToContact : TlFunction
{
    enum uint tlId = 0xD89A83A3;

    Vector!(InputUser) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `users.getSavedMusic`, id 0x788D7FE3.
final class users_getSavedMusic : TlFunction
{
    enum uint tlId = 0x788D7FE3;

    InputUser id;
    int offset;
    int limit;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `users.getSavedMusicByID`, id 0x7573A4E9.
final class users_getSavedMusicByID : TlFunction
{
    enum uint tlId = 0x7573A4E9;

    InputUser id;
    Vector!(InputDocument) documents;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `users.suggestBirthday`, id 0xFC533372.
final class users_suggestBirthday : TlFunction
{
    enum uint tlId = 0xFC533372;

    InputUser id;
    Birthday birthday;

    override uint tlIdValue() const nothrow { return tlId; }
}

