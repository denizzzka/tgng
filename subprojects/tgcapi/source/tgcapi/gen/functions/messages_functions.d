/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.messages_functions;

/// TL function `messages.getMessages`, id 0x63C66506.
final class messages_getMessages
{
    enum uint tlId = 0x63C66506;

    Vector!(InputMessage) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getDialogs`, id 0xA0F4CB4F.
final class messages_getDialogs
{
    enum uint tlId = 0xA0F4CB4F;

    uint flags;
    bool exclude_pinned;
    int folder_id;
    int offset_date;
    int offset_id;
    InputPeer offset_peer;
    int limit;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getHistory`, id 0x4423E6C5.
final class messages_getHistory
{
    enum uint tlId = 0x4423E6C5;

    InputPeer peer;
    int offset_id;
    int offset_date;
    int add_offset;
    int limit;
    int max_id;
    int min_id;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.search`, id 0x29EE847A.
final class messages_search
{
    enum uint tlId = 0x29EE847A;

    uint flags;
    InputPeer peer;
    string q;
    InputPeer from_id;
    InputPeer saved_peer_id;
    Vector!(Reaction) saved_reaction;
    int top_msg_id;
    MessagesFilter filter;
    int min_date;
    int max_date;
    int offset_id;
    int add_offset;
    int limit;
    int max_id;
    int min_id;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.readHistory`, id 0x0E306D3A.
final class messages_readHistory
{
    enum uint tlId = 0x0E306D3A;

    InputPeer peer;
    int max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteHistory`, id 0xB08F922A.
final class messages_deleteHistory
{
    enum uint tlId = 0xB08F922A;

    uint flags;
    bool just_clear;
    bool revoke;
    InputPeer peer;
    int max_id;
    int min_date;
    int max_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteMessages`, id 0xE58E95D2.
final class messages_deleteMessages
{
    enum uint tlId = 0xE58E95D2;

    uint flags;
    bool revoke;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.receivedMessages`, id 0x05A954C0.
final class messages_receivedMessages
{
    enum uint tlId = 0x05A954C0;

    int max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setTyping`, id 0x58943EE2.
final class messages_setTyping
{
    enum uint tlId = 0x58943EE2;

    uint flags;
    InputPeer peer;
    int top_msg_id;
    SendMessageAction action;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendMessage`, id 0xFEF48F62.
final class messages_sendMessage
{
    enum uint tlId = 0xFEF48F62;

    uint flags;
    bool no_webpage;
    bool silent;
    bool background;
    bool clear_draft;
    bool noforwards;
    bool update_stickersets_order;
    bool invert_media;
    bool allow_paid_floodskip;
    InputPeer peer;
    InputReplyTo reply_to;
    string message;
    long random_id;
    ReplyMarkup reply_markup;
    Vector!(MessageEntity) entities;
    int schedule_date;
    int schedule_repeat_period;
    InputPeer send_as;
    InputQuickReplyShortcut quick_reply_shortcut;
    long effect;
    long allow_paid_stars;
    SuggestedPost suggested_post;
    InputRichMessage rich_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendMedia`, id 0x0330E77F.
final class messages_sendMedia
{
    enum uint tlId = 0x0330E77F;

    uint flags;
    bool silent;
    bool background;
    bool clear_draft;
    bool noforwards;
    bool update_stickersets_order;
    bool invert_media;
    bool allow_paid_floodskip;
    InputPeer peer;
    InputReplyTo reply_to;
    InputMedia media;
    string message;
    long random_id;
    ReplyMarkup reply_markup;
    Vector!(MessageEntity) entities;
    int schedule_date;
    int schedule_repeat_period;
    InputPeer send_as;
    InputQuickReplyShortcut quick_reply_shortcut;
    long effect;
    long allow_paid_stars;
    SuggestedPost suggested_post;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.forwardMessages`, id 0x13704A7C.
final class messages_forwardMessages
{
    enum uint tlId = 0x13704A7C;

    uint flags;
    bool silent;
    bool background;
    bool with_my_score;
    bool drop_author;
    bool drop_media_captions;
    bool noforwards;
    bool allow_paid_floodskip;
    bool from_ephemeral;
    InputPeer from_peer;
    Vector!(int) id;
    Vector!(long) random_id;
    InputPeer to_peer;
    int top_msg_id;
    InputReplyTo reply_to;
    int schedule_date;
    int schedule_repeat_period;
    InputPeer send_as;
    InputQuickReplyShortcut quick_reply_shortcut;
    long effect;
    int video_timestamp;
    long allow_paid_stars;
    SuggestedPost suggested_post;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.reportSpam`, id 0xCF1592DB.
final class messages_reportSpam
{
    enum uint tlId = 0xCF1592DB;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getPeerSettings`, id 0xEFD9A6A2.
final class messages_getPeerSettings
{
    enum uint tlId = 0xEFD9A6A2;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.report`, id 0xFC78AF9B.
final class messages_report
{
    enum uint tlId = 0xFC78AF9B;

    InputPeer peer;
    Vector!(int) id;
    ubyte[] option;
    string message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getChats`, id 0x49E9528F.
final class messages_getChats
{
    enum uint tlId = 0x49E9528F;

    Vector!(long) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getFullChat`, id 0xAEB00B34.
final class messages_getFullChat
{
    enum uint tlId = 0xAEB00B34;

    long chat_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editChatTitle`, id 0x73783FFD.
final class messages_editChatTitle
{
    enum uint tlId = 0x73783FFD;

    long chat_id;
    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editChatPhoto`, id 0x35DDD674.
final class messages_editChatPhoto
{
    enum uint tlId = 0x35DDD674;

    long chat_id;
    InputChatPhoto photo;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.addChatUser`, id 0xCBC6D107.
final class messages_addChatUser
{
    enum uint tlId = 0xCBC6D107;

    long chat_id;
    InputUser user_id;
    int fwd_limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteChatUser`, id 0xA2185CAB.
final class messages_deleteChatUser
{
    enum uint tlId = 0xA2185CAB;

    uint flags;
    bool revoke_history;
    long chat_id;
    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.createChat`, id 0x92CEDDD4.
final class messages_createChat
{
    enum uint tlId = 0x92CEDDD4;

    uint flags;
    Vector!(InputUser) users;
    string title;
    int ttl_period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getDhConfig`, id 0x26CF8950.
final class messages_getDhConfig
{
    enum uint tlId = 0x26CF8950;

    int version_;
    int random_length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.requestEncryption`, id 0xF64DAF43.
final class messages_requestEncryption
{
    enum uint tlId = 0xF64DAF43;

    InputUser user_id;
    int random_id;
    ubyte[] g_a;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.acceptEncryption`, id 0x3DBC0415.
final class messages_acceptEncryption
{
    enum uint tlId = 0x3DBC0415;

    InputEncryptedChat peer;
    ubyte[] g_b;
    long key_fingerprint;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.discardEncryption`, id 0xF393AEA0.
final class messages_discardEncryption
{
    enum uint tlId = 0xF393AEA0;

    uint flags;
    bool delete_history;
    int chat_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setEncryptedTyping`, id 0x791451ED.
final class messages_setEncryptedTyping
{
    enum uint tlId = 0x791451ED;

