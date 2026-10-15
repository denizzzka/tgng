/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.chatlists_functions;

import tg_client_api.functions.tl_function;
import tg_client_api.types.common_types;
import tg_client_api.types.vector;

/// TL function `chatlists.exportChatlistInvite`, id 0x8472478E.
final class chatlists_exportChatlistInvite : TlFunction
{
    enum uint tlId = 0x8472478E;

    InputChatlist chatlist;
    string title;
    Vector!(InputPeer) peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `chatlists.deleteExportedInvite`, id 0x719C5C5E.
final class chatlists_deleteExportedInvite : TlFunction
{
    enum uint tlId = 0x719C5C5E;

    InputChatlist chatlist;
    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `chatlists.editExportedInvite`, id 0x653DB63D.
final class chatlists_editExportedInvite : TlFunction
{
    enum uint tlId = 0x653DB63D;

    uint flags;
    InputChatlist chatlist;
    string slug;
    string title;
    Vector!(InputPeer) peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `chatlists.getExportedInvites`, id 0xCE03DA83.
final class chatlists_getExportedInvites : TlFunction
{
    enum uint tlId = 0xCE03DA83;

    InputChatlist chatlist;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `chatlists.checkChatlistInvite`, id 0x41C10FFF.
final class chatlists_checkChatlistInvite : TlFunction
{
    enum uint tlId = 0x41C10FFF;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `chatlists.joinChatlistInvite`, id 0xA6B1E39A.
final class chatlists_joinChatlistInvite : TlFunction
{
    enum uint tlId = 0xA6B1E39A;

    string slug;
    Vector!(InputPeer) peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `chatlists.getChatlistUpdates`, id 0x89419521.
final class chatlists_getChatlistUpdates : TlFunction
{
    enum uint tlId = 0x89419521;

    InputChatlist chatlist;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `chatlists.joinChatlistUpdates`, id 0xE089F8F5.
final class chatlists_joinChatlistUpdates : TlFunction
{
    enum uint tlId = 0xE089F8F5;

    InputChatlist chatlist;
    Vector!(InputPeer) peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `chatlists.hideChatlistUpdates`, id 0x66E486FB.
final class chatlists_hideChatlistUpdates : TlFunction
{
    enum uint tlId = 0x66E486FB;

    InputChatlist chatlist;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `chatlists.getLeaveChatlistSuggestions`, id 0xFDBCD714.
final class chatlists_getLeaveChatlistSuggestions : TlFunction
{
    enum uint tlId = 0xFDBCD714;

    InputChatlist chatlist;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `chatlists.leaveChatlist`, id 0x74FAE13A.
final class chatlists_leaveChatlist : TlFunction
{
    enum uint tlId = 0x74FAE13A;

    InputChatlist chatlist;
    Vector!(InputPeer) peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

