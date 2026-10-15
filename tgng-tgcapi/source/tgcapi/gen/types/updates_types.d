/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.types.updates_types;

/// TL sum type `updates.State`.
abstract class updates_State
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: updates_state
}

/// TL sum type `updates.Difference`.
abstract class updates_Difference
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: updates_difference
    // constructor: updates_differenceEmpty
    // constructor: updates_differenceSlice
    // constructor: updates_differenceTooLong
}

/// TL sum type `updates.ChannelDifference`.
abstract class updates_ChannelDifference
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: updates_channelDifference
    // constructor: updates_channelDifferenceEmpty
    // constructor: updates_channelDifferenceTooLong
}

/// TL constructor `updates.state`, id 0xA56C2A3E.
final class updates_state : updates_State
{
    enum uint tlId = 0xA56C2A3E;

    int pts;
    int qts;
    int date;
    int seq;
    int unread_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updates.differenceEmpty`, id 0x5D75A138.
final class updates_differenceEmpty : updates_Difference
{
    enum uint tlId = 0x5D75A138;

    int date;
    int seq;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updates.difference`, id 0x00F49CA0.
final class updates_difference : updates_Difference
{
    enum uint tlId = 0x00F49CA0;

    Vector!(Message) new_messages;
    Vector!(EncryptedMessage) new_encrypted_messages;
    Vector!(Update) other_updates;
    Vector!(Chat) chats;
    Vector!(User) users;
    updates_State state;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updates.differenceSlice`, id 0xA8FB1981.
final class updates_differenceSlice : updates_Difference
{
    enum uint tlId = 0xA8FB1981;

    Vector!(Message) new_messages;
    Vector!(EncryptedMessage) new_encrypted_messages;
    Vector!(Update) other_updates;
    Vector!(Chat) chats;
    Vector!(User) users;
    updates_State intermediate_state;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updates.differenceTooLong`, id 0x4AFE8F6D.
final class updates_differenceTooLong : updates_Difference
{
    enum uint tlId = 0x4AFE8F6D;

    int pts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updates.channelDifferenceEmpty`, id 0x3E11AFFB.
final class updates_channelDifferenceEmpty : updates_ChannelDifference
{
    enum uint tlId = 0x3E11AFFB;

    uint flags;
    bool final_;
    int pts;
    int timeout;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updates.channelDifferenceTooLong`, id 0xA4BCC6FE.
final class updates_channelDifferenceTooLong : updates_ChannelDifference
{
    enum uint tlId = 0xA4BCC6FE;

    uint flags;
    bool final_;
    int timeout;
    Dialog dialog;
    Vector!(Message) messages;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updates.channelDifference`, id 0x2064674E.
final class updates_channelDifference : updates_ChannelDifference
{
    enum uint tlId = 0x2064674E;

    uint flags;
    bool final_;
    int pts;
    int timeout;
    Vector!(Message) new_messages;
    Vector!(Update) other_updates;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

