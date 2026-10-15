/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.stats_types;

/// TL sum type `stats.BroadcastStats`.
abstract class stats_BroadcastStats
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: stats_broadcastStats
}

/// TL sum type `stats.MegagroupStats`.
abstract class stats_MegagroupStats
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: stats_megagroupStats
}

/// TL sum type `stats.MessageStats`.
abstract class stats_MessageStats
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: stats_messageStats
}

/// TL sum type `stats.StoryStats`.
abstract class stats_StoryStats
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: stats_storyStats
}

/// TL sum type `stats.PublicForwards`.
abstract class stats_PublicForwards
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: stats_publicForwards
}

/// TL sum type `stats.PollStats`.
abstract class stats_PollStats
{
    /// The id of the concrete constructor.
    abstract uint tlId() const nothrow;
    // constructor: stats_pollStats
}

/// TL constructor `stats.broadcastStats`, id 0x396CA5FC.
final class stats_broadcastStats : stats_BroadcastStats
{
    enum uint tlId = 0x396CA5FC;

    StatsDateRangeDays period;
    StatsAbsValueAndPrev followers;
    StatsAbsValueAndPrev views_per_post;
    StatsAbsValueAndPrev shares_per_post;
    StatsAbsValueAndPrev reactions_per_post;
    StatsAbsValueAndPrev views_per_story;
    StatsAbsValueAndPrev shares_per_story;
    StatsAbsValueAndPrev reactions_per_story;
    StatsPercentValue enabled_notifications;
    StatsGraph growth_graph;
    StatsGraph followers_graph;
    StatsGraph mute_graph;
    StatsGraph top_hours_graph;
    StatsGraph interactions_graph;
    StatsGraph iv_interactions_graph;
    StatsGraph views_by_source_graph;
    StatsGraph new_followers_by_source_graph;
    StatsGraph languages_graph;
    StatsGraph reactions_by_emotion_graph;
    StatsGraph story_interactions_graph;
    StatsGraph story_reactions_by_emotion_graph;
    Vector!(PostInteractionCounters) recent_posts_interactions;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stats.megagroupStats`, id 0xEF7FF916.
final class stats_megagroupStats : stats_MegagroupStats
{
    enum uint tlId = 0xEF7FF916;

    StatsDateRangeDays period;
    StatsAbsValueAndPrev members;
    StatsAbsValueAndPrev messages;
    StatsAbsValueAndPrev viewers;
    StatsAbsValueAndPrev posters;
    StatsGraph growth_graph;
    StatsGraph members_graph;
    StatsGraph new_members_by_source_graph;
    StatsGraph languages_graph;
    StatsGraph messages_graph;
    StatsGraph actions_graph;
    StatsGraph top_hours_graph;
    StatsGraph weekdays_graph;
    Vector!(StatsGroupTopPoster) top_posters;
    Vector!(StatsGroupTopAdmin) top_admins;
    Vector!(StatsGroupTopInviter) top_inviters;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stats.messageStats`, id 0x7FE91C14.
final class stats_messageStats : stats_MessageStats
{
    enum uint tlId = 0x7FE91C14;

    StatsGraph views_graph;
    StatsGraph reactions_by_emotion_graph;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stats.storyStats`, id 0x50CD067C.
final class stats_storyStats : stats_StoryStats
{
    enum uint tlId = 0x50CD067C;

    StatsGraph views_graph;
    StatsGraph reactions_by_emotion_graph;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stats.publicForwards`, id 0x93037E20.
final class stats_publicForwards : stats_PublicForwards
{
    enum uint tlId = 0x93037E20;

    uint flags;
    int count;
    Vector!(PublicForward) forwards;
    string next_offset;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stats.pollStats`, id 0x2999BEED.
final class stats_pollStats : stats_PollStats
{
    enum uint tlId = 0x2999BEED;

    StatsGraph votes_graph;

    override uint tlIdValue() const nothrow { return tlId; }
}

