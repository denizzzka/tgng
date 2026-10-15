/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.functions.channels_functions;

/// TL function `channels.readHistory`, id 0xCC104937.
final class channels_readHistory
{
    enum uint tlId = 0xCC104937;

    InputChannel channel;
    int max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.deleteMessages`, id 0x84C1FD4E.
final class channels_deleteMessages
{
    enum uint tlId = 0x84C1FD4E;

    InputChannel channel;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.reportSpam`, id 0xF44A8315.
final class channels_reportSpam
{
    enum uint tlId = 0xF44A8315;

    InputChannel channel;
    InputPeer participant;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getMessages`, id 0xAD8C9A23.
final class channels_getMessages
{
    enum uint tlId = 0xAD8C9A23;

    InputChannel channel;
    Vector!(InputMessage) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getParticipants`, id 0x77CED9D0.
final class channels_getParticipants
{
    enum uint tlId = 0x77CED9D0;

    InputChannel channel;
    ChannelParticipantsFilter filter;
    int offset;
    int limit;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getParticipant`, id 0xA0AB6CC6.
final class channels_getParticipant
{
    enum uint tlId = 0xA0AB6CC6;

    InputChannel channel;
    InputPeer participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getChannels`, id 0x0A7F6BBB.
final class channels_getChannels
{
    enum uint tlId = 0x0A7F6BBB;

    Vector!(InputChannel) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getFullChannel`, id 0x08736A09.
final class channels_getFullChannel
{
    enum uint tlId = 0x08736A09;

    InputChannel channel;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.createChannel`, id 0x91006707.
final class channels_createChannel
{
    enum uint tlId = 0x91006707;

    uint flags;
    bool broadcast;
    bool megagroup;
    bool for_import;
    bool forum;
    string title;
    string about;
    InputGeoPoint geo_point;
    string address;
    int ttl_period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.editAdmin`, id 0x9A98AD68.
final class channels_editAdmin
{
    enum uint tlId = 0x9A98AD68;

    uint flags;
    InputChannel channel;
    InputUser user_id;
    ChatAdminRights admin_rights;
    string rank;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.editTitle`, id 0x566DECD0.
final class channels_editTitle
{
    enum uint tlId = 0x566DECD0;

    InputChannel channel;
    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.editPhoto`, id 0xF12E57C9.
final class channels_editPhoto
{
    enum uint tlId = 0xF12E57C9;

    InputChannel channel;
    InputChatPhoto photo;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.checkUsername`, id 0x10E6BD2C.
final class channels_checkUsername
{
    enum uint tlId = 0x10E6BD2C;

    InputChannel channel;
    string username;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.updateUsername`, id 0x3514B3DE.
final class channels_updateUsername
{
    enum uint tlId = 0x3514B3DE;

    InputChannel channel;
    string username;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.joinChannel`, id 0x7F6A1E22.
final class channels_joinChannel
{
    enum uint tlId = 0x7F6A1E22;

    InputChannel channel;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.leaveChannel`, id 0xF836AA95.
final class channels_leaveChannel
{
    enum uint tlId = 0xF836AA95;

    InputChannel channel;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.inviteToChannel`, id 0xC9E33D54.
final class channels_inviteToChannel
{
    enum uint tlId = 0xC9E33D54;

    InputChannel channel;
    Vector!(InputUser) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.deleteChannel`, id 0xC0111FE3.
final class channels_deleteChannel
{
    enum uint tlId = 0xC0111FE3;

    InputChannel channel;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.exportMessageLink`, id 0xE63FADEB.
final class channels_exportMessageLink
{
    enum uint tlId = 0xE63FADEB;

    uint flags;
    bool grouped;
    bool thread;
    InputChannel channel;
    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.toggleSignatures`, id 0x418D549C.
final class channels_toggleSignatures
{
    enum uint tlId = 0x418D549C;

    uint flags;
    bool signatures_enabled;
    bool profiles_enabled;
    InputChannel channel;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getAdminedPublicChannels`, id 0xF8B036AF.
final class channels_getAdminedPublicChannels
{
    enum uint tlId = 0xF8B036AF;

