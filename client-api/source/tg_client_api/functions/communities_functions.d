/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.communities_functions;

import tg_client_api.functions.tl_function;
import tg_client_api.types.common_types;

/// TL function `communities.create`, id 0xA63859EC.
final class communities_create : TlFunction
{
    enum uint tlId = 0xA63859EC;

    uint flags;
    bool hidden;
    string title;
    string about;
    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.togglePeerLink`, id 0x736DCFEA.
final class communities_togglePeerLink : TlFunction
{
    enum uint tlId = 0x736DCFEA;

    uint flags;
    bool visible;
    bool hidden;
    bool deleted;
    InputChannel community;
    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.getJoinedCommunities`, id 0xA663E830.
final class communities_getJoinedCommunities : TlFunction
{
    enum uint tlId = 0xA663E830;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.toggleCommunityCollapsedInDialogs`, id 0xD766E3EA.
final class communities_toggleCommunityCollapsedInDialogs : TlFunction
{
    enum uint tlId = 0xD766E3EA;

    uint flags;
    bool collapsed;
    InputChannel community;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.getPeerLinkRequests`, id 0x93773344.
final class communities_getPeerLinkRequests : TlFunction
{
    enum uint tlId = 0x93773344;

    InputChannel community;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.togglePeerLinkRequestApproval`, id 0x8C8219A8.
final class communities_togglePeerLinkRequestApproval : TlFunction
{
    enum uint tlId = 0x8C8219A8;

    uint flags;
    bool reject;
    InputChannel community;
    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.toggleAllPeerLinkRequestApproval`, id 0xBFE3DD3D.
final class communities_toggleAllPeerLinkRequestApproval : TlFunction
{
    enum uint tlId = 0xBFE3DD3D;

    uint flags;
    bool reject;
    InputChannel community;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.toggleParticipantBanned`, id 0x9967AD0F.
final class communities_toggleParticipantBanned : TlFunction
{
    enum uint tlId = 0x9967AD0F;

    uint flags;
    bool unban;
    InputChannel community;
    InputPeer participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.getParticipantJoinedChats`, id 0xF87EABAB.
final class communities_getParticipantJoinedChats : TlFunction
{
    enum uint tlId = 0xF87EABAB;

    InputChannel community;
    InputPeer participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

