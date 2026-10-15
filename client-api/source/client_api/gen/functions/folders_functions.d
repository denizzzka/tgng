/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.functions.folders_functions;

/// TL function `folders.editPeerFolders`, id 0x6847D0AB.
final class folders_editPeerFolders
{
    enum uint tlId = 0x6847D0AB;

    Vector!(InputFolderPeer) folder_peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

