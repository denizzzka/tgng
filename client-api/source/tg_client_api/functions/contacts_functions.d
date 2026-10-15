/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.contacts_functions;

import tg_client_api.functions.tl_function;
import tg_client_api.types.common_types;
import tg_client_api.types.vector;

/// TL function `contacts.getContactIDs`, id 0x7ADC669D.
final class contacts_getContactIDs : TlFunction
{
    enum uint tlId = 0x7ADC669D;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.getStatuses`, id 0xC4A353EE.
final class contacts_getStatuses : TlFunction
{
    enum uint tlId = 0xC4A353EE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.getContacts`, id 0x5DD69E12.
final class contacts_getContacts : TlFunction
{
    enum uint tlId = 0x5DD69E12;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.importContacts`, id 0x2C800BE5.
final class contacts_importContacts : TlFunction
{
    enum uint tlId = 0x2C800BE5;

    Vector!(InputContact) contacts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.deleteContacts`, id 0x096A0E00.
final class contacts_deleteContacts : TlFunction
{
    enum uint tlId = 0x096A0E00;

    Vector!(InputUser) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.deleteByPhones`, id 0x1013FD9E.
final class contacts_deleteByPhones : TlFunction
{
    enum uint tlId = 0x1013FD9E;

    Vector!(string) phones;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.block`, id 0x2E2E8734.
final class contacts_block : TlFunction
{
    enum uint tlId = 0x2E2E8734;

    uint flags;
    bool my_stories_from;
    InputPeer id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.unblock`, id 0xB550D328.
final class contacts_unblock : TlFunction
{
    enum uint tlId = 0xB550D328;

    uint flags;
    bool my_stories_from;
    InputPeer id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.getBlocked`, id 0x9A868F80.
final class contacts_getBlocked : TlFunction
{
    enum uint tlId = 0x9A868F80;

    uint flags;
    bool my_stories_from;
    int offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.search`, id 0x05F58D0F.
final class contacts_search : TlFunction
{
    enum uint tlId = 0x05F58D0F;

    uint flags;
    bool broadcasts;
    bool bots;
    string q;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.resolveUsername`, id 0x725AFBBC.
final class contacts_resolveUsername : TlFunction
{
    enum uint tlId = 0x725AFBBC;

    uint flags;
    string username;
    string referer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.getTopPeers`, id 0x973478B6.
final class contacts_getTopPeers : TlFunction
{
    enum uint tlId = 0x973478B6;

    uint flags;
    bool correspondents;
    bool bots_pm;
    bool bots_inline;
    bool phone_calls;
    bool forward_users;
    bool forward_chats;
    bool groups;
    bool channels;
    bool bots_app;
    bool bots_guestchat;
    int offset;
    int limit;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.resetTopPeerRating`, id 0x1AE373AC.
final class contacts_resetTopPeerRating : TlFunction
{
    enum uint tlId = 0x1AE373AC;

    TopPeerCategory category;
    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.resetSaved`, id 0x879537F1.
final class contacts_resetSaved : TlFunction
{
    enum uint tlId = 0x879537F1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.getSaved`, id 0x82F1E39F.
final class contacts_getSaved : TlFunction
{
    enum uint tlId = 0x82F1E39F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.toggleTopPeers`, id 0x8514BDDA.
final class contacts_toggleTopPeers : TlFunction
{
    enum uint tlId = 0x8514BDDA;

    bool enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.addContact`, id 0xD9BA2E54.
final class contacts_addContact : TlFunction
{
    enum uint tlId = 0xD9BA2E54;

    uint flags;
    bool add_phone_privacy_exception;
    InputUser id;
    string first_name;
    string last_name;
    string phone;
    TextWithEntities note;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.acceptContact`, id 0xF831A20F.
final class contacts_acceptContact : TlFunction
{
    enum uint tlId = 0xF831A20F;

    InputUser id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.getLocated`, id 0xD348BC44.
final class contacts_getLocated : TlFunction
{
    enum uint tlId = 0xD348BC44;

    uint flags;
    bool background;
    InputGeoPoint geo_point;
    int self_expires;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.blockFromReplies`, id 0x29A8962C.
final class contacts_blockFromReplies : TlFunction
{
    enum uint tlId = 0x29A8962C;

    uint flags;
    bool delete_message;
    bool delete_history;
    bool report_spam;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.resolvePhone`, id 0x8AF94344.
final class contacts_resolvePhone : TlFunction
{
    enum uint tlId = 0x8AF94344;

    string phone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.exportContactToken`, id 0xF8654027.
final class contacts_exportContactToken : TlFunction
{
    enum uint tlId = 0xF8654027;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.importContactToken`, id 0x13005788.
final class contacts_importContactToken : TlFunction
{
    enum uint tlId = 0x13005788;

    string token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.editCloseFriends`, id 0xBA6705F0.
final class contacts_editCloseFriends : TlFunction
{
    enum uint tlId = 0xBA6705F0;

    Vector!(long) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.setBlocked`, id 0x94C65C76.
final class contacts_setBlocked : TlFunction
{
    enum uint tlId = 0x94C65C76;

    uint flags;
    bool my_stories_from;
    Vector!(InputPeer) id;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.getBirthdays`, id 0xDAEDA864.
final class contacts_getBirthdays : TlFunction
{
    enum uint tlId = 0xDAEDA864;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.getSponsoredPeers`, id 0xB6C8C393.
final class contacts_getSponsoredPeers : TlFunction
{
    enum uint tlId = 0xB6C8C393;

    string q;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `contacts.updateContactNote`, id 0x139F63FB.
final class contacts_updateContactNote : TlFunction
{
    enum uint tlId = 0x139F63FB;

    InputUser id;
    TextWithEntities note;

    override uint tlIdValue() const nothrow { return tlId; }
}

