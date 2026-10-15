/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.payments_functions;

/// TL function `payments.getPaymentForm`, id 0x37148DBB.
final class payments_getPaymentForm
{
    enum uint tlId = 0x37148DBB;

    uint flags;
    InputInvoice invoice;
    DataJSON theme_params;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getPaymentReceipt`, id 0x2478D1CC.
final class payments_getPaymentReceipt
{
    enum uint tlId = 0x2478D1CC;

    InputPeer peer;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.validateRequestedInfo`, id 0xB6C8F12B.
final class payments_validateRequestedInfo
{
    enum uint tlId = 0xB6C8F12B;

    uint flags;
    bool save;
    InputInvoice invoice;
    PaymentRequestedInfo info;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.sendPaymentForm`, id 0x2D03522F.
final class payments_sendPaymentForm
{
    enum uint tlId = 0x2D03522F;

    uint flags;
    long form_id;
    InputInvoice invoice;
    string requested_info_id;
    string shipping_option_id;
    InputPaymentCredentials credentials;
    long tip_amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getSavedInfo`, id 0x227D824B.
final class payments_getSavedInfo
{
    enum uint tlId = 0x227D824B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.clearSavedInfo`, id 0xD83D70C1.
final class payments_clearSavedInfo
{
    enum uint tlId = 0xD83D70C1;

    uint flags;
    bool credentials;
    bool info;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getBankCardData`, id 0x2E79D779.
final class payments_getBankCardData
{
    enum uint tlId = 0x2E79D779;

    string number;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.exportInvoice`, id 0x0F91B065.
final class payments_exportInvoice
{
    enum uint tlId = 0x0F91B065;

    InputMedia invoice_media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.assignAppStoreTransaction`, id 0x80ED747D.
final class payments_assignAppStoreTransaction
{
    enum uint tlId = 0x80ED747D;

    ubyte[] receipt;
    InputStorePaymentPurpose purpose;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.assignPlayMarketTransaction`, id 0xDFFD50D3.
final class payments_assignPlayMarketTransaction
{
    enum uint tlId = 0xDFFD50D3;

    DataJSON receipt;
    InputStorePaymentPurpose purpose;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getPremiumGiftCodeOptions`, id 0x2757BA54.
final class payments_getPremiumGiftCodeOptions
{
    enum uint tlId = 0x2757BA54;

    uint flags;
    InputPeer boost_peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.checkGiftCode`, id 0x8E51B4C1.
final class payments_checkGiftCode
{
    enum uint tlId = 0x8E51B4C1;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.applyGiftCode`, id 0xF6E26854.
final class payments_applyGiftCode
{
    enum uint tlId = 0xF6E26854;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getGiveawayInfo`, id 0xF4239425.
final class payments_getGiveawayInfo
{
    enum uint tlId = 0xF4239425;

    InputPeer peer;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.launchPrepaidGiveaway`, id 0x5FF58F20.
final class payments_launchPrepaidGiveaway
{
    enum uint tlId = 0x5FF58F20;

    InputPeer peer;
    long giveaway_id;
    InputStorePaymentPurpose purpose;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarsTopupOptions`, id 0xC00EC7D3.
final class payments_getStarsTopupOptions
{
    enum uint tlId = 0xC00EC7D3;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarsStatus`, id 0x4EA9B3BF.
final class payments_getStarsStatus
{
    enum uint tlId = 0x4EA9B3BF;

    uint flags;
    bool ton;
    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarsTransactions`, id 0x69DA4557.
final class payments_getStarsTransactions
{
    enum uint tlId = 0x69DA4557;

    uint flags;
    bool inbound;
    bool outbound;
    bool ascending;
    bool ton;
    string subscription_id;
    InputPeer peer;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.sendStarsForm`, id 0x7998C914.
final class payments_sendStarsForm
{
    enum uint tlId = 0x7998C914;

