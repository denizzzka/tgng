/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.folders_functions;

import tg_client_api.functions.tl_function;
import tg_client_api.types.common_types;
import tg_client_api.types.vector;

/// TL function `folders.editPeerFolders`, id 0x6847D0AB.
final class folders_editPeerFolders : TlFunction
{
    enum uint tlId = 0x6847D0AB;

    Vector!(InputFolderPeer) folder_peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

