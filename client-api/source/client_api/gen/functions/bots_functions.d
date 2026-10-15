/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.functions.bots_functions;

/// TL function `bots.sendCustomRequest`, id 0xAA2769ED.
final class bots_sendCustomRequest
{
    enum uint tlId = 0xAA2769ED;

    string custom_method;
    DataJSON params;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.answerWebhookJSONQuery`, id 0xE6213F4D.
final class bots_answerWebhookJSONQuery
{
    enum uint tlId = 0xE6213F4D;

    long query_id;
    DataJSON data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.setBotCommands`, id 0x0517165A.
final class bots_setBotCommands
{
    enum uint tlId = 0x0517165A;

    BotCommandScope scope_;
    string lang_code;
    Vector!(BotCommand) commands;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.resetBotCommands`, id 0x3D8DE0F9.
final class bots_resetBotCommands
{
    enum uint tlId = 0x3D8DE0F9;

    BotCommandScope scope_;
    string lang_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.getBotCommands`, id 0xE34C0DD6.
final class bots_getBotCommands
{
    enum uint tlId = 0xE34C0DD6;

    BotCommandScope scope_;
    string lang_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.setBotMenuButton`, id 0x4504D54F.
final class bots_setBotMenuButton
{
    enum uint tlId = 0x4504D54F;

    InputUser user_id;
    BotMenuButton button;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.getBotMenuButton`, id 0x9C60EB28.
final class bots_getBotMenuButton
{
    enum uint tlId = 0x9C60EB28;

    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.setBotBroadcastDefaultAdminRights`, id 0x788464E1.
final class bots_setBotBroadcastDefaultAdminRights
{
    enum uint tlId = 0x788464E1;

    ChatAdminRights admin_rights;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.setBotGroupDefaultAdminRights`, id 0x925EC9EA.
final class bots_setBotGroupDefaultAdminRights
{
    enum uint tlId = 0x925EC9EA;

    ChatAdminRights admin_rights;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.setBotInfo`, id 0x10CF3123.
final class bots_setBotInfo
{
    enum uint tlId = 0x10CF3123;

    uint flags;
    InputUser bot;
    string lang_code;
    string name;
    string about;
    string description;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.getBotInfo`, id 0xDCD914FD.
final class bots_getBotInfo
{
    enum uint tlId = 0xDCD914FD;

    uint flags;
    InputUser bot;
    string lang_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.reorderUsernames`, id 0x9709B1C2.
final class bots_reorderUsernames
{
    enum uint tlId = 0x9709B1C2;

    InputUser bot;
    Vector!(string) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.toggleUsername`, id 0x053CA973.
final class bots_toggleUsername
{
    enum uint tlId = 0x053CA973;

    InputUser bot;
    string username;
    bool active;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.canSendMessage`, id 0x1359F4E6.
final class bots_canSendMessage
{
    enum uint tlId = 0x1359F4E6;

    InputUser bot;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.allowSendMessage`, id 0xF132E3EF.
final class bots_allowSendMessage
{
    enum uint tlId = 0xF132E3EF;

    InputUser bot;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.invokeWebViewCustomMethod`, id 0x087FC5E7.
final class bots_invokeWebViewCustomMethod
{
    enum uint tlId = 0x087FC5E7;

    InputUser bot;
    string custom_method;
    DataJSON params;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.getPopularAppBots`, id 0xC2510192.
final class bots_getPopularAppBots
{
    enum uint tlId = 0xC2510192;

    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.addPreviewMedia`, id 0x17AEB75A.
final class bots_addPreviewMedia
{
    enum uint tlId = 0x17AEB75A;

    InputUser bot;
    string lang_code;
    InputMedia media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.editPreviewMedia`, id 0x8525606F.
final class bots_editPreviewMedia
{
    enum uint tlId = 0x8525606F;

    InputUser bot;
    string lang_code;
    InputMedia media;
    InputMedia new_media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.deletePreviewMedia`, id 0x2D0135B3.
final class bots_deletePreviewMedia
{
    enum uint tlId = 0x2D0135B3;

    InputUser bot;
    string lang_code;
    Vector!(InputMedia) media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.reorderPreviewMedias`, id 0xB627F3AA.
final class bots_reorderPreviewMedias
{
    enum uint tlId = 0xB627F3AA;