    long form_id;
    InputInvoice invoice;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.refundStarsCharge`, id 0x25AE8F4A.
final class payments_refundStarsCharge
{
    enum uint tlId = 0x25AE8F4A;

    InputUser user_id;
    string charge_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarsRevenueStats`, id 0xD91FFAD6.
final class payments_getStarsRevenueStats
{
    enum uint tlId = 0xD91FFAD6;

    uint flags;
    bool dark;
    bool ton;
    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarsRevenueWithdrawalUrl`, id 0x2433DC92.
final class payments_getStarsRevenueWithdrawalUrl
{
    enum uint tlId = 0x2433DC92;

    uint flags;
    bool ton;
    InputPeer peer;
    long amount;
    InputCheckPasswordSRP password;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarsRevenueAdsAccountUrl`, id 0xD1D7EFC5.
final class payments_getStarsRevenueAdsAccountUrl
{
    enum uint tlId = 0xD1D7EFC5;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarsTransactionsByID`, id 0x2DCA16B8.
final class payments_getStarsTransactionsByID
{
    enum uint tlId = 0x2DCA16B8;

    uint flags;
    bool ton;
    InputPeer peer;
    Vector!(InputStarsTransaction) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarsGiftOptions`, id 0xD3C96BC8.
final class payments_getStarsGiftOptions
{
    enum uint tlId = 0xD3C96BC8;

    uint flags;
    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarsSubscriptions`, id 0x032512C5.
final class payments_getStarsSubscriptions
{
    enum uint tlId = 0x032512C5;

    uint flags;
    bool missing_balance;
    InputPeer peer;
    string offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.changeStarsSubscription`, id 0xC7770878.
final class payments_changeStarsSubscription
{
    enum uint tlId = 0xC7770878;

    uint flags;
    InputPeer peer;
    string subscription_id;
    bool canceled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.fulfillStarsSubscription`, id 0xCC5BEBB3.
final class payments_fulfillStarsSubscription
{
    enum uint tlId = 0xCC5BEBB3;

    InputPeer peer;
    string subscription_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarsGiveawayOptions`, id 0xBD1EFD3E.
final class payments_getStarsGiveawayOptions
{
    enum uint tlId = 0xBD1EFD3E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarGifts`, id 0xC4563590.
final class payments_getStarGifts
{
    enum uint tlId = 0xC4563590;

    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.saveStarGift`, id 0x2A2A697C.
final class payments_saveStarGift
{
    enum uint tlId = 0x2A2A697C;

    uint flags;
    bool unsave;
    InputSavedStarGift stargift;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.convertStarGift`, id 0x74BF076B.
final class payments_convertStarGift
{
    enum uint tlId = 0x74BF076B;

    InputSavedStarGift stargift;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.botCancelStarsSubscription`, id 0x6DFA0622.
final class payments_botCancelStarsSubscription
{
    enum uint tlId = 0x6DFA0622;

    uint flags;
    bool restore;
    InputUser user_id;
    string charge_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getConnectedStarRefBots`, id 0x5869A553.
final class payments_getConnectedStarRefBots
{
    enum uint tlId = 0x5869A553;

    uint flags;
    InputPeer peer;
    int offset_date;
    string offset_link;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getConnectedStarRefBot`, id 0xB7D998F0.
final class payments_getConnectedStarRefBot
{
    enum uint tlId = 0xB7D998F0;

    InputPeer peer;
    InputUser bot;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getSuggestedStarRefBots`, id 0x0D6B48F7.
final class payments_getSuggestedStarRefBots
{
    enum uint tlId = 0x0D6B48F7;

    uint flags;
    bool order_by_revenue;
    bool order_by_date;
    InputPeer peer;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.connectStarRefBot`, id 0x7ED5348A.
final class payments_connectStarRefBot
{
    enum uint tlId = 0x7ED5348A;

    InputPeer peer;
    InputUser bot;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.editConnectedStarRefBot`, id 0xE4FCA4A3.
final class payments_editConnectedStarRefBot
{
    enum uint tlId = 0xE4FCA4A3;

    uint flags;
    bool revoked;
    InputPeer peer;
    string link;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarGiftUpgradePreview`, id 0x9C9ABCB1.
final class payments_getStarGiftUpgradePreview
{
    enum uint tlId = 0x9C9ABCB1;

