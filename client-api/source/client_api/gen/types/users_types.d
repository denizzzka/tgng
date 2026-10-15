/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.types.users_types;

/// TL sum type `users.UserFull`.
abstract class users_UserFull
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: users_userFull
}

/// TL sum type `users.Users`.
abstract class users_Users
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: users_users
    // constructor: users_usersSlice
}

/// TL sum type `users.SavedMusic`.
abstract class users_SavedMusic
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: users_savedMusic
    // constructor: users_savedMusicNotModified
}

/// TL constructor `users.userFull`, id 0x3B6D152E.
final class users_userFull : users_UserFull
{
    enum uint tlId = 0x3B6D152E;

    UserFull full_user;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `users.users`, id 0x62D706B8.
final class users_users : users_Users
{
    enum uint tlId = 0x62D706B8;

    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `users.usersSlice`, id 0x315A4974.
final class users_usersSlice : users_Users
{
    enum uint tlId = 0x315A4974;

    int count;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `users.savedMusicNotModified`, id 0xE3878AA4.
final class users_savedMusicNotModified : users_SavedMusic
{
    enum uint tlId = 0xE3878AA4;

    int count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `users.savedMusic`, id 0x34A2F297.
final class users_savedMusic : users_SavedMusic
{
    enum uint tlId = 0x34A2F297;

    int count;
    Vector!(Document) documents;

    override uint tlIdValue() const nothrow { return tlId; }
}

