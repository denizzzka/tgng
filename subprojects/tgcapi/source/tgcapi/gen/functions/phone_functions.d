/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.functions.phone_functions;

/// TL function `phone.getCallConfig`, id 0x55451FA9.
final class phone_getCallConfig
{
    enum uint tlId = 0x55451FA9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.requestCall`, id 0x42FF96ED.
final class phone_requestCall
{
    enum uint tlId = 0x42FF96ED;

    uint flags;
    bool video;
    InputUser user_id;
    int random_id;
    ubyte[] g_a_hash;
    PhoneCallProtocol protocol;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.acceptCall`, id 0x3BD2B4A0.
final class phone_acceptCall
{
    enum uint tlId = 0x3BD2B4A0;

    InputPhoneCall peer;
    ubyte[] g_b;
    PhoneCallProtocol protocol;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.confirmCall`, id 0x2EFE1722.
final class phone_confirmCall
{
    enum uint tlId = 0x2EFE1722;

    InputPhoneCall peer;
    ubyte[] g_a;
    long key_fingerprint;
    PhoneCallProtocol protocol;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.receivedCall`, id 0x17D54F61.
final class phone_receivedCall
{
    enum uint tlId = 0x17D54F61;

    InputPhoneCall peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.discardCall`, id 0xB2CBC1C0.
final class phone_discardCall
{
    enum uint tlId = 0xB2CBC1C0;

    uint flags;
    bool video;
    InputPhoneCall peer;
    int duration;
    PhoneCallDiscardReason reason;
    long connection_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.setCallRating`, id 0x59EAD627.
final class phone_setCallRating
{
    enum uint tlId = 0x59EAD627;

    uint flags;
    bool user_initiative;
    InputPhoneCall peer;
    int rating;
    string comment;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.saveCallDebug`, id 0x277ADD7E.
final class phone_saveCallDebug
{
    enum uint tlId = 0x277ADD7E;

    InputPhoneCall peer;
    DataJSON debug_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.sendSignalingData`, id 0xFF7A9383.
final class phone_sendSignalingData
{
    enum uint tlId = 0xFF7A9383;

    InputPhoneCall peer;
    ubyte[] data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.createGroupCall`, id 0x48CDC6D8.
final class phone_createGroupCall
{
    enum uint tlId = 0x48CDC6D8;

    uint flags;
    bool rtmp_stream;
    InputPeer peer;
    int random_id;
    string title;
    int schedule_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.joinGroupCall`, id 0x8FB53057.
final class phone_joinGroupCall
{
    enum uint tlId = 0x8FB53057;

    uint flags;
    bool muted;
    bool video_stopped;
    InputGroupCall call;
    InputPeer join_as;
    string invite_hash;
    ubyte[32] public_key;
    ubyte[] block;
    DataJSON params;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.leaveGroupCall`, id 0x500377F9.
final class phone_leaveGroupCall
{
    enum uint tlId = 0x500377F9;

    InputGroupCall call;
    int source;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.inviteToGroupCall`, id 0x7B393160.
final class phone_inviteToGroupCall
{
    enum uint tlId = 0x7B393160;

    InputGroupCall call;
    Vector!(InputUser) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.discardGroupCall`, id 0x7A777135.
final class phone_discardGroupCall
{
    enum uint tlId = 0x7A777135;

    InputGroupCall call;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.toggleGroupCallSettings`, id 0x974392F2.
final class phone_toggleGroupCallSettings
{
    enum uint tlId = 0x974392F2;

    uint flags;
    bool reset_invite_hash;
    InputGroupCall call;
    bool join_muted;
    bool messages_enabled;
    long send_paid_messages_stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.getGroupCall`, id 0x041845DB.
final class phone_getGroupCall
{
    enum uint tlId = 0x041845DB;

    InputGroupCall call;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.getGroupParticipants`, id 0xC558D8AB.
final class phone_getGroupParticipants
{
    enum uint tlId = 0xC558D8AB;

    InputGroupCall call;
    Vector!(InputPeer) ids;
    Vector!(int) sources;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.checkGroupCall`, id 0xB59CF977.
final class phone_checkGroupCall
{
    enum uint tlId = 0xB59CF977;

    InputGroupCall call;
    Vector!(int) sources;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.toggleGroupCallRecord`, id 0xF128C708.
final class phone_toggleGroupCallRecord
{
    enum uint tlId = 0xF128C708;

    uint flags;
    bool start;
    bool video;
    InputGroupCall call;
    string title;
    bool video_portrait;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.editGroupCallParticipant`, id 0xA5273ABF.
final class phone_editGroupCallParticipant
{
    enum uint tlId = 0xA5273ABF;

    uint flags;
    InputGroupCall call;
    InputPeer participant;
    bool muted;
    int volume;
    bool raise_hand;
    bool video_stopped;
    bool video_paused;
    bool presentation_paused;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.editGroupCallTitle`, id 0x1CA6AC0A.
final class phone_editGroupCallTitle
{
    enum uint tlId = 0x1CA6AC0A;