    long gift_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.upgradeStarGift`, id 0xAED6E4F5.
final class payments_upgradeStarGift
{
    enum uint tlId = 0xAED6E4F5;

    uint flags;
    bool keep_original_details;
    InputSavedStarGift stargift;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.transferStarGift`, id 0x7F18176A.
final class payments_transferStarGift
{
    enum uint tlId = 0x7F18176A;

    InputSavedStarGift stargift;
    InputPeer to_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getUniqueStarGift`, id 0xA1974D72.
final class payments_getUniqueStarGift
{
    enum uint tlId = 0xA1974D72;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getSavedStarGifts`, id 0xA319E569.
final class payments_getSavedStarGifts
{
    enum uint tlId = 0xA319E569;

    uint flags;
    bool exclude_unsaved;
    bool exclude_saved;
    bool exclude_unlimited;
    bool exclude_unique;
    bool sort_by_value;
    bool exclude_upgradable;
    bool exclude_unupgradable;
    bool peer_color_available;
    bool exclude_hosted;
    InputPeer peer;
    int collection_id;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getSavedStarGift`, id 0xB455A106.
final class payments_getSavedStarGift
{
    enum uint tlId = 0xB455A106;

    Vector!(InputSavedStarGift) stargift;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarGiftWithdrawalUrl`, id 0xD06E93A8.
final class payments_getStarGiftWithdrawalUrl
{
    enum uint tlId = 0xD06E93A8;

    InputSavedStarGift stargift;
    InputCheckPasswordSRP password;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.toggleChatStarGiftNotifications`, id 0x60EAEFA1.
final class payments_toggleChatStarGiftNotifications
{
    enum uint tlId = 0x60EAEFA1;

    uint flags;
    bool enabled;
    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.toggleStarGiftsPinnedToTop`, id 0x1513E7B0.
final class payments_toggleStarGiftsPinnedToTop
{
    enum uint tlId = 0x1513E7B0;

    InputPeer peer;
    Vector!(InputSavedStarGift) stargift;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.canPurchaseStore`, id 0x4FDC5EA7.
final class payments_canPurchaseStore
{
    enum uint tlId = 0x4FDC5EA7;

    InputStorePaymentPurpose purpose;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getResaleStarGifts`, id 0x7A5FA236.
final class payments_getResaleStarGifts
{
    enum uint tlId = 0x7A5FA236;

    uint flags;
    bool sort_by_price;
    bool sort_by_num;
    bool for_craft;
    bool stars_only;
    long attributes_hash;
    long gift_id;
    Vector!(StarGiftAttributeId) attributes;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.updateStarGiftPrice`, id 0xEDBE6CCB.
final class payments_updateStarGiftPrice
{
    enum uint tlId = 0xEDBE6CCB;

    InputSavedStarGift stargift;
    StarsAmount resell_amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.createStarGiftCollection`, id 0x1F4A0E87.
final class payments_createStarGiftCollection
{
    enum uint tlId = 0x1F4A0E87;

    InputPeer peer;
    string title;
    Vector!(InputSavedStarGift) stargift;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.updateStarGiftCollection`, id 0x4FDDBEE7.
final class payments_updateStarGiftCollection
{
    enum uint tlId = 0x4FDDBEE7;

    uint flags;
    InputPeer peer;
    int collection_id;
    string title;
    Vector!(InputSavedStarGift) delete_stargift;
    Vector!(InputSavedStarGift) add_stargift;
    Vector!(InputSavedStarGift) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.reorderStarGiftCollections`, id 0xC32AF4CC.
final class payments_reorderStarGiftCollections
{
    enum uint tlId = 0xC32AF4CC;

