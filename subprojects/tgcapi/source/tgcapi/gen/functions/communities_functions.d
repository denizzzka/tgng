/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.functions.communities_functions;

/// TL function `communities.create`, id 0xA63859EC.
final class communities_create
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
final class communities_togglePeerLink
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
final class communities_getJoinedCommunities
{
    enum uint tlId = 0xA663E830;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.toggleCommunityCollapsedInDialogs`, id 0xD766E3EA.
final class communities_toggleCommunityCollapsedInDialogs
{
    enum uint tlId = 0xD766E3EA;

    uint flags;
    bool collapsed;
    InputChannel community;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.getPeerLinkRequests`, id 0x93773344.
final class communities_getPeerLinkRequests
{
    enum uint tlId = 0x93773344;

    InputChannel community;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.togglePeerLinkRequestApproval`, id 0x8C8219A8.
final class communities_togglePeerLinkRequestApproval
{
    enum uint tlId = 0x8C8219A8;

    uint flags;
    bool reject;
    InputChannel community;
    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.toggleAllPeerLinkRequestApproval`, id 0xBFE3DD3D.
final class communities_toggleAllPeerLinkRequestApproval
{
    enum uint tlId = 0xBFE3DD3D;

    uint flags;
    bool reject;
    InputChannel community;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.toggleParticipantBanned`, id 0x9967AD0F.
final class communities_toggleParticipantBanned
{
    enum uint tlId = 0x9967AD0F;

    uint flags;
    bool unban;
    InputChannel community;
    InputPeer participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `communities.getParticipantJoinedChats`, id 0xF87EABAB.
final class communities_getParticipantJoinedChats
{
    enum uint tlId = 0xF87EABAB;

    InputChannel community;
    InputPeer participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

