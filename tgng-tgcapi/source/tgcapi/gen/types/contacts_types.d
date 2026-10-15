/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.types.contacts_types;

/// TL sum type `contacts.Contacts`.
abstract class contacts_Contacts
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: contacts_contacts
    // constructor: contacts_contactsNotModified
}

/// TL sum type `contacts.ImportedContacts`.
abstract class contacts_ImportedContacts
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: contacts_importedContacts
}

/// TL sum type `contacts.Blocked`.
abstract class contacts_Blocked
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: contacts_blocked
    // constructor: contacts_blockedSlice
}

/// TL sum type `contacts.Found`.
abstract class contacts_Found
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: contacts_found
}

/// TL sum type `contacts.ResolvedPeer`.
abstract class contacts_ResolvedPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: contacts_resolvedPeer
}

/// TL sum type `contacts.TopPeers`.
abstract class contacts_TopPeers
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: contacts_topPeers
    // constructor: contacts_topPeersDisabled
    // constructor: contacts_topPeersNotModified
}

/// TL sum type `contacts.ContactBirthdays`.
abstract class contacts_ContactBirthdays
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: contacts_contactBirthdays
}

/// TL sum type `contacts.SponsoredPeers`.
abstract class contacts_SponsoredPeers
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: contacts_sponsoredPeers
    // constructor: contacts_sponsoredPeersEmpty
}

/// TL constructor `contacts.contactsNotModified`, id 0xB74BA9D2.
final class contacts_contactsNotModified : contacts_Contacts
{
    enum uint tlId = 0xB74BA9D2;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contacts.contacts`, id 0xEAE87E42.
final class contacts_contacts : contacts_Contacts
{
    enum uint tlId = 0xEAE87E42;

    Vector!(Contact) contacts;
    int saved_count;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contacts.importedContacts`, id 0x77D01C3B.
final class contacts_importedContacts : contacts_ImportedContacts
{
    enum uint tlId = 0x77D01C3B;

    Vector!(ImportedContact) imported;
    Vector!(PopularContact) popular_invites;
    Vector!(long) retry_contacts;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contacts.blocked`, id 0x0ADE1591.
final class contacts_blocked : contacts_Blocked
{
    enum uint tlId = 0x0ADE1591;

    Vector!(PeerBlocked) blocked;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contacts.blockedSlice`, id 0xE1664194.
final class contacts_blockedSlice : contacts_Blocked
{
    enum uint tlId = 0xE1664194;

    int count;
    Vector!(PeerBlocked) blocked;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contacts.found`, id 0xB3134D9D.
final class contacts_found : contacts_Found
{
    enum uint tlId = 0xB3134D9D;

    Vector!(Peer) my_results;
    Vector!(Peer) results;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contacts.resolvedPeer`, id 0x7F077AD9.
final class contacts_resolvedPeer : contacts_ResolvedPeer
{
    enum uint tlId = 0x7F077AD9;

    Peer peer;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contacts.topPeersNotModified`, id 0xDE266EF5.
final class contacts_topPeersNotModified : contacts_TopPeers
{
    enum uint tlId = 0xDE266EF5;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contacts.topPeers`, id 0x70B772A8.
final class contacts_topPeers : contacts_TopPeers
{
    enum uint tlId = 0x70B772A8;

    Vector!(TopPeerCategoryPeers) categories;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contacts.topPeersDisabled`, id 0xB52C939D.
final class contacts_topPeersDisabled : contacts_TopPeers
{
    enum uint tlId = 0xB52C939D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contacts.contactBirthdays`, id 0x114FF30D.
final class contacts_contactBirthdays : contacts_ContactBirthdays
{
    enum uint tlId = 0x114FF30D;

    Vector!(ContactBirthday) contacts;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contacts.sponsoredPeersEmpty`, id 0xEA32B4B1.
final class contacts_sponsoredPeersEmpty : contacts_SponsoredPeers
{
    enum uint tlId = 0xEA32B4B1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contacts.sponsoredPeers`, id 0xEB032884.
final class contacts_sponsoredPeers : contacts_SponsoredPeers
{
    enum uint tlId = 0xEB032884;

    Vector!(SponsoredPeer) peers;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

