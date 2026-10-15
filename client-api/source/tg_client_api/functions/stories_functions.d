/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.stories_functions;

import tg_client_api.functions.tl_function;
import tg_client_api.types.common_types;
import tg_client_api.types.vector;

/// TL function `stories.canSendStory`, id 0x30EB63F0.
final class stories_canSendStory : TlFunction
{
    enum uint tlId = 0x30EB63F0;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.sendStory`, id 0x8F9E6898.
final class stories_sendStory : TlFunction
{
    enum uint tlId = 0x8F9E6898;

    uint flags;
    bool pinned;
    bool noforwards;
    bool fwd_modified;
    InputPeer peer;
    InputMedia media;
    Vector!(MediaArea) media_areas;
    string caption;
    Vector!(MessageEntity) entities;
    Vector!(InputPrivacyRule) privacy_rules;
    long random_id;
    int period;
    InputPeer fwd_from_id;
    int fwd_from_story;
    Vector!(int) albums;
    InputDocument music;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.editStory`, id 0x2C63A72B.
final class stories_editStory : TlFunction
{
    enum uint tlId = 0x2C63A72B;

    uint flags;
    InputPeer peer;
    int id;
    InputMedia media;
    Vector!(MediaArea) media_areas;
    string caption;
    Vector!(MessageEntity) entities;
    Vector!(InputPrivacyRule) privacy_rules;
    InputDocument music;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.deleteStories`, id 0xAE59DB5F.
final class stories_deleteStories : TlFunction
{
    enum uint tlId = 0xAE59DB5F;

    InputPeer peer;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.togglePinned`, id 0x9A75A1EF.
final class stories_togglePinned : TlFunction
{
    enum uint tlId = 0x9A75A1EF;

    InputPeer peer;
    Vector!(int) id;
    bool pinned;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getAllStories`, id 0xEEB0D625.
final class stories_getAllStories : TlFunction
{
    enum uint tlId = 0xEEB0D625;

    uint flags;
    bool next;
    bool hidden;
    string state;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getPinnedStories`, id 0x5821A5DC.
final class stories_getPinnedStories : TlFunction
{
    enum uint tlId = 0x5821A5DC;

    InputPeer peer;
    int offset_id;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getStoriesArchive`, id 0xB4352016.
final class stories_getStoriesArchive : TlFunction
{
    enum uint tlId = 0xB4352016;

    InputPeer peer;
    int offset_id;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getStoriesByID`, id 0x5774CA74.
final class stories_getStoriesByID : TlFunction
{
    enum uint tlId = 0x5774CA74;

    InputPeer peer;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.toggleAllStoriesHidden`, id 0x7C2557C4.
final class stories_toggleAllStoriesHidden : TlFunction
{
    enum uint tlId = 0x7C2557C4;

    bool hidden;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.readStories`, id 0xA556DAC8.
final class stories_readStories : TlFunction
{
    enum uint tlId = 0xA556DAC8;

    InputPeer peer;
    int max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.incrementStoryViews`, id 0xB2028AFB.
final class stories_incrementStoryViews : TlFunction
{
    enum uint tlId = 0xB2028AFB;

    InputPeer peer;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getStoryViewsList`, id 0x7ED23C57.
final class stories_getStoryViewsList : TlFunction
{
    enum uint tlId = 0x7ED23C57;

    uint flags;
    bool just_contacts;
    bool reactions_first;
    bool forwards_first;
    InputPeer peer;
    string q;
    int id;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getStoriesViews`, id 0x28E16CC8.
final class stories_getStoriesViews : TlFunction
{
    enum uint tlId = 0x28E16CC8;

    InputPeer peer;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.exportStoryLink`, id 0x7B8DEF20.
final class stories_exportStoryLink : TlFunction
{
    enum uint tlId = 0x7B8DEF20;