    InputEncryptedChat peer;
    bool typing;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.readEncryptedHistory`, id 0x7F4B690A.
final class messages_readEncryptedHistory
{
    enum uint tlId = 0x7F4B690A;

    InputEncryptedChat peer;
    int max_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendEncrypted`, id 0x44FA7A15.
final class messages_sendEncrypted
{
    enum uint tlId = 0x44FA7A15;

    uint flags;
    bool silent;
    InputEncryptedChat peer;
    long random_id;
    ubyte[] data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendEncryptedFile`, id 0x5559481D.
final class messages_sendEncryptedFile
{
    enum uint tlId = 0x5559481D;

    uint flags;
    bool silent;
    InputEncryptedChat peer;
    long random_id;
    ubyte[] data;
    InputEncryptedFile file;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendEncryptedService`, id 0x32D439A4.
final class messages_sendEncryptedService
{
    enum uint tlId = 0x32D439A4;

    InputEncryptedChat peer;
    long random_id;
    ubyte[] data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.receivedQueue`, id 0x55A5BB66.
final class messages_receivedQueue
{
    enum uint tlId = 0x55A5BB66;

    int max_qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.reportEncryptedSpam`, id 0x4B0C8C0F.
final class messages_reportEncryptedSpam
{
    enum uint tlId = 0x4B0C8C0F;

    InputEncryptedChat peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.readMessageContents`, id 0x36A73F77.
final class messages_readMessageContents
{
    enum uint tlId = 0x36A73F77;

    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getStickers`, id 0xD5A5D3A1.
final class messages_getStickers
{
    enum uint tlId = 0xD5A5D3A1;

    string emoticon;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getAllStickers`, id 0xB8A0A1A8.
final class messages_getAllStickers
{
    enum uint tlId = 0xB8A0A1A8;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getWebPagePreview`, id 0x570D6F6F.
final class messages_getWebPagePreview
{
    enum uint tlId = 0x570D6F6F;

    uint flags;
    string message;
    Vector!(MessageEntity) entities;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.exportChatInvite`, id 0xA455DE90.
final class messages_exportChatInvite
{
    enum uint tlId = 0xA455DE90;

    uint flags;
    bool legacy_revoke_permanent;
    bool request_needed;
    InputPeer peer;
    int expire_date;
    int usage_limit;
    string title;
    StarsSubscriptionPricing subscription_pricing;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.checkChatInvite`, id 0x3EADB1BB.
final class messages_checkChatInvite
{
    enum uint tlId = 0x3EADB1BB;

    string hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.importChatInvite`, id 0xDE91436E.
final class messages_importChatInvite
{
    enum uint tlId = 0xDE91436E;

    string hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getStickerSet`, id 0xC8A0EC74.
final class messages_getStickerSet
{
    enum uint tlId = 0xC8A0EC74;

    InputStickerSet stickerset;
    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.installStickerSet`, id 0xC78FE460.
final class messages_installStickerSet
{
    enum uint tlId = 0xC78FE460;

    InputStickerSet stickerset;
    bool archived;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.uninstallStickerSet`, id 0xF96E55DE.
final class messages_uninstallStickerSet
{
    enum uint tlId = 0xF96E55DE;

    InputStickerSet stickerset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.startBot`, id 0xE6DF7378.
final class messages_startBot
{
    enum uint tlId = 0xE6DF7378;

    InputUser bot;
    InputPeer peer;
    long random_id;
    string start_param;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getMessagesViews`, id 0x5784D3E1.
final class messages_getMessagesViews
{
    enum uint tlId = 0x5784D3E1;

    InputPeer peer;
    Vector!(int) id;
    bool increment;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editChatAdmin`, id 0xA85BD1C2.
final class messages_editChatAdmin
{
    enum uint tlId = 0xA85BD1C2;

    long chat_id;
    InputUser user_id;
    bool is_admin;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.migrateChat`, id 0xA2875319.
final class messages_migrateChat
{
    enum uint tlId = 0xA2875319;

    long chat_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.searchGlobal`, id 0x6126A43C.
final class messages_searchGlobal
{
    enum uint tlId = 0x6126A43C;

    uint flags;
    bool broadcasts_only;
    bool groups_only;
    bool users_only;
    int folder_id;
    InputChannel community;
    string q;
    MessagesFilter filter;
    int min_date;
    int max_date;
    int offset_rate;
    InputPeer offset_peer;
    int offset_id;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.reorderStickerSets`, id 0x78337739.
final class messages_reorderStickerSets
{
    enum uint tlId = 0x78337739;

    uint flags;
    bool masks;
    bool emojis;
    Vector!(long) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getDocumentByHash`, id 0xB1F2061F.
final class messages_getDocumentByHash
{
    enum uint tlId = 0xB1F2061F;

    ubyte[] sha256;
    long size;
    string mime_type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getSavedGifs`, id 0x5CF09635.
final class messages_getSavedGifs
{
    enum uint tlId = 0x5CF09635;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.saveGif`, id 0x327A30CB.
final class messages_saveGif
{
    enum uint tlId = 0x327A30CB;

    InputDocument id;
    bool unsave;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getInlineBotResults`, id 0x514E999D.
final class messages_getInlineBotResults
{
    enum uint tlId = 0x514E999D;

    uint flags;
    InputUser bot;
    InputPeer peer;
    InputGeoPoint geo_point;
    string query;
    string offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setInlineBotResults`, id 0xBB12A419.
final class messages_setInlineBotResults
{
    enum uint tlId = 0xBB12A419;

    uint flags;
    bool gallery;
    bool private_;
    long query_id;
    Vector!(InputBotInlineResult) results;
    int cache_time;
    string next_offset;
    InlineBotSwitchPM switch_pm;
    InlineBotWebView switch_webview;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendInlineBotResult`, id 0xC0CF7646.
final class messages_sendInlineBotResult
{
    enum uint tlId = 0xC0CF7646;

    uint flags;
    bool silent;
    bool background;
    bool clear_draft;
    bool hide_via;
    InputPeer peer;
    InputReplyTo reply_to;
    long random_id;
    long query_id;
    string id;
    int schedule_date;
    InputPeer send_as;
    InputQuickReplyShortcut quick_reply_shortcut;
    long allow_paid_stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getMessageEditData`, id 0xFDA68D36.
final class messages_getMessageEditData
{
    enum uint tlId = 0xFDA68D36;

    InputPeer peer;
    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editMessage`, id 0xB106E66C.
final class messages_editMessage
{
    enum uint tlId = 0xB106E66C;

    uint flags;
    bool no_webpage;
    bool invert_media;
    InputPeer peer;
    int id;
    string message;
    InputMedia media;
    ReplyMarkup reply_markup;
    Vector!(MessageEntity) entities;
    int schedule_date;
    int schedule_repeat_period;
    int quick_reply_shortcut_id;
    InputRichMessage rich_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editInlineBotMessage`, id 0xA423BB51.
final class messages_editInlineBotMessage
{
    enum uint tlId = 0xA423BB51;

    uint flags;
    bool no_webpage;
    bool invert_media;
    InputBotInlineMessageID id;
    string message;
    InputMedia media;
    ReplyMarkup reply_markup;
    Vector!(MessageEntity) entities;
    InputRichMessage rich_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getBotCallbackAnswer`, id 0x9342CA07.
final class messages_getBotCallbackAnswer
{
    enum uint tlId = 0x9342CA07;

