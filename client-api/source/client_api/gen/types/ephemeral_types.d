/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.types.ephemeral_types;

/// TL sum type `ephemeral.WelcomeMessages`.
abstract class ephemeral_WelcomeMessages
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: ephemeral_welcomeMessages
    // constructor: ephemeral_welcomeMessagesNotModified
}

/// TL constructor `ephemeral.welcomeMessagesNotModified`, id 0x59FFDB31.
final class ephemeral_welcomeMessagesNotModified : ephemeral_WelcomeMessages
{
    enum uint tlId = 0x59FFDB31;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `ephemeral.welcomeMessages`, id 0x104FC872.
final class ephemeral_welcomeMessages : ephemeral_WelcomeMessages
{
    enum uint tlId = 0x104FC872;

    long hash;
    Vector!(EphemeralMessage) messages;

    override uint tlIdValue() const nothrow { return tlId; }
}