    uint flags;
    bool by_location;
    bool check_limit;
    bool for_personal;
    bool for_community_peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.editBanned`, id 0x96E6CD81.
final class channels_editBanned
{
    enum uint tlId = 0x96E6CD81;

    InputChannel channel;
    InputPeer participant;
    ChatBannedRights banned_rights;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getAdminLog`, id 0x33DDF480.
final class channels_getAdminLog
{
    enum uint tlId = 0x33DDF480;

    uint flags;
    InputChannel channel;
    string q;
    ChannelAdminLogEventsFilter events_filter;
    Vector!(InputUser) admins;
    long max_id;
    long min_id;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.setStickers`, id 0xEA8CA4F9.
final class channels_setStickers
{
    enum uint tlId = 0xEA8CA4F9;

    InputChannel channel;
    InputStickerSet stickerset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.readMessageContents`, id 0xEAB5DC38.
final class channels_readMessageContents
{
    enum uint tlId = 0xEAB5DC38;

    InputChannel channel;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.deleteHistory`, id 0x9BAA9647.
final class channels_deleteHistory
{
    enum uint tlId = 0x9BAA9647;

    uint flags;
    bool for_everyone;
    InputChannel channel;
    int max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.togglePreHistoryHidden`, id 0xEABBB94C.
final class channels_togglePreHistoryHidden
{
    enum uint tlId = 0xEABBB94C;

    InputChannel channel;
    bool enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getLeftChannels`, id 0x8341ECC0.
final class channels_getLeftChannels
{
    enum uint tlId = 0x8341ECC0;

    int offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getGroupsForDiscussion`, id 0xF5DAD378.
final class channels_getGroupsForDiscussion
{
    enum uint tlId = 0xF5DAD378;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.setDiscussionGroup`, id 0x40582BB2.
final class channels_setDiscussionGroup
{
    enum uint tlId = 0x40582BB2;

    InputChannel broadcast;
    InputChannel group;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.editLocation`, id 0x58E63F6D.
final class channels_editLocation
{
    enum uint tlId = 0x58E63F6D;

    InputChannel channel;
    InputGeoPoint geo_point;
    string address;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.toggleSlowMode`, id 0xEDD49EF0.
final class channels_toggleSlowMode
{
    enum uint tlId = 0xEDD49EF0;

    InputChannel channel;
    int seconds;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getInactiveChannels`, id 0x11E831EE.
final class channels_getInactiveChannels
{
    enum uint tlId = 0x11E831EE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.convertToGigagroup`, id 0x0B290C69.
final class channels_convertToGigagroup
{
    enum uint tlId = 0x0B290C69;

    InputChannel channel;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getSendAs`, id 0xE785A43F.
final class channels_getSendAs
{
    enum uint tlId = 0xE785A43F;

    uint flags;
    bool for_paid_reactions;
    bool for_live_stories;
    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.deleteParticipantHistory`, id 0x367544DB.
final class channels_deleteParticipantHistory
{
    enum uint tlId = 0x367544DB;

    InputChannel channel;
    InputPeer participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.toggleJoinToSend`, id 0xE4CB9580.
final class channels_toggleJoinToSend
{
    enum uint tlId = 0xE4CB9580;

    InputChannel channel;
    bool enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.toggleJoinRequest`, id 0x0ECC2618.
final class channels_toggleJoinRequest
{
    enum uint tlId = 0x0ECC2618;

    uint flags;
    bool apply_to_invites;
    InputChannel channel;
    bool enabled;
    InputUser guard_bot;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.reorderUsernames`, id 0xB45CED1D.
final class channels_reorderUsernames
{
    enum uint tlId = 0xB45CED1D;