    InputPeer peer;
    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.report`, id 0x19D8EB45.
final class stories_report : TlFunction
{
    enum uint tlId = 0x19D8EB45;

    InputPeer peer;
    Vector!(int) id;
    ubyte[] option;
    string message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.activateStealthMode`, id 0x57BBD166.
final class stories_activateStealthMode : TlFunction
{
    enum uint tlId = 0x57BBD166;

    uint flags;
    bool past;
    bool future;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.sendReaction`, id 0x7FD736B2.
final class stories_sendReaction : TlFunction
{
    enum uint tlId = 0x7FD736B2;

    uint flags;
    bool add_to_recent;
    InputPeer peer;
    int story_id;
    Reaction reaction;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getPeerStories`, id 0x2C4ADA50.
final class stories_getPeerStories : TlFunction
{
    enum uint tlId = 0x2C4ADA50;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getAllReadPeerStories`, id 0x9B5AE7F9.
final class stories_getAllReadPeerStories : TlFunction
{
    enum uint tlId = 0x9B5AE7F9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getPeerMaxIDs`, id 0x78499170.
final class stories_getPeerMaxIDs : TlFunction
{
    enum uint tlId = 0x78499170;

    Vector!(InputPeer) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getChatsToSend`, id 0xA56A8B60.
final class stories_getChatsToSend : TlFunction
{
    enum uint tlId = 0xA56A8B60;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.togglePeerStoriesHidden`, id 0xBD0415C4.
final class stories_togglePeerStoriesHidden : TlFunction
{
    enum uint tlId = 0xBD0415C4;

    InputPeer peer;
    bool hidden;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getStoryReactionsList`, id 0xB9B2881F.
final class stories_getStoryReactionsList : TlFunction
{
    enum uint tlId = 0xB9B2881F;

    uint flags;
    bool forwards_first;
    InputPeer peer;
    int id;
    Reaction reaction;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.togglePinnedToTop`, id 0x0B297E9B.
final class stories_togglePinnedToTop : TlFunction
{
    enum uint tlId = 0x0B297E9B;

    InputPeer peer;
    Vector!(int) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.searchPosts`, id 0xD1810907.
final class stories_searchPosts : TlFunction
{
    enum uint tlId = 0xD1810907;

    uint flags;
    string hashtag;
    MediaArea area;
    InputPeer peer;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.createAlbum`, id 0xA36396E5.
final class stories_createAlbum : TlFunction
{
    enum uint tlId = 0xA36396E5;

    InputPeer peer;
    string title;
    Vector!(int) stories;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.updateAlbum`, id 0x5E5259B6.
final class stories_updateAlbum : TlFunction
{
    enum uint tlId = 0x5E5259B6;

    uint flags;
    InputPeer peer;
    int album_id;
    string title;
    Vector!(int) delete_stories;
    Vector!(int) add_stories;
    Vector!(int) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.reorderAlbums`, id 0x8535FBD9.
final class stories_reorderAlbums : TlFunction
{
    enum uint tlId = 0x8535FBD9;

    InputPeer peer;
    Vector!(int) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.deleteAlbum`, id 0x8D3456D0.
final class stories_deleteAlbum : TlFunction
{
    enum uint tlId = 0x8D3456D0;

    InputPeer peer;
    int album_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getAlbums`, id 0x25B3EAC7.
final class stories_getAlbums : TlFunction
{
    enum uint tlId = 0x25B3EAC7;

    InputPeer peer;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.getAlbumStories`, id 0xAC806D61.
final class stories_getAlbumStories : TlFunction
{
    enum uint tlId = 0xAC806D61;

    InputPeer peer;
    int album_id;
    int offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `stories.startLive`, id 0xD069CCDE.
final class stories_startLive : TlFunction
{
    enum uint tlId = 0xD069CCDE;

    uint flags;
    bool pinned;
    bool noforwards;
    bool rtmp_stream;
    InputPeer peer;
    string caption;
    Vector!(MessageEntity) entities;
    Vector!(InputPrivacyRule) privacy_rules;
    long random_id;
    bool messages_enabled;
    long send_paid_messages_stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