    InputGroupCall call;
    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.getGroupCallJoinAs`, id 0xEF7C213A.
final class phone_getGroupCallJoinAs
{
    enum uint tlId = 0xEF7C213A;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.exportGroupCallInvite`, id 0xE6AA647F.
final class phone_exportGroupCallInvite
{
    enum uint tlId = 0xE6AA647F;

    uint flags;
    bool can_self_unmute;
    InputGroupCall call;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.toggleGroupCallStartSubscription`, id 0x219C34E6.
final class phone_toggleGroupCallStartSubscription
{
    enum uint tlId = 0x219C34E6;

    InputGroupCall call;
    bool subscribed;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.startScheduledGroupCall`, id 0x5680E342.
final class phone_startScheduledGroupCall
{
    enum uint tlId = 0x5680E342;

    InputGroupCall call;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.saveDefaultGroupCallJoinAs`, id 0x575E1F8C.
final class phone_saveDefaultGroupCallJoinAs
{
    enum uint tlId = 0x575E1F8C;

    InputPeer peer;
    InputPeer join_as;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.joinGroupCallPresentation`, id 0xCBEA6BC4.
final class phone_joinGroupCallPresentation
{
    enum uint tlId = 0xCBEA6BC4;

    InputGroupCall call;
    DataJSON params;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.leaveGroupCallPresentation`, id 0x1C50D144.
final class phone_leaveGroupCallPresentation
{
    enum uint tlId = 0x1C50D144;

    InputGroupCall call;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.getGroupCallStreamChannels`, id 0x1AB21940.
final class phone_getGroupCallStreamChannels
{
    enum uint tlId = 0x1AB21940;

    InputGroupCall call;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.getGroupCallStreamRtmpUrl`, id 0x5AF4C73A.
final class phone_getGroupCallStreamRtmpUrl
{
    enum uint tlId = 0x5AF4C73A;

    uint flags;
    bool live_story;
    InputPeer peer;
    bool revoke;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.saveCallLog`, id 0x41248786.
final class phone_saveCallLog
{
    enum uint tlId = 0x41248786;

    InputPhoneCall peer;
    InputFile file;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.createConferenceCall`, id 0x7D0444BB.
final class phone_createConferenceCall
{
    enum uint tlId = 0x7D0444BB;

    uint flags;
    bool muted;
    bool video_stopped;
    bool join;
    int random_id;
    ubyte[32] public_key;
    ubyte[] block;
    DataJSON params;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.deleteConferenceCallParticipants`, id 0x8CA60525.
final class phone_deleteConferenceCallParticipants
{
    enum uint tlId = 0x8CA60525;

    uint flags;
    bool only_left;
    bool kick;
    InputGroupCall call;
    Vector!(long) ids;
    ubyte[] block;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.sendConferenceCallBroadcast`, id 0xC6701900.
final class phone_sendConferenceCallBroadcast
{
    enum uint tlId = 0xC6701900;

    InputGroupCall call;
    ubyte[] block;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.inviteConferenceCallParticipant`, id 0xBCF22685.
final class phone_inviteConferenceCallParticipant
{
    enum uint tlId = 0xBCF22685;

    uint flags;
    bool video;
    InputGroupCall call;
    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.declineConferenceCallInvite`, id 0x3C479971.
final class phone_declineConferenceCallInvite
{
    enum uint tlId = 0x3C479971;

    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.getGroupCallChainBlocks`, id 0xEE9F88A6.
final class phone_getGroupCallChainBlocks
{
    enum uint tlId = 0xEE9F88A6;

    InputGroupCall call;
    int sub_chain_id;
    int offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.sendGroupCallMessage`, id 0xB1D11410.
final class phone_sendGroupCallMessage
{
    enum uint tlId = 0xB1D11410;

    uint flags;
    InputGroupCall call;
    long random_id;
    TextWithEntities message;
    long allow_paid_stars;
    InputPeer send_as;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.sendGroupCallEncryptedMessage`, id 0xE5AFA56D.
final class phone_sendGroupCallEncryptedMessage
{
    enum uint tlId = 0xE5AFA56D;

    InputGroupCall call;
    ubyte[] encrypted_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.deleteGroupCallMessages`, id 0xF64F54F7.
final class phone_deleteGroupCallMessages
{
    enum uint tlId = 0xF64F54F7;

    uint flags;
    bool report_spam;
    InputGroupCall call;
    Vector!(int) messages;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.deleteGroupCallParticipantMessages`, id 0x1DBFECA0.
final class phone_deleteGroupCallParticipantMessages
{
    enum uint tlId = 0x1DBFECA0;

    uint flags;
    bool report_spam;
    InputGroupCall call;
    InputPeer participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.getGroupCallStars`, id 0x6F636302.
final class phone_getGroupCallStars
{
    enum uint tlId = 0x6F636302;

    InputGroupCall call;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `phone.saveDefaultSendAs`, id 0x4167ADD1.
final class phone_saveDefaultSendAs
{
    enum uint tlId = 0x4167ADD1;

    InputGroupCall call;
    InputPeer send_as;

    override uint tlIdValue() const nothrow { return tlId; }
}