    uint flags;
    bool game;
    InputPeer peer;
    int msg_id;
    ubyte[] data;
    InputCheckPasswordSRP password;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setBotCallbackAnswer`, id 0xD58F130A.
final class messages_setBotCallbackAnswer
{
    enum uint tlId = 0xD58F130A;

    uint flags;
    bool alert;
    long query_id;
    string message;
    string url;
    int cache_time;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getPeerDialogs`, id 0xE470BCFD.
final class messages_getPeerDialogs
{
    enum uint tlId = 0xE470BCFD;

    Vector!(InputDialogPeer) peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.saveDraft`, id 0xAD0FA15C.
final class messages_saveDraft
{
    enum uint tlId = 0xAD0FA15C;

    uint flags;
    bool no_webpage;
    bool invert_media;
    InputReplyTo reply_to;
    InputPeer peer;
    string message;
    Vector!(MessageEntity) entities;
    InputMedia media;
    long effect;
    SuggestedPost suggested_post;
    InputRichMessage rich_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getAllDrafts`, id 0x6A3F8D65.
final class messages_getAllDrafts
{
    enum uint tlId = 0x6A3F8D65;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getFeaturedStickers`, id 0x64780B14.
final class messages_getFeaturedStickers
{
    enum uint tlId = 0x64780B14;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.readFeaturedStickers`, id 0x5B118126.
final class messages_readFeaturedStickers
{
    enum uint tlId = 0x5B118126;

    Vector!(long) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getRecentStickers`, id 0x9DA9403B.
final class messages_getRecentStickers
{
    enum uint tlId = 0x9DA9403B;

    uint flags;
    bool attached;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.saveRecentSticker`, id 0x392718F8.
final class messages_saveRecentSticker
{
    enum uint tlId = 0x392718F8;

    uint flags;
    bool attached;
    InputDocument id;
    bool unsave;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.clearRecentStickers`, id 0x8999602D.
final class messages_clearRecentStickers
{
    enum uint tlId = 0x8999602D;

    uint flags;
    bool attached;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getArchivedStickers`, id 0x57F17692.
final class messages_getArchivedStickers
{
    enum uint tlId = 0x57F17692;

    uint flags;
    bool masks;
    bool emojis;
    long offset_id;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getMaskStickers`, id 0x640F82B8.
final class messages_getMaskStickers
{
    enum uint tlId = 0x640F82B8;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getAttachedStickers`, id 0xCC5B67CC.
final class messages_getAttachedStickers
{
    enum uint tlId = 0xCC5B67CC;

    InputStickeredMedia media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setGameScore`, id 0x8EF8ECC0.
final class messages_setGameScore
{
    enum uint tlId = 0x8EF8ECC0;

    uint flags;
    bool edit_message;
    bool force;
    InputPeer peer;
    int id;
    InputUser user_id;
    int score;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setInlineGameScore`, id 0x15AD9F64.
final class messages_setInlineGameScore
{
    enum uint tlId = 0x15AD9F64;

    uint flags;
    bool edit_message;
    bool force;
    InputBotInlineMessageID id;
    InputUser user_id;
    int score;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getGameHighScores`, id 0xE822649D.
final class messages_getGameHighScores
{
    enum uint tlId = 0xE822649D;

    InputPeer peer;
    int id;
    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getInlineGameHighScores`, id 0x0F635E1B.
final class messages_getInlineGameHighScores
{
    enum uint tlId = 0x0F635E1B;

    InputBotInlineMessageID id;
    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getCommonChats`, id 0xE40CA104.
final class messages_getCommonChats
{
    enum uint tlId = 0xE40CA104;

    InputUser user_id;
    long max_id;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getWebPage`, id 0x8D9692A3.
final class messages_getWebPage
{
    enum uint tlId = 0x8D9692A3;

    string url;
    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.toggleDialogPin`, id 0xA731E257.
final class messages_toggleDialogPin
{
    enum uint tlId = 0xA731E257;

    uint flags;
    bool pinned;
    InputDialogPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.reorderPinnedDialogs`, id 0x3B1ADF37.
final class messages_reorderPinnedDialogs
{
    enum uint tlId = 0x3B1ADF37;

    uint flags;
    bool force;
    int folder_id;
    Vector!(InputDialogPeer) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getPinnedDialogs`, id 0xD6B94DF2.
final class messages_getPinnedDialogs
{
    enum uint tlId = 0xD6B94DF2;

    int folder_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setBotShippingResults`, id 0xE5F672FA.
final class messages_setBotShippingResults
{
    enum uint tlId = 0xE5F672FA;

    uint flags;
    long query_id;
    string error;
    Vector!(ShippingOption) shipping_options;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setBotPrecheckoutResults`, id 0x09C2DD95.
final class messages_setBotPrecheckoutResults
{
    enum uint tlId = 0x09C2DD95;

    uint flags;
    bool success;
    long query_id;
    string error;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.uploadMedia`, id 0x14967978.
final class messages_uploadMedia
{
    enum uint tlId = 0x14967978;

    uint flags;
    string business_connection_id;
    InputPeer peer;
    InputMedia media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendScreenshotNotification`, id 0xA1405817.
final class messages_sendScreenshotNotification
{
    enum uint tlId = 0xA1405817;

    InputPeer peer;
    InputReplyTo reply_to;
    long random_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getFavedStickers`, id 0x04F1AAA9.
final class messages_getFavedStickers
{
    enum uint tlId = 0x04F1AAA9;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.faveSticker`, id 0xB9FFC55B.
final class messages_faveSticker
{
    enum uint tlId = 0xB9FFC55B;

    InputDocument id;
    bool unfave;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getUnreadMentions`, id 0xF107E790.
final class messages_getUnreadMentions
{
    enum uint tlId = 0xF107E790;

    uint flags;
    InputPeer peer;
    int top_msg_id;
    int offset_id;
    int add_offset;
    int limit;
    int max_id;
    int min_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.readMentions`, id 0x36E5BF4D.
final class messages_readMentions
{
    enum uint tlId = 0x36E5BF4D;

    uint flags;
    InputPeer peer;
    int top_msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getRecentLocations`, id 0x702A40E0.
final class messages_getRecentLocations
{
    enum uint tlId = 0x702A40E0;

    InputPeer peer;
    int limit;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendMultiMedia`, id 0x1BF89D74.
final class messages_sendMultiMedia
{
    enum uint tlId = 0x1BF89D74;

    uint flags;
    bool silent;
    bool background;
    bool clear_draft;
    bool noforwards;
    bool update_stickersets_order;
    bool invert_media;
    bool allow_paid_floodskip;
    InputPeer peer;
    InputReplyTo reply_to;
    Vector!(InputSingleMedia) multi_media;
    int schedule_date;
    InputPeer send_as;
    InputQuickReplyShortcut quick_reply_shortcut;
    long effect;
    long allow_paid_stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.uploadEncryptedFile`, id 0x5057C497.
final class messages_uploadEncryptedFile
{
    enum uint tlId = 0x5057C497;