    InputChannel channel;
    Vector!(string) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.toggleUsername`, id 0x50F24105.
final class channels_toggleUsername
{
    enum uint tlId = 0x50F24105;

    InputChannel channel;
    string username;
    bool active;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.deactivateAllUsernames`, id 0x0A245DD3.
final class channels_deactivateAllUsernames
{
    enum uint tlId = 0x0A245DD3;

    InputChannel channel;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.toggleForum`, id 0x3FF75734.
final class channels_toggleForum
{
    enum uint tlId = 0x3FF75734;

    InputChannel channel;
    bool enabled;
    bool tabs;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.toggleAntiSpam`, id 0x68F3E4EB.
final class channels_toggleAntiSpam
{
    enum uint tlId = 0x68F3E4EB;

    InputChannel channel;
    bool enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.reportAntiSpamFalsePositive`, id 0xA850A693.
final class channels_reportAntiSpamFalsePositive
{
    enum uint tlId = 0xA850A693;

    InputChannel channel;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.toggleParticipantsHidden`, id 0x6A6E7854.
final class channels_toggleParticipantsHidden
{
    enum uint tlId = 0x6A6E7854;

    InputChannel channel;
    bool enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.updateColor`, id 0xD8AA3671.
final class channels_updateColor
{
    enum uint tlId = 0xD8AA3671;

    uint flags;
    bool for_profile;
    InputChannel channel;
    int color;
    long background_emoji_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.toggleViewForumAsMessages`, id 0x9738BB15.
final class channels_toggleViewForumAsMessages
{
    enum uint tlId = 0x9738BB15;

    InputChannel channel;
    bool enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getChannelRecommendations`, id 0x25A71742.
final class channels_getChannelRecommendations
{
    enum uint tlId = 0x25A71742;

    uint flags;
    InputChannel channel;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.updateEmojiStatus`, id 0xF0D3E6A8.
final class channels_updateEmojiStatus
{
    enum uint tlId = 0xF0D3E6A8;

    InputChannel channel;
    EmojiStatus emoji_status;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.setBoostsToUnblockRestrictions`, id 0xAD399CEE.
final class channels_setBoostsToUnblockRestrictions
{
    enum uint tlId = 0xAD399CEE;

    InputChannel channel;
    int boosts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.setEmojiStickers`, id 0x3CD930B7.
final class channels_setEmojiStickers
{
    enum uint tlId = 0x3CD930B7;

    InputChannel channel;
    InputStickerSet stickerset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.restrictSponsoredMessages`, id 0x9AE91519.
final class channels_restrictSponsoredMessages
{
    enum uint tlId = 0x9AE91519;

    InputChannel channel;
    bool restricted;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.searchPosts`, id 0xF2C4F24D.
final class channels_searchPosts
{
    enum uint tlId = 0xF2C4F24D;

    uint flags;
    string hashtag;
    string query;
    int offset_rate;
    InputPeer offset_peer;
    int offset_id;
    int limit;
    long allow_paid_stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.updatePaidMessagesPrice`, id 0x4B12327B.
final class channels_updatePaidMessagesPrice
{
    enum uint tlId = 0x4B12327B;

    uint flags;
    bool broadcast_messages_allowed;
    InputChannel channel;
    long send_paid_messages_stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.toggleAutotranslation`, id 0x167FC0A1.
final class channels_toggleAutotranslation
{
    enum uint tlId = 0x167FC0A1;

    InputChannel channel;
    bool enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.getMessageAuthor`, id 0xECE2A0E6.
final class channels_getMessageAuthor
{
    enum uint tlId = 0xECE2A0E6;

    InputChannel channel;
    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.checkSearchPostsFlood`, id 0x22567115.
final class channels_checkSearchPostsFlood
{
    enum uint tlId = 0x22567115;

    uint flags;
    string query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `channels.setMainProfileTab`, id 0x3583FCB1.
final class channels_setMainProfileTab
{
    enum uint tlId = 0x3583FCB1;

    InputChannel channel;
    ProfileTab tab;

    override uint tlIdValue() const nothrow { return tlId; }
}

