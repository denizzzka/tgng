/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.types.stories_types;

/// TL sum type `stories.AllStories`.
abstract class stories_AllStories
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stories_allStories
    // constructor: stories_allStoriesNotModified
}

/// TL sum type `stories.Stories`.
abstract class stories_Stories
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stories_stories
}

/// TL sum type `stories.StoryViewsList`.
abstract class stories_StoryViewsList
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stories_storyViewsList
}

/// TL sum type `stories.StoryViews`.
abstract class stories_StoryViews
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stories_storyViews
}

/// TL sum type `stories.PeerStories`.
abstract class stories_PeerStories
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stories_peerStories
}

/// TL sum type `stories.StoryReactionsList`.
abstract class stories_StoryReactionsList
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stories_storyReactionsList
}

/// TL sum type `stories.FoundStories`.
abstract class stories_FoundStories
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stories_foundStories
}

/// TL sum type `stories.CanSendStoryCount`.
abstract class stories_CanSendStoryCount
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stories_canSendStoryCount
}

/// TL sum type `stories.Albums`.
abstract class stories_Albums
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stories_albums
    // constructor: stories_albumsNotModified
}

/// TL constructor `stories.allStoriesNotModified`, id 0x1158FE3E.
final class stories_allStoriesNotModified : stories_AllStories
{
    enum uint tlId = 0x1158FE3E;

    uint flags;
    string state;
    StoriesStealthMode stealth_mode;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stories.allStories`, id 0x6EFC5E81.
final class stories_allStories : stories_AllStories
{
    enum uint tlId = 0x6EFC5E81;

    uint flags;
    bool has_more;
    int count;
    string state;
    Vector!(PeerStories) peer_stories;
    Vector!(Chat) chats;
    Vector!(User) users;
    StoriesStealthMode stealth_mode;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stories.stories`, id 0x63C3DD0A.
final class stories_stories : stories_Stories
{
    enum uint tlId = 0x63C3DD0A;

    uint flags;
    int count;
    Vector!(StoryItem) stories;
    Vector!(int) pinned_to_top;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stories.storyViewsList`, id 0x59D78FC5.
final class stories_storyViewsList : stories_StoryViewsList
{
    enum uint tlId = 0x59D78FC5;

    uint flags;
    int count;
    int views_count;
    int forwards_count;
    int reactions_count;
    Vector!(StoryView) views;
    Vector!(Chat) chats;
    Vector!(User) users;
    string next_offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stories.storyViews`, id 0xDE9EED1D.
final class stories_storyViews : stories_StoryViews
{
    enum uint tlId = 0xDE9EED1D;

    Vector!(StoryViews) views;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stories.peerStories`, id 0xCAE68768.
final class stories_peerStories : stories_PeerStories
{
    enum uint tlId = 0xCAE68768;

    PeerStories stories;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stories.storyReactionsList`, id 0xAA5F789C.
final class stories_storyReactionsList : stories_StoryReactionsList
{
    enum uint tlId = 0xAA5F789C;

    uint flags;
    int count;
    Vector!(StoryReaction) reactions;
    Vector!(Chat) chats;
    Vector!(User) users;
    string next_offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stories.foundStories`, id 0xE2DE7737.
final class stories_foundStories : stories_FoundStories
{
    enum uint tlId = 0xE2DE7737;

    uint flags;
    int count;
    Vector!(FoundStory) stories;
    string next_offset;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stories.canSendStoryCount`, id 0xC387C04E.
final class stories_canSendStoryCount : stories_CanSendStoryCount
{
    enum uint tlId = 0xC387C04E;

    int count_remains;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stories.albumsNotModified`, id 0x564EDAEB.
final class stories_albumsNotModified : stories_Albums
{
    enum uint tlId = 0x564EDAEB;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stories.albums`, id 0xC3987A3A.
final class stories_albums : stories_Albums
{
    enum uint tlId = 0xC3987A3A;

    long hash;
    Vector!(StoryAlbum) albums;

    override uint tlIdValue() const nothrow { return tlId; }
}