    InputEncryptedChat peer;
    InputEncryptedFile file;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.searchStickerSets`, id 0x35705B8A.
final class messages_searchStickerSets
{
    enum uint tlId = 0x35705B8A;

    uint flags;
    bool exclude_featured;
    string q;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getSplitRanges`, id 0x1CFF7E08.
final class messages_getSplitRanges
{
    enum uint tlId = 0x1CFF7E08;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.markDialogUnread`, id 0x8C5006F8.
final class messages_markDialogUnread
{
    enum uint tlId = 0x8C5006F8;

    uint flags;
    bool unread;
    InputPeer parent_peer;
    InputDialogPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getDialogUnreadMarks`, id 0x21202222.
final class messages_getDialogUnreadMarks
{
    enum uint tlId = 0x21202222;

    uint flags;
    InputPeer parent_peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.clearAllDrafts`, id 0x7E58EE9C.
final class messages_clearAllDrafts
{
    enum uint tlId = 0x7E58EE9C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.updatePinnedMessage`, id 0xD2AAF7EC.
final class messages_updatePinnedMessage
{
    enum uint tlId = 0xD2AAF7EC;

    uint flags;
    bool silent;
    bool unpin;
    bool pm_oneside;
    InputPeer peer;
    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendVote`, id 0x10EA6184.
final class messages_sendVote
{
    enum uint tlId = 0x10EA6184;

    InputPeer peer;
    int msg_id;
    Vector!(ubyte[]) options;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getPollResults`, id 0xEDA3E33B.
final class messages_getPollResults
{
    enum uint tlId = 0xEDA3E33B;

    InputPeer peer;
    int msg_id;
    long poll_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getOnlines`, id 0x6E2BE050.
final class messages_getOnlines
{
    enum uint tlId = 0x6E2BE050;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editChatAbout`, id 0xDEF60797.
final class messages_editChatAbout
{
    enum uint tlId = 0xDEF60797;

    InputPeer peer;
    string about;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editChatDefaultBannedRights`, id 0xA5866B41.
final class messages_editChatDefaultBannedRights
{
    enum uint tlId = 0xA5866B41;

    InputPeer peer;
    ChatBannedRights banned_rights;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getEmojiKeywords`, id 0x35A0E062.
final class messages_getEmojiKeywords
{
    enum uint tlId = 0x35A0E062;

    string lang_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getEmojiKeywordsDifference`, id 0x1508B6AF.
final class messages_getEmojiKeywordsDifference
{
    enum uint tlId = 0x1508B6AF;

    string lang_code;
    int from_version;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getEmojiKeywordsLanguages`, id 0x4E9963B2.
final class messages_getEmojiKeywordsLanguages
{
    enum uint tlId = 0x4E9963B2;

    Vector!(string) lang_codes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getEmojiURL`, id 0xD5B10C26.
final class messages_getEmojiURL
{
    enum uint tlId = 0xD5B10C26;

    string lang_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getSearchCounters`, id 0x1BBCF300.
final class messages_getSearchCounters
{
    enum uint tlId = 0x1BBCF300;

    uint flags;
    InputPeer peer;
    InputPeer saved_peer_id;
    int top_msg_id;
    Vector!(MessagesFilter) filters;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.requestUrlAuth`, id 0x894CC99C.
final class messages_requestUrlAuth
{
    enum uint tlId = 0x894CC99C;

    uint flags;
    InputPeer peer;
    int msg_id;
    int button_id;
    string url;
    string in_app_origin;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.acceptUrlAuth`, id 0x67A3F0DE.
final class messages_acceptUrlAuth
{
    enum uint tlId = 0x67A3F0DE;

    uint flags;
    bool write_allowed;
    bool share_phone_number;
    InputPeer peer;
    int msg_id;
    int button_id;
    string url;
    string match_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.hidePeerSettingsBar`, id 0x4FACB138.
final class messages_hidePeerSettingsBar
{
    enum uint tlId = 0x4FACB138;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getScheduledHistory`, id 0xF516760B.
final class messages_getScheduledHistory
{
    enum uint tlId = 0xF516760B;

    InputPeer peer;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getScheduledMessages`, id 0xBDBB0464.
final class messages_getScheduledMessages
{
    enum uint tlId = 0xBDBB0464;

    InputPeer peer;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendScheduledMessages`, id 0xBD38850A.
final class messages_sendScheduledMessages
{
    enum uint tlId = 0xBD38850A;

    InputPeer peer;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteScheduledMessages`, id 0x59AE2B16.
final class messages_deleteScheduledMessages
{
    enum uint tlId = 0x59AE2B16;

    InputPeer peer;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getPollVotes`, id 0xB86E380E.
final class messages_getPollVotes
{
    enum uint tlId = 0xB86E380E;

    uint flags;
    InputPeer peer;
    int id;
    ubyte[] option;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.toggleStickerSets`, id 0xB5052FEA.
final class messages_toggleStickerSets
{
    enum uint tlId = 0xB5052FEA;

    uint flags;
    bool uninstall;
    bool archive;
    bool unarchive;
    Vector!(InputStickerSet) stickersets;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getDialogFilters`, id 0xEFD48C89.
final class messages_getDialogFilters
{
    enum uint tlId = 0xEFD48C89;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getSuggestedDialogFilters`, id 0xA29CD42C.
final class messages_getSuggestedDialogFilters
{
    enum uint tlId = 0xA29CD42C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.updateDialogFilter`, id 0x1AD4A04A.
final class messages_updateDialogFilter
{
    enum uint tlId = 0x1AD4A04A;

    uint flags;
    int id;
    DialogFilter filter;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.updateDialogFiltersOrder`, id 0xC563C1E4.
final class messages_updateDialogFiltersOrder
{
    enum uint tlId = 0xC563C1E4;

    Vector!(int) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getOldFeaturedStickers`, id 0x7ED094A1.
final class messages_getOldFeaturedStickers
{
    enum uint tlId = 0x7ED094A1;

    int offset;
    int limit;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getReplies`, id 0x22DDD30C.
final class messages_getReplies
{
    enum uint tlId = 0x22DDD30C;

    InputPeer peer;
    int msg_id;
    int offset_id;
    int offset_date;
    int add_offset;
    int limit;
    int max_id;
    int min_id;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getDiscussionMessage`, id 0x446972FD.
final class messages_getDiscussionMessage
{
    enum uint tlId = 0x446972FD;

    InputPeer peer;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.readDiscussion`, id 0xF731A9F4.
final class messages_readDiscussion
{
    enum uint tlId = 0xF731A9F4;

    InputPeer peer;
    int msg_id;
    int read_max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.unpinAllMessages`, id 0x062DD747.
final class messages_unpinAllMessages
{
    enum uint tlId = 0x062DD747;

    uint flags;
    InputPeer peer;
    int top_msg_id;
    InputPeer saved_peer_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteChat`, id 0x5BD0EE50.
final class messages_deleteChat
{
    enum uint tlId = 0x5BD0EE50;

    long chat_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deletePhoneCallHistory`, id 0xF9CBE409.
final class messages_deletePhoneCallHistory
{
    enum uint tlId = 0xF9CBE409;