    InputPeer peer;
    Vector!(int) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.deleteStarGiftCollection`, id 0xAD5648E8.
final class payments_deleteStarGiftCollection
{
    enum uint tlId = 0xAD5648E8;

    InputPeer peer;
    int collection_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarGiftCollections`, id 0x981B91DD.
final class payments_getStarGiftCollections
{
    enum uint tlId = 0x981B91DD;

    InputPeer peer;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getUniqueStarGiftValueInfo`, id 0x4365AF6B.
final class payments_getUniqueStarGiftValueInfo
{
    enum uint tlId = 0x4365AF6B;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.checkCanSendGift`, id 0xC0C4EDC9.
final class payments_checkCanSendGift
{
    enum uint tlId = 0xC0C4EDC9;

    long gift_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarGiftAuctionState`, id 0x5C9FF4D6.
final class payments_getStarGiftAuctionState
{
    enum uint tlId = 0x5C9FF4D6;

    InputStarGiftAuction auction;
    int version_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarGiftAuctionAcquiredGifts`, id 0x6BA2CBEC.
final class payments_getStarGiftAuctionAcquiredGifts
{
    enum uint tlId = 0x6BA2CBEC;

    long gift_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarGiftActiveAuctions`, id 0xA5D0514D.
final class payments_getStarGiftActiveAuctions
{
    enum uint tlId = 0xA5D0514D;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.resolveStarGiftOffer`, id 0xE9CE781C.
final class payments_resolveStarGiftOffer
{
    enum uint tlId = 0xE9CE781C;

    uint flags;
    bool decline;
    int offer_msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.sendStarGiftOffer`, id 0x8FB86B41.
final class payments_sendStarGiftOffer
{
    enum uint tlId = 0x8FB86B41;

    uint flags;
    InputPeer peer;
    string slug;
    StarsAmount price;
    int duration;
    long random_id;
    long allow_paid_stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getStarGiftUpgradeAttributes`, id 0x6D038B58.
final class payments_getStarGiftUpgradeAttributes
{
    enum uint tlId = 0x6D038B58;

    long gift_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getCraftStarGifts`, id 0xFD05DD00.
final class payments_getCraftStarGifts
{
    enum uint tlId = 0xFD05DD00;

    long gift_id;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.craftStarGift`, id 0xB0F9684F.
final class payments_craftStarGift
{
    enum uint tlId = 0xB0F9684F;

    Vector!(InputSavedStarGift) stargift;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getCurrencyRates`, id 0xD35983E8.
final class payments_getCurrencyRates
{
    enum uint tlId = 0xD35983E8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getOnrampProviders`, id 0x3F3E00DC.
final class payments_getOnrampProviders
{
    enum uint tlId = 0x3F3E00DC;

    uint flags;
    string crypto_currency;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getOnrampBaseCurrencies`, id 0x1C8BEDF3.
final class payments_getOnrampBaseCurrencies
{
    enum uint tlId = 0x1C8BEDF3;

    string provider;
    string crypto_currency;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getOnrampAvailability`, id 0x2EC29951.
final class payments_getOnrampAvailability
{
    enum uint tlId = 0x2EC29951;

    uint flags;
    string provider;
    string crypto_currency;
    string base_currency;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getOnrampLimits`, id 0x80E851FD.
final class payments_getOnrampLimits
{
    enum uint tlId = 0x80E851FD;

    uint flags;
    string provider;
    string crypto_currency;
    string base_currency;
    string payment_method;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.getOnrampQuote`, id 0xE06645FA.
final class payments_getOnrampQuote
{
    enum uint tlId = 0xE06645FA;

    uint flags;
    string provider;
    string crypto_currency;
    string base_currency;
    string base_amount;
    string crypto_amount;
    string payment_method;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `payments.createOnrampSession`, id 0xA2197CF6.
final class payments_createOnrampSession
{
    enum uint tlId = 0xA2197CF6;

    uint flags;
    string provider;
    string crypto_currency;
    string address;
    string payment_method;
    string base_currency;
    string base_amount;
    string memo;
    string theme;
    string success_return_url;
    string fail_return_url;
    string crypto_amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