    InputUser bot;
    string lang_code;
    Vector!(InputMedia) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.getPreviewInfo`, id 0x423AB3AD.
final class bots_getPreviewInfo
{
    enum uint tlId = 0x423AB3AD;

    InputUser bot;
    string lang_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.getPreviewMedias`, id 0xA2A5594D.
final class bots_getPreviewMedias
{
    enum uint tlId = 0xA2A5594D;

    InputUser bot;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.updateUserEmojiStatus`, id 0xED9F30C5.
final class bots_updateUserEmojiStatus
{
    enum uint tlId = 0xED9F30C5;

    InputUser user_id;
    EmojiStatus emoji_status;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.toggleUserEmojiStatusPermission`, id 0x06DE6392.
final class bots_toggleUserEmojiStatusPermission
{
    enum uint tlId = 0x06DE6392;

    InputUser bot;
    bool enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.checkDownloadFileParams`, id 0x50077589.
final class bots_checkDownloadFileParams
{
    enum uint tlId = 0x50077589;

    InputUser bot;
    string file_name;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.getAdminedBots`, id 0xB0711D83.
final class bots_getAdminedBots
{
    enum uint tlId = 0xB0711D83;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.updateStarRefProgram`, id 0x778B5AB3.
final class bots_updateStarRefProgram
{
    enum uint tlId = 0x778B5AB3;

    uint flags;
    InputUser bot;
    int commission_permille;
    int duration_months;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.setCustomVerification`, id 0xF4946757.
final class bots_setCustomVerification
{
    enum uint tlId = 0xF4946757;

    uint flags;
    bool enabled;
    InputUser bot;
    InputPeer peer;
    TextWithEntities custom_description;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.getBotRecommendations`, id 0xA1B70815.
final class bots_getBotRecommendations
{
    enum uint tlId = 0xA1B70815;

    InputUser bot;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.checkUsername`, id 0xE3AC4C61.
final class bots_checkUsername
{
    enum uint tlId = 0xE3AC4C61;

    uint flags;
    bool additional;
    string username;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.createBot`, id 0xE5B17F2B.
final class bots_createBot
{
    enum uint tlId = 0xE5B17F2B;

    uint flags;
    bool via_deeplink;
    string name;
    string username;
    InputUser manager_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.exportBotToken`, id 0xBD0D99EB.
final class bots_exportBotToken
{
    enum uint tlId = 0xBD0D99EB;

    InputUser bot;
    bool revoke;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.requestWebViewButton`, id 0x31A2A35E.
final class bots_requestWebViewButton
{
    enum uint tlId = 0x31A2A35E;

    InputUser user_id;
    KeyboardButton button;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.getRequestedWebViewButton`, id 0xBF25B7F3.
final class bots_getRequestedWebViewButton
{
    enum uint tlId = 0xBF25B7F3;

    InputUser bot;
    string webapp_req_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.getAccessSettings`, id 0x213853A3.
final class bots_getAccessSettings
{
    enum uint tlId = 0x213853A3;

    InputUser bot;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.editAccessSettings`, id 0x31813CD8.
final class bots_editAccessSettings
{
    enum uint tlId = 0x31813CD8;

    uint flags;
    bool restricted;
    InputUser bot;
    Vector!(InputUser) add_users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.setJoinChatResults`, id 0xE71A4810.
final class bots_setJoinChatResults
{
    enum uint tlId = 0xE71A4810;

    long query_id;
    JoinChatBotResult result;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.addUsername`, id 0x3501C08A.
final class bots_addUsername
{
    enum uint tlId = 0x3501C08A;

    InputUser bot;
    string username;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bots.removeUsername`, id 0xC704147D.
final class bots_removeUsername
{
    enum uint tlId = 0xC704147D;

    InputUser bot;
    string username;

    override uint tlIdValue() const nothrow { return tlId; }
}