    uint flags;
    bool revoke;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.checkHistoryImport`, id 0x43FE19F3.
final class messages_checkHistoryImport
{
    enum uint tlId = 0x43FE19F3;

    string import_head;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.initHistoryImport`, id 0x34090C3B.
final class messages_initHistoryImport
{
    enum uint tlId = 0x34090C3B;

    InputPeer peer;
    InputFile file;
    int media_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.uploadImportedMedia`, id 0x2A862092.
final class messages_uploadImportedMedia
{
    enum uint tlId = 0x2A862092;

    InputPeer peer;
    long import_id;
    string file_name;
    InputMedia media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.startHistoryImport`, id 0xB43DF344.
final class messages_startHistoryImport
{
    enum uint tlId = 0xB43DF344;

    InputPeer peer;
    long import_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getExportedChatInvites`, id 0xA2B5A3F6.
final class messages_getExportedChatInvites
{
    enum uint tlId = 0xA2B5A3F6;

    uint flags;
    bool revoked;
    InputPeer peer;
    InputUser admin_id;
    int offset_date;
    string offset_link;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getExportedChatInvite`, id 0x73746F5C.
final class messages_getExportedChatInvite
{
    enum uint tlId = 0x73746F5C;

    InputPeer peer;
    string link;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editExportedChatInvite`, id 0xBDCA2F75.
final class messages_editExportedChatInvite
{
    enum uint tlId = 0xBDCA2F75;

    uint flags;
    bool revoked;
    InputPeer peer;
    string link;
    int expire_date;
    int usage_limit;
    bool request_needed;
    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteRevokedExportedChatInvites`, id 0x56987BD5.
final class messages_deleteRevokedExportedChatInvites
{
    enum uint tlId = 0x56987BD5;

    InputPeer peer;
    InputUser admin_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteExportedChatInvite`, id 0xD464A42B.
final class messages_deleteExportedChatInvite
{
    enum uint tlId = 0xD464A42B;

    InputPeer peer;
    string link;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getAdminsWithInvites`, id 0x3920E6EF.
final class messages_getAdminsWithInvites
{
    enum uint tlId = 0x3920E6EF;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getChatInviteImporters`, id 0xDF04DD4E.
final class messages_getChatInviteImporters
{
    enum uint tlId = 0xDF04DD4E;

    uint flags;
    bool requested;
    bool subscription_expired;
    InputPeer peer;
    string link;
    string q;
    int offset_date;
    InputUser offset_user;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setHistoryTTL`, id 0xB80E5FE4.
final class messages_setHistoryTTL
{
    enum uint tlId = 0xB80E5FE4;

    InputPeer peer;
    int period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.checkHistoryImportPeer`, id 0x5DC60F03.
final class messages_checkHistoryImportPeer
{
    enum uint tlId = 0x5DC60F03;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setChatTheme`, id 0x081202C9.
final class messages_setChatTheme
{
    enum uint tlId = 0x081202C9;

    InputPeer peer;
    InputChatTheme theme;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getMessageReadParticipants`, id 0x31C1C44F.
final class messages_getMessageReadParticipants
{
    enum uint tlId = 0x31C1C44F;

    InputPeer peer;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getSearchResultsCalendar`, id 0x6AA3F6BD.
final class messages_getSearchResultsCalendar
{
    enum uint tlId = 0x6AA3F6BD;

    uint flags;
    InputPeer peer;
    InputPeer saved_peer_id;
    MessagesFilter filter;
    int offset_id;
    int offset_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getSearchResultsPositions`, id 0x9C7F2F10.
final class messages_getSearchResultsPositions
{
    enum uint tlId = 0x9C7F2F10;

    uint flags;
    InputPeer peer;
    InputPeer saved_peer_id;
    MessagesFilter filter;
    int offset_id;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.hideChatJoinRequest`, id 0x7FE7E815.
final class messages_hideChatJoinRequest
{
    enum uint tlId = 0x7FE7E815;

    uint flags;
    bool approved;
    InputPeer peer;
    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.hideAllChatJoinRequests`, id 0xE085F4EA.
final class messages_hideAllChatJoinRequests
{
    enum uint tlId = 0xE085F4EA;

    uint flags;
    bool approved;
    InputPeer peer;
    string link;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.toggleNoForwards`, id 0xB2081A35.
final class messages_toggleNoForwards
{
    enum uint tlId = 0xB2081A35;

    uint flags;
    InputPeer peer;
    bool enabled;
    int request_msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.saveDefaultSendAs`, id 0xCCFDDF96.
final class messages_saveDefaultSendAs
{
    enum uint tlId = 0xCCFDDF96;

    InputPeer peer;
    InputPeer send_as;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendReaction`, id 0xD30D78D4.
final class messages_sendReaction
{
    enum uint tlId = 0xD30D78D4;

    uint flags;
    bool big;
    bool add_to_recent;
    InputPeer peer;
    int msg_id;
    Vector!(Reaction) reaction;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getMessagesReactions`, id 0x8BBA90E6.
final class messages_getMessagesReactions
{
    enum uint tlId = 0x8BBA90E6;

    InputPeer peer;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getMessageReactionsList`, id 0x461B3F48.
final class messages_getMessageReactionsList
{
    enum uint tlId = 0x461B3F48;

    uint flags;
    InputPeer peer;
    int id;
    Reaction reaction;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setChatAvailableReactions`, id 0x864B2581.
final class messages_setChatAvailableReactions
{
    enum uint tlId = 0x864B2581;

    uint flags;
    InputPeer peer;
    ChatReactions available_reactions;
    int reactions_limit;
    bool paid_enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getAvailableReactions`, id 0x18DEA0AC.
final class messages_getAvailableReactions
{
    enum uint tlId = 0x18DEA0AC;

    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setDefaultReaction`, id 0x4F47A016.
final class messages_setDefaultReaction
{
    enum uint tlId = 0x4F47A016;

    Reaction reaction;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.translateText`, id 0xA5EEC345.
final class messages_translateText
{
    enum uint tlId = 0xA5EEC345;

    uint flags;
    InputPeer peer;
    Vector!(int) id;
    Vector!(TextWithEntities) text;
    string to_lang;
    string tone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getUnreadReactions`, id 0xBD7F90AC.
final class messages_getUnreadReactions
{
    enum uint tlId = 0xBD7F90AC;

    uint flags;
    InputPeer peer;
    int top_msg_id;
    InputPeer saved_peer_id;
    int offset_id;
    int add_offset;
    int limit;
    int max_id;
    int min_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.readReactions`, id 0x9EC44F93.
final class messages_readReactions
{
    enum uint tlId = 0x9EC44F93;

    uint flags;
    InputPeer peer;
    int top_msg_id;
    InputPeer saved_peer_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.searchSentMedia`, id 0x107E31A0.
final class messages_searchSentMedia
{
    enum uint tlId = 0x107E31A0;

    string q;
    MessagesFilter filter;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getAttachMenuBots`, id 0x16FCC2CB.
final class messages_getAttachMenuBots
{
    enum uint tlId = 0x16FCC2CB;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getAttachMenuBot`, id 0x77216192.
final class messages_getAttachMenuBot
{
    enum uint tlId = 0x77216192;

    InputUser bot;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.toggleBotInAttachMenu`, id 0x69F59D69.
final class messages_toggleBotInAttachMenu
{
    enum uint tlId = 0x69F59D69;

