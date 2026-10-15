/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.types.communities_types;

/// TL sum type `communities.PeerLinkRequests`.
abstract class communities_PeerLinkRequests
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: communities_peerLinkRequests
}

/// TL sum type `communities.ParticipantJoinedChats`.
abstract class communities_ParticipantJoinedChats
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: communities_participantJoinedChats
}

/// TL constructor `communities.peerLinkRequests`, id 0x2244AFAD.
final class communities_peerLinkRequests : communities_PeerLinkRequests
{
    enum uint tlId = 0x2244AFAD;

    uint flags;
    int total_count;
    Vector!(CommunityPeerRequest) requests;
    string next_offset;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `communities.participantJoinedChats`, id 0x8D78512A.
final class communities_participantJoinedChats : communities_ParticipantJoinedChats
{
    enum uint tlId = 0x8D78512A;

    Vector!(long) creator_chat_ids;
    Vector!(long) joined_chat_ids;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

