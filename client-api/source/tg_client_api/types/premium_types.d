/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.types.premium_types;

import tg_client_api.types.common_types;
import tg_client_api.types.vector;

/// TL sum type `premium.BoostsList`.
abstract class premium_BoostsList
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: premium_boostsList
}

/// TL sum type `premium.MyBoosts`.
abstract class premium_MyBoosts
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: premium_myBoosts
}

/// TL sum type `premium.BoostsStatus`.
abstract class premium_BoostsStatus
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: premium_boostsStatus
}

/// TL constructor `premium.boostsList`, id 0x86F8613C.
final class premium_boostsList : premium_BoostsList
{
    enum uint tlId = 0x86F8613C;

    uint flags;
    int count;
    Vector!(Boost) boosts;
    string next_offset;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `premium.myBoosts`, id 0x9AE228E2.
final class premium_myBoosts : premium_MyBoosts
{
    enum uint tlId = 0x9AE228E2;

    Vector!(MyBoost) my_boosts;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `premium.boostsStatus`, id 0x4959427A.
final class premium_boostsStatus : premium_BoostsStatus
{
    enum uint tlId = 0x4959427A;

    uint flags;
    bool my_boost;
    int level;
    int current_level_boosts;
    int boosts;
    int gift_boosts;
    int next_level_boosts;
    StatsPercentValue premium_audience;
    string boost_url;
    Vector!(PrepaidGiveaway) prepaid_giveaways;
    Vector!(int) my_boost_slots;

    override uint tlIdValue() const nothrow { return tlId; }
}