    uint flags;
    bool write_allowed;
    InputUser bot;
    bool enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.requestWebView`, id 0x269DC2C1.
final class messages_requestWebView
{
    enum uint tlId = 0x269DC2C1;

    uint flags;
    bool from_bot_menu;
    bool silent;
    bool compact;
    bool fullscreen;
    InputPeer peer;
    InputUser bot;
    string url;
    string start_param;
    DataJSON theme_params;
    string platform;
    InputReplyTo reply_to;
    InputPeer send_as;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.prolongWebView`, id 0xB0D81A83.
final class messages_prolongWebView
{
    enum uint tlId = 0xB0D81A83;

    uint flags;
    bool silent;
    InputPeer peer;
    InputUser bot;
    long query_id;
    InputReplyTo reply_to;
    InputPeer send_as;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.requestSimpleWebView`, id 0x413A3E73.
final class messages_requestSimpleWebView
{
    enum uint tlId = 0x413A3E73;

    uint flags;
    bool from_switch_webview;
    bool from_side_menu;
    bool compact;
    bool fullscreen;
    InputUser bot;
    string url;
    string start_param;
    DataJSON theme_params;
    string platform;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendWebViewResultMessage`, id 0x0A4314F5.
final class messages_sendWebViewResultMessage
{
    enum uint tlId = 0x0A4314F5;

    string bot_query_id;
    InputBotInlineResult result;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendWebViewData`, id 0xDC0242C8.
final class messages_sendWebViewData
{
    enum uint tlId = 0xDC0242C8;

    InputUser bot;
    long random_id;
    string button_text;
    string data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.transcribeAudio`, id 0x269E9A49.
final class messages_transcribeAudio
{
    enum uint tlId = 0x269E9A49;

    InputPeer peer;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.rateTranscribedAudio`, id 0x7F1D072F.
final class messages_rateTranscribedAudio
{
    enum uint tlId = 0x7F1D072F;

    InputPeer peer;
    int msg_id;
    long transcription_id;
    bool good;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getCustomEmojiDocuments`, id 0xD9AB0F54.
final class messages_getCustomEmojiDocuments
{
    enum uint tlId = 0xD9AB0F54;

    Vector!(long) document_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getEmojiStickers`, id 0xFBFCA18F.
final class messages_getEmojiStickers
{
    enum uint tlId = 0xFBFCA18F;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getFeaturedEmojiStickers`, id 0x0ECF6736.
final class messages_getFeaturedEmojiStickers
{
    enum uint tlId = 0x0ECF6736;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.reportReaction`, id 0x3F64C076.
final class messages_reportReaction
{
    enum uint tlId = 0x3F64C076;

    InputPeer peer;
    int id;
    InputPeer reaction_peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getTopReactions`, id 0xBB8125BA.
final class messages_getTopReactions
{
    enum uint tlId = 0xBB8125BA;

    int limit;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getRecentReactions`, id 0x39461DB2.
final class messages_getRecentReactions
{
    enum uint tlId = 0x39461DB2;

    int limit;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.clearRecentReactions`, id 0x9DFEEFB4.
final class messages_clearRecentReactions
{
    enum uint tlId = 0x9DFEEFB4;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getExtendedMedia`, id 0x84F80814.
final class messages_getExtendedMedia
{
    enum uint tlId = 0x84F80814;

    InputPeer peer;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setDefaultHistoryTTL`, id 0x9EB51445.
final class messages_setDefaultHistoryTTL
{
    enum uint tlId = 0x9EB51445;

    int period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getDefaultHistoryTTL`, id 0x658B7188.
final class messages_getDefaultHistoryTTL
{
    enum uint tlId = 0x658B7188;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendBotRequestedPeer`, id 0x6C5CF2A7.
final class messages_sendBotRequestedPeer
{
    enum uint tlId = 0x6C5CF2A7;

    uint flags;
    InputPeer peer;
    int msg_id;
    string webapp_req_id;
    int button_id;
    Vector!(InputPeer) requested_peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getEmojiGroups`, id 0x7488CE5B.
final class messages_getEmojiGroups
{
    enum uint tlId = 0x7488CE5B;

    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getEmojiStatusGroups`, id 0x2ECD56CD.
final class messages_getEmojiStatusGroups
{
    enum uint tlId = 0x2ECD56CD;

    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getEmojiProfilePhotoGroups`, id 0x21A548F3.
final class messages_getEmojiProfilePhotoGroups
{
    enum uint tlId = 0x21A548F3;

    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.searchCustomEmoji`, id 0x2C11C0D7.
final class messages_searchCustomEmoji
{
    enum uint tlId = 0x2C11C0D7;

    string emoticon;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.togglePeerTranslations`, id 0xE47CB579.
final class messages_togglePeerTranslations
{
    enum uint tlId = 0xE47CB579;

    uint flags;
    bool disabled;
    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getBotApp`, id 0x34FDC5C3.
final class messages_getBotApp
{
    enum uint tlId = 0x34FDC5C3;

    InputBotApp app;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.requestAppWebView`, id 0x53618BCE.
final class messages_requestAppWebView
{
    enum uint tlId = 0x53618BCE;

    uint flags;
    bool write_allowed;
    bool compact;
    bool fullscreen;
    InputPeer peer;
    InputBotApp app;
    string start_param;
    DataJSON theme_params;
    string platform;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setChatWallPaper`, id 0x8FFACAE1.
final class messages_setChatWallPaper
{
    enum uint tlId = 0x8FFACAE1;

    uint flags;
    bool for_both;
    bool revert;
    InputPeer peer;
    InputWallPaper wallpaper;
    WallPaperSettings settings;
    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.searchEmojiStickerSets`, id 0x92B4494C.
final class messages_searchEmojiStickerSets
{
    enum uint tlId = 0x92B4494C;

    uint flags;
    bool exclude_featured;
    string q;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getSavedDialogs`, id 0x1E91FC99.
final class messages_getSavedDialogs
{
    enum uint tlId = 0x1E91FC99;

    uint flags;
    bool exclude_pinned;
    InputPeer parent_peer;
    int offset_date;
    int offset_id;
    InputPeer offset_peer;
    int limit;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getSavedHistory`, id 0x998AB009.
final class messages_getSavedHistory
{
    enum uint tlId = 0x998AB009;

    uint flags;
    InputPeer parent_peer;
    InputPeer peer;
    int offset_id;
    int offset_date;
    int add_offset;
    int limit;
    int max_id;
    int min_id;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteSavedHistory`, id 0x4DC5085F.
final class messages_deleteSavedHistory
{
    enum uint tlId = 0x4DC5085F;

    uint flags;
    InputPeer parent_peer;
    InputPeer peer;
    int max_id;
    int min_date;
    int max_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getPinnedSavedDialogs`, id 0xD63D94E0.
final class messages_getPinnedSavedDialogs
{
    enum uint tlId = 0xD63D94E0;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.toggleSavedDialogPin`, id 0xAC81BBDE.
final class messages_toggleSavedDialogPin
{
    enum uint tlId = 0xAC81BBDE;

    uint flags;
    bool pinned;
    InputDialogPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.reorderPinnedSavedDialogs`, id 0x8B716587.
final class messages_reorderPinnedSavedDialogs
{
    enum uint tlId = 0x8B716587;

    uint flags;
    bool force;
    Vector!(InputDialogPeer) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getSavedReactionTags`, id 0x3637E05B.
final class messages_getSavedReactionTags
{
    enum uint tlId = 0x3637E05B;

    uint flags;
    InputPeer peer;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.updateSavedReactionTag`, id 0x60297DEC.
final class messages_updateSavedReactionTag
{
    enum uint tlId = 0x60297DEC;

    uint flags;
    Reaction reaction;
    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getDefaultTagReactions`, id 0xBDF93428.
final class messages_getDefaultTagReactions
{
    enum uint tlId = 0xBDF93428;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getOutboxReadDate`, id 0x8C4BFE5D.
final class messages_getOutboxReadDate
{
    enum uint tlId = 0x8C4BFE5D;

    InputPeer peer;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getQuickReplies`, id 0xD483F2A8.
final class messages_getQuickReplies
{
    enum uint tlId = 0xD483F2A8;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.reorderQuickReplies`, id 0x60331907.
final class messages_reorderQuickReplies
{
    enum uint tlId = 0x60331907;

    Vector!(int) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.checkQuickReplyShortcut`, id 0xF1D0FBD3.
final class messages_checkQuickReplyShortcut
{
    enum uint tlId = 0xF1D0FBD3;

    string shortcut;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editQuickReplyShortcut`, id 0x5C003CEF.
final class messages_editQuickReplyShortcut
{
    enum uint tlId = 0x5C003CEF;

    int shortcut_id;
    string shortcut;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteQuickReplyShortcut`, id 0x3CC04740.
final class messages_deleteQuickReplyShortcut
{
    enum uint tlId = 0x3CC04740;

    int shortcut_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getQuickReplyMessages`, id 0x94A495C3.
final class messages_getQuickReplyMessages
{
    enum uint tlId = 0x94A495C3;

    uint flags;
    int shortcut_id;
    Vector!(int) id;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendQuickReplyMessages`, id 0x6C750DE1.
final class messages_sendQuickReplyMessages
{
    enum uint tlId = 0x6C750DE1;

    InputPeer peer;
    int shortcut_id;
    Vector!(int) id;
    Vector!(long) random_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteQuickReplyMessages`, id 0xE105E910.
final class messages_deleteQuickReplyMessages
{
    enum uint tlId = 0xE105E910;

    int shortcut_id;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.toggleDialogFilterTags`, id 0xFD2DDA49.
final class messages_toggleDialogFilterTags
{
    enum uint tlId = 0xFD2DDA49;

    bool enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getMyStickers`, id 0xD0B5E1FC.
final class messages_getMyStickers
{
    enum uint tlId = 0xD0B5E1FC;

    long offset_id;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getEmojiStickerGroups`, id 0x1DD840F5.
final class messages_getEmojiStickerGroups
{
    enum uint tlId = 0x1DD840F5;

    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getAvailableEffects`, id 0xDEA20A39.
final class messages_getAvailableEffects
{
    enum uint tlId = 0xDEA20A39;

    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editFactCheck`, id 0x0589EE75.
final class messages_editFactCheck
{
    enum uint tlId = 0x0589EE75;

    InputPeer peer;
    int msg_id;
    TextWithEntities text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteFactCheck`, id 0xD1DA940C.
final class messages_deleteFactCheck
{
    enum uint tlId = 0xD1DA940C;

    InputPeer peer;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getFactCheck`, id 0xB9CDC5EE.
final class messages_getFactCheck
{
    enum uint tlId = 0xB9CDC5EE;

    InputPeer peer;
    Vector!(int) msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.requestMainWebView`, id 0xC9E01E7B.
final class messages_requestMainWebView
{
    enum uint tlId = 0xC9E01E7B;

    uint flags;
    bool compact;
    bool fullscreen;
    InputPeer peer;
    InputUser bot;
    string start_param;
    DataJSON theme_params;
    string platform;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.sendPaidReaction`, id 0x58BBCB50.
final class messages_sendPaidReaction
{
    enum uint tlId = 0x58BBCB50;

    uint flags;
    InputPeer peer;
    int msg_id;
    int count;
    long random_id;
    PaidReactionPrivacy private_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.togglePaidReactionPrivacy`, id 0x435885B5.
final class messages_togglePaidReactionPrivacy
{
    enum uint tlId = 0x435885B5;

    InputPeer peer;
    int msg_id;
    PaidReactionPrivacy private_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getPaidReactionPrivacy`, id 0x472455AA.
final class messages_getPaidReactionPrivacy
{
    enum uint tlId = 0x472455AA;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.viewSponsoredMessage`, id 0x269E3643.
final class messages_viewSponsoredMessage
{
    enum uint tlId = 0x269E3643;

    ubyte[] random_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.clickSponsoredMessage`, id 0x8235057E.
final class messages_clickSponsoredMessage
{
    enum uint tlId = 0x8235057E;

    uint flags;
    bool media;
    bool fullscreen;
    ubyte[] random_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.reportSponsoredMessage`, id 0x12CBF0C4.
final class messages_reportSponsoredMessage
{
    enum uint tlId = 0x12CBF0C4;

    ubyte[] random_id;
    ubyte[] option;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getSponsoredMessages`, id 0x3D6CE850.
final class messages_getSponsoredMessages
{
    enum uint tlId = 0x3D6CE850;

    uint flags;
    InputPeer peer;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.savePreparedInlineMessage`, id 0xF21F7F2F.
final class messages_savePreparedInlineMessage
{
    enum uint tlId = 0xF21F7F2F;

    uint flags;
    InputBotInlineResult result;
    InputUser user_id;
    Vector!(InlineQueryPeerType) peer_types;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getPreparedInlineMessage`, id 0x857EBDB8.
final class messages_getPreparedInlineMessage
{
    enum uint tlId = 0x857EBDB8;

    InputUser bot;
    string id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.searchStickers`, id 0x29B1C66A.
final class messages_searchStickers
{
    enum uint tlId = 0x29B1C66A;

    uint flags;
    bool emojis;
    string q;
    string emoticon;
    Vector!(string) lang_code;
    int offset;
    int limit;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.reportMessagesDelivery`, id 0x5A6D7395.
final class messages_reportMessagesDelivery
{
    enum uint tlId = 0x5A6D7395;

    uint flags;
    bool push;
    InputPeer peer;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getSavedDialogsByID`, id 0x6F6F9C96.
final class messages_getSavedDialogsByID
{
    enum uint tlId = 0x6F6F9C96;

    uint flags;
    InputPeer parent_peer;
    Vector!(InputPeer) ids;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.readSavedHistory`, id 0xBA4A3B5B.
final class messages_readSavedHistory
{
    enum uint tlId = 0xBA4A3B5B;

    InputPeer parent_peer;
    InputPeer peer;
    int max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.toggleTodoCompleted`, id 0xD3E03124.
final class messages_toggleTodoCompleted
{
    enum uint tlId = 0xD3E03124;

    InputPeer peer;
    int msg_id;
    Vector!(int) completed;
    Vector!(int) incompleted;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.appendTodoList`, id 0x21A61057.
final class messages_appendTodoList
{
    enum uint tlId = 0x21A61057;

    InputPeer peer;
    int msg_id;
    Vector!(TodoItem) list;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.toggleSuggestedPostApproval`, id 0x8107455C.
final class messages_toggleSuggestedPostApproval
{
    enum uint tlId = 0x8107455C;

    uint flags;
    bool reject;
    InputPeer peer;
    int msg_id;
    int schedule_date;
    string reject_comment;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getForumTopics`, id 0x3BA47BFF.
final class messages_getForumTopics
{
    enum uint tlId = 0x3BA47BFF;

    uint flags;
    InputPeer peer;
    string q;
    int offset_date;
    int offset_id;
    int offset_topic;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getForumTopicsByID`, id 0xAF0A4A08.
final class messages_getForumTopicsByID
{
    enum uint tlId = 0xAF0A4A08;

    InputPeer peer;
    Vector!(int) topics;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editForumTopic`, id 0xCECC1134.
final class messages_editForumTopic
{
    enum uint tlId = 0xCECC1134;

    uint flags;
    InputPeer peer;
    int topic_id;
    string title;
    long icon_emoji_id;
    bool closed;
    bool hidden;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.updatePinnedForumTopic`, id 0x175DF251.
final class messages_updatePinnedForumTopic
{
    enum uint tlId = 0x175DF251;

    InputPeer peer;
    int topic_id;
    bool pinned;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.reorderPinnedForumTopics`, id 0x0E7841F0.
final class messages_reorderPinnedForumTopics
{
    enum uint tlId = 0x0E7841F0;

    uint flags;
    bool force;
    InputPeer peer;
    Vector!(int) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.createForumTopic`, id 0x2F98C3D5.
final class messages_createForumTopic
{
    enum uint tlId = 0x2F98C3D5;

    uint flags;
    bool title_missing;
    InputPeer peer;
    string title;
    int icon_color;
    long icon_emoji_id;
    long random_id;
    InputPeer send_as;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteTopicHistory`, id 0xD2816F10.
final class messages_deleteTopicHistory
{
    enum uint tlId = 0xD2816F10;

    InputPeer peer;
    int top_msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getEmojiGameInfo`, id 0xFB7E8CA7.
final class messages_getEmojiGameInfo
{
    enum uint tlId = 0xFB7E8CA7;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.summarizeText`, id 0xABBBD346.
final class messages_summarizeText
{
    enum uint tlId = 0xABBBD346;

    uint flags;
    InputPeer peer;
    int id;
    string to_lang;
    string tone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editChatCreator`, id 0xF743B857.
final class messages_editChatCreator
{
    enum uint tlId = 0xF743B857;

    InputPeer peer;
    InputUser user_id;
    InputCheckPasswordSRP password;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getFutureChatCreatorAfterLeave`, id 0x3B7D0EA6.
final class messages_getFutureChatCreatorAfterLeave
{
    enum uint tlId = 0x3B7D0EA6;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.editChatParticipantRank`, id 0xA00F32B0.
final class messages_editChatParticipantRank
{
    enum uint tlId = 0xA00F32B0;

    InputPeer peer;
    InputPeer participant;
    string rank;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.declineUrlAuth`, id 0x35436BBC.
final class messages_declineUrlAuth
{
    enum uint tlId = 0x35436BBC;

    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.checkUrlAuthMatchCode`, id 0xC9A47B0B.
final class messages_checkUrlAuthMatchCode
{
    enum uint tlId = 0xC9A47B0B;

    string url;
    string match_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.composeMessageWithAI`, id 0xDAECC589.
final class messages_composeMessageWithAI
{
    enum uint tlId = 0xDAECC589;

    uint flags;
    bool proofread;
    bool emojify;
    TextWithEntities text;
    string translate_to_lang;
    InputAiComposeTone tone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.reportReadMetrics`, id 0x4067C5E6.
final class messages_reportReadMetrics
{
    enum uint tlId = 0x4067C5E6;

    InputPeer peer;
    Vector!(InputMessageReadMetric) metrics;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.reportMusicListen`, id 0xDDBCD819.
final class messages_reportMusicListen
{
    enum uint tlId = 0xDDBCD819;

    InputDocument id;
    int listened_duration;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.addPollAnswer`, id 0x19BC4B6D.
final class messages_addPollAnswer
{
    enum uint tlId = 0x19BC4B6D;

    InputPeer peer;
    int msg_id;
    PollAnswer answer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deletePollAnswer`, id 0xAC8505A5.
final class messages_deletePollAnswer
{
    enum uint tlId = 0xAC8505A5;

    InputPeer peer;
    int msg_id;
    ubyte[] option;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getUnreadPollVotes`, id 0x43286CF2.
final class messages_getUnreadPollVotes
{
    enum uint tlId = 0x43286CF2;

    uint flags;
    InputPeer peer;
    int top_msg_id;
    int offset_id;
    int add_offset;
    int limit;
    int max_id;
    int min_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.readPollVotes`, id 0x1720B4D8.
final class messages_readPollVotes
{
    enum uint tlId = 0x1720B4D8;

    uint flags;
    InputPeer peer;
    int top_msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.setBotGuestChatResult`, id 0xB8F106E3.
final class messages_setBotGuestChatResult
{
    enum uint tlId = 0xB8F106E3;

    long query_id;
    InputBotInlineResult result;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteParticipantReactions`, id 0xA0B80CF8.
final class messages_deleteParticipantReactions
{
    enum uint tlId = 0xA0B80CF8;

    InputPeer peer;
    InputPeer participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.deleteParticipantReaction`, id 0xE3B7F82C.
final class messages_deleteParticipantReaction
{
    enum uint tlId = 0xE3B7F82C;

    InputPeer peer;
    int msg_id;
    InputPeer participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getPersonalChannelHistory`, id 0x55FB0996.
final class messages_getPersonalChannelHistory
{
    enum uint tlId = 0x55FB0996;

    InputUser user_id;
    int limit;
    int max_id;
    int min_id;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.getRichMessage`, id 0x501569CF.
final class messages_getRichMessage
{
    enum uint tlId = 0x501569CF;

    InputPeer peer;
    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.translateRichMessage`, id 0x1A542004.
final class messages_translateRichMessage
{
    enum uint tlId = 0x1A542004;

    uint flags;
    InputPeer peer;
    Vector!(int) id;
    Vector!(InputRichMessage) text;
    string to_lang;
    string tone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.composeRichMessageWithAI`, id 0x8D7AE6AF.
final class messages_composeRichMessageWithAI
{
    enum uint tlId = 0x8D7AE6AF;

    uint flags;
    bool proofread;
    bool emojify;
    InputRichMessage text;
    string translate_to_lang;
    InputAiComposeTone tone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `messages.requestChatJoinWebView`, id 0xBA9EE679.
final class messages_requestChatJoinWebView
{
    enum uint tlId = 0xBA9EE679;

    uint flags;
    long query_id;
    DataJSON theme_params;
    string platform;

    override uint tlIdValue() const nothrow { return tlId; }
}

