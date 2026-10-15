/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.types.common_types;

/// TL sum type `True`.
abstract class True
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: true_
}

/// TL sum type `Error`.
abstract class Error_
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: error
}

/// TL sum type `IpPort`.
abstract class IpPort
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: ipPort
    // constructor: ipPortSecret
}

/// TL sum type `AccessPointRule`.
abstract class AccessPointRule
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: accessPointRule
}

/// TL sum type `InputFileLocation`.
abstract class InputFileLocation
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputDocumentFileLocation
    // constructor: inputEncryptedFileLocation
    // constructor: inputFileLocation
    // constructor: inputGroupCallStream
    // constructor: inputPeerPhotoFileLocation
    // constructor: inputPeerPhotoFileLocationLegacy
    // constructor: inputPhotoFileLocation
    // constructor: inputPhotoLegacyFileLocation
    // constructor: inputSecureFileLocation
    // constructor: inputStickerSetThumb
    // constructor: inputStickerSetThumbLegacy
    // constructor: inputTakeoutFileLocation
}

/// TL sum type `InputPeer`.
abstract class InputPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPeerChannel
    // constructor: inputPeerChannelFromMessage
    // constructor: inputPeerChat
    // constructor: inputPeerEmpty
    // constructor: inputPeerSelf
    // constructor: inputPeerUser
    // constructor: inputPeerUserFromMessage
}

/// TL sum type `InputUser`.
abstract class InputUser
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputUser
    // constructor: inputUserEmpty
    // constructor: inputUserFromMessage
    // constructor: inputUserSelf
}

/// TL sum type `InputContact`.
abstract class InputContact
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPhoneContact
}

/// TL sum type `InputFile`.
abstract class InputFile
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputFile
    // constructor: inputFileBig
    // constructor: inputFileStoryDocument
}

/// TL sum type `InputMedia`.
abstract class InputMedia
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputMediaContact
    // constructor: inputMediaDice
    // constructor: inputMediaDocument
    // constructor: inputMediaDocumentExternal
    // constructor: inputMediaEmpty
    // constructor: inputMediaGame
    // constructor: inputMediaGeoLive
    // constructor: inputMediaGeoPoint
    // constructor: inputMediaInvoice
    // constructor: inputMediaPaidMedia
    // constructor: inputMediaPhoto
    // constructor: inputMediaPhotoExternal
    // constructor: inputMediaPoll
    // constructor: inputMediaStakeDice
    // constructor: inputMediaStory
    // constructor: inputMediaTodo
    // constructor: inputMediaUploadedDocument
    // constructor: inputMediaUploadedPhoto
    // constructor: inputMediaVenue
    // constructor: inputMediaWebPage
}

/// TL sum type `InputChatPhoto`.
abstract class InputChatPhoto
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputChatPhoto
    // constructor: inputChatPhotoEmpty
    // constructor: inputChatUploadedPhoto
}

/// TL sum type `InputGeoPoint`.
abstract class InputGeoPoint
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputGeoPoint
    // constructor: inputGeoPointEmpty
}

/// TL sum type `InputPhoto`.
abstract class InputPhoto
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPhoto
    // constructor: inputPhotoEmpty
}

/// TL sum type `Peer`.
abstract class Peer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: peerChannel
    // constructor: peerChat
    // constructor: peerUser
}

/// TL sum type `User`.
abstract class User
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: user
    // constructor: userEmpty
}

/// TL sum type `UserProfilePhoto`.
abstract class UserProfilePhoto
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: userProfilePhoto
    // constructor: userProfilePhotoEmpty
}

/// TL sum type `UserStatus`.
abstract class UserStatus
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: userStatusEmpty
    // constructor: userStatusLastMonth
    // constructor: userStatusLastWeek
    // constructor: userStatusOffline
    // constructor: userStatusOnline
    // constructor: userStatusRecently
}

/// TL sum type `Chat`.
abstract class Chat
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: channel
    // constructor: channelForbidden
    // constructor: chat
    // constructor: chatEmpty
    // constructor: chatForbidden
    // constructor: community
    // constructor: communityForbidden
}

/// TL sum type `ChatFull`.
abstract class ChatFull
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: channelFull
    // constructor: chatFull
    // constructor: communityFull
}

/// TL sum type `ChatParticipant`.
abstract class ChatParticipant
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatParticipant
    // constructor: chatParticipantAdmin
    // constructor: chatParticipantCreator
}

/// TL sum type `ChatParticipants`.
abstract class ChatParticipants
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatParticipants
    // constructor: chatParticipantsForbidden
}

/// TL sum type `ChatPhoto`.
abstract class ChatPhoto
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatPhoto
    // constructor: chatPhotoEmpty
}

/// TL sum type `Message`.
abstract class Message
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: message
    // constructor: messageEmpty
    // constructor: messageService
}

/// TL sum type `MessageMedia`.
abstract class MessageMedia
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messageMediaContact
    // constructor: messageMediaDice
    // constructor: messageMediaDocument
    // constructor: messageMediaEmpty
    // constructor: messageMediaGame
    // constructor: messageMediaGeo
    // constructor: messageMediaGeoLive
    // constructor: messageMediaGiveaway
    // constructor: messageMediaGiveawayResults
    // constructor: messageMediaInvoice
    // constructor: messageMediaPaidMedia
    // constructor: messageMediaPhoto
    // constructor: messageMediaPoll
    // constructor: messageMediaStory
    // constructor: messageMediaToDo
    // constructor: messageMediaUnsupported
    // constructor: messageMediaVenue
    // constructor: messageMediaVideoStream
    // constructor: messageMediaWebPage
}

/// TL sum type `MessageAction`.
abstract class MessageAction
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messageActionBoostApply
    // constructor: messageActionBotAllowed
    // constructor: messageActionChangeCommunity
    // constructor: messageActionChangeCreator
    // constructor: messageActionChannelCreate
    // constructor: messageActionChannelMigrateFrom
    // constructor: messageActionChatAddUser
    // constructor: messageActionChatCreate
    // constructor: messageActionChatDeletePhoto
    // constructor: messageActionChatDeleteUser
    // constructor: messageActionChatEditPhoto
    // constructor: messageActionChatEditTitle
    // constructor: messageActionChatJoinedByLink
    // constructor: messageActionChatJoinedByRequest
    // constructor: messageActionChatJoinedViaCommunity
    // constructor: messageActionChatMigrateTo
    // constructor: messageActionConferenceCall
    // constructor: messageActionContactSignUp
    // constructor: messageActionCustomAction
    // constructor: messageActionEmpty
    // constructor: messageActionGameScore
    // constructor: messageActionGeoProximityReached
    // constructor: messageActionGiftCode
    // constructor: messageActionGiftPremium
    // constructor: messageActionGiftStars
    // constructor: messageActionGiftTon
    // constructor: messageActionGiveawayLaunch
    // constructor: messageActionGiveawayResults
    // constructor: messageActionGramTransfer
    // constructor: messageActionGroupCall
    // constructor: messageActionGroupCallScheduled
    // constructor: messageActionHistoryClear
    // constructor: messageActionInviteToGroupCall
    // constructor: messageActionManagedBotCreated
    // constructor: messageActionNewCreatorPending
    // constructor: messageActionNoForwardsRequest
    // constructor: messageActionNoForwardsToggle
    // constructor: messageActionPaidMessagesPrice
    // constructor: messageActionPaidMessagesRefunded
    // constructor: messageActionPaymentRefunded
    // constructor: messageActionPaymentSent
    // constructor: messageActionPaymentSentMe
    // constructor: messageActionPhoneCall
    // constructor: messageActionPinMessage
    // constructor: messageActionPollAppendAnswer
    // constructor: messageActionPollDeleteAnswer
    // constructor: messageActionPrizeStars
    // constructor: messageActionRequestedPeer
    // constructor: messageActionRequestedPeerSentMe
    // constructor: messageActionScreenshotTaken
    // constructor: messageActionSecureValuesSent
    // constructor: messageActionSecureValuesSentMe
    // constructor: messageActionSetChatTheme
    // constructor: messageActionSetChatWallPaper
    // constructor: messageActionSetMessagesTTL
    // constructor: messageActionStarGift
    // constructor: messageActionStarGiftPurchaseOffer
    // constructor: messageActionStarGiftPurchaseOfferDeclined
    // constructor: messageActionStarGiftUnique
    // constructor: messageActionSuggestBirthday
    // constructor: messageActionSuggestProfilePhoto
    // constructor: messageActionSuggestedPostApproval
    // constructor: messageActionSuggestedPostRefund
    // constructor: messageActionSuggestedPostSuccess
    // constructor: messageActionTodoAppendTasks
    // constructor: messageActionTodoCompletions
    // constructor: messageActionTopicCreate
    // constructor: messageActionTopicEdit
    // constructor: messageActionWalletTonConnectRequest
    // constructor: messageActionWebViewDataSent
    // constructor: messageActionWebViewDataSentMe
}

/// TL sum type `Dialog`.
abstract class Dialog
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: dialog
    // constructor: dialogCommunity
    // constructor: dialogFolder
}

/// TL sum type `Photo`.
abstract class Photo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: photo
    // constructor: photoEmpty
}

/// TL sum type `PhotoSize`.
abstract class PhotoSize
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: photoCachedSize
    // constructor: photoPathSize
    // constructor: photoSize
    // constructor: photoSizeEmpty
    // constructor: photoSizeProgressive
    // constructor: photoStrippedSize
}

/// TL sum type `GeoPoint`.
abstract class GeoPoint
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: geoPoint
    // constructor: geoPointEmpty
}

/// TL sum type `InputNotifyPeer`.
abstract class InputNotifyPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputNotifyBroadcasts
    // constructor: inputNotifyChats
    // constructor: inputNotifyCommunity
    // constructor: inputNotifyForumTopic
    // constructor: inputNotifyPeer
    // constructor: inputNotifyUsers
}

/// TL sum type `InputPeerNotifySettings`.
abstract class InputPeerNotifySettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPeerNotifySettings
}

/// TL sum type `PeerNotifySettings`.
abstract class PeerNotifySettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: peerNotifySettings
}

/// TL sum type `PeerSettings`.
abstract class PeerSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: peerSettings
}

/// TL sum type `WallPaper`.
abstract class WallPaper
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallPaper
    // constructor: wallPaperNoFile
}

/// TL sum type `ReportReason`.
abstract class ReportReason
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputReportReasonChildAbuse
    // constructor: inputReportReasonCopyright
    // constructor: inputReportReasonFake
    // constructor: inputReportReasonGeoIrrelevant
    // constructor: inputReportReasonIllegalDrugs
    // constructor: inputReportReasonOther
    // constructor: inputReportReasonPersonalDetails
    // constructor: inputReportReasonPornography
    // constructor: inputReportReasonSpam
    // constructor: inputReportReasonViolence
}

/// TL sum type `UserFull`.
abstract class UserFull
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: userFull
}

/// TL sum type `Contact`.
abstract class Contact
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: contact
}

/// TL sum type `ImportedContact`.
abstract class ImportedContact
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: importedContact
}

/// TL sum type `ContactStatus`.
abstract class ContactStatus
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: contactStatus
}

/// TL sum type `MessagesFilter`.
abstract class MessagesFilter
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputMessagesFilterChatPhotos
    // constructor: inputMessagesFilterContacts
    // constructor: inputMessagesFilterDocument
    // constructor: inputMessagesFilterEmpty
    // constructor: inputMessagesFilterGeo
    // constructor: inputMessagesFilterGif
    // constructor: inputMessagesFilterMusic
    // constructor: inputMessagesFilterMyMentions
    // constructor: inputMessagesFilterPhoneCalls
    // constructor: inputMessagesFilterPhotoVideo
    // constructor: inputMessagesFilterPhotos
    // constructor: inputMessagesFilterPinned
    // constructor: inputMessagesFilterPoll
    // constructor: inputMessagesFilterRoundVideo
    // constructor: inputMessagesFilterRoundVoice
    // constructor: inputMessagesFilterUrl
    // constructor: inputMessagesFilterVideo
    // constructor: inputMessagesFilterVoice
}

/// TL sum type `Update`.
abstract class Update
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: updateAiComposeTones
    // constructor: updateAttachMenuBots
    // constructor: updateAutoSaveSettings
    // constructor: updateBotBusinessConnect
    // constructor: updateBotCallbackQuery
    // constructor: updateBotChatBoost
    // constructor: updateBotChatInviteRequester
    // constructor: updateBotCommands
    // constructor: updateBotDeleteBusinessMessage
    // constructor: updateBotEditBusinessMessage
    // constructor: updateBotGuestChatQuery
    // constructor: updateBotInlineQuery
    // constructor: updateBotInlineSend
    // constructor: updateBotMenuButton
    // constructor: updateBotMessageReaction
    // constructor: updateBotMessageReactions
    // constructor: updateBotNewBusinessMessage
    // constructor: updateBotPrecheckoutQuery
    // constructor: updateBotPurchasedPaidMedia
    // constructor: updateBotShippingQuery
    // constructor: updateBotStarsSubscription
    // constructor: updateBotStopped
    // constructor: updateBotWebhookJSON
    // constructor: updateBotWebhookJSONQuery
    // constructor: updateBusinessBotCallbackQuery
    // constructor: updateChannel
    // constructor: updateChannelAvailableMessages
    // constructor: updateChannelMessageForwards
    // constructor: updateChannelMessageViews
    // constructor: updateChannelParticipant
    // constructor: updateChannelReadMessagesContents
    // constructor: updateChannelTooLong
    // constructor: updateChannelUserTyping
    // constructor: updateChannelViewForumAsMessages
    // constructor: updateChannelWebPage
    // constructor: updateChat
    // constructor: updateChatDefaultBannedRights
    // constructor: updateChatParticipant
    // constructor: updateChatParticipantAdd
    // constructor: updateChatParticipantAdmin
    // constructor: updateChatParticipantDelete
    // constructor: updateChatParticipantRank
    // constructor: updateChatParticipants
    // constructor: updateChatUserTyping
    // constructor: updateConfig
    // constructor: updateContactsReset
    // constructor: updateDcOptions
    // constructor: updateDeleteChannelMessages
    // constructor: updateDeleteEphemeralMessages
    // constructor: updateDeleteGroupCallMessages
    // constructor: updateDeleteMessages
    // constructor: updateDeleteQuickReply
    // constructor: updateDeleteQuickReplyMessages
    // constructor: updateDeleteScheduledMessages
    // constructor: updateDialogFilter
    // constructor: updateDialogFilterOrder
    // constructor: updateDialogFilters
    // constructor: updateDialogPinned
    // constructor: updateDialogUnreadMark
    // constructor: updateDraftMessage
    // constructor: updateEditChannelMessage
    // constructor: updateEditEphemeralMessage
    // constructor: updateEditMessage
    // constructor: updateEmojiGameInfo
    // constructor: updateEncryptedChatTyping
    // constructor: updateEncryptedMessagesRead
    // constructor: updateEncryption
    // constructor: updateEphemeralBotCallbackQuery
    // constructor: updateFavedStickers
    // constructor: updateFolderPeers
    // constructor: updateGeoLiveViewed
    // constructor: updateGroupCall
    // constructor: updateGroupCallChainBlocks
    // constructor: updateGroupCallConnection
    // constructor: updateGroupCallEncryptedMessage
    // constructor: updateGroupCallMessage
    // constructor: updateGroupCallParticipants
    // constructor: updateInlineBotCallbackQuery
    // constructor: updateJoinChatWebViewDecision
    // constructor: updateLangPack
    // constructor: updateLangPackTooLong
    // constructor: updateLoginToken
    // constructor: updateManagedBot
    // constructor: updateMessageExtendedMedia
    // constructor: updateMessageID
    // constructor: updateMessagePoll
    // constructor: updateMessagePollVote
    // constructor: updateMessageReactions
    // constructor: updateMonoForumNoPaidException
    // constructor: updateMoveStickerSetToTop
    // constructor: updateNewAuthorization
    // constructor: updateNewBotConnection
    // constructor: updateNewChannelMessage
    // constructor: updateNewEncryptedMessage
    // constructor: updateNewEphemeralMessage
    // constructor: updateNewMessage
    // constructor: updateNewQuickReply
    // constructor: updateNewScheduledMessage
    // constructor: updateNewStickerSet
    // constructor: updateNewStoryReaction
    // constructor: updateNotifySettings
    // constructor: updatePaidReactionPrivacy
    // constructor: updatePeerBlocked
    // constructor: updatePeerHistoryTTL
    // constructor: updatePeerLocated
    // constructor: updatePeerSettings
    // constructor: updatePeerWallpaper
    // constructor: updatePendingJoinRequests
    // constructor: updatePhoneCall
    // constructor: updatePhoneCallSignalingData
    // constructor: updatePinnedChannelMessages
    // constructor: updatePinnedDialogs
    // constructor: updatePinnedForumTopic
    // constructor: updatePinnedForumTopics
    // constructor: updatePinnedMessages
    // constructor: updatePinnedSavedDialogs
    // constructor: updatePrivacy
    // constructor: updatePtsChanged
    // constructor: updateQuickReplies
    // constructor: updateQuickReplyMessage
    // constructor: updateReadChannelDiscussionInbox
    // constructor: updateReadChannelDiscussionOutbox
    // constructor: updateReadChannelInbox
    // constructor: updateReadChannelOutbox
    // constructor: updateReadFeaturedEmojiStickers
    // constructor: updateReadFeaturedStickers
    // constructor: updateReadHistoryInbox
    // constructor: updateReadHistoryOutbox
    // constructor: updateReadMessagesContents
    // constructor: updateReadMonoForumInbox
    // constructor: updateReadMonoForumOutbox
    // constructor: updateReadStories
    // constructor: updateRecentEmojiStatuses
    // constructor: updateRecentReactions
    // constructor: updateRecentStickers
    // constructor: updateSavedDialogPinned
    // constructor: updateSavedGifs
    // constructor: updateSavedReactionTags
    // constructor: updateSavedRingtones
    // constructor: updateSentPhoneCode
    // constructor: updateSentStoryReaction
    // constructor: updateSentWalletTransaction
    // constructor: updateServiceNotification
    // constructor: updateSmsJob
    // constructor: updateStarGiftAuctionState
    // constructor: updateStarGiftAuctionUserState
    // constructor: updateStarGiftCraftFail
    // constructor: updateStarsBalance
    // constructor: updateStarsRevenueStatus
    // constructor: updateStickerSets
    // constructor: updateStickerSetsOrder
    // constructor: updateStoriesStealthMode
    // constructor: updateStory
    // constructor: updateStoryID
    // constructor: updateTheme
    // constructor: updateTranscribedAudio
    // constructor: updateUser
    // constructor: updateUserEmojiStatus
    // constructor: updateUserName
    // constructor: updateUserPhone
    // constructor: updateUserStatus
    // constructor: updateUserTyping
    // constructor: updateWalletGaslessInfo
    // constructor: updateWalletState
    // constructor: updateWalletTonConnectPendingDisconnect
    // constructor: updateWalletTonConnectSession
    // constructor: updateWebBrowserException
    // constructor: updateWebBrowserSettings
    // constructor: updateWebPage
    // constructor: updateWebViewResultSent
}

/// TL sum type `Updates`.
abstract class Updates
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: updateShort
    // constructor: updateShortChatMessage
    // constructor: updateShortMessage
    // constructor: updateShortSentMessage
    // constructor: updates
    // constructor: updatesCombined
    // constructor: updatesTooLong
}

/// TL sum type `DcOption`.
abstract class DcOption
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: dcOption
}

/// TL sum type `Config`.
abstract class Config
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: config
}

/// TL sum type `NearestDc`.
abstract class NearestDc
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: nearestDc
}

/// TL sum type `EncryptedChat`.
abstract class EncryptedChat
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: encryptedChat
    // constructor: encryptedChatDiscarded
    // constructor: encryptedChatEmpty
    // constructor: encryptedChatRequested
    // constructor: encryptedChatWaiting
}

/// TL sum type `InputEncryptedChat`.
abstract class InputEncryptedChat
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputEncryptedChat
}

/// TL sum type `EncryptedFile`.
abstract class EncryptedFile
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: encryptedFile
    // constructor: encryptedFileEmpty
}

/// TL sum type `InputEncryptedFile`.
abstract class InputEncryptedFile
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputEncryptedFile
    // constructor: inputEncryptedFileBigUploaded
    // constructor: inputEncryptedFileEmpty
    // constructor: inputEncryptedFileUploaded
}

/// TL sum type `EncryptedMessage`.
abstract class EncryptedMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: encryptedMessage
    // constructor: encryptedMessageService
}

/// TL sum type `InputDocument`.
abstract class InputDocument
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputDocument
    // constructor: inputDocumentEmpty
}

/// TL sum type `Document`.
abstract class Document
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: document
    // constructor: documentEmpty
}

/// TL sum type `NotifyPeer`.
abstract class NotifyPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: notifyBroadcasts
    // constructor: notifyChats
    // constructor: notifyCommunity
    // constructor: notifyForumTopic
    // constructor: notifyPeer
    // constructor: notifyUsers
}

/// TL sum type `SendMessageAction`.
abstract class SendMessageAction
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputSendMessageRichMessageDraftAction
    // constructor: sendMessageCancelAction
    // constructor: sendMessageChooseContactAction
    // constructor: sendMessageChooseStickerAction
    // constructor: sendMessageEmojiInteraction
    // constructor: sendMessageEmojiInteractionSeen
    // constructor: sendMessageGamePlayAction
    // constructor: sendMessageGeoLocationAction
    // constructor: sendMessageHistoryImportAction
    // constructor: sendMessageRecordAudioAction
    // constructor: sendMessageRecordRoundAction
    // constructor: sendMessageRecordVideoAction
    // constructor: sendMessageRichMessageDraftAction
    // constructor: sendMessageStopDraftAction
    // constructor: sendMessageTextDraftAction
    // constructor: sendMessageTypingAction
    // constructor: sendMessageUploadAudioAction
    // constructor: sendMessageUploadDocumentAction
    // constructor: sendMessageUploadPhotoAction
    // constructor: sendMessageUploadRoundAction
    // constructor: sendMessageUploadVideoAction
    // constructor: speakingInGroupCallAction
}

/// TL sum type `InputPrivacyKey`.
abstract class InputPrivacyKey
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPrivacyKeyAbout
    // constructor: inputPrivacyKeyAddedByPhone
    // constructor: inputPrivacyKeyBirthday
    // constructor: inputPrivacyKeyChatInvite
    // constructor: inputPrivacyKeyForwards
    // constructor: inputPrivacyKeyNoPaidMessages
    // constructor: inputPrivacyKeyPhoneCall
    // constructor: inputPrivacyKeyPhoneNumber
    // constructor: inputPrivacyKeyPhoneP2P
    // constructor: inputPrivacyKeyProfilePhoto
    // constructor: inputPrivacyKeySavedMusic
    // constructor: inputPrivacyKeyStarGiftsAutoSave
    // constructor: inputPrivacyKeyStatusTimestamp
    // constructor: inputPrivacyKeyVoiceMessages
}

/// TL sum type `PrivacyKey`.
abstract class PrivacyKey
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: privacyKeyAbout
    // constructor: privacyKeyAddedByPhone
    // constructor: privacyKeyBirthday
    // constructor: privacyKeyChatInvite
    // constructor: privacyKeyForwards
    // constructor: privacyKeyNoPaidMessages
    // constructor: privacyKeyPhoneCall
    // constructor: privacyKeyPhoneNumber
    // constructor: privacyKeyPhoneP2P
    // constructor: privacyKeyProfilePhoto
    // constructor: privacyKeySavedMusic
    // constructor: privacyKeyStarGiftsAutoSave
    // constructor: privacyKeyStatusTimestamp
    // constructor: privacyKeyVoiceMessages
}

/// TL sum type `InputPrivacyRule`.
abstract class InputPrivacyRule
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPrivacyValueAllowAll
    // constructor: inputPrivacyValueAllowBots
    // constructor: inputPrivacyValueAllowChatParticipants
    // constructor: inputPrivacyValueAllowCloseFriends
    // constructor: inputPrivacyValueAllowContacts
    // constructor: inputPrivacyValueAllowPremium
    // constructor: inputPrivacyValueAllowUsers
    // constructor: inputPrivacyValueDisallowAll
    // constructor: inputPrivacyValueDisallowBots
    // constructor: inputPrivacyValueDisallowChatParticipants
    // constructor: inputPrivacyValueDisallowContacts
    // constructor: inputPrivacyValueDisallowUsers
}

/// TL sum type `PrivacyRule`.
abstract class PrivacyRule
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: privacyValueAllowAll
    // constructor: privacyValueAllowBots
    // constructor: privacyValueAllowChatParticipants
    // constructor: privacyValueAllowCloseFriends
    // constructor: privacyValueAllowContacts
    // constructor: privacyValueAllowPremium
    // constructor: privacyValueAllowUsers
    // constructor: privacyValueDisallowAll
    // constructor: privacyValueDisallowBots
    // constructor: privacyValueDisallowChatParticipants
    // constructor: privacyValueDisallowContacts
    // constructor: privacyValueDisallowUsers
}

/// TL sum type `AccountDaysTTL`.
abstract class AccountDaysTTL
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: accountDaysTTL
}

/// TL sum type `DocumentAttribute`.
abstract class DocumentAttribute
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: documentAttributeAnimated
    // constructor: documentAttributeAudio
    // constructor: documentAttributeCustomEmoji
    // constructor: documentAttributeFilename
    // constructor: documentAttributeHasStickers
    // constructor: documentAttributeImageSize
    // constructor: documentAttributeSticker
    // constructor: documentAttributeVideo
}

/// TL sum type `StickerPack`.
abstract class StickerPack
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stickerPack
}

/// TL sum type `WebPage`.
abstract class WebPage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: webPage
    // constructor: webPageEmpty
    // constructor: webPageNotModified
    // constructor: webPagePending
}

/// TL sum type `Authorization`.
abstract class Authorization
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: authorization
}

/// TL sum type `ReceivedNotifyMessage`.
abstract class ReceivedNotifyMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: receivedNotifyMessage
}

/// TL sum type `ExportedChatInvite`.
abstract class ExportedChatInvite
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatInviteExported
    // constructor: chatInvitePublicJoinRequests
}

/// TL sum type `ChatInvite`.
abstract class ChatInvite
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatInvite
    // constructor: chatInviteAlready
    // constructor: chatInvitePeek
}

/// TL sum type `InputStickerSet`.
abstract class InputStickerSet
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputStickerSetAnimatedEmoji
    // constructor: inputStickerSetAnimatedEmojiAnimations
    // constructor: inputStickerSetDice
    // constructor: inputStickerSetEmojiChannelDefaultStatuses
    // constructor: inputStickerSetEmojiDefaultStatuses
    // constructor: inputStickerSetEmojiDefaultTopicIcons
    // constructor: inputStickerSetEmojiGenericAnimations
    // constructor: inputStickerSetEmpty
    // constructor: inputStickerSetID
    // constructor: inputStickerSetPremiumGifts
    // constructor: inputStickerSetShortName
    // constructor: inputStickerSetTonGifts
}

/// TL sum type `StickerSet`.
abstract class StickerSet
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stickerSet
}

/// TL sum type `BotCommand`.
abstract class BotCommand
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: botCommand
}

/// TL sum type `BotInfo`.
abstract class BotInfo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: botInfo
}

/// TL sum type `KeyboardButton`.
abstract class KeyboardButton
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: keyboardButton
}

/// TL sum type `KeyboardButtonRow`.
abstract class KeyboardButtonRow
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: keyboardButtonRow
}

/// TL sum type `ReplyMarkup`.
abstract class ReplyMarkup
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: replyInlineMarkup
    // constructor: replyKeyboardForceReply
    // constructor: replyKeyboardHide
    // constructor: replyKeyboardMarkup
}

/// TL sum type `MessageEntity`.
abstract class MessageEntity
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputMessageEntityMentionName
    // constructor: messageEntityBankCard
    // constructor: messageEntityBlockquote
    // constructor: messageEntityBold
    // constructor: messageEntityBotCommand
    // constructor: messageEntityCashtag
    // constructor: messageEntityCode
    // constructor: messageEntityCustomEmoji
    // constructor: messageEntityDiffDelete
    // constructor: messageEntityDiffInsert
    // constructor: messageEntityDiffReplace
    // constructor: messageEntityEmail
    // constructor: messageEntityFormattedDate
    // constructor: messageEntityHashtag
    // constructor: messageEntityItalic
    // constructor: messageEntityMention
    // constructor: messageEntityMentionName
    // constructor: messageEntityPhone
    // constructor: messageEntityPre
    // constructor: messageEntitySpoiler
    // constructor: messageEntityStrike
    // constructor: messageEntityTextUrl
    // constructor: messageEntityTonAddress
    // constructor: messageEntityUnderline
    // constructor: messageEntityUnknown
    // constructor: messageEntityUrl
}

/// TL sum type `InputChannel`.
abstract class InputChannel
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputChannel
    // constructor: inputChannelEmpty
    // constructor: inputChannelFromMessage
}

/// TL sum type `MessageRange`.
abstract class MessageRange
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messageRange
}

/// TL sum type `ChannelMessagesFilter`.
abstract class ChannelMessagesFilter
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: channelMessagesFilter
    // constructor: channelMessagesFilterEmpty
}

/// TL sum type `ChannelParticipant`.
abstract class ChannelParticipant
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: channelParticipant
    // constructor: channelParticipantAdmin
    // constructor: channelParticipantBanned
    // constructor: channelParticipantCreator
    // constructor: channelParticipantLeft
    // constructor: channelParticipantSelf
}

/// TL sum type `ChannelParticipantsFilter`.
abstract class ChannelParticipantsFilter
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: channelParticipantsAdmins
    // constructor: channelParticipantsBanned
    // constructor: channelParticipantsBots
    // constructor: channelParticipantsContacts
    // constructor: channelParticipantsKicked
    // constructor: channelParticipantsMentions
    // constructor: channelParticipantsRecent
    // constructor: channelParticipantsSearch
}

/// TL sum type `InputBotInlineMessage`.
abstract class InputBotInlineMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputBotInlineMessageGame
    // constructor: inputBotInlineMessageMediaAuto
    // constructor: inputBotInlineMessageMediaContact
    // constructor: inputBotInlineMessageMediaGeo
    // constructor: inputBotInlineMessageMediaInvoice
    // constructor: inputBotInlineMessageMediaVenue
    // constructor: inputBotInlineMessageMediaWebPage
    // constructor: inputBotInlineMessageRichMessage
    // constructor: inputBotInlineMessageText
}

/// TL sum type `InputBotInlineResult`.
abstract class InputBotInlineResult
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputBotInlineResult
    // constructor: inputBotInlineResultDocument
    // constructor: inputBotInlineResultGame
    // constructor: inputBotInlineResultPhoto
}

/// TL sum type `BotInlineMessage`.
abstract class BotInlineMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: botInlineMessageMediaAuto
    // constructor: botInlineMessageMediaContact
    // constructor: botInlineMessageMediaGeo
    // constructor: botInlineMessageMediaInvoice
    // constructor: botInlineMessageMediaVenue
    // constructor: botInlineMessageMediaWebPage
    // constructor: botInlineMessageRichMessage
    // constructor: botInlineMessageText
}

/// TL sum type `BotInlineResult`.
abstract class BotInlineResult
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: botInlineMediaResult
    // constructor: botInlineResult
}

/// TL sum type `ExportedMessageLink`.
abstract class ExportedMessageLink
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: exportedMessageLink
}

/// TL sum type `MessageFwdHeader`.
abstract class MessageFwdHeader
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messageFwdHeader
}

/// TL sum type `InputBotInlineMessageID`.
abstract class InputBotInlineMessageID
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputBotInlineMessageID
    // constructor: inputBotInlineMessageID64
}

/// TL sum type `InlineBotSwitchPM`.
abstract class InlineBotSwitchPM
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inlineBotSwitchPM
}

/// TL sum type `TopPeer`.
abstract class TopPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: topPeer
}

/// TL sum type `TopPeerCategory`.
abstract class TopPeerCategory
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: topPeerCategoryBotsApp
    // constructor: topPeerCategoryBotsGuestChat
    // constructor: topPeerCategoryBotsInline
    // constructor: topPeerCategoryBotsPM
    // constructor: topPeerCategoryChannels
    // constructor: topPeerCategoryCorrespondents
    // constructor: topPeerCategoryForwardChats
    // constructor: topPeerCategoryForwardUsers
    // constructor: topPeerCategoryGroups
    // constructor: topPeerCategoryPhoneCalls
}

/// TL sum type `TopPeerCategoryPeers`.
abstract class TopPeerCategoryPeers
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: topPeerCategoryPeers
}

/// TL sum type `DraftMessage`.
abstract class DraftMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: draftMessage
    // constructor: draftMessageEmpty
}

/// TL sum type `StickerSetCovered`.
abstract class StickerSetCovered
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stickerSetCovered
    // constructor: stickerSetFullCovered
    // constructor: stickerSetMultiCovered
    // constructor: stickerSetNoCovered
}

/// TL sum type `MaskCoords`.
abstract class MaskCoords
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: maskCoords
}

/// TL sum type `InputStickeredMedia`.
abstract class InputStickeredMedia
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputStickeredMediaDocument
    // constructor: inputStickeredMediaPhoto
}

/// TL sum type `Game`.
abstract class Game
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: game
}

/// TL sum type `InputGame`.
abstract class InputGame
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputGameID
    // constructor: inputGameShortName
}

/// TL sum type `HighScore`.
abstract class HighScore
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: highScore
}

/// TL sum type `RichText`.
abstract class RichText
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: textAnchor
    // constructor: textAutoEmail
    // constructor: textAutoPhone
    // constructor: textAutoUrl
    // constructor: textBankCard
    // constructor: textBold
    // constructor: textBotCommand
    // constructor: textButton
    // constructor: textCashtag
    // constructor: textConcat
    // constructor: textCustomEmoji
    // constructor: textDate
    // constructor: textDiff
    // constructor: textEmail
    // constructor: textEmpty
    // constructor: textFixed
    // constructor: textHashtag
    // constructor: textImage
    // constructor: textItalic
    // constructor: textMarked
    // constructor: textMath
    // constructor: textMention
    // constructor: textMentionName
    // constructor: textPhone
    // constructor: textPlain
    // constructor: textSpoiler
    // constructor: textStrike
    // constructor: textSubscript
    // constructor: textSuperscript
    // constructor: textTonAddress
    // constructor: textUnderline
    // constructor: textUrl
}

/// TL sum type `PageBlock`.
abstract class PageBlock
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPageBlockMap
    // constructor: pageBlockAnchor
    // constructor: pageBlockAudio
    // constructor: pageBlockAuthorDate
    // constructor: pageBlockBlockquote
    // constructor: pageBlockBlockquoteBlocks
    // constructor: pageBlockButtonRow
    // constructor: pageBlockChannel
    // constructor: pageBlockCollage
    // constructor: pageBlockCover
    // constructor: pageBlockDetails
    // constructor: pageBlockDivider
    // constructor: pageBlockDocument
    // constructor: pageBlockEmbed
    // constructor: pageBlockEmbedPost
    // constructor: pageBlockFooter
    // constructor: pageBlockHeader
    // constructor: pageBlockHeading1
    // constructor: pageBlockHeading2
    // constructor: pageBlockHeading3
    // constructor: pageBlockHeading4
    // constructor: pageBlockHeading5
    // constructor: pageBlockHeading6
    // constructor: pageBlockKicker
    // constructor: pageBlockList
    // constructor: pageBlockMap
    // constructor: pageBlockMath
    // constructor: pageBlockOrderedList
    // constructor: pageBlockParagraph
    // constructor: pageBlockPhoto
    // constructor: pageBlockPreformatted
    // constructor: pageBlockPullquote
    // constructor: pageBlockRelatedArticles
    // constructor: pageBlockSlideshow
    // constructor: pageBlockSubheader
    // constructor: pageBlockSubtitle
    // constructor: pageBlockTable
    // constructor: pageBlockThinking
    // constructor: pageBlockTitle
    // constructor: pageBlockUnsupported
    // constructor: pageBlockVideo
}

/// TL sum type `PhoneCallDiscardReason`.
abstract class PhoneCallDiscardReason
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: phoneCallDiscardReasonBusy
    // constructor: phoneCallDiscardReasonDisconnect
    // constructor: phoneCallDiscardReasonHangup
    // constructor: phoneCallDiscardReasonMigrateConferenceCall
    // constructor: phoneCallDiscardReasonMissed
}

/// TL sum type `DataJSON`.
abstract class DataJSON
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: dataJSON
}

/// TL sum type `LabeledPrice`.
abstract class LabeledPrice
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: labeledPrice
}

/// TL sum type `Invoice`.
abstract class Invoice
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: invoice
}

/// TL sum type `PaymentCharge`.
abstract class PaymentCharge
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: paymentCharge
}

/// TL sum type `PostAddress`.
abstract class PostAddress
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: postAddress
}

/// TL sum type `PaymentRequestedInfo`.
abstract class PaymentRequestedInfo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: paymentRequestedInfo
}

/// TL sum type `PaymentSavedCredentials`.
abstract class PaymentSavedCredentials
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: paymentSavedCredentialsCard
}

/// TL sum type `WebDocument`.
abstract class WebDocument
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: webDocument
    // constructor: webDocumentNoProxy
}

/// TL sum type `InputWebDocument`.
abstract class InputWebDocument
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputWebDocument
}

/// TL sum type `InputWebFileLocation`.
abstract class InputWebFileLocation
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputWebFileAudioAlbumThumbLocation
    // constructor: inputWebFileGeoPointLocation
    // constructor: inputWebFileLocation
}

/// TL sum type `InputPaymentCredentials`.
abstract class InputPaymentCredentials
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPaymentCredentials
    // constructor: inputPaymentCredentialsApplePay
    // constructor: inputPaymentCredentialsGooglePay
    // constructor: inputPaymentCredentialsSaved
}

/// TL sum type `ShippingOption`.
abstract class ShippingOption
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: shippingOption
}

/// TL sum type `InputStickerSetItem`.
abstract class InputStickerSetItem
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputStickerSetItem
}

/// TL sum type `InputPhoneCall`.
abstract class InputPhoneCall
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPhoneCall
}

/// TL sum type `PhoneCall`.
abstract class PhoneCall
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: phoneCall
    // constructor: phoneCallAccepted
    // constructor: phoneCallDiscarded
    // constructor: phoneCallEmpty
    // constructor: phoneCallRequested
    // constructor: phoneCallWaiting
}

/// TL sum type `PhoneConnection`.
abstract class PhoneConnection
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: phoneConnection
    // constructor: phoneConnectionWebrtc
}

/// TL sum type `PhoneCallProtocol`.
abstract class PhoneCallProtocol
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: phoneCallProtocol
}

/// TL sum type `CdnPublicKey`.
abstract class CdnPublicKey
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: cdnPublicKey
}

/// TL sum type `CdnConfig`.
abstract class CdnConfig
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: cdnConfig
}

/// TL sum type `LangPackString`.
abstract class LangPackString
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: langPackString
    // constructor: langPackStringDeleted
    // constructor: langPackStringPluralized
}

/// TL sum type `LangPackDifference`.
abstract class LangPackDifference
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: langPackDifference
}

/// TL sum type `LangPackLanguage`.
abstract class LangPackLanguage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: langPackLanguage
}

/// TL sum type `ChannelAdminLogEventAction`.
abstract class ChannelAdminLogEventAction
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: channelAdminLogEventActionChangeAbout
    // constructor: channelAdminLogEventActionChangeAvailableReactions
    // constructor: channelAdminLogEventActionChangeEmojiStatus
    // constructor: channelAdminLogEventActionChangeEmojiStickerSet
    // constructor: channelAdminLogEventActionChangeHistoryTTL
    // constructor: channelAdminLogEventActionChangeLinkedChat
    // constructor: channelAdminLogEventActionChangeLocation
    // constructor: channelAdminLogEventActionChangePeerColor
    // constructor: channelAdminLogEventActionChangePhoto
    // constructor: channelAdminLogEventActionChangeProfilePeerColor
    // constructor: channelAdminLogEventActionChangeStickerSet
    // constructor: channelAdminLogEventActionChangeTitle
    // constructor: channelAdminLogEventActionChangeUsername
    // constructor: channelAdminLogEventActionChangeUsernames
    // constructor: channelAdminLogEventActionChangeWallpaper
    // constructor: channelAdminLogEventActionCreateTopic
    // constructor: channelAdminLogEventActionDefaultBannedRights
    // constructor: channelAdminLogEventActionDeleteMessage
    // constructor: channelAdminLogEventActionDeleteTopic
    // constructor: channelAdminLogEventActionDiscardGroupCall
    // constructor: channelAdminLogEventActionEditMessage
    // constructor: channelAdminLogEventActionEditTopic
    // constructor: channelAdminLogEventActionExportedInviteDelete
    // constructor: channelAdminLogEventActionExportedInviteEdit
    // constructor: channelAdminLogEventActionExportedInviteRevoke
    // constructor: channelAdminLogEventActionParticipantEditRank
    // constructor: channelAdminLogEventActionParticipantInvite
    // constructor: channelAdminLogEventActionParticipantJoin
    // constructor: channelAdminLogEventActionParticipantJoinByInvite
    // constructor: channelAdminLogEventActionParticipantJoinByRequest
    // constructor: channelAdminLogEventActionParticipantLeave
    // constructor: channelAdminLogEventActionParticipantMute
    // constructor: channelAdminLogEventActionParticipantSubExtend
    // constructor: channelAdminLogEventActionParticipantToggleAdmin
    // constructor: channelAdminLogEventActionParticipantToggleBan
    // constructor: channelAdminLogEventActionParticipantUnmute
    // constructor: channelAdminLogEventActionParticipantVolume
    // constructor: channelAdminLogEventActionPinTopic
    // constructor: channelAdminLogEventActionSendMessage
    // constructor: channelAdminLogEventActionStartGroupCall
    // constructor: channelAdminLogEventActionStopPoll
    // constructor: channelAdminLogEventActionToggleAntiSpam
    // constructor: channelAdminLogEventActionToggleAutotranslation
    // constructor: channelAdminLogEventActionToggleForum
    // constructor: channelAdminLogEventActionToggleGroupCallSetting
    // constructor: channelAdminLogEventActionToggleInvites
    // constructor: channelAdminLogEventActionToggleNoForwards
    // constructor: channelAdminLogEventActionTogglePreHistoryHidden
    // constructor: channelAdminLogEventActionToggleSignatureProfiles
    // constructor: channelAdminLogEventActionToggleSignatures
    // constructor: channelAdminLogEventActionToggleSlowMode
    // constructor: channelAdminLogEventActionUpdatePinned
}

/// TL sum type `ChannelAdminLogEvent`.
abstract class ChannelAdminLogEvent
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: channelAdminLogEvent
}

/// TL sum type `ChannelAdminLogEventsFilter`.
abstract class ChannelAdminLogEventsFilter
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: channelAdminLogEventsFilter
}

/// TL sum type `PopularContact`.
abstract class PopularContact
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: popularContact
}

/// TL sum type `RecentMeUrl`.
abstract class RecentMeUrl
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: recentMeUrlChat
    // constructor: recentMeUrlChatInvite
    // constructor: recentMeUrlStickerSet
    // constructor: recentMeUrlUnknown
    // constructor: recentMeUrlUser
}

/// TL sum type `InputSingleMedia`.
abstract class InputSingleMedia
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputSingleMedia
}

/// TL sum type `WebAuthorization`.
abstract class WebAuthorization
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: webAuthorization
}

/// TL sum type `InputMessage`.
abstract class InputMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputMessageCallbackQuery
    // constructor: inputMessageID
    // constructor: inputMessagePinned
    // constructor: inputMessageReplyTo
}

/// TL sum type `InputDialogPeer`.
abstract class InputDialogPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputDialogPeer
    // constructor: inputDialogPeerCommunity
    // constructor: inputDialogPeerFolder
}

/// TL sum type `DialogPeer`.
abstract class DialogPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: dialogPeer
    // constructor: dialogPeerCommunity
    // constructor: dialogPeerFolder
}

/// TL sum type `FileHash`.
abstract class FileHash
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: fileHash
}

/// TL sum type `InputClientProxy`.
abstract class InputClientProxy
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputClientProxy
}

/// TL sum type `InputSecureFile`.
abstract class InputSecureFile
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputSecureFile
    // constructor: inputSecureFileUploaded
}

/// TL sum type `SecureFile`.
abstract class SecureFile
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: secureFile
    // constructor: secureFileEmpty
}

/// TL sum type `SecureData`.
abstract class SecureData
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: secureData
}

/// TL sum type `SecurePlainData`.
abstract class SecurePlainData
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: securePlainEmail
    // constructor: securePlainPhone
}

/// TL sum type `SecureValueType`.
abstract class SecureValueType
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: secureValueTypeAddress
    // constructor: secureValueTypeBankStatement
    // constructor: secureValueTypeDriverLicense
    // constructor: secureValueTypeEmail
    // constructor: secureValueTypeIdentityCard
    // constructor: secureValueTypeInternalPassport
    // constructor: secureValueTypePassport
    // constructor: secureValueTypePassportRegistration
    // constructor: secureValueTypePersonalDetails
    // constructor: secureValueTypePhone
    // constructor: secureValueTypeRentalAgreement
    // constructor: secureValueTypeTemporaryRegistration
    // constructor: secureValueTypeUtilityBill
}

/// TL sum type `SecureValue`.
abstract class SecureValue
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: secureValue
}

/// TL sum type `InputSecureValue`.
abstract class InputSecureValue
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputSecureValue
}

/// TL sum type `SecureValueHash`.
abstract class SecureValueHash
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: secureValueHash
}

/// TL sum type `SecureValueError`.
abstract class SecureValueError
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: secureValueError
    // constructor: secureValueErrorData
    // constructor: secureValueErrorFile
    // constructor: secureValueErrorFiles
    // constructor: secureValueErrorFrontSide
    // constructor: secureValueErrorReverseSide
    // constructor: secureValueErrorSelfie
    // constructor: secureValueErrorTranslationFile
    // constructor: secureValueErrorTranslationFiles
}

/// TL sum type `SecureCredentialsEncrypted`.
abstract class SecureCredentialsEncrypted
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: secureCredentialsEncrypted
}

/// TL sum type `SavedContact`.
abstract class SavedContact
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: savedPhoneContact
}

/// TL sum type `PasswordKdfAlgo`.
abstract class PasswordKdfAlgo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: passwordKdfAlgoSHA256SHA256PBKDF2HMACSHA512iter100000SHA256ModPow
    // constructor: passwordKdfAlgoUnknown
}

/// TL sum type `SecurePasswordKdfAlgo`.
abstract class SecurePasswordKdfAlgo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: securePasswordKdfAlgoPBKDF2HMACSHA512iter100000
    // constructor: securePasswordKdfAlgoSHA512
    // constructor: securePasswordKdfAlgoUnknown
}

/// TL sum type `SecureSecretSettings`.
abstract class SecureSecretSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: secureSecretSettings
}

/// TL sum type `InputCheckPasswordSRP`.
abstract class InputCheckPasswordSRP
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputCheckPasswordEmpty
    // constructor: inputCheckPasswordSRP
}

/// TL sum type `SecureRequiredType`.
abstract class SecureRequiredType
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: secureRequiredType
    // constructor: secureRequiredTypeOneOf
}

/// TL sum type `InputAppEvent`.
abstract class InputAppEvent
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputAppEvent
}

/// TL sum type `JSONObjectValue`.
abstract class JSONObjectValue
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: jsonObjectValue
}

/// TL sum type `JSONValue`.
abstract class JSONValue
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: jsonArray
    // constructor: jsonBool
    // constructor: jsonNull
    // constructor: jsonNumber
    // constructor: jsonObject
    // constructor: jsonString
}

/// TL sum type `PageTableCell`.
abstract class PageTableCell
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: pageTableCell
}

/// TL sum type `PageTableRow`.
abstract class PageTableRow
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: pageTableRow
}

/// TL sum type `PageCaption`.
abstract class PageCaption
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: pageCaption
}

/// TL sum type `PageListItem`.
abstract class PageListItem
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: pageListItemBlocks
    // constructor: pageListItemText
}

/// TL sum type `PageListOrderedItem`.
abstract class PageListOrderedItem
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: pageListOrderedItemBlocks
    // constructor: pageListOrderedItemText
}

/// TL sum type `PageRelatedArticle`.
abstract class PageRelatedArticle
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: pageRelatedArticle
}

/// TL sum type `Page`.
abstract class Page
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: page
}

/// TL sum type `PollAnswer`.
abstract class PollAnswer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPollAnswer
    // constructor: pollAnswer
}

/// TL sum type `Poll`.
abstract class Poll
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: poll
}

/// TL sum type `PollAnswerVoters`.
abstract class PollAnswerVoters
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: pollAnswerVoters
}

/// TL sum type `PollResults`.
abstract class PollResults
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: pollResults
}

/// TL sum type `ChatOnlines`.
abstract class ChatOnlines
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatOnlines
}

/// TL sum type `StatsURL`.
abstract class StatsURL
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: statsURL
}

/// TL sum type `ChatAdminRights`.
abstract class ChatAdminRights
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatAdminRights
}

/// TL sum type `ChatBannedRights`.
abstract class ChatBannedRights
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatBannedRights
}

/// TL sum type `InputWallPaper`.
abstract class InputWallPaper
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputWallPaper
    // constructor: inputWallPaperNoFile
    // constructor: inputWallPaperSlug
}

/// TL sum type `CodeSettings`.
abstract class CodeSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: codeSettings
}

/// TL sum type `WallPaperSettings`.
abstract class WallPaperSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallPaperSettings
}

/// TL sum type `AutoDownloadSettings`.
abstract class AutoDownloadSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: autoDownloadSettings
}

/// TL sum type `EmojiKeyword`.
abstract class EmojiKeyword
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: emojiKeyword
    // constructor: emojiKeywordDeleted
}

/// TL sum type `EmojiKeywordsDifference`.
abstract class EmojiKeywordsDifference
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: emojiKeywordsDifference
}

/// TL sum type `EmojiURL`.
abstract class EmojiURL
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: emojiURL
}

/// TL sum type `EmojiLanguage`.
abstract class EmojiLanguage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: emojiLanguage
}

/// TL sum type `Folder`.
abstract class Folder
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: folder
}

/// TL sum type `InputFolderPeer`.
abstract class InputFolderPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputFolderPeer
}

/// TL sum type `FolderPeer`.
abstract class FolderPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: folderPeer
}

/// TL sum type `UrlAuthResult`.
abstract class UrlAuthResult
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: urlAuthResultAccepted
    // constructor: urlAuthResultDefault
    // constructor: urlAuthResultRequest
}

/// TL sum type `ChannelLocation`.
abstract class ChannelLocation
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: channelLocation
    // constructor: channelLocationEmpty
}

/// TL sum type `PeerLocated`.
abstract class PeerLocated
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: peerLocated
    // constructor: peerSelfLocated
}

/// TL sum type `RestrictionReason`.
abstract class RestrictionReason
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: restrictionReason
}

/// TL sum type `InputTheme`.
abstract class InputTheme
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputTheme
    // constructor: inputThemeSlug
}

/// TL sum type `Theme`.
abstract class Theme
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: theme
}

/// TL sum type `BaseTheme`.
abstract class BaseTheme
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: baseThemeArctic
    // constructor: baseThemeClassic
    // constructor: baseThemeDay
    // constructor: baseThemeNight
    // constructor: baseThemeTinted
}

/// TL sum type `InputThemeSettings`.
abstract class InputThemeSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputThemeSettings
}

/// TL sum type `ThemeSettings`.
abstract class ThemeSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: themeSettings
}

/// TL sum type `WebPageAttribute`.
abstract class WebPageAttribute
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: webPageAttributeAiComposeTone
    // constructor: webPageAttributeStarGiftAuction
    // constructor: webPageAttributeStarGiftCollection
    // constructor: webPageAttributeStickerSet
    // constructor: webPageAttributeStory
    // constructor: webPageAttributeTheme
    // constructor: webPageAttributeUniqueStarGift
}

/// TL sum type `BankCardOpenUrl`.
abstract class BankCardOpenUrl
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: bankCardOpenUrl
}

/// TL sum type `DialogFilter`.
abstract class DialogFilter
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: dialogFilter
    // constructor: dialogFilterChatlist
    // constructor: dialogFilterDefault
}

/// TL sum type `DialogFilterSuggested`.
abstract class DialogFilterSuggested
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: dialogFilterSuggested
}

/// TL sum type `StatsDateRangeDays`.
abstract class StatsDateRangeDays
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: statsDateRangeDays
}

/// TL sum type `StatsAbsValueAndPrev`.
abstract class StatsAbsValueAndPrev
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: statsAbsValueAndPrev
}

/// TL sum type `StatsPercentValue`.
abstract class StatsPercentValue
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: statsPercentValue
}

/// TL sum type `StatsGraph`.
abstract class StatsGraph
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: statsGraph
    // constructor: statsGraphAsync
    // constructor: statsGraphError
}

/// TL sum type `VideoSize`.
abstract class VideoSize
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: videoSize
    // constructor: videoSizeEmojiMarkup
    // constructor: videoSizeStickerMarkup
}

/// TL sum type `StatsGroupTopPoster`.
abstract class StatsGroupTopPoster
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: statsGroupTopPoster
}

/// TL sum type `StatsGroupTopAdmin`.
abstract class StatsGroupTopAdmin
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: statsGroupTopAdmin
}

/// TL sum type `StatsGroupTopInviter`.
abstract class StatsGroupTopInviter
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: statsGroupTopInviter
}

/// TL sum type `GlobalPrivacySettings`.
abstract class GlobalPrivacySettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: globalPrivacySettings
}

/// TL sum type `MessageViews`.
abstract class MessageViews
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messageViews
}

/// TL sum type `MessageReplyHeader`.
abstract class MessageReplyHeader
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messageReplyHeader
    // constructor: messageReplyStoryHeader
}

/// TL sum type `MessageReplies`.
abstract class MessageReplies
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messageReplies
}

/// TL sum type `PeerBlocked`.
abstract class PeerBlocked
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: peerBlocked
}

/// TL sum type `GroupCall`.
abstract class GroupCall
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: groupCall
    // constructor: groupCallDiscarded
}

/// TL sum type `InputGroupCall`.
abstract class InputGroupCall
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputGroupCall
    // constructor: inputGroupCallInviteMessage
    // constructor: inputGroupCallSlug
}

/// TL sum type `GroupCallParticipant`.
abstract class GroupCallParticipant
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: groupCallParticipant
}

/// TL sum type `InlineQueryPeerType`.
abstract class InlineQueryPeerType
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inlineQueryPeerTypeBotPM
    // constructor: inlineQueryPeerTypeBroadcast
    // constructor: inlineQueryPeerTypeChat
    // constructor: inlineQueryPeerTypeMegagroup
    // constructor: inlineQueryPeerTypePM
    // constructor: inlineQueryPeerTypeSameBotPM
}

/// TL sum type `ChatInviteImporter`.
abstract class ChatInviteImporter
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatInviteImporter
}

/// TL sum type `ChatAdminWithInvites`.
abstract class ChatAdminWithInvites
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatAdminWithInvites
}

/// TL sum type `GroupCallParticipantVideoSourceGroup`.
abstract class GroupCallParticipantVideoSourceGroup
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: groupCallParticipantVideoSourceGroup
}

/// TL sum type `GroupCallParticipantVideo`.
abstract class GroupCallParticipantVideo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: groupCallParticipantVideo
}

/// TL sum type `BotCommandScope`.
abstract class BotCommandScope
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: botCommandScopeChatAdmins
    // constructor: botCommandScopeChats
    // constructor: botCommandScopeDefault
    // constructor: botCommandScopePeer
    // constructor: botCommandScopePeerAdmins
    // constructor: botCommandScopePeerUser
    // constructor: botCommandScopeUsers
}

/// TL sum type `ChatTheme`.
abstract class ChatTheme
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatTheme
    // constructor: chatThemeUniqueGift
}

/// TL sum type `SponsoredMessage`.
abstract class SponsoredMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: sponsoredMessage
}

/// TL sum type `SearchResultsCalendarPeriod`.
abstract class SearchResultsCalendarPeriod
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: searchResultsCalendarPeriod
}

/// TL sum type `SearchResultsPosition`.
abstract class SearchResultsPosition
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: searchResultPosition
}

/// TL sum type `ReactionCount`.
abstract class ReactionCount
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: reactionCount
}

/// TL sum type `MessageReactions`.
abstract class MessageReactions
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messageReactions
}

/// TL sum type `AvailableReaction`.
abstract class AvailableReaction
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: availableReaction
}

/// TL sum type `MessagePeerReaction`.
abstract class MessagePeerReaction
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messagePeerReaction
}

/// TL sum type `GroupCallStreamChannel`.
abstract class GroupCallStreamChannel
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: groupCallStreamChannel
}

/// TL sum type `AttachMenuBotIconColor`.
abstract class AttachMenuBotIconColor
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: attachMenuBotIconColor
}

/// TL sum type `AttachMenuBotIcon`.
abstract class AttachMenuBotIcon
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: attachMenuBotIcon
}

/// TL sum type `AttachMenuBot`.
abstract class AttachMenuBot
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: attachMenuBot
}

/// TL sum type `AttachMenuBots`.
abstract class AttachMenuBots
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: attachMenuBots
    // constructor: attachMenuBotsNotModified
}

/// TL sum type `AttachMenuBotsBot`.
abstract class AttachMenuBotsBot
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: attachMenuBotsBot
}

/// TL sum type `WebViewResult`.
abstract class WebViewResult
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: webViewResultUrl
}

/// TL sum type `WebViewMessageSent`.
abstract class WebViewMessageSent
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: webViewMessageSent
}

/// TL sum type `BotMenuButton`.
abstract class BotMenuButton
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: botMenuButton
    // constructor: botMenuButtonCommands
    // constructor: botMenuButtonDefault
}

/// TL sum type `NotificationSound`.
abstract class NotificationSound
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: notificationSoundDefault
    // constructor: notificationSoundLocal
    // constructor: notificationSoundNone
    // constructor: notificationSoundRingtone
}

/// TL sum type `AttachMenuPeerType`.
abstract class AttachMenuPeerType
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: attachMenuPeerTypeBotPM
    // constructor: attachMenuPeerTypeBroadcast
    // constructor: attachMenuPeerTypeChat
    // constructor: attachMenuPeerTypePM
    // constructor: attachMenuPeerTypeSameBotPM
}

/// TL sum type `InputInvoice`.
abstract class InputInvoice
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputInvoiceBusinessBotTransferStars
    // constructor: inputInvoiceChatInviteSubscription
    // constructor: inputInvoiceMessage
    // constructor: inputInvoicePremiumAuthCode
    // constructor: inputInvoicePremiumGiftCode
    // constructor: inputInvoicePremiumGiftStars
    // constructor: inputInvoiceSlug
    // constructor: inputInvoiceStarGift
    // constructor: inputInvoiceStarGiftAuctionBid
    // constructor: inputInvoiceStarGiftDropOriginalDetails
    // constructor: inputInvoiceStarGiftPrepaidUpgrade
    // constructor: inputInvoiceStarGiftResale
    // constructor: inputInvoiceStarGiftTransfer
    // constructor: inputInvoiceStarGiftUpgrade
    // constructor: inputInvoiceStars
}

/// TL sum type `InputStorePaymentPurpose`.
abstract class InputStorePaymentPurpose
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputStorePaymentAuthCode
    // constructor: inputStorePaymentGiftPremium
    // constructor: inputStorePaymentPremiumGiftCode
    // constructor: inputStorePaymentPremiumGiveaway
    // constructor: inputStorePaymentPremiumSubscription
    // constructor: inputStorePaymentStarsGift
    // constructor: inputStorePaymentStarsGiveaway
    // constructor: inputStorePaymentStarsTopup
}

/// TL sum type `PaymentFormMethod`.
abstract class PaymentFormMethod
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: paymentFormMethod
}

/// TL sum type `EmojiStatus`.
abstract class EmojiStatus
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: emojiStatus
    // constructor: emojiStatusCollectible
    // constructor: emojiStatusEmpty
    // constructor: inputEmojiStatusCollectible
}

/// TL sum type `Reaction`.
abstract class Reaction
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: reactionCustomEmoji
    // constructor: reactionEmoji
    // constructor: reactionEmpty
    // constructor: reactionPaid
}

/// TL sum type `ChatReactions`.
abstract class ChatReactions
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: chatReactionsAll
    // constructor: chatReactionsNone
    // constructor: chatReactionsSome
}

/// TL sum type `EmailVerifyPurpose`.
abstract class EmailVerifyPurpose
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: emailVerifyPurposeLoginChange
    // constructor: emailVerifyPurposeLoginSetup
    // constructor: emailVerifyPurposePassport
}

/// TL sum type `EmailVerification`.
abstract class EmailVerification
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: emailVerificationApple
    // constructor: emailVerificationCode
    // constructor: emailVerificationGoogle
}

/// TL sum type `PremiumSubscriptionOption`.
abstract class PremiumSubscriptionOption
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: premiumSubscriptionOption
}

/// TL sum type `SendAsPeer`.
abstract class SendAsPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: sendAsPeer
}

/// TL sum type `MessageExtendedMedia`.
abstract class MessageExtendedMedia
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messageExtendedMedia
    // constructor: messageExtendedMediaPreview
}

/// TL sum type `StickerKeyword`.
abstract class StickerKeyword
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: stickerKeyword
}

/// TL sum type `Username`.
abstract class Username
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: username
}

/// TL sum type `ForumTopic`.
abstract class ForumTopic
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: forumTopic
    // constructor: forumTopicDeleted
}

/// TL sum type `DefaultHistoryTTL`.
abstract class DefaultHistoryTTL
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: defaultHistoryTTL
}

/// TL sum type `ExportedContactToken`.
abstract class ExportedContactToken
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: exportedContactToken
}

/// TL sum type `RequestPeerType`.
abstract class RequestPeerType
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: requestPeerTypeBroadcast
    // constructor: requestPeerTypeChat
    // constructor: requestPeerTypeCreateBot
    // constructor: requestPeerTypeUser
}

/// TL sum type `EmojiList`.
abstract class EmojiList
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: emojiList
    // constructor: emojiListNotModified
}

/// TL sum type `EmojiGroup`.
abstract class EmojiGroup
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: emojiGroup
    // constructor: emojiGroupGreeting
    // constructor: emojiGroupPremium
}

/// TL sum type `TextWithEntities`.
abstract class TextWithEntities
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: textWithEntities
}

/// TL sum type `AutoSaveSettings`.
abstract class AutoSaveSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: autoSaveSettings
}

/// TL sum type `AutoSaveException`.
abstract class AutoSaveException
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: autoSaveException
}

/// TL sum type `InputBotApp`.
abstract class InputBotApp
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputBotAppID
    // constructor: inputBotAppShortName
}

/// TL sum type `BotApp`.
abstract class BotApp
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: botApp
    // constructor: botAppNotModified
}

/// TL sum type `InlineBotWebView`.
abstract class InlineBotWebView
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inlineBotWebView
}

/// TL sum type `ReadParticipantDate`.
abstract class ReadParticipantDate
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: readParticipantDate
}

/// TL sum type `InputChatlist`.
abstract class InputChatlist
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputChatlistDialogFilter
}

/// TL sum type `ExportedChatlistInvite`.
abstract class ExportedChatlistInvite
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: exportedChatlistInvite
}

/// TL sum type `MessagePeerVote`.
abstract class MessagePeerVote
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messagePeerVote
    // constructor: messagePeerVoteInputOption
    // constructor: messagePeerVoteMultiple
}

/// TL sum type `StoryViews`.
abstract class StoryViews
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: storyViews
}

/// TL sum type `StoryItem`.
abstract class StoryItem
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: storyItem
    // constructor: storyItemDeleted
    // constructor: storyItemSkipped
}

/// TL sum type `StoryView`.
abstract class StoryView
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: storyView
    // constructor: storyViewPublicForward
    // constructor: storyViewPublicRepost
}

/// TL sum type `InputReplyTo`.
abstract class InputReplyTo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputReplyToEphemeralMessage
    // constructor: inputReplyToMessage
    // constructor: inputReplyToMonoForum
    // constructor: inputReplyToStory
}

/// TL sum type `ExportedStoryLink`.
abstract class ExportedStoryLink
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: exportedStoryLink
}

/// TL sum type `StoriesStealthMode`.
abstract class StoriesStealthMode
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: storiesStealthMode
}

/// TL sum type `MediaAreaCoordinates`.
abstract class MediaAreaCoordinates
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: mediaAreaCoordinates
}

/// TL sum type `MediaArea`.
abstract class MediaArea
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputMediaAreaChannelPost
    // constructor: inputMediaAreaVenue
    // constructor: mediaAreaChannelPost
    // constructor: mediaAreaGeoPoint
    // constructor: mediaAreaStarGift
    // constructor: mediaAreaSuggestedReaction
    // constructor: mediaAreaUrl
    // constructor: mediaAreaVenue
    // constructor: mediaAreaWeather
}

/// TL sum type `PeerStories`.
abstract class PeerStories
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: peerStories
}

/// TL sum type `PremiumGiftCodeOption`.
abstract class PremiumGiftCodeOption
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: premiumGiftCodeOption
}

/// TL sum type `PrepaidGiveaway`.
abstract class PrepaidGiveaway
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: prepaidGiveaway
    // constructor: prepaidStarsGiveaway
}

/// TL sum type `Boost`.
abstract class Boost
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: boost
}

/// TL sum type `MyBoost`.
abstract class MyBoost
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: myBoost
}

/// TL sum type `StoryFwdHeader`.
abstract class StoryFwdHeader
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: storyFwdHeader
}

/// TL sum type `PostInteractionCounters`.
abstract class PostInteractionCounters
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: postInteractionCountersMessage
    // constructor: postInteractionCountersStory
}

/// TL sum type `PublicForward`.
abstract class PublicForward
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: publicForwardMessage
    // constructor: publicForwardStory
}

/// TL sum type `PeerColor`.
abstract class PeerColor
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPeerColorCollectible
    // constructor: peerColor
    // constructor: peerColorCollectible
}

/// TL sum type `StoryReaction`.
abstract class StoryReaction
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: storyReaction
    // constructor: storyReactionPublicForward
    // constructor: storyReactionPublicRepost
}

/// TL sum type `SavedDialog`.
abstract class SavedDialog
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: monoForumDialog
    // constructor: savedDialog
}

/// TL sum type `SavedReactionTag`.
abstract class SavedReactionTag
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: savedReactionTag
}

/// TL sum type `OutboxReadDate`.
abstract class OutboxReadDate
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: outboxReadDate
}

/// TL sum type `SmsJob`.
abstract class SmsJob
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: smsJob
}

/// TL sum type `BusinessWeeklyOpen`.
abstract class BusinessWeeklyOpen
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: businessWeeklyOpen
}

/// TL sum type `BusinessWorkHours`.
abstract class BusinessWorkHours
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: businessWorkHours
}

/// TL sum type `BusinessLocation`.
abstract class BusinessLocation
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: businessLocation
}

/// TL sum type `InputBusinessRecipients`.
abstract class InputBusinessRecipients
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputBusinessRecipients
}

/// TL sum type `BusinessRecipients`.
abstract class BusinessRecipients
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: businessRecipients
}

/// TL sum type `BusinessAwayMessageSchedule`.
abstract class BusinessAwayMessageSchedule
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: businessAwayMessageScheduleAlways
    // constructor: businessAwayMessageScheduleCustom
    // constructor: businessAwayMessageScheduleOutsideWorkHours
}

/// TL sum type `InputBusinessGreetingMessage`.
abstract class InputBusinessGreetingMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputBusinessGreetingMessage
}

/// TL sum type `BusinessGreetingMessage`.
abstract class BusinessGreetingMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: businessGreetingMessage
}

/// TL sum type `InputBusinessAwayMessage`.
abstract class InputBusinessAwayMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputBusinessAwayMessage
}

/// TL sum type `BusinessAwayMessage`.
abstract class BusinessAwayMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: businessAwayMessage
}

/// TL sum type `Timezone`.
abstract class Timezone
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: timezone
}

/// TL sum type `QuickReply`.
abstract class QuickReply
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: quickReply
}

/// TL sum type `InputQuickReplyShortcut`.
abstract class InputQuickReplyShortcut
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputQuickReplyShortcut
    // constructor: inputQuickReplyShortcutId
}

/// TL sum type `ConnectedBot`.
abstract class ConnectedBot
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: connectedBot
}

/// TL sum type `Birthday`.
abstract class Birthday
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: birthday
}

/// TL sum type `BotBusinessConnection`.
abstract class BotBusinessConnection
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: botBusinessConnection
}

/// TL sum type `InputBusinessIntro`.
abstract class InputBusinessIntro
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputBusinessIntro
}

/// TL sum type `BusinessIntro`.
abstract class BusinessIntro
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: businessIntro
}

/// TL sum type `InputCollectible`.
abstract class InputCollectible
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputCollectiblePhone
    // constructor: inputCollectibleUsername
}

/// TL sum type `InputBusinessBotRecipients`.
abstract class InputBusinessBotRecipients
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputBusinessBotRecipients
}

/// TL sum type `BusinessBotRecipients`.
abstract class BusinessBotRecipients
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: businessBotRecipients
}

/// TL sum type `ContactBirthday`.
abstract class ContactBirthday
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: contactBirthday
}

/// TL sum type `MissingInvitee`.
abstract class MissingInvitee
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: missingInvitee
}

/// TL sum type `InputBusinessChatLink`.
abstract class InputBusinessChatLink
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputBusinessChatLink
}

/// TL sum type `BusinessChatLink`.
abstract class BusinessChatLink
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: businessChatLink
}

/// TL sum type `RequestedPeer`.
abstract class RequestedPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: requestedPeerChannel
    // constructor: requestedPeerChat
    // constructor: requestedPeerUser
}

/// TL sum type `SponsoredMessageReportOption`.
abstract class SponsoredMessageReportOption
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: sponsoredMessageReportOption
}

/// TL sum type `ReactionNotificationsFrom`.
abstract class ReactionNotificationsFrom
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: reactionNotificationsFromAll
    // constructor: reactionNotificationsFromContacts
}

/// TL sum type `ReactionsNotifySettings`.
abstract class ReactionsNotifySettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: reactionsNotifySettings
}

/// TL sum type `AvailableEffect`.
abstract class AvailableEffect
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: availableEffect
}

/// TL sum type `FactCheck`.
abstract class FactCheck
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: factCheck
}

/// TL sum type `StarsTransactionPeer`.
abstract class StarsTransactionPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starsTransactionPeer
    // constructor: starsTransactionPeerAPI
    // constructor: starsTransactionPeerAds
    // constructor: starsTransactionPeerAppStore
    // constructor: starsTransactionPeerFragment
    // constructor: starsTransactionPeerPlayMarket
    // constructor: starsTransactionPeerPremiumBot
    // constructor: starsTransactionPeerUnsupported
}

/// TL sum type `StarsTopupOption`.
abstract class StarsTopupOption
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starsTopupOption
}

/// TL sum type `StarsTransaction`.
abstract class StarsTransaction
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starsTransaction
}

/// TL sum type `FoundStory`.
abstract class FoundStory
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: foundStory
}

/// TL sum type `GeoPointAddress`.
abstract class GeoPointAddress
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: geoPointAddress
}

/// TL sum type `StarsRevenueStatus`.
abstract class StarsRevenueStatus
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starsRevenueStatus
}

/// TL sum type `InputStarsTransaction`.
abstract class InputStarsTransaction
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputStarsTransaction
}

/// TL sum type `StarsGiftOption`.
abstract class StarsGiftOption
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starsGiftOption
}

/// TL sum type `BotPreviewMedia`.
abstract class BotPreviewMedia
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: botPreviewMedia
}

/// TL sum type `StarsSubscriptionPricing`.
abstract class StarsSubscriptionPricing
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starsSubscriptionPricing
}

/// TL sum type `StarsSubscription`.
abstract class StarsSubscription
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starsSubscription
}

/// TL sum type `MessageReactor`.
abstract class MessageReactor
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messageReactor
}

/// TL sum type `StarsGiveawayOption`.
abstract class StarsGiveawayOption
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starsGiveawayOption
}

/// TL sum type `StarsGiveawayWinnersOption`.
abstract class StarsGiveawayWinnersOption
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starsGiveawayWinnersOption
}

/// TL sum type `StarGift`.
abstract class StarGift
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGift
    // constructor: starGiftUnique
}

/// TL sum type `MessageReportOption`.
abstract class MessageReportOption
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: messageReportOption
}

/// TL sum type `ReportResult`.
abstract class ReportResult
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: reportResultAddComment
    // constructor: reportResultChooseOption
    // constructor: reportResultReported
}

/// TL sum type `BotAppSettings`.
abstract class BotAppSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: botAppSettings
}

/// TL sum type `StarRefProgram`.
abstract class StarRefProgram
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starRefProgram
}

/// TL sum type `ConnectedBotStarRef`.
abstract class ConnectedBotStarRef
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: connectedBotStarRef
}

/// TL sum type `StarsAmount`.
abstract class StarsAmount
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starsAmount
    // constructor: starsTonAmount
}

/// TL sum type `BotVerifierSettings`.
abstract class BotVerifierSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: botVerifierSettings
}

/// TL sum type `BotVerification`.
abstract class BotVerification
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: botVerification
}

/// TL sum type `StarGiftAttribute`.
abstract class StarGiftAttribute
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGiftAttributeBackdrop
    // constructor: starGiftAttributeModel
    // constructor: starGiftAttributeOriginalDetails
    // constructor: starGiftAttributePattern
}

/// TL sum type `SavedStarGift`.
abstract class SavedStarGift
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: savedStarGift
}

/// TL sum type `InputSavedStarGift`.
abstract class InputSavedStarGift
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputSavedStarGiftChat
    // constructor: inputSavedStarGiftSlug
    // constructor: inputSavedStarGiftUser
}

/// TL sum type `PaidReactionPrivacy`.
abstract class PaidReactionPrivacy
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: paidReactionPrivacyAnonymous
    // constructor: paidReactionPrivacyDefault
    // constructor: paidReactionPrivacyPeer
}

/// TL sum type `RequirementToContact`.
abstract class RequirementToContact
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: requirementToContactEmpty
    // constructor: requirementToContactPaidMessages
    // constructor: requirementToContactPremium
}

/// TL sum type `BusinessBotRights`.
abstract class BusinessBotRights
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: businessBotRights
}

/// TL sum type `DisallowedGiftsSettings`.
abstract class DisallowedGiftsSettings
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: disallowedGiftsSettings
}

/// TL sum type `SponsoredPeer`.
abstract class SponsoredPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: sponsoredPeer
}

/// TL sum type `StarGiftAttributeId`.
abstract class StarGiftAttributeId
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGiftAttributeIdBackdrop
    // constructor: starGiftAttributeIdModel
    // constructor: starGiftAttributeIdPattern
}

/// TL sum type `StarGiftAttributeCounter`.
abstract class StarGiftAttributeCounter
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGiftAttributeCounter
}

/// TL sum type `PendingSuggestion`.
abstract class PendingSuggestion
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: pendingSuggestion
}

/// TL sum type `TodoItem`.
abstract class TodoItem
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: todoItem
}

/// TL sum type `TodoList`.
abstract class TodoList
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: todoList
}

/// TL sum type `TodoCompletion`.
abstract class TodoCompletion
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: todoCompletion
}

/// TL sum type `SuggestedPost`.
abstract class SuggestedPost
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: suggestedPost
}

/// TL sum type `StarsRating`.
abstract class StarsRating
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starsRating
}

/// TL sum type `StarGiftCollection`.
abstract class StarGiftCollection
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGiftCollection
}

/// TL sum type `StoryAlbum`.
abstract class StoryAlbum
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: storyAlbum
}

/// TL sum type `SearchPostsFlood`.
abstract class SearchPostsFlood
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: searchPostsFlood
}

/// TL sum type `ProfileTab`.
abstract class ProfileTab
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: profileTabFiles
    // constructor: profileTabGifs
    // constructor: profileTabGifts
    // constructor: profileTabLinks
    // constructor: profileTabMedia
    // constructor: profileTabMusic
    // constructor: profileTabPosts
    // constructor: profileTabVoice
}

/// TL sum type `InputChatTheme`.
abstract class InputChatTheme
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputChatTheme
    // constructor: inputChatThemeEmpty
    // constructor: inputChatThemeUniqueGift
}

/// TL sum type `StarGiftUpgradePrice`.
abstract class StarGiftUpgradePrice
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGiftUpgradePrice
}

/// TL sum type `GroupCallMessage`.
abstract class GroupCallMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: groupCallMessage
}

/// TL sum type `GroupCallDonor`.
abstract class GroupCallDonor
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: groupCallDonor
}

/// TL sum type `RecentStory`.
abstract class RecentStory
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: recentStory
}

/// TL sum type `AuctionBidLevel`.
abstract class AuctionBidLevel
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: auctionBidLevel
}

/// TL sum type `StarGiftAuctionState`.
abstract class StarGiftAuctionState
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGiftAuctionState
    // constructor: starGiftAuctionStateFinished
    // constructor: starGiftAuctionStateNotModified
}

/// TL sum type `StarGiftAuctionUserState`.
abstract class StarGiftAuctionUserState
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGiftAuctionUserState
}

/// TL sum type `StarGiftAuctionAcquiredGift`.
abstract class StarGiftAuctionAcquiredGift
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGiftAuctionAcquiredGift
}

/// TL sum type `StarGiftActiveAuctionState`.
abstract class StarGiftActiveAuctionState
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGiftActiveAuctionState
}

/// TL sum type `InputStarGiftAuction`.
abstract class InputStarGiftAuction
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputStarGiftAuction
    // constructor: inputStarGiftAuctionSlug
}

/// TL sum type `Passkey`.
abstract class Passkey
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: passkey
}

/// TL sum type `InputPasskeyResponse`.
abstract class InputPasskeyResponse
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPasskeyResponseLogin
    // constructor: inputPasskeyResponseRegister
}

/// TL sum type `InputPasskeyCredential`.
abstract class InputPasskeyCredential
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputPasskeyCredentialPublicKey
}

/// TL sum type `StarGiftBackground`.
abstract class StarGiftBackground
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGiftBackground
}

/// TL sum type `StarGiftAuctionRound`.
abstract class StarGiftAuctionRound
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGiftAuctionRound
    // constructor: starGiftAuctionRoundExtendable
}

/// TL sum type `StarGiftAttributeRarity`.
abstract class StarGiftAttributeRarity
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: starGiftAttributeRarity
    // constructor: starGiftAttributeRarityEpic
    // constructor: starGiftAttributeRarityLegendary
    // constructor: starGiftAttributeRarityRare
    // constructor: starGiftAttributeRarityUncommon
}

/// TL sum type `KeyboardButtonStyle`.
abstract class KeyboardButtonStyle
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: keyboardButtonStyle
}

/// TL sum type `InputMessageReadMetric`.
abstract class InputMessageReadMetric
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputMessageReadMetric
}

/// TL sum type `InputAiComposeTone`.
abstract class InputAiComposeTone
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputAiComposeToneDefault
    // constructor: inputAiComposeToneID
    // constructor: inputAiComposeToneSingleUse
    // constructor: inputAiComposeToneSlug
}

/// TL sum type `AiComposeTone`.
abstract class AiComposeTone
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: aiComposeTone
    // constructor: aiComposeToneDefault
}

/// TL sum type `AiComposeToneExample`.
abstract class AiComposeToneExample
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: aiComposeToneExample
}

/// TL sum type `JoinChatBotResult`.
abstract class JoinChatBotResult
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: joinChatBotResultApproved
    // constructor: joinChatBotResultDeclined
    // constructor: joinChatBotResultQueued
    // constructor: joinChatBotResultWebView
}

/// TL sum type `WebDomainException`.
abstract class WebDomainException
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: webDomainException
}

/// TL sum type `InputRichFile`.
abstract class InputRichFile
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputRichFileDocument
    // constructor: inputRichFilePhoto
}

/// TL sum type `InputRichMessage`.
abstract class InputRichMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputRichMessage
    // constructor: inputRichMessageHTML
    // constructor: inputRichMessageMarkdown
}

/// TL sum type `RichMessage`.
abstract class RichMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: richMessage
}

/// TL sum type `CommunityPeer`.
abstract class CommunityPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: communityPeer
}

/// TL sum type `CommunityPeerRequest`.
abstract class CommunityPeerRequest
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: communityPeerRequest
}

/// TL sum type `EphemeralMessage`.
abstract class EphemeralMessage
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: ephemeralMessage
}

/// TL sum type `ButtonType`.
abstract class ButtonType
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: buttonTypeDefault
    // constructor: buttonTypeRequestGeoLocation
    // constructor: buttonTypeRequestPeer
    // constructor: buttonTypeRequestPhone
    // constructor: buttonTypeRequestPoll
    // constructor: buttonTypeSimpleWebView
    // constructor: inputButtonTypeRequestPeer
}

/// TL sum type `InlineButtonType`.
abstract class InlineButtonType
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inlineButtonTypeBuy
    // constructor: inlineButtonTypeCallback
    // constructor: inlineButtonTypeCopy
    // constructor: inlineButtonTypeDisabled
    // constructor: inlineButtonTypeGame
    // constructor: inlineButtonTypeSwitchInline
    // constructor: inlineButtonTypeUrl
    // constructor: inlineButtonTypeUrlAuth
    // constructor: inlineButtonTypeUserProfile
    // constructor: inlineButtonTypeWebView
    // constructor: inputInlineButtonTypeUrlAuth
    // constructor: inputInlineButtonTypeUserProfile
}

/// TL sum type `KeyboardInlineButton`.
abstract class KeyboardInlineButton
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: keyboardInlineButton
}

/// TL sum type `KeyboardInlineButtonRow`.
abstract class KeyboardInlineButtonRow
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: keyboardInlineButtonRow
}

/// TL sum type `RichButtonStyle`.
abstract class RichButtonStyle
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: richButtonStyle
}

/// TL sum type `PageButton`.
abstract class PageButton
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: pageButton
}

/// TL sum type `CurrencyRate`.
abstract class CurrencyRate
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: currencyRate
}

/// TL sum type `OnrampMethodAvailability`.
abstract class OnrampMethodAvailability
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: onrampMethodAvailability
}

/// TL sum type `OnrampProviderInfo`.
abstract class OnrampProviderInfo
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: onrampProviderInfo
}

/// TL sum type `OnrampAvailability`.
abstract class OnrampAvailability
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: onrampAvailability
}

/// TL sum type `OnrampLimits`.
abstract class OnrampLimits
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: onrampLimits
}

/// TL sum type `OnrampQuote`.
abstract class OnrampQuote
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: onrampQuote
}

/// TL sum type `OnrampSession`.
abstract class OnrampSession
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: onrampSession
}

/// TL sum type `WalletState`.
abstract class WalletState
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: walletState
    // constructor: walletStateEmpty
}

/// TL sum type `WalletUserAddress`.
abstract class WalletUserAddress
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: walletUserAddress
}

/// TL sum type `WalletTransactionPeer`.
abstract class WalletTransactionPeer
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: walletTransactionPeerAddress
    // constructor: walletTransactionPeerOnramp
    // constructor: walletTransactionPeerUnsupported
    // constructor: walletTransactionPeerUser
}

/// TL sum type `WalletTransaction`.
abstract class WalletTransaction
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: walletTransaction
}

/// TL sum type `WalletOwnershipProof`.
abstract class WalletOwnershipProof
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: walletOwnershipProof
}

/// TL sum type `InputWalletReplacement`.
abstract class InputWalletReplacement
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: inputWalletImported
    // constructor: inputWalletNew
}

/// TL sum type `TonConnectManifest`.
abstract class TonConnectManifest
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: tonConnectManifest
}

/// TL sum type `TonConnectSession`.
abstract class TonConnectSession
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: tonConnectSession
}

/// TL sum type `TonConnectNextEventId`.
abstract class TonConnectNextEventId
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: tonConnectNextEventId
}

/// TL sum type `TonConnectRequest`.
abstract class TonConnectRequest
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: tonConnectRequest
}

/// TL constructor `true`, id 0x3FEDD339.
final class true_ : True
{
    enum uint tlId = 0x3FEDD339;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `boolFalse`, id 0xBC799737.
final class boolFalse
{
    enum uint tlId = 0xBC799737;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `boolTrue`, id 0x997275B5.
final class boolTrue
{
    enum uint tlId = 0x997275B5;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `error`, id 0xC4B9F9BB.
final class error : Error_
{
    enum uint tlId = 0xC4B9F9BB;

    int code;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `ipPort`, id 0xD433AD73.
final class ipPort : IpPort
{
    enum uint tlId = 0xD433AD73;

    int ipv4;
    int port;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `ipPortSecret`, id 0x37982646.
final class ipPortSecret : IpPort
{
    enum uint tlId = 0x37982646;

    int ipv4;
    int port;
    ubyte[] secret;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `accessPointRule`, id 0x4679B65F.
final class accessPointRule : AccessPointRule
{
    enum uint tlId = 0x4679B65F;

    string phone_prefix_rules;
    int dc_id;
    Vector!(IpPort) ips;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPeerPhotoFileLocationLegacy`, id 0x27D69997.
final class inputPeerPhotoFileLocationLegacy : InputFileLocation
{
    enum uint tlId = 0x27D69997;

    uint flags;
    bool big;
    InputPeer peer;
    long volume_id;
    int local_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetThumbLegacy`, id 0x0DBAEAE9.
final class inputStickerSetThumbLegacy : InputFileLocation
{
    enum uint tlId = 0x0DBAEAE9;

    InputStickerSet stickerset;
    long volume_id;
    int local_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPeerEmpty`, id 0x7F3B18EA.
final class inputPeerEmpty : InputPeer
{
    enum uint tlId = 0x7F3B18EA;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPeerSelf`, id 0x7DA07EC9.
final class inputPeerSelf : InputPeer
{
    enum uint tlId = 0x7DA07EC9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPeerChat`, id 0x35A95CB9.
final class inputPeerChat : InputPeer
{
    enum uint tlId = 0x35A95CB9;

    long chat_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPeerUser`, id 0xDDE8A54C.
final class inputPeerUser : InputPeer
{
    enum uint tlId = 0xDDE8A54C;

    long user_id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPeerChannel`, id 0x27BCBBFC.
final class inputPeerChannel : InputPeer
{
    enum uint tlId = 0x27BCBBFC;

    long channel_id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPeerUserFromMessage`, id 0xA87B0A1C.
final class inputPeerUserFromMessage : InputPeer
{
    enum uint tlId = 0xA87B0A1C;

    InputPeer peer;
    int msg_id;
    long user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPeerChannelFromMessage`, id 0xBD2A0840.
final class inputPeerChannelFromMessage : InputPeer
{
    enum uint tlId = 0xBD2A0840;

    InputPeer peer;
    int msg_id;
    long channel_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputUserEmpty`, id 0xB98886CF.
final class inputUserEmpty : InputUser
{
    enum uint tlId = 0xB98886CF;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputUserSelf`, id 0xF7C1B13F.
final class inputUserSelf : InputUser
{
    enum uint tlId = 0xF7C1B13F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputUser`, id 0xF21158C6.
final class inputUser : InputUser
{
    enum uint tlId = 0xF21158C6;

    long user_id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputUserFromMessage`, id 0x1DA448E2.
final class inputUserFromMessage : InputUser
{
    enum uint tlId = 0x1DA448E2;

    InputPeer peer;
    int msg_id;
    long user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPhoneContact`, id 0x6A1DC4BE.
final class inputPhoneContact : InputContact
{
    enum uint tlId = 0x6A1DC4BE;

    uint flags;
    long client_id;
    string phone;
    string first_name;
    string last_name;
    TextWithEntities note;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputFile`, id 0xF52FF27F.
final class inputFile : InputFile
{
    enum uint tlId = 0xF52FF27F;

    long id;
    int parts;
    string name;
    string md5_checksum;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputFileBig`, id 0xFA4F0BB5.
final class inputFileBig : InputFile
{
    enum uint tlId = 0xFA4F0BB5;

    long id;
    int parts;
    string name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputFileStoryDocument`, id 0x62DC8B48.
final class inputFileStoryDocument : InputFile
{
    enum uint tlId = 0x62DC8B48;

    InputDocument id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaEmpty`, id 0x9664F57F.
final class inputMediaEmpty : InputMedia
{
    enum uint tlId = 0x9664F57F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaUploadedPhoto`, id 0x7D8375DA.
final class inputMediaUploadedPhoto : InputMedia
{
    enum uint tlId = 0x7D8375DA;

    uint flags;
    bool spoiler;
    bool live_photo;
    InputFile file;
    Vector!(InputDocument) stickers;
    int ttl_seconds;
    InputDocument video;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaPhoto`, id 0xE3AF4434.
final class inputMediaPhoto : InputMedia
{
    enum uint tlId = 0xE3AF4434;

    uint flags;
    bool spoiler;
    bool live_photo;
    InputPhoto id;
    int ttl_seconds;
    InputDocument video;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaGeoPoint`, id 0xF9C44144.
final class inputMediaGeoPoint : InputMedia
{
    enum uint tlId = 0xF9C44144;

    InputGeoPoint geo_point;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaContact`, id 0xF8AB7DFB.
final class inputMediaContact : InputMedia
{
    enum uint tlId = 0xF8AB7DFB;

    string phone_number;
    string first_name;
    string last_name;
    string vcard;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaUploadedDocument`, id 0x037C9330.
final class inputMediaUploadedDocument : InputMedia
{
    enum uint tlId = 0x037C9330;

    uint flags;
    bool nosound_video;
    bool force_file;
    bool spoiler;
    InputFile file;
    InputFile thumb;
    string mime_type;
    Vector!(DocumentAttribute) attributes;
    Vector!(InputDocument) stickers;
    InputPhoto video_cover;
    int video_timestamp;
    int ttl_seconds;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaDocument`, id 0xA8763AB5.
final class inputMediaDocument : InputMedia
{
    enum uint tlId = 0xA8763AB5;

    uint flags;
    bool spoiler;
    InputDocument id;
    InputPhoto video_cover;
    int video_timestamp;
    int ttl_seconds;
    string query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaVenue`, id 0xC13D1C11.
final class inputMediaVenue : InputMedia
{
    enum uint tlId = 0xC13D1C11;

    InputGeoPoint geo_point;
    string title;
    string address;
    string provider;
    string venue_id;
    string venue_type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaPhotoExternal`, id 0xE5BBFE1A.
final class inputMediaPhotoExternal : InputMedia
{
    enum uint tlId = 0xE5BBFE1A;

    uint flags;
    bool spoiler;
    string url;
    int ttl_seconds;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaDocumentExternal`, id 0x779600F9.
final class inputMediaDocumentExternal : InputMedia
{
    enum uint tlId = 0x779600F9;

    uint flags;
    bool spoiler;
    string url;
    int ttl_seconds;
    InputPhoto video_cover;
    int video_timestamp;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaGame`, id 0xD33F43F3.
final class inputMediaGame : InputMedia
{
    enum uint tlId = 0xD33F43F3;

    InputGame id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaInvoice`, id 0x405FEF0D.
final class inputMediaInvoice : InputMedia
{
    enum uint tlId = 0x405FEF0D;

    uint flags;
    string title;
    string description;
    InputWebDocument photo;
    Invoice invoice;
    ubyte[] payload;
    string provider;
    DataJSON provider_data;
    string start_param;
    InputMedia extended_media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaGeoLive`, id 0x971FA843.
final class inputMediaGeoLive : InputMedia
{
    enum uint tlId = 0x971FA843;

    uint flags;
    bool stopped;
    InputGeoPoint geo_point;
    int heading;
    int period;
    int proximity_notification_radius;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaPoll`, id 0x883A4108.
final class inputMediaPoll : InputMedia
{
    enum uint tlId = 0x883A4108;

    uint flags;
    Poll poll;
    Vector!(int) correct_answers;
    InputMedia attached_media;
    string solution;
    Vector!(MessageEntity) solution_entities;
    InputMedia solution_media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaDice`, id 0xE66FBF7B.
final class inputMediaDice : InputMedia
{
    enum uint tlId = 0xE66FBF7B;

    string emoticon;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaStory`, id 0x89FDD778.
final class inputMediaStory : InputMedia
{
    enum uint tlId = 0x89FDD778;

    InputPeer peer;
    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaWebPage`, id 0xC21B8849.
final class inputMediaWebPage : InputMedia
{
    enum uint tlId = 0xC21B8849;

    uint flags;
    bool force_large_media;
    bool force_small_media;
    bool optional;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaPaidMedia`, id 0xC4103386.
final class inputMediaPaidMedia : InputMedia
{
    enum uint tlId = 0xC4103386;

    uint flags;
    long stars_amount;
    Vector!(InputMedia) extended_media;
    string payload;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaTodo`, id 0x9FC55FDE.
final class inputMediaTodo : InputMedia
{
    enum uint tlId = 0x9FC55FDE;

    TodoList todo;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaStakeDice`, id 0xF3A9244A.
final class inputMediaStakeDice : InputMedia
{
    enum uint tlId = 0xF3A9244A;

    string game_hash;
    long ton_amount;
    ubyte[] client_seed;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputChatPhotoEmpty`, id 0x1CA48F57.
final class inputChatPhotoEmpty : InputChatPhoto
{
    enum uint tlId = 0x1CA48F57;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputChatUploadedPhoto`, id 0xBDCDAEC0.
final class inputChatUploadedPhoto : InputChatPhoto
{
    enum uint tlId = 0xBDCDAEC0;

    uint flags;
    InputFile file;
    InputFile video;
    double video_start_ts;
    VideoSize video_emoji_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputChatPhoto`, id 0x8953AD37.
final class inputChatPhoto : InputChatPhoto
{
    enum uint tlId = 0x8953AD37;

    InputPhoto id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputGeoPointEmpty`, id 0xE4C123D6.
final class inputGeoPointEmpty : InputGeoPoint
{
    enum uint tlId = 0xE4C123D6;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputGeoPoint`, id 0x48222FAF.
final class inputGeoPoint : InputGeoPoint
{
    enum uint tlId = 0x48222FAF;

    uint flags;
    double lat;
    double long_;
    int accuracy_radius;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPhotoEmpty`, id 0x1CD7BF0D.
final class inputPhotoEmpty : InputPhoto
{
    enum uint tlId = 0x1CD7BF0D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPhoto`, id 0x3BB3B94A.
final class inputPhoto : InputPhoto
{
    enum uint tlId = 0x3BB3B94A;

    long id;
    long access_hash;
    ubyte[] file_reference;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputFileLocation`, id 0xDFDAABE1.
final class inputFileLocation : InputFileLocation
{
    enum uint tlId = 0xDFDAABE1;

    long volume_id;
    int local_id;
    long secret;
    ubyte[] file_reference;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputEncryptedFileLocation`, id 0xF5235D55.
final class inputEncryptedFileLocation : InputFileLocation
{
    enum uint tlId = 0xF5235D55;

    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputDocumentFileLocation`, id 0xBAD07584.
final class inputDocumentFileLocation : InputFileLocation
{
    enum uint tlId = 0xBAD07584;

    long id;
    long access_hash;
    ubyte[] file_reference;
    string thumb_size;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputSecureFileLocation`, id 0xCBC7EE28.
final class inputSecureFileLocation : InputFileLocation
{
    enum uint tlId = 0xCBC7EE28;

    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputTakeoutFileLocation`, id 0x29BE5899.
final class inputTakeoutFileLocation : InputFileLocation
{
    enum uint tlId = 0x29BE5899;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPhotoFileLocation`, id 0x40181FFE.
final class inputPhotoFileLocation : InputFileLocation
{
    enum uint tlId = 0x40181FFE;

    long id;
    long access_hash;
    ubyte[] file_reference;
    string thumb_size;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPhotoLegacyFileLocation`, id 0xD83466F3.
final class inputPhotoLegacyFileLocation : InputFileLocation
{
    enum uint tlId = 0xD83466F3;

    long id;
    long access_hash;
    ubyte[] file_reference;
    long volume_id;
    int local_id;
    long secret;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPeerPhotoFileLocation`, id 0x37257E99.
final class inputPeerPhotoFileLocation : InputFileLocation
{
    enum uint tlId = 0x37257E99;

    uint flags;
    bool big;
    InputPeer peer;
    long photo_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetThumb`, id 0x9D84F3DB.
final class inputStickerSetThumb : InputFileLocation
{
    enum uint tlId = 0x9D84F3DB;

    InputStickerSet stickerset;
    int thumb_version;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputGroupCallStream`, id 0x0598A92A.
final class inputGroupCallStream : InputFileLocation
{
    enum uint tlId = 0x0598A92A;

    uint flags;
    InputGroupCall call;
    long time_ms;
    int scale;
    int video_channel;
    int video_quality;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `peerUser`, id 0x59511722.
final class peerUser : Peer
{
    enum uint tlId = 0x59511722;

    long user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `peerChat`, id 0x36C6019A.
final class peerChat : Peer
{
    enum uint tlId = 0x36C6019A;

    long chat_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `peerChannel`, id 0xA2A5371E.
final class peerChannel : Peer
{
    enum uint tlId = 0xA2A5371E;

    long channel_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `userEmpty`, id 0xD3BC4B7A.
final class userEmpty : User
{
    enum uint tlId = 0xD3BC4B7A;

    long id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `user`, id 0xB1B8CC83.
final class user : User
{
    enum uint tlId = 0xB1B8CC83;

    uint flags;
    bool self;
    bool contact;
    bool mutual_contact;
    bool deleted;
    bool bot;
    bool bot_chat_history;
    bool bot_nochats;
    bool verified;
    bool restricted;
    bool min;
    bool bot_inline_geo;
    bool support;
    bool scam;
    bool apply_min_photo;
    bool fake;
    bool bot_attach_menu;
    bool premium;
    bool attach_menu_enabled;
    uint flags2;
    bool bot_can_edit;
    bool close_friend;
    bool stories_hidden;
    bool stories_unavailable;
    bool contact_require_premium;
    bool bot_business;
    bool bot_has_main_app;
    bool bot_forum_view;
    bool bot_forum_can_manage_topics;
    bool bot_can_manage_bots;
    bool bot_guestchat;
    bool bot_guard;
    long id;
    long access_hash;
    string first_name;
    string last_name;
    string username;
    string phone;
    UserProfilePhoto photo;
    UserStatus status;
    int bot_info_version;
    Vector!(RestrictionReason) restriction_reason;
    string bot_inline_placeholder;
    string lang_code;
    EmojiStatus emoji_status;
    Vector!(Username) usernames;
    RecentStory stories_max_id;
    PeerColor color;
    PeerColor profile_color;
    int bot_active_users;
    long bot_verification_icon;
    long send_paid_messages_stars;
    long linked_community_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `userProfilePhotoEmpty`, id 0x4F11BAE1.
final class userProfilePhotoEmpty : UserProfilePhoto
{
    enum uint tlId = 0x4F11BAE1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `userProfilePhoto`, id 0x82D1F706.
final class userProfilePhoto : UserProfilePhoto
{
    enum uint tlId = 0x82D1F706;

    uint flags;
    bool has_video;
    bool personal;
    long photo_id;
    ubyte[] stripped_thumb;
    int dc_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `userStatusEmpty`, id 0x09D05049.
final class userStatusEmpty : UserStatus
{
    enum uint tlId = 0x09D05049;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `userStatusOnline`, id 0xEDB93949.
final class userStatusOnline : UserStatus
{
    enum uint tlId = 0xEDB93949;

    int expires;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `userStatusOffline`, id 0x008C703F.
final class userStatusOffline : UserStatus
{
    enum uint tlId = 0x008C703F;

    int was_online;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `userStatusRecently`, id 0x7B197DC8.
final class userStatusRecently : UserStatus
{
    enum uint tlId = 0x7B197DC8;

    uint flags;
    bool by_me;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `userStatusLastWeek`, id 0x541A1D1A.
final class userStatusLastWeek : UserStatus
{
    enum uint tlId = 0x541A1D1A;

    uint flags;
    bool by_me;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `userStatusLastMonth`, id 0x65899777.
final class userStatusLastMonth : UserStatus
{
    enum uint tlId = 0x65899777;

    uint flags;
    bool by_me;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatEmpty`, id 0x29562865.
final class chatEmpty : Chat
{
    enum uint tlId = 0x29562865;

    long id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chat`, id 0x41CBF256.
final class chat : Chat
{
    enum uint tlId = 0x41CBF256;

    uint flags;
    bool creator;
    bool left;
    bool deactivated;
    bool call_active;
    bool call_not_empty;
    bool noforwards;
    long id;
    string title;
    ChatPhoto photo;
    int participants_count;
    int date;
    int version_;
    InputChannel migrated_to;
    ChatAdminRights admin_rights;
    ChatBannedRights default_banned_rights;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatForbidden`, id 0x6592A1A7.
final class chatForbidden : Chat
{
    enum uint tlId = 0x6592A1A7;

    long id;
    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channel`, id 0xD49F34C6.
final class channel : Chat
{
    enum uint tlId = 0xD49F34C6;

    uint flags;
    bool creator;
    bool left;
    bool broadcast;
    bool verified;
    bool megagroup;
    bool restricted;
    bool signatures;
    bool min;
    bool scam;
    bool has_link;
    bool has_geo;
    bool slowmode_enabled;
    bool call_active;
    bool call_not_empty;
    bool fake;
    bool gigagroup;
    bool noforwards;
    bool join_to_send;
    bool join_request;
    bool forum;
    uint flags2;
    bool stories_hidden;
    bool stories_hidden_min;
    bool stories_unavailable;
    bool signature_profiles;
    bool autotranslation;
    bool broadcast_messages_allowed;
    bool monoforum;
    bool forum_tabs;
    long id;
    long access_hash;
    string title;
    string username;
    ChatPhoto photo;
    int date;
    Vector!(RestrictionReason) restriction_reason;
    ChatAdminRights admin_rights;
    ChatBannedRights banned_rights;
    ChatBannedRights default_banned_rights;
    int participants_count;
    Vector!(Username) usernames;
    RecentStory stories_max_id;
    PeerColor color;
    PeerColor profile_color;
    EmojiStatus emoji_status;
    int level;
    int subscription_until_date;
    long bot_verification_icon;
    long send_paid_messages_stars;
    long linked_monoforum_id;
    long linked_community_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelForbidden`, id 0x17D493D5.
final class channelForbidden : Chat
{
    enum uint tlId = 0x17D493D5;

    uint flags;
    bool broadcast;
    bool megagroup;
    bool monoforum;
    long id;
    long access_hash;
    string title;
    int until_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `communityForbidden`, id 0xFD3CDAB8.
final class communityForbidden : Chat
{
    enum uint tlId = 0xFD3CDAB8;

    uint flags;
    long id;
    long access_hash;
    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `community`, id 0x65EFE954.
final class community : Chat
{
    enum uint tlId = 0x65EFE954;

    uint flags;
    bool creator;
    bool left;
    bool min;
    uint flags2;
    bool collapsed_in_dialogs;
    long id;
    long access_hash;
    string title;
    ChatPhoto photo;
    int date;
    ChatAdminRights admin_rights;
    ChatBannedRights default_banned_rights;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatFull`, id 0x2633421B.
final class chatFull : ChatFull
{
    enum uint tlId = 0x2633421B;

    uint flags;
    bool can_set_username;
    bool has_scheduled;
    bool translations_disabled;
    bool has_welcome_messages;
    long id;
    string about;
    ChatParticipants participants;
    Photo chat_photo;
    PeerNotifySettings notify_settings;
    ExportedChatInvite exported_invite;
    Vector!(BotInfo) bot_info;
    int pinned_msg_id;
    int folder_id;
    InputGroupCall call;
    int ttl_period;
    Peer groupcall_default_join_as;
    string theme_emoticon;
    int requests_pending;
    Vector!(long) recent_requesters;
    ChatReactions available_reactions;
    int reactions_limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelFull`, id 0xA04E8D3A.
final class channelFull : ChatFull
{
    enum uint tlId = 0xA04E8D3A;

    uint flags;
    bool can_view_participants;
    bool can_set_username;
    bool can_set_stickers;
    bool hidden_prehistory;
    bool can_set_location;
    bool has_scheduled;
    bool can_view_stats;
    bool blocked;
    uint flags2;
    bool can_delete_channel;
    bool antispam;
    bool participants_hidden;
    bool translations_disabled;
    bool stories_pinned_available;
    bool view_forum_as_messages;
    bool restricted_sponsored;
    bool can_view_revenue;
    bool paid_media_allowed;
    bool can_view_stars_revenue;
    bool paid_reactions_available;
    bool stargifts_available;
    bool paid_messages_available;
    bool has_welcome_messages;
    long id;
    string about;
    int participants_count;
    int admins_count;
    int kicked_count;
    int banned_count;
    int online_count;
    int read_inbox_max_id;
    int read_outbox_max_id;
    int unread_count;
    Photo chat_photo;
    PeerNotifySettings notify_settings;
    ExportedChatInvite exported_invite;
    Vector!(BotInfo) bot_info;
    long migrated_from_chat_id;
    int migrated_from_max_id;
    int pinned_msg_id;
    StickerSet stickerset;
    int available_min_id;
    int folder_id;
    long linked_chat_id;
    ChannelLocation location;
    int slowmode_seconds;
    int slowmode_next_send_date;
    int stats_dc;
    int pts;
    InputGroupCall call;
    int ttl_period;
    Vector!(string) pending_suggestions;
    Peer groupcall_default_join_as;
    string theme_emoticon;
    int requests_pending;
    Vector!(long) recent_requesters;
    Peer default_send_as;
    ChatReactions available_reactions;
    int reactions_limit;
    PeerStories stories;
    WallPaper wallpaper;
    int boosts_applied;
    int boosts_unrestrict;
    StickerSet emojiset;
    BotVerification bot_verification;
    int stargifts_count;
    long send_paid_messages_stars;
    ProfileTab main_tab;
    long guard_bot_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `communityFull`, id 0xCBB7A507.
final class communityFull : ChatFull
{
    enum uint tlId = 0xCBB7A507;

    uint flags;
    long id;
    string about;
    Photo chat_photo;
    Vector!(CommunityPeer) linked_peers;
    int admins_count;
    int kicked_count;
    int peer_link_requests_pending;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatParticipant`, id 0x38E79FDE.
final class chatParticipant : ChatParticipant
{
    enum uint tlId = 0x38E79FDE;

    uint flags;
    long user_id;
    long inviter_id;
    int date;
    string rank;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatParticipantCreator`, id 0xE1F867B8.
final class chatParticipantCreator : ChatParticipant
{
    enum uint tlId = 0xE1F867B8;

    uint flags;
    long user_id;
    string rank;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatParticipantAdmin`, id 0x0360D5D2.
final class chatParticipantAdmin : ChatParticipant
{
    enum uint tlId = 0x0360D5D2;

    uint flags;
    long user_id;
    long inviter_id;
    int date;
    string rank;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatParticipantsForbidden`, id 0x8763D3E1.
final class chatParticipantsForbidden : ChatParticipants
{
    enum uint tlId = 0x8763D3E1;

    uint flags;
    long chat_id;
    ChatParticipant self_participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatParticipants`, id 0x3CBC93F8.
final class chatParticipants : ChatParticipants
{
    enum uint tlId = 0x3CBC93F8;

    long chat_id;
    Vector!(ChatParticipant) participants;
    int version_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatPhotoEmpty`, id 0x37C1011C.
final class chatPhotoEmpty : ChatPhoto
{
    enum uint tlId = 0x37C1011C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatPhoto`, id 0x1C6E1C11.
final class chatPhoto : ChatPhoto
{
    enum uint tlId = 0x1C6E1C11;

    uint flags;
    bool has_video;
    long photo_id;
    ubyte[] stripped_thumb;
    int dc_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEmpty`, id 0x90A6CA84.
final class messageEmpty : Message
{
    enum uint tlId = 0x90A6CA84;

    uint flags;
    int id;
    Peer peer_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `message`, id 0x7600B9D3.
final class message : Message
{
    enum uint tlId = 0x7600B9D3;

    uint flags;
    bool out_;
    bool mentioned;
    bool media_unread;
    bool silent;
    bool post;
    bool from_scheduled;
    bool legacy;
    bool edit_hide;
    bool pinned;
    bool noforwards;
    bool invert_media;
    uint flags2;
    bool offline;
    bool video_processing_pending;
    bool paid_suggested_post_stars;
    bool paid_suggested_post_ton;
    int id;
    Peer from_id;
    int from_boosts_applied;
    string from_rank;
    Peer peer_id;
    Peer saved_peer_id;
    MessageFwdHeader fwd_from;
    long via_bot_id;
    long via_business_bot_id;
    Peer guestchat_via_from;
    MessageReplyHeader reply_to;
    int date;
    string message;
    MessageMedia media;
    ReplyMarkup reply_markup;
    Vector!(MessageEntity) entities;
    int views;
    int forwards;
    MessageReplies replies;
    int edit_date;
    string post_author;
    long grouped_id;
    MessageReactions reactions;
    Vector!(RestrictionReason) restriction_reason;
    int ttl_period;
    int quick_reply_shortcut_id;
    long effect;
    FactCheck factcheck;
    int report_delivery_until_date;
    long paid_message_stars;
    SuggestedPost suggested_post;
    int schedule_repeat_period;
    string summary_from_language;
    RichMessage rich_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageService`, id 0x7A800E0A.
final class messageService : Message
{
    enum uint tlId = 0x7A800E0A;

    uint flags;
    bool out_;
    bool mentioned;
    bool media_unread;
    bool reactions_are_possible;
    bool silent;
    bool post;
    bool legacy;
    int id;
    Peer from_id;
    Peer peer_id;
    Peer saved_peer_id;
    MessageReplyHeader reply_to;
    int date;
    MessageAction action;
    MessageReactions reactions;
    int ttl_period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaEmpty`, id 0x3DED6320.
final class messageMediaEmpty : MessageMedia
{
    enum uint tlId = 0x3DED6320;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaPhoto`, id 0xE216EB63.
final class messageMediaPhoto : MessageMedia
{
    enum uint tlId = 0xE216EB63;

    uint flags;
    bool spoiler;
    bool live_photo;
    Photo photo;
    int ttl_seconds;
    Document video;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaGeo`, id 0x56E0D474.
final class messageMediaGeo : MessageMedia
{
    enum uint tlId = 0x56E0D474;

    GeoPoint geo;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaContact`, id 0x70322949.
final class messageMediaContact : MessageMedia
{
    enum uint tlId = 0x70322949;

    string phone_number;
    string first_name;
    string last_name;
    string vcard;
    long user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaUnsupported`, id 0x9F84F49E.
final class messageMediaUnsupported : MessageMedia
{
    enum uint tlId = 0x9F84F49E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaDocument`, id 0x52D8CCD9.
final class messageMediaDocument : MessageMedia
{
    enum uint tlId = 0x52D8CCD9;

    uint flags;
    bool nopremium;
    bool spoiler;
    bool video;
    bool round;
    bool voice;
    Document document;
    Vector!(Document) alt_documents;
    Photo video_cover;
    int video_timestamp;
    int ttl_seconds;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaWebPage`, id 0xDDF10C3B.
final class messageMediaWebPage : MessageMedia
{
    enum uint tlId = 0xDDF10C3B;

    uint flags;
    bool force_large_media;
    bool force_small_media;
    bool manual;
    bool safe;
    WebPage webpage;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaVenue`, id 0x2EC0533F.
final class messageMediaVenue : MessageMedia
{
    enum uint tlId = 0x2EC0533F;

    GeoPoint geo;
    string title;
    string address;
    string provider;
    string venue_id;
    string venue_type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaGame`, id 0xFDB19008.
final class messageMediaGame : MessageMedia
{
    enum uint tlId = 0xFDB19008;

    Game game;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaInvoice`, id 0xF6A548D3.
final class messageMediaInvoice : MessageMedia
{
    enum uint tlId = 0xF6A548D3;

    uint flags;
    bool shipping_address_requested;
    bool test;
    string title;
    string description;
    WebDocument photo;
    int receipt_msg_id;
    string currency;
    long total_amount;
    string start_param;
    MessageExtendedMedia extended_media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaGeoLive`, id 0xB940C666.
final class messageMediaGeoLive : MessageMedia
{
    enum uint tlId = 0xB940C666;

    uint flags;
    GeoPoint geo;
    int heading;
    int period;
    int proximity_notification_radius;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaPoll`, id 0x773F4E66.
final class messageMediaPoll : MessageMedia
{
    enum uint tlId = 0x773F4E66;

    uint flags;
    Poll poll;
    PollResults results;
    MessageMedia attached_media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaDice`, id 0x08CBEC07.
final class messageMediaDice : MessageMedia
{
    enum uint tlId = 0x08CBEC07;

    uint flags;
    int value;
    string emoticon;
    messages_EmojiGameOutcome game_outcome;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaStory`, id 0x68CB6283.
final class messageMediaStory : MessageMedia
{
    enum uint tlId = 0x68CB6283;

    uint flags;
    bool via_mention;
    Peer peer;
    int id;
    StoryItem story;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaGiveaway`, id 0xAA073BEB.
final class messageMediaGiveaway : MessageMedia
{
    enum uint tlId = 0xAA073BEB;

    uint flags;
    bool only_new_subscribers;
    bool winners_are_visible;
    Vector!(long) channels;
    Vector!(string) countries_iso2;
    string prize_description;
    int quantity;
    int months;
    long stars;
    int until_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaGiveawayResults`, id 0xCEAA3EA1.
final class messageMediaGiveawayResults : MessageMedia
{
    enum uint tlId = 0xCEAA3EA1;

    uint flags;
    bool only_new_subscribers;
    bool refunded;
    long channel_id;
    int additional_peers_count;
    int launch_msg_id;
    int winners_count;
    int unclaimed_count;
    Vector!(long) winners;
    int months;
    long stars;
    string prize_description;
    int until_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaPaidMedia`, id 0xA8852491.
final class messageMediaPaidMedia : MessageMedia
{
    enum uint tlId = 0xA8852491;

    long stars_amount;
    Vector!(MessageExtendedMedia) extended_media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaToDo`, id 0x8A53B014.
final class messageMediaToDo : MessageMedia
{
    enum uint tlId = 0x8A53B014;

    uint flags;
    TodoList todo;
    Vector!(TodoCompletion) completions;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageMediaVideoStream`, id 0xCA5CAB89.
final class messageMediaVideoStream : MessageMedia
{
    enum uint tlId = 0xCA5CAB89;

    uint flags;
    bool rtmp_stream;
    InputGroupCall call;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionEmpty`, id 0xB6AEF7B0.
final class messageActionEmpty : MessageAction
{
    enum uint tlId = 0xB6AEF7B0;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChatCreate`, id 0xBD47CBAD.
final class messageActionChatCreate : MessageAction
{
    enum uint tlId = 0xBD47CBAD;

    string title;
    Vector!(long) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChatEditTitle`, id 0xB5A1CE5A.
final class messageActionChatEditTitle : MessageAction
{
    enum uint tlId = 0xB5A1CE5A;

    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChatEditPhoto`, id 0x7FCB13A8.
final class messageActionChatEditPhoto : MessageAction
{
    enum uint tlId = 0x7FCB13A8;

    Photo photo;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChatDeletePhoto`, id 0x95E3FBEF.
final class messageActionChatDeletePhoto : MessageAction
{
    enum uint tlId = 0x95E3FBEF;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChatAddUser`, id 0x15CEFD00.
final class messageActionChatAddUser : MessageAction
{
    enum uint tlId = 0x15CEFD00;

    Vector!(long) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChatDeleteUser`, id 0xA43F30CC.
final class messageActionChatDeleteUser : MessageAction
{
    enum uint tlId = 0xA43F30CC;

    long user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChatJoinedByLink`, id 0x031224C3.
final class messageActionChatJoinedByLink : MessageAction
{
    enum uint tlId = 0x031224C3;

    long inviter_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChannelCreate`, id 0x95D2AC92.
final class messageActionChannelCreate : MessageAction
{
    enum uint tlId = 0x95D2AC92;

    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChatMigrateTo`, id 0xE1037F92.
final class messageActionChatMigrateTo : MessageAction
{
    enum uint tlId = 0xE1037F92;

    long channel_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChannelMigrateFrom`, id 0xEA3948E9.
final class messageActionChannelMigrateFrom : MessageAction
{
    enum uint tlId = 0xEA3948E9;

    string title;
    long chat_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionPinMessage`, id 0x94BD38ED.
final class messageActionPinMessage : MessageAction
{
    enum uint tlId = 0x94BD38ED;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionHistoryClear`, id 0x9FBAB604.
final class messageActionHistoryClear : MessageAction
{
    enum uint tlId = 0x9FBAB604;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionGameScore`, id 0x92A72876.
final class messageActionGameScore : MessageAction
{
    enum uint tlId = 0x92A72876;

    long game_id;
    int score;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionPaymentSentMe`, id 0xFFA00CCC.
final class messageActionPaymentSentMe : MessageAction
{
    enum uint tlId = 0xFFA00CCC;

    uint flags;
    bool recurring_init;
    bool recurring_used;
    string currency;
    long total_amount;
    ubyte[] payload;
    PaymentRequestedInfo info;
    string shipping_option_id;
    PaymentCharge charge;
    int subscription_until_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionPaymentSent`, id 0xC624B16E.
final class messageActionPaymentSent : MessageAction
{
    enum uint tlId = 0xC624B16E;

    uint flags;
    bool recurring_init;
    bool recurring_used;
    string currency;
    long total_amount;
    string invoice_slug;
    int subscription_until_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionPhoneCall`, id 0x80E11A7F.
final class messageActionPhoneCall : MessageAction
{
    enum uint tlId = 0x80E11A7F;

    uint flags;
    bool video;
    long call_id;
    PhoneCallDiscardReason reason;
    int duration;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionScreenshotTaken`, id 0x4792929B.
final class messageActionScreenshotTaken : MessageAction
{
    enum uint tlId = 0x4792929B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionCustomAction`, id 0xFAE69F56.
final class messageActionCustomAction : MessageAction
{
    enum uint tlId = 0xFAE69F56;

    string message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionBotAllowed`, id 0xC516D679.
final class messageActionBotAllowed : MessageAction
{
    enum uint tlId = 0xC516D679;

    uint flags;
    bool attach_menu;
    bool from_request;
    string domain;
    BotApp app;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionSecureValuesSentMe`, id 0x1B287353.
final class messageActionSecureValuesSentMe : MessageAction
{
    enum uint tlId = 0x1B287353;

    Vector!(SecureValue) values;
    SecureCredentialsEncrypted credentials;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionSecureValuesSent`, id 0xD95C6154.
final class messageActionSecureValuesSent : MessageAction
{
    enum uint tlId = 0xD95C6154;

    Vector!(SecureValueType) types;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionContactSignUp`, id 0xF3F25F76.
final class messageActionContactSignUp : MessageAction
{
    enum uint tlId = 0xF3F25F76;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionGeoProximityReached`, id 0x98E0D697.
final class messageActionGeoProximityReached : MessageAction
{
    enum uint tlId = 0x98E0D697;

    Peer from_id;
    Peer to_id;
    int distance;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionGroupCall`, id 0x7A0D7F42.
final class messageActionGroupCall : MessageAction
{
    enum uint tlId = 0x7A0D7F42;

    uint flags;
    InputGroupCall call;
    int duration;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionInviteToGroupCall`, id 0x502F92F7.
final class messageActionInviteToGroupCall : MessageAction
{
    enum uint tlId = 0x502F92F7;

    InputGroupCall call;
    Vector!(long) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionSetMessagesTTL`, id 0x3C134D7B.
final class messageActionSetMessagesTTL : MessageAction
{
    enum uint tlId = 0x3C134D7B;

    uint flags;
    int period;
    long auto_setting_from;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionGroupCallScheduled`, id 0xB3A07661.
final class messageActionGroupCallScheduled : MessageAction
{
    enum uint tlId = 0xB3A07661;

    InputGroupCall call;
    int schedule_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionSetChatTheme`, id 0xB91BBD3A.
final class messageActionSetChatTheme : MessageAction
{
    enum uint tlId = 0xB91BBD3A;

    ChatTheme theme;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChatJoinedByRequest`, id 0xEBBCA3CB.
final class messageActionChatJoinedByRequest : MessageAction
{
    enum uint tlId = 0xEBBCA3CB;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionWebViewDataSentMe`, id 0x47DD8079.
final class messageActionWebViewDataSentMe : MessageAction
{
    enum uint tlId = 0x47DD8079;

    string text;
    string data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionWebViewDataSent`, id 0xB4C38CB5.
final class messageActionWebViewDataSent : MessageAction
{
    enum uint tlId = 0xB4C38CB5;

    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionGiftPremium`, id 0x48E91302.
final class messageActionGiftPremium : MessageAction
{
    enum uint tlId = 0x48E91302;

    uint flags;
    string currency;
    long amount;
    int days;
    string crypto_currency;
    long crypto_amount;
    TextWithEntities message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionTopicCreate`, id 0x0D999256.
final class messageActionTopicCreate : MessageAction
{
    enum uint tlId = 0x0D999256;

    uint flags;
    bool title_missing;
    string title;
    int icon_color;
    long icon_emoji_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionTopicEdit`, id 0xC0944820.
final class messageActionTopicEdit : MessageAction
{
    enum uint tlId = 0xC0944820;

    uint flags;
    string title;
    long icon_emoji_id;
    bool closed;
    bool hidden;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionSuggestProfilePhoto`, id 0x57DE635E.
final class messageActionSuggestProfilePhoto : MessageAction
{
    enum uint tlId = 0x57DE635E;

    Photo photo;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionRequestedPeer`, id 0x31518E9B.
final class messageActionRequestedPeer : MessageAction
{
    enum uint tlId = 0x31518E9B;

    int button_id;
    Vector!(Peer) peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionSetChatWallPaper`, id 0x5060A3F4.
final class messageActionSetChatWallPaper : MessageAction
{
    enum uint tlId = 0x5060A3F4;

    uint flags;
    bool same;
    bool for_both;
    WallPaper wallpaper;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionGiftCode`, id 0x31C48347.
final class messageActionGiftCode : MessageAction
{
    enum uint tlId = 0x31C48347;

    uint flags;
    bool via_giveaway;
    bool unclaimed;
    Peer boost_peer;
    int days;
    string slug;
    string currency;
    long amount;
    string crypto_currency;
    long crypto_amount;
    TextWithEntities message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionGiveawayLaunch`, id 0xA80F51E4.
final class messageActionGiveawayLaunch : MessageAction
{
    enum uint tlId = 0xA80F51E4;

    uint flags;
    long stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionGiveawayResults`, id 0x87E2F155.
final class messageActionGiveawayResults : MessageAction
{
    enum uint tlId = 0x87E2F155;

    uint flags;
    bool stars;
    int winners_count;
    int unclaimed_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionBoostApply`, id 0xCC02AA6D.
final class messageActionBoostApply : MessageAction
{
    enum uint tlId = 0xCC02AA6D;

    int boosts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionRequestedPeerSentMe`, id 0x93B31848.
final class messageActionRequestedPeerSentMe : MessageAction
{
    enum uint tlId = 0x93B31848;

    int button_id;
    Vector!(RequestedPeer) peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionPaymentRefunded`, id 0x41B3E202.
final class messageActionPaymentRefunded : MessageAction
{
    enum uint tlId = 0x41B3E202;

    uint flags;
    Peer peer;
    string currency;
    long total_amount;
    ubyte[] payload;
    PaymentCharge charge;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionGiftStars`, id 0x45D5B021.
final class messageActionGiftStars : MessageAction
{
    enum uint tlId = 0x45D5B021;

    uint flags;
    string currency;
    long amount;
    long stars;
    string crypto_currency;
    long crypto_amount;
    string transaction_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionPrizeStars`, id 0xB00C47A2.
final class messageActionPrizeStars : MessageAction
{
    enum uint tlId = 0xB00C47A2;

    uint flags;
    bool unclaimed;
    long stars;
    string transaction_id;
    Peer boost_peer;
    int giveaway_msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionStarGift`, id 0xEA2C31D3.
final class messageActionStarGift : MessageAction
{
    enum uint tlId = 0xEA2C31D3;

    uint flags;
    bool name_hidden;
    bool saved;
    bool converted;
    bool upgraded;
    bool refunded;
    bool can_upgrade;
    bool prepaid_upgrade;
    bool upgrade_separate;
    bool auction_acquired;
    StarGift gift;
    TextWithEntities message;
    long convert_stars;
    int upgrade_msg_id;
    long upgrade_stars;
    Peer from_id;
    Peer peer;
    long saved_id;
    string prepaid_upgrade_hash;
    int gift_msg_id;
    Peer to_id;
    int gift_num;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionStarGiftUnique`, id 0x7E1C1187.
final class messageActionStarGiftUnique : MessageAction
{
    enum uint tlId = 0x7E1C1187;

    uint flags;
    bool upgrade;
    bool transferred;
    bool saved;
    bool refunded;
    bool prepaid_upgrade;
    bool assigned;
    bool from_offer;
    bool craft;
    bool name_hidden;
    StarGift gift;
    int can_export_at;
    long transfer_stars;
    Peer from_id;
    Peer peer;
    long saved_id;
    StarsAmount resale_amount;
    int can_transfer_at;
    int can_resell_at;
    long drop_original_details_stars;
    int can_craft_at;
    TextWithEntities message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionPaidMessagesRefunded`, id 0xAC1F1FCD.
final class messageActionPaidMessagesRefunded : MessageAction
{
    enum uint tlId = 0xAC1F1FCD;

    int count;
    long stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionPaidMessagesPrice`, id 0x84B88578.
final class messageActionPaidMessagesPrice : MessageAction
{
    enum uint tlId = 0x84B88578;

    uint flags;
    bool broadcast_messages_allowed;
    long stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionConferenceCall`, id 0x2FFE2F7A.
final class messageActionConferenceCall : MessageAction
{
    enum uint tlId = 0x2FFE2F7A;

    uint flags;
    bool missed;
    bool active;
    bool video;
    long call_id;
    int duration;
    Vector!(Peer) other_participants;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionTodoCompletions`, id 0xCC7C5C89.
final class messageActionTodoCompletions : MessageAction
{
    enum uint tlId = 0xCC7C5C89;

    Vector!(int) completed;
    Vector!(int) incompleted;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionTodoAppendTasks`, id 0xC7EDBC83.
final class messageActionTodoAppendTasks : MessageAction
{
    enum uint tlId = 0xC7EDBC83;

    Vector!(TodoItem) list;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionSuggestedPostApproval`, id 0xEE7A1596.
final class messageActionSuggestedPostApproval : MessageAction
{
    enum uint tlId = 0xEE7A1596;

    uint flags;
    bool rejected;
    bool balance_too_low;
    string reject_comment;
    int schedule_date;
    StarsAmount price;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionSuggestedPostSuccess`, id 0x95DDCF69.
final class messageActionSuggestedPostSuccess : MessageAction
{
    enum uint tlId = 0x95DDCF69;

    StarsAmount price;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionSuggestedPostRefund`, id 0x69F916F8.
final class messageActionSuggestedPostRefund : MessageAction
{
    enum uint tlId = 0x69F916F8;

    uint flags;
    bool payer_initiated;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionGiftTon`, id 0xA8A3C699.
final class messageActionGiftTon : MessageAction
{
    enum uint tlId = 0xA8A3C699;

    uint flags;
    string currency;
    long amount;
    string crypto_currency;
    long crypto_amount;
    string transaction_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionSuggestBirthday`, id 0x2C8F2A25.
final class messageActionSuggestBirthday : MessageAction
{
    enum uint tlId = 0x2C8F2A25;

    Birthday birthday;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionStarGiftPurchaseOffer`, id 0x774278D4.
final class messageActionStarGiftPurchaseOffer : MessageAction
{
    enum uint tlId = 0x774278D4;

    uint flags;
    bool accepted;
    bool declined;
    StarGift gift;
    StarsAmount price;
    int expires_at;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionStarGiftPurchaseOfferDeclined`, id 0x73ADA76B.
final class messageActionStarGiftPurchaseOfferDeclined : MessageAction
{
    enum uint tlId = 0x73ADA76B;

    uint flags;
    bool expired;
    StarGift gift;
    StarsAmount price;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionNewCreatorPending`, id 0xB07ED085.
final class messageActionNewCreatorPending : MessageAction
{
    enum uint tlId = 0xB07ED085;

    long new_creator_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChangeCreator`, id 0xE188503B.
final class messageActionChangeCreator : MessageAction
{
    enum uint tlId = 0xE188503B;

    long new_creator_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionNoForwardsToggle`, id 0xBF7D6572.
final class messageActionNoForwardsToggle : MessageAction
{
    enum uint tlId = 0xBF7D6572;

    bool prev_value;
    bool new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionNoForwardsRequest`, id 0x3E2793BA.
final class messageActionNoForwardsRequest : MessageAction
{
    enum uint tlId = 0x3E2793BA;

    uint flags;
    bool expired;
    bool prev_value;
    bool new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionPollAppendAnswer`, id 0x9DA1CD6C.
final class messageActionPollAppendAnswer : MessageAction
{
    enum uint tlId = 0x9DA1CD6C;

    PollAnswer answer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionPollDeleteAnswer`, id 0x399674DC.
final class messageActionPollDeleteAnswer : MessageAction
{
    enum uint tlId = 0x399674DC;

    PollAnswer answer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionManagedBotCreated`, id 0x16605E3E.
final class messageActionManagedBotCreated : MessageAction
{
    enum uint tlId = 0x16605E3E;

    long bot_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChangeCommunity`, id 0x5D20BAE8.
final class messageActionChangeCommunity : MessageAction
{
    enum uint tlId = 0x5D20BAE8;

    uint flags;
    long community_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionChatJoinedViaCommunity`, id 0x4A8BFE80.
final class messageActionChatJoinedViaCommunity : MessageAction
{
    enum uint tlId = 0x4A8BFE80;

    long community_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionGramTransfer`, id 0x9329EA33.
final class messageActionGramTransfer : MessageAction
{
    enum uint tlId = 0x9329EA33;

    uint flags;
    bool comment_encrypted;
    long amount;
    string peer_address;
    string transaction_id;
    string comment;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageActionWalletTonConnectRequest`, id 0x69B8C4BF.
final class messageActionWalletTonConnectRequest : MessageAction
{
    enum uint tlId = 0x69B8C4BF;

    uint flags;
    bool accepted;
    bool declined;
    long session_id;
    int expires;
    string topic;
    string trace_id;
    string dapp_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `dialog`, id 0xFC89F7F3.
final class dialog : Dialog
{
    enum uint tlId = 0xFC89F7F3;

    uint flags;
    bool pinned;
    bool unread_mark;
    bool view_forum_as_messages;
    Peer peer;
    int top_message;
    int read_inbox_max_id;
    int read_outbox_max_id;
    int unread_count;
    int unread_mentions_count;
    int unread_reactions_count;
    int unread_poll_votes_count;
    PeerNotifySettings notify_settings;
    int pts;
    DraftMessage draft;
    int folder_id;
    int ttl_period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `dialogFolder`, id 0x71BD134C.
final class dialogFolder : Dialog
{
    enum uint tlId = 0x71BD134C;

    uint flags;
    bool pinned;
    Folder folder;
    Peer peer;
    int top_message;
    int unread_muted_peers_count;
    int unread_unmuted_peers_count;
    int unread_muted_messages_count;
    int unread_unmuted_messages_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `dialogCommunity`, id 0xF78A0973.
final class dialogCommunity : Dialog
{
    enum uint tlId = 0xF78A0973;

    uint flags;
    bool pinned;
    long community_id;
    PeerNotifySettings notify_settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `photoEmpty`, id 0x2331B22D.
final class photoEmpty : Photo
{
    enum uint tlId = 0x2331B22D;

    long id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `photo`, id 0xFB197A65.
final class photo : Photo
{
    enum uint tlId = 0xFB197A65;

    uint flags;
    bool has_stickers;
    long id;
    long access_hash;
    ubyte[] file_reference;
    int date;
    Vector!(PhotoSize) sizes;
    Vector!(VideoSize) video_sizes;
    int dc_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `photoSizeEmpty`, id 0x0E17E23C.
final class photoSizeEmpty : PhotoSize
{
    enum uint tlId = 0x0E17E23C;

    string type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `photoSize`, id 0x75C78E60.
final class photoSize : PhotoSize
{
    enum uint tlId = 0x75C78E60;

    string type;
    int w;
    int h;
    int size;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `photoCachedSize`, id 0x021E1AD6.
final class photoCachedSize : PhotoSize
{
    enum uint tlId = 0x021E1AD6;

    string type;
    int w;
    int h;
    ubyte[] bytes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `photoStrippedSize`, id 0xE0B0BC2E.
final class photoStrippedSize : PhotoSize
{
    enum uint tlId = 0xE0B0BC2E;

    string type;
    ubyte[] bytes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `photoSizeProgressive`, id 0xFA3EFB95.
final class photoSizeProgressive : PhotoSize
{
    enum uint tlId = 0xFA3EFB95;

    string type;
    int w;
    int h;
    Vector!(int) sizes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `photoPathSize`, id 0xD8214D41.
final class photoPathSize : PhotoSize
{
    enum uint tlId = 0xD8214D41;

    string type;
    ubyte[] bytes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `geoPointEmpty`, id 0x1117DD5F.
final class geoPointEmpty : GeoPoint
{
    enum uint tlId = 0x1117DD5F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `geoPoint`, id 0xB2A2F663.
final class geoPoint : GeoPoint
{
    enum uint tlId = 0xB2A2F663;

    uint flags;
    double long_;
    double lat;
    long access_hash;
    int accuracy_radius;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputNotifyPeer`, id 0xB8BC5B0C.
final class inputNotifyPeer : InputNotifyPeer
{
    enum uint tlId = 0xB8BC5B0C;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputNotifyUsers`, id 0x193B4417.
final class inputNotifyUsers : InputNotifyPeer
{
    enum uint tlId = 0x193B4417;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputNotifyChats`, id 0x4A95E84E.
final class inputNotifyChats : InputNotifyPeer
{
    enum uint tlId = 0x4A95E84E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputNotifyBroadcasts`, id 0xB1DB7C7E.
final class inputNotifyBroadcasts : InputNotifyPeer
{
    enum uint tlId = 0xB1DB7C7E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputNotifyForumTopic`, id 0x5C467992.
final class inputNotifyForumTopic : InputNotifyPeer
{
    enum uint tlId = 0x5C467992;

    InputPeer peer;
    int top_msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputNotifyCommunity`, id 0x27BB1ADC.
final class inputNotifyCommunity : InputNotifyPeer
{
    enum uint tlId = 0x27BB1ADC;

    InputChannel community;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPeerNotifySettings`, id 0xCACB6AE2.
final class inputPeerNotifySettings : InputPeerNotifySettings
{
    enum uint tlId = 0xCACB6AE2;

    uint flags;
    bool show_previews;
    bool silent;
    int mute_until;
    NotificationSound sound;
    bool stories_muted;
    bool stories_hide_sender;
    NotificationSound stories_sound;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `peerNotifySettings`, id 0x99622C0C.
final class peerNotifySettings : PeerNotifySettings
{
    enum uint tlId = 0x99622C0C;

    uint flags;
    bool show_previews;
    bool silent;
    int mute_until;
    NotificationSound ios_sound;
    NotificationSound android_sound;
    NotificationSound other_sound;
    bool stories_muted;
    bool stories_hide_sender;
    NotificationSound stories_ios_sound;
    NotificationSound stories_android_sound;
    NotificationSound stories_other_sound;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `peerSettings`, id 0xF47741F7.
final class peerSettings : PeerSettings
{
    enum uint tlId = 0xF47741F7;

    uint flags;
    bool report_spam;
    bool add_contact;
    bool block_contact;
    bool share_contact;
    bool need_contacts_exception;
    bool report_geo;
    bool autoarchived;
    bool invite_members;
    bool request_chat_broadcast;
    bool business_bot_paused;
    bool business_bot_can_reply;
    int geo_distance;
    string request_chat_title;
    int request_chat_date;
    long business_bot_id;
    string business_bot_manage_url;
    long charge_paid_message_stars;
    string registration_month;
    string phone_country;
    int name_change_date;
    int photo_change_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallPaper`, id 0xA437C3ED.
final class wallPaper : WallPaper
{
    enum uint tlId = 0xA437C3ED;

    long id;
    uint flags;
    bool creator;
    bool default_;
    bool pattern;
    bool dark;
    long access_hash;
    string slug;
    Document document;
    WallPaperSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallPaperNoFile`, id 0xE0804116.
final class wallPaperNoFile : WallPaper
{
    enum uint tlId = 0xE0804116;

    long id;
    uint flags;
    bool default_;
    bool dark;
    WallPaperSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReportReasonSpam`, id 0x58DBCAB8.
final class inputReportReasonSpam : ReportReason
{
    enum uint tlId = 0x58DBCAB8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReportReasonViolence`, id 0x1E22C78D.
final class inputReportReasonViolence : ReportReason
{
    enum uint tlId = 0x1E22C78D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReportReasonPornography`, id 0x2E59D922.
final class inputReportReasonPornography : ReportReason
{
    enum uint tlId = 0x2E59D922;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReportReasonChildAbuse`, id 0xADF44EE3.
final class inputReportReasonChildAbuse : ReportReason
{
    enum uint tlId = 0xADF44EE3;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReportReasonOther`, id 0xC1E4A2B1.
final class inputReportReasonOther : ReportReason
{
    enum uint tlId = 0xC1E4A2B1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReportReasonCopyright`, id 0x9B89F93A.
final class inputReportReasonCopyright : ReportReason
{
    enum uint tlId = 0x9B89F93A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReportReasonGeoIrrelevant`, id 0xDBD4FEED.
final class inputReportReasonGeoIrrelevant : ReportReason
{
    enum uint tlId = 0xDBD4FEED;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReportReasonFake`, id 0xF5DDD6E7.
final class inputReportReasonFake : ReportReason
{
    enum uint tlId = 0xF5DDD6E7;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReportReasonIllegalDrugs`, id 0x0A8EB2BE.
final class inputReportReasonIllegalDrugs : ReportReason
{
    enum uint tlId = 0x0A8EB2BE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReportReasonPersonalDetails`, id 0x9EC7863D.
final class inputReportReasonPersonalDetails : ReportReason
{
    enum uint tlId = 0x9EC7863D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `userFull`, id 0x06CBE645.
final class userFull : UserFull
{
    enum uint tlId = 0x06CBE645;

    uint flags;
    bool blocked;
    bool phone_calls_available;
    bool phone_calls_private;
    bool can_pin_message;
    bool has_scheduled;
    bool video_calls_available;
    bool voice_messages_forbidden;
    bool translations_disabled;
    bool stories_pinned_available;
    bool blocked_my_stories_from;
    bool wallpaper_overridden;
    bool contact_require_premium;
    bool read_dates_private;
    uint flags2;
    bool sponsored_enabled;
    bool can_view_revenue;
    bool bot_can_manage_emoji_status;
    bool display_gifts_button;
    bool noforwards_my_enabled;
    bool noforwards_peer_enabled;
    bool unofficial_security_risk;
    long id;
    string about;
    PeerSettings settings;
    Photo personal_photo;
    Photo profile_photo;
    Photo fallback_photo;
    PeerNotifySettings notify_settings;
    BotInfo bot_info;
    int pinned_msg_id;
    int common_chats_count;
    int folder_id;
    int ttl_period;
    ChatTheme theme;
    string private_forward_name;
    ChatAdminRights bot_group_admin_rights;
    ChatAdminRights bot_broadcast_admin_rights;
    WallPaper wallpaper;
    PeerStories stories;
    BusinessWorkHours business_work_hours;
    BusinessLocation business_location;
    BusinessGreetingMessage business_greeting_message;
    BusinessAwayMessage business_away_message;
    BusinessIntro business_intro;
    Birthday birthday;
    long personal_channel_id;
    int personal_channel_message;
    int stargifts_count;
    StarRefProgram starref_program;
    BotVerification bot_verification;
    long send_paid_messages_stars;
    DisallowedGiftsSettings disallowed_gifts;
    StarsRating stars_rating;
    StarsRating stars_my_pending_rating;
    int stars_my_pending_rating_date;
    ProfileTab main_tab;
    Document saved_music;
    TextWithEntities note;
    long bot_manager_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contact`, id 0x145ADE0B.
final class contact : Contact
{
    enum uint tlId = 0x145ADE0B;

    long user_id;
    bool mutual;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `importedContact`, id 0xC13E3C50.
final class importedContact : ImportedContact
{
    enum uint tlId = 0xC13E3C50;

    long user_id;
    long client_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contactStatus`, id 0x16D9703B.
final class contactStatus : ContactStatus
{
    enum uint tlId = 0x16D9703B;

    long user_id;
    UserStatus status;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterEmpty`, id 0x57E2F66C.
final class inputMessagesFilterEmpty : MessagesFilter
{
    enum uint tlId = 0x57E2F66C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterPhotos`, id 0x9609A51C.
final class inputMessagesFilterPhotos : MessagesFilter
{
    enum uint tlId = 0x9609A51C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterVideo`, id 0x9FC00E65.
final class inputMessagesFilterVideo : MessagesFilter
{
    enum uint tlId = 0x9FC00E65;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterPhotoVideo`, id 0x56E9F0E4.
final class inputMessagesFilterPhotoVideo : MessagesFilter
{
    enum uint tlId = 0x56E9F0E4;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterDocument`, id 0x9EDDF188.
final class inputMessagesFilterDocument : MessagesFilter
{
    enum uint tlId = 0x9EDDF188;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterUrl`, id 0x7EF0DD87.
final class inputMessagesFilterUrl : MessagesFilter
{
    enum uint tlId = 0x7EF0DD87;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterGif`, id 0xFFC86587.
final class inputMessagesFilterGif : MessagesFilter
{
    enum uint tlId = 0xFFC86587;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterVoice`, id 0x50F5C392.
final class inputMessagesFilterVoice : MessagesFilter
{
    enum uint tlId = 0x50F5C392;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterMusic`, id 0x3751B49E.
final class inputMessagesFilterMusic : MessagesFilter
{
    enum uint tlId = 0x3751B49E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterChatPhotos`, id 0x3A20ECB8.
final class inputMessagesFilterChatPhotos : MessagesFilter
{
    enum uint tlId = 0x3A20ECB8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterPhoneCalls`, id 0x80C99768.
final class inputMessagesFilterPhoneCalls : MessagesFilter
{
    enum uint tlId = 0x80C99768;

    uint flags;
    bool missed;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterRoundVoice`, id 0x7A7C17A4.
final class inputMessagesFilterRoundVoice : MessagesFilter
{
    enum uint tlId = 0x7A7C17A4;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterRoundVideo`, id 0xB549DA53.
final class inputMessagesFilterRoundVideo : MessagesFilter
{
    enum uint tlId = 0xB549DA53;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterMyMentions`, id 0xC1F8E69A.
final class inputMessagesFilterMyMentions : MessagesFilter
{
    enum uint tlId = 0xC1F8E69A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterGeo`, id 0xE7026D0D.
final class inputMessagesFilterGeo : MessagesFilter
{
    enum uint tlId = 0xE7026D0D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterContacts`, id 0xE062DB83.
final class inputMessagesFilterContacts : MessagesFilter
{
    enum uint tlId = 0xE062DB83;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterPinned`, id 0x1BB00451.
final class inputMessagesFilterPinned : MessagesFilter
{
    enum uint tlId = 0x1BB00451;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagesFilterPoll`, id 0xFA2BC90A.
final class inputMessagesFilterPoll : MessagesFilter
{
    enum uint tlId = 0xFA2BC90A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateNewMessage`, id 0x1F2B0AFD.
final class updateNewMessage : Update
{
    enum uint tlId = 0x1F2B0AFD;

    Message message;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateMessageID`, id 0x4E90BFD6.
final class updateMessageID : Update
{
    enum uint tlId = 0x4E90BFD6;

    int id;
    long random_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDeleteMessages`, id 0xA20DB0E5.
final class updateDeleteMessages : Update
{
    enum uint tlId = 0xA20DB0E5;

    Vector!(int) messages;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateUserTyping`, id 0x2A17BF5C.
final class updateUserTyping : Update
{
    enum uint tlId = 0x2A17BF5C;

    uint flags;
    long user_id;
    int top_msg_id;
    SendMessageAction action;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChatUserTyping`, id 0x83487AF0.
final class updateChatUserTyping : Update
{
    enum uint tlId = 0x83487AF0;

    long chat_id;
    Peer from_id;
    SendMessageAction action;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChatParticipants`, id 0x07761198.
final class updateChatParticipants : Update
{
    enum uint tlId = 0x07761198;

    ChatParticipants participants;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateUserStatus`, id 0xE5BDF8DE.
final class updateUserStatus : Update
{
    enum uint tlId = 0xE5BDF8DE;

    long user_id;
    UserStatus status;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateUserName`, id 0xA7848924.
final class updateUserName : Update
{
    enum uint tlId = 0xA7848924;

    long user_id;
    string first_name;
    string last_name;
    Vector!(Username) usernames;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateNewAuthorization`, id 0x8951ABEF.
final class updateNewAuthorization : Update
{
    enum uint tlId = 0x8951ABEF;

    uint flags;
    bool unconfirmed;
    long hash;
    int date;
    string device;
    string location;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateNewEncryptedMessage`, id 0x12BCBD9A.
final class updateNewEncryptedMessage : Update
{
    enum uint tlId = 0x12BCBD9A;

    EncryptedMessage message;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateEncryptedChatTyping`, id 0x1710F156.
final class updateEncryptedChatTyping : Update
{
    enum uint tlId = 0x1710F156;

    int chat_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateEncryption`, id 0xB4A2E88D.
final class updateEncryption : Update
{
    enum uint tlId = 0xB4A2E88D;

    EncryptedChat chat;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateEncryptedMessagesRead`, id 0x38FE25B7.
final class updateEncryptedMessagesRead : Update
{
    enum uint tlId = 0x38FE25B7;

    int chat_id;
    int max_date;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChatParticipantAdd`, id 0x3DDA5451.
final class updateChatParticipantAdd : Update
{
    enum uint tlId = 0x3DDA5451;

    long chat_id;
    long user_id;
    long inviter_id;
    int date;
    int version_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChatParticipantDelete`, id 0xE32F3D77.
final class updateChatParticipantDelete : Update
{
    enum uint tlId = 0xE32F3D77;

    long chat_id;
    long user_id;
    int version_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDcOptions`, id 0x8E5E9873.
final class updateDcOptions : Update
{
    enum uint tlId = 0x8E5E9873;

    Vector!(DcOption) dc_options;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateNotifySettings`, id 0xBEC268EF.
final class updateNotifySettings : Update
{
    enum uint tlId = 0xBEC268EF;

    NotifyPeer peer;
    PeerNotifySettings notify_settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateServiceNotification`, id 0xEBE46819.
final class updateServiceNotification : Update
{
    enum uint tlId = 0xEBE46819;

    uint flags;
    bool popup;
    bool invert_media;
    int inbox_date;
    string type;
    string message;
    MessageMedia media;
    Vector!(MessageEntity) entities;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePrivacy`, id 0xEE3B272A.
final class updatePrivacy : Update
{
    enum uint tlId = 0xEE3B272A;

    PrivacyKey key;
    Vector!(PrivacyRule) rules;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateUserPhone`, id 0x05492A13.
final class updateUserPhone : Update
{
    enum uint tlId = 0x05492A13;

    long user_id;
    string phone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateReadHistoryInbox`, id 0x9E84BC99.
final class updateReadHistoryInbox : Update
{
    enum uint tlId = 0x9E84BC99;

    uint flags;
    int folder_id;
    Peer peer;
    int top_msg_id;
    int max_id;
    int still_unread_count;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateReadHistoryOutbox`, id 0x2F2F21BF.
final class updateReadHistoryOutbox : Update
{
    enum uint tlId = 0x2F2F21BF;

    Peer peer;
    int max_id;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateWebPage`, id 0x7F891213.
final class updateWebPage : Update
{
    enum uint tlId = 0x7F891213;

    WebPage webpage;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateReadMessagesContents`, id 0xF8227181.
final class updateReadMessagesContents : Update
{
    enum uint tlId = 0xF8227181;

    uint flags;
    Vector!(int) messages;
    int pts;
    int pts_count;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChannelTooLong`, id 0x108D941F.
final class updateChannelTooLong : Update
{
    enum uint tlId = 0x108D941F;

    uint flags;
    long channel_id;
    int pts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChannel`, id 0x635B4C09.
final class updateChannel : Update
{
    enum uint tlId = 0x635B4C09;

    long channel_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateNewChannelMessage`, id 0x62BA04D9.
final class updateNewChannelMessage : Update
{
    enum uint tlId = 0x62BA04D9;

    Message message;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateReadChannelInbox`, id 0x922E6E10.
final class updateReadChannelInbox : Update
{
    enum uint tlId = 0x922E6E10;

    uint flags;
    int folder_id;
    long channel_id;
    int max_id;
    int still_unread_count;
    int pts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDeleteChannelMessages`, id 0xC32D5B12.
final class updateDeleteChannelMessages : Update
{
    enum uint tlId = 0xC32D5B12;

    long channel_id;
    Vector!(int) messages;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChannelMessageViews`, id 0xF226AC08.
final class updateChannelMessageViews : Update
{
    enum uint tlId = 0xF226AC08;

    long channel_id;
    int id;
    int views;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChatParticipantAdmin`, id 0xD7CA61A2.
final class updateChatParticipantAdmin : Update
{
    enum uint tlId = 0xD7CA61A2;

    long chat_id;
    long user_id;
    bool is_admin;
    int version_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateNewStickerSet`, id 0x688A30AA.
final class updateNewStickerSet : Update
{
    enum uint tlId = 0x688A30AA;

    messages_StickerSet stickerset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateStickerSetsOrder`, id 0x0BB2D201.
final class updateStickerSetsOrder : Update
{
    enum uint tlId = 0x0BB2D201;

    uint flags;
    bool masks;
    bool emojis;
    Vector!(long) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateStickerSets`, id 0x31C24808.
final class updateStickerSets : Update
{
    enum uint tlId = 0x31C24808;

    uint flags;
    bool masks;
    bool emojis;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateSavedGifs`, id 0x9375341E.
final class updateSavedGifs : Update
{
    enum uint tlId = 0x9375341E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotInlineQuery`, id 0x496F379C.
final class updateBotInlineQuery : Update
{
    enum uint tlId = 0x496F379C;

    uint flags;
    long query_id;
    long user_id;
    string query;
    GeoPoint geo;
    InlineQueryPeerType peer_type;
    string offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotInlineSend`, id 0x12F12A07.
final class updateBotInlineSend : Update
{
    enum uint tlId = 0x12F12A07;

    uint flags;
    long user_id;
    string query;
    GeoPoint geo;
    string id;
    InputBotInlineMessageID msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateEditChannelMessage`, id 0x1B3F4DF7.
final class updateEditChannelMessage : Update
{
    enum uint tlId = 0x1B3F4DF7;

    Message message;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotCallbackQuery`, id 0xB9CFC48D.
final class updateBotCallbackQuery : Update
{
    enum uint tlId = 0xB9CFC48D;

    uint flags;
    long query_id;
    long user_id;
    Peer peer;
    int msg_id;
    long chat_instance;
    ubyte[] data;
    string game_short_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateEditMessage`, id 0xE40370A3.
final class updateEditMessage : Update
{
    enum uint tlId = 0xE40370A3;

    Message message;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateInlineBotCallbackQuery`, id 0x691E9052.
final class updateInlineBotCallbackQuery : Update
{
    enum uint tlId = 0x691E9052;

    uint flags;
    long query_id;
    long user_id;
    InputBotInlineMessageID msg_id;
    long chat_instance;
    ubyte[] data;
    string game_short_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateReadChannelOutbox`, id 0xB75F99A9.
final class updateReadChannelOutbox : Update
{
    enum uint tlId = 0xB75F99A9;

    long channel_id;
    int max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDraftMessage`, id 0xEDFC111E.
final class updateDraftMessage : Update
{
    enum uint tlId = 0xEDFC111E;

    uint flags;
    Peer peer;
    int top_msg_id;
    Peer saved_peer_id;
    DraftMessage draft;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateReadFeaturedStickers`, id 0x571D2742.
final class updateReadFeaturedStickers : Update
{
    enum uint tlId = 0x571D2742;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateRecentStickers`, id 0x9A422C20.
final class updateRecentStickers : Update
{
    enum uint tlId = 0x9A422C20;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateConfig`, id 0xA229DD06.
final class updateConfig : Update
{
    enum uint tlId = 0xA229DD06;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePtsChanged`, id 0x3354678F.
final class updatePtsChanged : Update
{
    enum uint tlId = 0x3354678F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChannelWebPage`, id 0x2F2BA99F.
final class updateChannelWebPage : Update
{
    enum uint tlId = 0x2F2BA99F;

    long channel_id;
    WebPage webpage;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDialogPinned`, id 0x6E6FE51C.
final class updateDialogPinned : Update
{
    enum uint tlId = 0x6E6FE51C;

    uint flags;
    bool pinned;
    int folder_id;
    DialogPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePinnedDialogs`, id 0xFA0F3CA2.
final class updatePinnedDialogs : Update
{
    enum uint tlId = 0xFA0F3CA2;

    uint flags;
    int folder_id;
    Vector!(DialogPeer) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotWebhookJSON`, id 0x8317C0C3.
final class updateBotWebhookJSON : Update
{
    enum uint tlId = 0x8317C0C3;

    DataJSON data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotWebhookJSONQuery`, id 0x9B9240A6.
final class updateBotWebhookJSONQuery : Update
{
    enum uint tlId = 0x9B9240A6;

    long query_id;
    DataJSON data;
    int timeout;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotShippingQuery`, id 0xB5AEFD7D.
final class updateBotShippingQuery : Update
{
    enum uint tlId = 0xB5AEFD7D;

    long query_id;
    long user_id;
    ubyte[] payload;
    PostAddress shipping_address;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotPrecheckoutQuery`, id 0x8CAA9A96.
final class updateBotPrecheckoutQuery : Update
{
    enum uint tlId = 0x8CAA9A96;

    uint flags;
    long query_id;
    long user_id;
    ubyte[] payload;
    PaymentRequestedInfo info;
    string shipping_option_id;
    string currency;
    long total_amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePhoneCall`, id 0xAB0F6B1E.
final class updatePhoneCall : Update
{
    enum uint tlId = 0xAB0F6B1E;

    PhoneCall phone_call;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateLangPackTooLong`, id 0x46560264.
final class updateLangPackTooLong : Update
{
    enum uint tlId = 0x46560264;

    string lang_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateLangPack`, id 0x56022F4D.
final class updateLangPack : Update
{
    enum uint tlId = 0x56022F4D;

    LangPackDifference difference;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateFavedStickers`, id 0xE511996D.
final class updateFavedStickers : Update
{
    enum uint tlId = 0xE511996D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChannelReadMessagesContents`, id 0x25F324F7.
final class updateChannelReadMessagesContents : Update
{
    enum uint tlId = 0x25F324F7;

    uint flags;
    long channel_id;
    int top_msg_id;
    Peer saved_peer_id;
    Vector!(int) messages;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateContactsReset`, id 0x7084A7BE.
final class updateContactsReset : Update
{
    enum uint tlId = 0x7084A7BE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChannelAvailableMessages`, id 0xB23FC698.
final class updateChannelAvailableMessages : Update
{
    enum uint tlId = 0xB23FC698;

    long channel_id;
    int available_min_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDialogUnreadMark`, id 0xB658F23E.
final class updateDialogUnreadMark : Update
{
    enum uint tlId = 0xB658F23E;

    uint flags;
    bool unread;
    DialogPeer peer;
    Peer saved_peer_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateMessagePoll`, id 0xD64C522B.
final class updateMessagePoll : Update
{
    enum uint tlId = 0xD64C522B;

    uint flags;
    Peer peer;
    int msg_id;
    int top_msg_id;
    long poll_id;
    Poll poll;
    PollResults results;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChatDefaultBannedRights`, id 0x54C01850.
final class updateChatDefaultBannedRights : Update
{
    enum uint tlId = 0x54C01850;

    Peer peer;
    ChatBannedRights default_banned_rights;
    int version_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateFolderPeers`, id 0x19360DC0.
final class updateFolderPeers : Update
{
    enum uint tlId = 0x19360DC0;

    Vector!(FolderPeer) folder_peers;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePeerSettings`, id 0x6A7E7366.
final class updatePeerSettings : Update
{
    enum uint tlId = 0x6A7E7366;

    Peer peer;
    PeerSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePeerLocated`, id 0xB4AFCFB0.
final class updatePeerLocated : Update
{
    enum uint tlId = 0xB4AFCFB0;

    Vector!(PeerLocated) peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateNewScheduledMessage`, id 0x39A51DFB.
final class updateNewScheduledMessage : Update
{
    enum uint tlId = 0x39A51DFB;

    Message message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDeleteScheduledMessages`, id 0xF2A71983.
final class updateDeleteScheduledMessages : Update
{
    enum uint tlId = 0xF2A71983;

    uint flags;
    Peer peer;
    Vector!(int) messages;
    Vector!(int) sent_messages;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateTheme`, id 0x8216FBA3.
final class updateTheme : Update
{
    enum uint tlId = 0x8216FBA3;

    Theme theme;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateGeoLiveViewed`, id 0x871FB939.
final class updateGeoLiveViewed : Update
{
    enum uint tlId = 0x871FB939;

    Peer peer;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateLoginToken`, id 0x564FE691.
final class updateLoginToken : Update
{
    enum uint tlId = 0x564FE691;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateMessagePollVote`, id 0x7699F014.
final class updateMessagePollVote : Update
{
    enum uint tlId = 0x7699F014;

    long poll_id;
    Peer peer;
    Vector!(ubyte[]) options;
    Vector!(int) positions;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDialogFilter`, id 0x26FFDE7D.
final class updateDialogFilter : Update
{
    enum uint tlId = 0x26FFDE7D;

    uint flags;
    int id;
    DialogFilter filter;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDialogFilterOrder`, id 0xA5D72105.
final class updateDialogFilterOrder : Update
{
    enum uint tlId = 0xA5D72105;

    Vector!(int) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDialogFilters`, id 0x3504914F.
final class updateDialogFilters : Update
{
    enum uint tlId = 0x3504914F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePhoneCallSignalingData`, id 0x2661BF09.
final class updatePhoneCallSignalingData : Update
{
    enum uint tlId = 0x2661BF09;

    long phone_call_id;
    ubyte[] data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChannelMessageForwards`, id 0xD29A27F4.
final class updateChannelMessageForwards : Update
{
    enum uint tlId = 0xD29A27F4;

    long channel_id;
    int id;
    int forwards;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateReadChannelDiscussionInbox`, id 0xD6B19546.
final class updateReadChannelDiscussionInbox : Update
{
    enum uint tlId = 0xD6B19546;

    uint flags;
    long channel_id;
    int top_msg_id;
    int read_max_id;
    long broadcast_id;
    int broadcast_post;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateReadChannelDiscussionOutbox`, id 0x695C9E7C.
final class updateReadChannelDiscussionOutbox : Update
{
    enum uint tlId = 0x695C9E7C;

    long channel_id;
    int top_msg_id;
    int read_max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePeerBlocked`, id 0xEBE07752.
final class updatePeerBlocked : Update
{
    enum uint tlId = 0xEBE07752;

    uint flags;
    bool blocked;
    bool blocked_my_stories_from;
    Peer peer_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChannelUserTyping`, id 0x8C88C923.
final class updateChannelUserTyping : Update
{
    enum uint tlId = 0x8C88C923;

    uint flags;
    long channel_id;
    int top_msg_id;
    Peer from_id;
    SendMessageAction action;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePinnedMessages`, id 0xED85EAB5.
final class updatePinnedMessages : Update
{
    enum uint tlId = 0xED85EAB5;

    uint flags;
    bool pinned;
    Peer peer;
    Vector!(int) messages;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePinnedChannelMessages`, id 0x5BB98608.
final class updatePinnedChannelMessages : Update
{
    enum uint tlId = 0x5BB98608;

    uint flags;
    bool pinned;
    long channel_id;
    Vector!(int) messages;
    int pts;
    int pts_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChat`, id 0xF89A6A4E.
final class updateChat : Update
{
    enum uint tlId = 0xF89A6A4E;

    long chat_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateGroupCallParticipants`, id 0xF2EBDB4E.
final class updateGroupCallParticipants : Update
{
    enum uint tlId = 0xF2EBDB4E;

    InputGroupCall call;
    Vector!(GroupCallParticipant) participants;
    int version_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateGroupCall`, id 0x9D2216E0.
final class updateGroupCall : Update
{
    enum uint tlId = 0x9D2216E0;

    uint flags;
    bool live_story;
    Peer peer;
    GroupCall call;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePeerHistoryTTL`, id 0xBB9BB9A5.
final class updatePeerHistoryTTL : Update
{
    enum uint tlId = 0xBB9BB9A5;

    uint flags;
    Peer peer;
    int ttl_period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChatParticipant`, id 0xD087663A.
final class updateChatParticipant : Update
{
    enum uint tlId = 0xD087663A;

    uint flags;
    long chat_id;
    int date;
    long actor_id;
    long user_id;
    ChatParticipant prev_participant;
    ChatParticipant new_participant;
    ExportedChatInvite invite;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChannelParticipant`, id 0x985D3ABB.
final class updateChannelParticipant : Update
{
    enum uint tlId = 0x985D3ABB;

    uint flags;
    bool via_chatlist;
    long channel_id;
    int date;
    long actor_id;
    long user_id;
    ChannelParticipant prev_participant;
    ChannelParticipant new_participant;
    ExportedChatInvite invite;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotStopped`, id 0xC4870A49.
final class updateBotStopped : Update
{
    enum uint tlId = 0xC4870A49;

    long user_id;
    int date;
    bool stopped;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateGroupCallConnection`, id 0x0B783982.
final class updateGroupCallConnection : Update
{
    enum uint tlId = 0x0B783982;

    uint flags;
    bool presentation;
    DataJSON params;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotCommands`, id 0x4D712F2E.
final class updateBotCommands : Update
{
    enum uint tlId = 0x4D712F2E;

    Peer peer;
    long bot_id;
    Vector!(BotCommand) commands;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePendingJoinRequests`, id 0x7063C3DB.
final class updatePendingJoinRequests : Update
{
    enum uint tlId = 0x7063C3DB;

    Peer peer;
    int requests_pending;
    Vector!(long) recent_requesters;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotChatInviteRequester`, id 0x7CB34D79.
final class updateBotChatInviteRequester : Update
{
    enum uint tlId = 0x7CB34D79;

    uint flags;
    Peer peer;
    int date;
    long user_id;
    string about;
    ExportedChatInvite invite;
    int qts;
    long query_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateMessageReactions`, id 0x1E297BFA.
final class updateMessageReactions : Update
{
    enum uint tlId = 0x1E297BFA;

    uint flags;
    Peer peer;
    int msg_id;
    int top_msg_id;
    Peer saved_peer_id;
    MessageReactions reactions;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateAttachMenuBots`, id 0x17B7A20B.
final class updateAttachMenuBots : Update
{
    enum uint tlId = 0x17B7A20B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateWebViewResultSent`, id 0x1592B79D.
final class updateWebViewResultSent : Update
{
    enum uint tlId = 0x1592B79D;

    long query_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotMenuButton`, id 0x14B85813.
final class updateBotMenuButton : Update
{
    enum uint tlId = 0x14B85813;

    long bot_id;
    BotMenuButton button;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateSavedRingtones`, id 0x74D8BE99.
final class updateSavedRingtones : Update
{
    enum uint tlId = 0x74D8BE99;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateTranscribedAudio`, id 0x0084CD5A.
final class updateTranscribedAudio : Update
{
    enum uint tlId = 0x0084CD5A;

    uint flags;
    bool pending;
    Peer peer;
    int msg_id;
    long transcription_id;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateReadFeaturedEmojiStickers`, id 0xFB4C496C.
final class updateReadFeaturedEmojiStickers : Update
{
    enum uint tlId = 0xFB4C496C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateUserEmojiStatus`, id 0x28373599.
final class updateUserEmojiStatus : Update
{
    enum uint tlId = 0x28373599;

    long user_id;
    EmojiStatus emoji_status;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateRecentEmojiStatuses`, id 0x30F443DB.
final class updateRecentEmojiStatuses : Update
{
    enum uint tlId = 0x30F443DB;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateRecentReactions`, id 0x6F7863F4.
final class updateRecentReactions : Update
{
    enum uint tlId = 0x6F7863F4;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateMoveStickerSetToTop`, id 0x86FCCF85.
final class updateMoveStickerSetToTop : Update
{
    enum uint tlId = 0x86FCCF85;

    uint flags;
    bool masks;
    bool emojis;
    long stickerset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateMessageExtendedMedia`, id 0xD5A41724.
final class updateMessageExtendedMedia : Update
{
    enum uint tlId = 0xD5A41724;

    Peer peer;
    int msg_id;
    Vector!(MessageExtendedMedia) extended_media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateUser`, id 0x20529438.
final class updateUser : Update
{
    enum uint tlId = 0x20529438;

    long user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateAutoSaveSettings`, id 0xEC05B097.
final class updateAutoSaveSettings : Update
{
    enum uint tlId = 0xEC05B097;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateStory`, id 0x75B3B798.
final class updateStory : Update
{
    enum uint tlId = 0x75B3B798;

    Peer peer;
    StoryItem story;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateReadStories`, id 0xF74E932B.
final class updateReadStories : Update
{
    enum uint tlId = 0xF74E932B;

    Peer peer;
    int max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateStoryID`, id 0x1BF335B9.
final class updateStoryID : Update
{
    enum uint tlId = 0x1BF335B9;

    int id;
    long random_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateStoriesStealthMode`, id 0x2C084DC1.
final class updateStoriesStealthMode : Update
{
    enum uint tlId = 0x2C084DC1;

    StoriesStealthMode stealth_mode;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateSentStoryReaction`, id 0x7D627683.
final class updateSentStoryReaction : Update
{
    enum uint tlId = 0x7D627683;

    Peer peer;
    int story_id;
    Reaction reaction;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotChatBoost`, id 0x904DD49C.
final class updateBotChatBoost : Update
{
    enum uint tlId = 0x904DD49C;

    Peer peer;
    Boost boost;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChannelViewForumAsMessages`, id 0x07B68920.
final class updateChannelViewForumAsMessages : Update
{
    enum uint tlId = 0x07B68920;

    long channel_id;
    bool enabled;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePeerWallpaper`, id 0xAE3F101D.
final class updatePeerWallpaper : Update
{
    enum uint tlId = 0xAE3F101D;

    uint flags;
    bool wallpaper_overridden;
    Peer peer;
    WallPaper wallpaper;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotMessageReaction`, id 0xAC21D3CE.
final class updateBotMessageReaction : Update
{
    enum uint tlId = 0xAC21D3CE;

    Peer peer;
    int msg_id;
    int date;
    Peer actor;
    Vector!(Reaction) old_reactions;
    Vector!(Reaction) new_reactions;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotMessageReactions`, id 0x09CB7759.
final class updateBotMessageReactions : Update
{
    enum uint tlId = 0x09CB7759;

    Peer peer;
    int msg_id;
    int date;
    Vector!(ReactionCount) reactions;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateSavedDialogPinned`, id 0xAEAF9E74.
final class updateSavedDialogPinned : Update
{
    enum uint tlId = 0xAEAF9E74;

    uint flags;
    bool pinned;
    DialogPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePinnedSavedDialogs`, id 0x686C85A6.
final class updatePinnedSavedDialogs : Update
{
    enum uint tlId = 0x686C85A6;

    uint flags;
    Vector!(DialogPeer) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateSavedReactionTags`, id 0x39C67432.
final class updateSavedReactionTags : Update
{
    enum uint tlId = 0x39C67432;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateSmsJob`, id 0xF16269D4.
final class updateSmsJob : Update
{
    enum uint tlId = 0xF16269D4;

    string job_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateQuickReplies`, id 0xF9470AB2.
final class updateQuickReplies : Update
{
    enum uint tlId = 0xF9470AB2;

    Vector!(QuickReply) quick_replies;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateNewQuickReply`, id 0xF53DA717.
final class updateNewQuickReply : Update
{
    enum uint tlId = 0xF53DA717;

    QuickReply quick_reply;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDeleteQuickReply`, id 0x53E6F1EC.
final class updateDeleteQuickReply : Update
{
    enum uint tlId = 0x53E6F1EC;

    int shortcut_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateQuickReplyMessage`, id 0x3E050D0F.
final class updateQuickReplyMessage : Update
{
    enum uint tlId = 0x3E050D0F;

    Message message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDeleteQuickReplyMessages`, id 0x566FE7CD.
final class updateDeleteQuickReplyMessages : Update
{
    enum uint tlId = 0x566FE7CD;

    int shortcut_id;
    Vector!(int) messages;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotBusinessConnect`, id 0x8AE5C97A.
final class updateBotBusinessConnect : Update
{
    enum uint tlId = 0x8AE5C97A;

    BotBusinessConnection connection;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotNewBusinessMessage`, id 0x9DDB347C.
final class updateBotNewBusinessMessage : Update
{
    enum uint tlId = 0x9DDB347C;

    uint flags;
    string connection_id;
    Message message;
    Message reply_to_message;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotEditBusinessMessage`, id 0x07DF587C.
final class updateBotEditBusinessMessage : Update
{
    enum uint tlId = 0x07DF587C;

    uint flags;
    string connection_id;
    Message message;
    Message reply_to_message;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotDeleteBusinessMessage`, id 0xA02A982E.
final class updateBotDeleteBusinessMessage : Update
{
    enum uint tlId = 0xA02A982E;

    string connection_id;
    Peer peer;
    Vector!(int) messages;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateNewStoryReaction`, id 0x1824E40B.
final class updateNewStoryReaction : Update
{
    enum uint tlId = 0x1824E40B;

    int story_id;
    Peer peer;
    Reaction reaction;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateStarsBalance`, id 0x4E80A379.
final class updateStarsBalance : Update
{
    enum uint tlId = 0x4E80A379;

    StarsAmount balance;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBusinessBotCallbackQuery`, id 0x1EA2FDA7.
final class updateBusinessBotCallbackQuery : Update
{
    enum uint tlId = 0x1EA2FDA7;

    uint flags;
    long query_id;
    long user_id;
    string connection_id;
    Message message;
    Message reply_to_message;
    long chat_instance;
    ubyte[] data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateStarsRevenueStatus`, id 0xA584B019.
final class updateStarsRevenueStatus : Update
{
    enum uint tlId = 0xA584B019;

    Peer peer;
    StarsRevenueStatus status;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotPurchasedPaidMedia`, id 0x283BD312.
final class updateBotPurchasedPaidMedia : Update
{
    enum uint tlId = 0x283BD312;

    long user_id;
    string payload;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePaidReactionPrivacy`, id 0x8B725FCE.
final class updatePaidReactionPrivacy : Update
{
    enum uint tlId = 0x8B725FCE;

    PaidReactionPrivacy private_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateSentPhoneCode`, id 0x504AA18F.
final class updateSentPhoneCode : Update
{
    enum uint tlId = 0x504AA18F;

    auth_SentCode sent_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateGroupCallChainBlocks`, id 0xA477288F.
final class updateGroupCallChainBlocks : Update
{
    enum uint tlId = 0xA477288F;

    InputGroupCall call;
    int sub_chain_id;
    Vector!(ubyte[]) blocks;
    int next_offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateReadMonoForumInbox`, id 0x77B0E372.
final class updateReadMonoForumInbox : Update
{
    enum uint tlId = 0x77B0E372;

    long channel_id;
    Peer saved_peer_id;
    int read_max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateReadMonoForumOutbox`, id 0xA4A79376.
final class updateReadMonoForumOutbox : Update
{
    enum uint tlId = 0xA4A79376;

    long channel_id;
    Peer saved_peer_id;
    int read_max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateMonoForumNoPaidException`, id 0x9F812B08.
final class updateMonoForumNoPaidException : Update
{
    enum uint tlId = 0x9F812B08;

    uint flags;
    bool exception;
    long channel_id;
    Peer saved_peer_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateGroupCallMessage`, id 0xD8326F0D.
final class updateGroupCallMessage : Update
{
    enum uint tlId = 0xD8326F0D;

    InputGroupCall call;
    GroupCallMessage message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateGroupCallEncryptedMessage`, id 0xC957A766.
final class updateGroupCallEncryptedMessage : Update
{
    enum uint tlId = 0xC957A766;

    InputGroupCall call;
    Peer from_id;
    ubyte[] encrypted_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePinnedForumTopic`, id 0x683B2C52.
final class updatePinnedForumTopic : Update
{
    enum uint tlId = 0x683B2C52;

    uint flags;
    bool pinned;
    Peer peer;
    int topic_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatePinnedForumTopics`, id 0xDEF143D0.
final class updatePinnedForumTopics : Update
{
    enum uint tlId = 0xDEF143D0;

    uint flags;
    Peer peer;
    Vector!(int) order;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDeleteGroupCallMessages`, id 0x3E85E92C.
final class updateDeleteGroupCallMessages : Update
{
    enum uint tlId = 0x3E85E92C;

    InputGroupCall call;
    Vector!(int) messages;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateStarGiftAuctionState`, id 0x48E246C2.
final class updateStarGiftAuctionState : Update
{
    enum uint tlId = 0x48E246C2;

    long gift_id;
    StarGiftAuctionState state;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateStarGiftAuctionUserState`, id 0xDC58F31E.
final class updateStarGiftAuctionUserState : Update
{
    enum uint tlId = 0xDC58F31E;

    long gift_id;
    StarGiftAuctionUserState user_state;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateEmojiGameInfo`, id 0xFB9C547A.
final class updateEmojiGameInfo : Update
{
    enum uint tlId = 0xFB9C547A;

    messages_EmojiGameInfo info;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateStarGiftCraftFail`, id 0xAC072444.
final class updateStarGiftCraftFail : Update
{
    enum uint tlId = 0xAC072444;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateChatParticipantRank`, id 0xBD8367B9.
final class updateChatParticipantRank : Update
{
    enum uint tlId = 0xBD8367B9;

    long chat_id;
    long user_id;
    string rank;
    int version_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateManagedBot`, id 0x4880ED9A.
final class updateManagedBot : Update
{
    enum uint tlId = 0x4880ED9A;

    long user_id;
    long bot_id;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotGuestChatQuery`, id 0xCDD4093D.
final class updateBotGuestChatQuery : Update
{
    enum uint tlId = 0xCDD4093D;

    uint flags;
    long query_id;
    Message message;
    Vector!(Message) reference_messages;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateAiComposeTones`, id 0x8C0F91FB.
final class updateAiComposeTones : Update
{
    enum uint tlId = 0x8C0F91FB;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateJoinChatWebViewDecision`, id 0xBDAC7E70.
final class updateJoinChatWebViewDecision : Update
{
    enum uint tlId = 0xBDAC7E70;

    Peer peer;
    long query_id;
    JoinChatBotResult result;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateNewBotConnection`, id 0xB22083A6.
final class updateNewBotConnection : Update
{
    enum uint tlId = 0xB22083A6;

    uint flags;
    bool confirmed;
    long bot_id;
    int date;
    string device;
    string location;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateWebBrowserSettings`, id 0xC39A2ADE.
final class updateWebBrowserSettings : Update
{
    enum uint tlId = 0xC39A2ADE;

    uint flags;
    bool open_external_browser;
    bool display_close_button;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateWebBrowserException`, id 0x140502D1.
final class updateWebBrowserException : Update
{
    enum uint tlId = 0x140502D1;

    uint flags;
    bool delete_;
    bool open_external_browser;
    WebDomainException exception;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateNewEphemeralMessage`, id 0x20BCBBA1.
final class updateNewEphemeralMessage : Update
{
    enum uint tlId = 0x20BCBBA1;

    EphemeralMessage message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateDeleteEphemeralMessages`, id 0x56DBFCF8.
final class updateDeleteEphemeralMessages : Update
{
    enum uint tlId = 0x56DBFCF8;

    Peer peer;
    Vector!(int) ids;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateEditEphemeralMessage`, id 0x4BBB8F01.
final class updateEditEphemeralMessage : Update
{
    enum uint tlId = 0x4BBB8F01;

    EphemeralMessage message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateEphemeralBotCallbackQuery`, id 0x7C1079D6.
final class updateEphemeralBotCallbackQuery : Update
{
    enum uint tlId = 0x7C1079D6;

    uint flags;
    long query_id;
    long user_id;
    Peer peer;
    int msg_id;
    ubyte[] data;
    long chat_instance;
    EphemeralMessage message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateBotStarsSubscription`, id 0x6C0D8E23.
final class updateBotStarsSubscription : Update
{
    enum uint tlId = 0x6C0D8E23;

    uint flags;
    bool canceled;
    bool payment_failed;
    bool restored;
    long user_id;
    ubyte[] payload;
    int qts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateWalletState`, id 0x6AC3F2AA.
final class updateWalletState : Update
{
    enum uint tlId = 0x6AC3F2AA;

    WalletState state;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateSentWalletTransaction`, id 0xB1434D4A.
final class updateSentWalletTransaction : Update
{
    enum uint tlId = 0xB1434D4A;

    uint flags;
    bool gasless;
    string msg_hash;
    WalletTransaction transaction;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateWalletGaslessInfo`, id 0xA8AE1CAC.
final class updateWalletGaslessInfo : Update
{
    enum uint tlId = 0xA8AE1CAC;

    uint flags;
    bool available;
    int left;
    int reset_at;
    long min_amount;
    string relayer_address;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateWalletTonConnectSession`, id 0x50A38E0E.
final class updateWalletTonConnectSession : Update
{
    enum uint tlId = 0x50A38E0E;

    TonConnectSession session;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateWalletTonConnectPendingDisconnect`, id 0xD1EE8199.
final class updateWalletTonConnectPendingDisconnect : Update
{
    enum uint tlId = 0xD1EE8199;

    Vector!(long) session_ids;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatesTooLong`, id 0xE317AF7E.
final class updatesTooLong : Updates
{
    enum uint tlId = 0xE317AF7E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateShortMessage`, id 0x313BC7F8.
final class updateShortMessage : Updates
{
    enum uint tlId = 0x313BC7F8;

    uint flags;
    bool out_;
    bool mentioned;
    bool media_unread;
    bool silent;
    int id;
    long user_id;
    string message;
    int pts;
    int pts_count;
    int date;
    MessageFwdHeader fwd_from;
    long via_bot_id;
    MessageReplyHeader reply_to;
    Vector!(MessageEntity) entities;
    int ttl_period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateShortChatMessage`, id 0x4D6DEEA5.
final class updateShortChatMessage : Updates
{
    enum uint tlId = 0x4D6DEEA5;

    uint flags;
    bool out_;
    bool mentioned;
    bool media_unread;
    bool silent;
    int id;
    long from_id;
    long chat_id;
    string message;
    int pts;
    int pts_count;
    int date;
    MessageFwdHeader fwd_from;
    long via_bot_id;
    MessageReplyHeader reply_to;
    Vector!(MessageEntity) entities;
    int ttl_period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateShort`, id 0x78D4DEC1.
final class updateShort : Updates
{
    enum uint tlId = 0x78D4DEC1;

    Update update;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updatesCombined`, id 0x725B04C3.
final class updatesCombined : Updates
{
    enum uint tlId = 0x725B04C3;

    Vector!(Update) updates;
    Vector!(User) users;
    Vector!(Chat) chats;
    int date;
    int seq_start;
    int seq;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updates`, id 0x74AE4240.
final class updates : Updates
{
    enum uint tlId = 0x74AE4240;

    Vector!(Update) updates;
    Vector!(User) users;
    Vector!(Chat) chats;
    int date;
    int seq;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `updateShortSentMessage`, id 0x9015E101.
final class updateShortSentMessage : Updates
{
    enum uint tlId = 0x9015E101;

    uint flags;
    bool out_;
    int id;
    int pts;
    int pts_count;
    int date;
    MessageMedia media;
    Vector!(MessageEntity) entities;
    int ttl_period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `dcOption`, id 0x18B7A10D.
final class dcOption : DcOption
{
    enum uint tlId = 0x18B7A10D;

    uint flags;
    bool ipv6;
    bool media_only;
    bool tcpo_only;
    bool cdn;
    bool static_;
    bool this_port_only;
    int id;
    string ip_address;
    int port;
    ubyte[] secret;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `config`, id 0xCC1A241E.
final class config : Config
{
    enum uint tlId = 0xCC1A241E;

    uint flags;
    bool default_p2p_contacts;
    bool preload_featured_stickers;
    bool revoke_pm_inbox;
    bool blocked_mode;
    bool force_try_ipv6;
    int date;
    int expires;
    bool test_mode;
    int this_dc;
    Vector!(DcOption) dc_options;
    string dc_txt_domain_name;
    int chat_size_max;
    int megagroup_size_max;
    int forwarded_count_max;
    int online_update_period_ms;
    int offline_blur_timeout_ms;
    int offline_idle_timeout_ms;
    int online_cloud_timeout_ms;
    int notify_cloud_delay_ms;
    int notify_default_delay_ms;
    int push_chat_period_ms;
    int push_chat_limit;
    int edit_time_limit;
    int revoke_time_limit;
    int revoke_pm_time_limit;
    int rating_e_decay;
    int stickers_recent_limit;
    int channels_read_media_period;
    int tmp_sessions;
    int call_receive_timeout_ms;
    int call_ring_timeout_ms;
    int call_connect_timeout_ms;
    int call_packet_timeout_ms;
    string me_url_prefix;
    string autoupdate_url_prefix;
    string gif_search_username;
    string venue_search_username;
    string img_search_username;
    string static_maps_provider;
    int caption_length_max;
    int message_length_max;
    int webfile_dc_id;
    string suggested_lang_code;
    int lang_pack_version;
    int base_lang_pack_version;
    Reaction reactions_default;
    string autologin_token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `nearestDc`, id 0x8E1A1775.
final class nearestDc : NearestDc
{
    enum uint tlId = 0x8E1A1775;

    string country;
    int this_dc;
    int nearest_dc;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `encryptedChatEmpty`, id 0xAB7EC0A0.
final class encryptedChatEmpty : EncryptedChat
{
    enum uint tlId = 0xAB7EC0A0;

    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `encryptedChatWaiting`, id 0x66B25953.
final class encryptedChatWaiting : EncryptedChat
{
    enum uint tlId = 0x66B25953;

    int id;
    long access_hash;
    int date;
    long admin_id;
    long participant_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `encryptedChatRequested`, id 0x48F1D94C.
final class encryptedChatRequested : EncryptedChat
{
    enum uint tlId = 0x48F1D94C;

    uint flags;
    int folder_id;
    int id;
    long access_hash;
    int date;
    long admin_id;
    long participant_id;
    ubyte[] g_a;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `encryptedChat`, id 0x61F0D4C7.
final class encryptedChat : EncryptedChat
{
    enum uint tlId = 0x61F0D4C7;

    int id;
    long access_hash;
    int date;
    long admin_id;
    long participant_id;
    ubyte[] g_a_or_b;
    long key_fingerprint;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `encryptedChatDiscarded`, id 0x1E1C7C45.
final class encryptedChatDiscarded : EncryptedChat
{
    enum uint tlId = 0x1E1C7C45;

    uint flags;
    bool history_deleted;
    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputEncryptedChat`, id 0xF141B5E1.
final class inputEncryptedChat : InputEncryptedChat
{
    enum uint tlId = 0xF141B5E1;

    int chat_id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `encryptedFileEmpty`, id 0xC21F497E.
final class encryptedFileEmpty : EncryptedFile
{
    enum uint tlId = 0xC21F497E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `encryptedFile`, id 0xA8008CD8.
final class encryptedFile : EncryptedFile
{
    enum uint tlId = 0xA8008CD8;

    long id;
    long access_hash;
    long size;
    int dc_id;
    int key_fingerprint;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputEncryptedFileEmpty`, id 0x1837C364.
final class inputEncryptedFileEmpty : InputEncryptedFile
{
    enum uint tlId = 0x1837C364;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputEncryptedFileUploaded`, id 0x64BD0306.
final class inputEncryptedFileUploaded : InputEncryptedFile
{
    enum uint tlId = 0x64BD0306;

    long id;
    int parts;
    string md5_checksum;
    int key_fingerprint;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputEncryptedFile`, id 0x5A17B5E5.
final class inputEncryptedFile : InputEncryptedFile
{
    enum uint tlId = 0x5A17B5E5;

    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputEncryptedFileBigUploaded`, id 0x2DC173C8.
final class inputEncryptedFileBigUploaded : InputEncryptedFile
{
    enum uint tlId = 0x2DC173C8;

    long id;
    int parts;
    int key_fingerprint;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `encryptedMessage`, id 0xED18C118.
final class encryptedMessage : EncryptedMessage
{
    enum uint tlId = 0xED18C118;

    long random_id;
    int chat_id;
    int date;
    ubyte[] bytes;
    EncryptedFile file;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `encryptedMessageService`, id 0x23734B06.
final class encryptedMessageService : EncryptedMessage
{
    enum uint tlId = 0x23734B06;

    long random_id;
    int chat_id;
    int date;
    ubyte[] bytes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputDocumentEmpty`, id 0x72F0EAAE.
final class inputDocumentEmpty : InputDocument
{
    enum uint tlId = 0x72F0EAAE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputDocument`, id 0x1ABFB575.
final class inputDocument : InputDocument
{
    enum uint tlId = 0x1ABFB575;

    long id;
    long access_hash;
    ubyte[] file_reference;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `documentEmpty`, id 0x36F8C871.
final class documentEmpty : Document
{
    enum uint tlId = 0x36F8C871;

    long id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `document`, id 0x8FD4C4D8.
final class document : Document
{
    enum uint tlId = 0x8FD4C4D8;

    uint flags;
    long id;
    long access_hash;
    ubyte[] file_reference;
    int date;
    string mime_type;
    long size;
    Vector!(PhotoSize) thumbs;
    Vector!(VideoSize) video_thumbs;
    int dc_id;
    Vector!(DocumentAttribute) attributes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `notifyPeer`, id 0x9FD40BD8.
final class notifyPeer : NotifyPeer
{
    enum uint tlId = 0x9FD40BD8;

    Peer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `notifyUsers`, id 0xB4C83B4C.
final class notifyUsers : NotifyPeer
{
    enum uint tlId = 0xB4C83B4C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `notifyChats`, id 0xC007CEC3.
final class notifyChats : NotifyPeer
{
    enum uint tlId = 0xC007CEC3;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `notifyBroadcasts`, id 0xD612E8EF.
final class notifyBroadcasts : NotifyPeer
{
    enum uint tlId = 0xD612E8EF;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `notifyForumTopic`, id 0x226E6308.
final class notifyForumTopic : NotifyPeer
{
    enum uint tlId = 0x226E6308;

    Peer peer;
    int top_msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `notifyCommunity`, id 0xBE376999.
final class notifyCommunity : NotifyPeer
{
    enum uint tlId = 0xBE376999;

    long community_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageTypingAction`, id 0x16BF744E.
final class sendMessageTypingAction : SendMessageAction
{
    enum uint tlId = 0x16BF744E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageCancelAction`, id 0xFD5EC8F5.
final class sendMessageCancelAction : SendMessageAction
{
    enum uint tlId = 0xFD5EC8F5;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageRecordVideoAction`, id 0xA187D66F.
final class sendMessageRecordVideoAction : SendMessageAction
{
    enum uint tlId = 0xA187D66F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageUploadVideoAction`, id 0xE9763AEC.
final class sendMessageUploadVideoAction : SendMessageAction
{
    enum uint tlId = 0xE9763AEC;

    int progress;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageRecordAudioAction`, id 0xD52F73F7.
final class sendMessageRecordAudioAction : SendMessageAction
{
    enum uint tlId = 0xD52F73F7;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageUploadAudioAction`, id 0xF351D7AB.
final class sendMessageUploadAudioAction : SendMessageAction
{
    enum uint tlId = 0xF351D7AB;

    int progress;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageUploadPhotoAction`, id 0xD1D34A26.
final class sendMessageUploadPhotoAction : SendMessageAction
{
    enum uint tlId = 0xD1D34A26;

    int progress;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageUploadDocumentAction`, id 0xAA0CD9E4.
final class sendMessageUploadDocumentAction : SendMessageAction
{
    enum uint tlId = 0xAA0CD9E4;

    int progress;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageGeoLocationAction`, id 0x176F8BA1.
final class sendMessageGeoLocationAction : SendMessageAction
{
    enum uint tlId = 0x176F8BA1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageChooseContactAction`, id 0x628CBC6F.
final class sendMessageChooseContactAction : SendMessageAction
{
    enum uint tlId = 0x628CBC6F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageGamePlayAction`, id 0xDD6A8F48.
final class sendMessageGamePlayAction : SendMessageAction
{
    enum uint tlId = 0xDD6A8F48;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageRecordRoundAction`, id 0x88F27FBC.
final class sendMessageRecordRoundAction : SendMessageAction
{
    enum uint tlId = 0x88F27FBC;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageUploadRoundAction`, id 0x243E1C66.
final class sendMessageUploadRoundAction : SendMessageAction
{
    enum uint tlId = 0x243E1C66;

    int progress;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `speakingInGroupCallAction`, id 0xD92C2285.
final class speakingInGroupCallAction : SendMessageAction
{
    enum uint tlId = 0xD92C2285;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageHistoryImportAction`, id 0xDBDA9246.
final class sendMessageHistoryImportAction : SendMessageAction
{
    enum uint tlId = 0xDBDA9246;

    int progress;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageChooseStickerAction`, id 0xB05AC6B1.
final class sendMessageChooseStickerAction : SendMessageAction
{
    enum uint tlId = 0xB05AC6B1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageEmojiInteraction`, id 0x25972BCB.
final class sendMessageEmojiInteraction : SendMessageAction
{
    enum uint tlId = 0x25972BCB;

    string emoticon;
    int msg_id;
    DataJSON interaction;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageEmojiInteractionSeen`, id 0xB665902E.
final class sendMessageEmojiInteractionSeen : SendMessageAction
{
    enum uint tlId = 0xB665902E;

    string emoticon;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageTextDraftAction`, id 0x3630B85A.
final class sendMessageTextDraftAction : SendMessageAction
{
    enum uint tlId = 0x3630B85A;

    uint flags;
    bool can_stop;
    bool keep_on_stop;
    long random_id;
    TextWithEntities text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputSendMessageRichMessageDraftAction`, id 0xA937C7BE.
final class inputSendMessageRichMessageDraftAction : SendMessageAction
{
    enum uint tlId = 0xA937C7BE;

    uint flags;
    bool can_stop;
    bool keep_on_stop;
    long random_id;
    InputRichMessage rich_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageRichMessageDraftAction`, id 0x52564893.
final class sendMessageRichMessageDraftAction : SendMessageAction
{
    enum uint tlId = 0x52564893;

    uint flags;
    bool can_stop;
    bool keep_on_stop;
    long random_id;
    RichMessage rich_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendMessageStopDraftAction`, id 0xFBF902B0.
final class sendMessageStopDraftAction : SendMessageAction
{
    enum uint tlId = 0xFBF902B0;

    long random_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyStatusTimestamp`, id 0x4F96CB18.
final class inputPrivacyKeyStatusTimestamp : InputPrivacyKey
{
    enum uint tlId = 0x4F96CB18;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyChatInvite`, id 0xBDFB0426.
final class inputPrivacyKeyChatInvite : InputPrivacyKey
{
    enum uint tlId = 0xBDFB0426;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyPhoneCall`, id 0xFABADC5F.
final class inputPrivacyKeyPhoneCall : InputPrivacyKey
{
    enum uint tlId = 0xFABADC5F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyPhoneP2P`, id 0xDB9E70D2.
final class inputPrivacyKeyPhoneP2P : InputPrivacyKey
{
    enum uint tlId = 0xDB9E70D2;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyForwards`, id 0xA4DD4C08.
final class inputPrivacyKeyForwards : InputPrivacyKey
{
    enum uint tlId = 0xA4DD4C08;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyProfilePhoto`, id 0x5719BACC.
final class inputPrivacyKeyProfilePhoto : InputPrivacyKey
{
    enum uint tlId = 0x5719BACC;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyPhoneNumber`, id 0x0352DAFA.
final class inputPrivacyKeyPhoneNumber : InputPrivacyKey
{
    enum uint tlId = 0x0352DAFA;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyAddedByPhone`, id 0xD1219BDD.
final class inputPrivacyKeyAddedByPhone : InputPrivacyKey
{
    enum uint tlId = 0xD1219BDD;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyVoiceMessages`, id 0xAEE69D68.
final class inputPrivacyKeyVoiceMessages : InputPrivacyKey
{
    enum uint tlId = 0xAEE69D68;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyAbout`, id 0x3823CC40.
final class inputPrivacyKeyAbout : InputPrivacyKey
{
    enum uint tlId = 0x3823CC40;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyBirthday`, id 0xD65A11CC.
final class inputPrivacyKeyBirthday : InputPrivacyKey
{
    enum uint tlId = 0xD65A11CC;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyStarGiftsAutoSave`, id 0xE1732341.
final class inputPrivacyKeyStarGiftsAutoSave : InputPrivacyKey
{
    enum uint tlId = 0xE1732341;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeyNoPaidMessages`, id 0xBDC597B4.
final class inputPrivacyKeyNoPaidMessages : InputPrivacyKey
{
    enum uint tlId = 0xBDC597B4;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyKeySavedMusic`, id 0x4DBE9226.
final class inputPrivacyKeySavedMusic : InputPrivacyKey
{
    enum uint tlId = 0x4DBE9226;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyStatusTimestamp`, id 0xBC2EAB30.
final class privacyKeyStatusTimestamp : PrivacyKey
{
    enum uint tlId = 0xBC2EAB30;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyChatInvite`, id 0x500E6DFA.
final class privacyKeyChatInvite : PrivacyKey
{
    enum uint tlId = 0x500E6DFA;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyPhoneCall`, id 0x3D662B7B.
final class privacyKeyPhoneCall : PrivacyKey
{
    enum uint tlId = 0x3D662B7B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyPhoneP2P`, id 0x39491CC8.
final class privacyKeyPhoneP2P : PrivacyKey
{
    enum uint tlId = 0x39491CC8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyForwards`, id 0x69EC56A3.
final class privacyKeyForwards : PrivacyKey
{
    enum uint tlId = 0x69EC56A3;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyProfilePhoto`, id 0x96151FED.
final class privacyKeyProfilePhoto : PrivacyKey
{
    enum uint tlId = 0x96151FED;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyPhoneNumber`, id 0xD19AE46D.
final class privacyKeyPhoneNumber : PrivacyKey
{
    enum uint tlId = 0xD19AE46D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyAddedByPhone`, id 0x42FFD42B.
final class privacyKeyAddedByPhone : PrivacyKey
{
    enum uint tlId = 0x42FFD42B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyVoiceMessages`, id 0x0697F414.
final class privacyKeyVoiceMessages : PrivacyKey
{
    enum uint tlId = 0x0697F414;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyAbout`, id 0xA486B761.
final class privacyKeyAbout : PrivacyKey
{
    enum uint tlId = 0xA486B761;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyBirthday`, id 0x2000A518.
final class privacyKeyBirthday : PrivacyKey
{
    enum uint tlId = 0x2000A518;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyStarGiftsAutoSave`, id 0x2CA4FDF8.
final class privacyKeyStarGiftsAutoSave : PrivacyKey
{
    enum uint tlId = 0x2CA4FDF8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeyNoPaidMessages`, id 0x17D348D2.
final class privacyKeyNoPaidMessages : PrivacyKey
{
    enum uint tlId = 0x17D348D2;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyKeySavedMusic`, id 0xFF7A571B.
final class privacyKeySavedMusic : PrivacyKey
{
    enum uint tlId = 0xFF7A571B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyValueAllowContacts`, id 0x0D09E07B.
final class inputPrivacyValueAllowContacts : InputPrivacyRule
{
    enum uint tlId = 0x0D09E07B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyValueAllowAll`, id 0x184B35CE.
final class inputPrivacyValueAllowAll : InputPrivacyRule
{
    enum uint tlId = 0x184B35CE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyValueAllowUsers`, id 0x131CC67F.
final class inputPrivacyValueAllowUsers : InputPrivacyRule
{
    enum uint tlId = 0x131CC67F;

    Vector!(InputUser) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyValueDisallowContacts`, id 0x0BA52007.
final class inputPrivacyValueDisallowContacts : InputPrivacyRule
{
    enum uint tlId = 0x0BA52007;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyValueDisallowAll`, id 0xD66B66C9.
final class inputPrivacyValueDisallowAll : InputPrivacyRule
{
    enum uint tlId = 0xD66B66C9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyValueDisallowUsers`, id 0x90110467.
final class inputPrivacyValueDisallowUsers : InputPrivacyRule
{
    enum uint tlId = 0x90110467;

    Vector!(InputUser) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyValueAllowChatParticipants`, id 0x840649CF.
final class inputPrivacyValueAllowChatParticipants : InputPrivacyRule
{
    enum uint tlId = 0x840649CF;

    Vector!(long) chats;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyValueDisallowChatParticipants`, id 0xE94F0F86.
final class inputPrivacyValueDisallowChatParticipants : InputPrivacyRule
{
    enum uint tlId = 0xE94F0F86;

    Vector!(long) chats;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyValueAllowCloseFriends`, id 0x2F453E49.
final class inputPrivacyValueAllowCloseFriends : InputPrivacyRule
{
    enum uint tlId = 0x2F453E49;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyValueAllowPremium`, id 0x77CDC9F1.
final class inputPrivacyValueAllowPremium : InputPrivacyRule
{
    enum uint tlId = 0x77CDC9F1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyValueAllowBots`, id 0x5A4FCCE5.
final class inputPrivacyValueAllowBots : InputPrivacyRule
{
    enum uint tlId = 0x5A4FCCE5;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPrivacyValueDisallowBots`, id 0xC4E57915.
final class inputPrivacyValueDisallowBots : InputPrivacyRule
{
    enum uint tlId = 0xC4E57915;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyValueAllowContacts`, id 0xFFFE1BAC.
final class privacyValueAllowContacts : PrivacyRule
{
    enum uint tlId = 0xFFFE1BAC;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyValueAllowAll`, id 0x65427B82.
final class privacyValueAllowAll : PrivacyRule
{
    enum uint tlId = 0x65427B82;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyValueAllowUsers`, id 0xB8905FB2.
final class privacyValueAllowUsers : PrivacyRule
{
    enum uint tlId = 0xB8905FB2;

    Vector!(long) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyValueDisallowContacts`, id 0xF888FA1A.
final class privacyValueDisallowContacts : PrivacyRule
{
    enum uint tlId = 0xF888FA1A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyValueDisallowAll`, id 0x8B73E763.
final class privacyValueDisallowAll : PrivacyRule
{
    enum uint tlId = 0x8B73E763;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyValueDisallowUsers`, id 0xE4621141.
final class privacyValueDisallowUsers : PrivacyRule
{
    enum uint tlId = 0xE4621141;

    Vector!(long) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyValueAllowChatParticipants`, id 0x6B134E8E.
final class privacyValueAllowChatParticipants : PrivacyRule
{
    enum uint tlId = 0x6B134E8E;

    Vector!(long) chats;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyValueDisallowChatParticipants`, id 0x41C87565.
final class privacyValueDisallowChatParticipants : PrivacyRule
{
    enum uint tlId = 0x41C87565;

    Vector!(long) chats;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyValueAllowCloseFriends`, id 0xF7E8D89B.
final class privacyValueAllowCloseFriends : PrivacyRule
{
    enum uint tlId = 0xF7E8D89B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyValueAllowPremium`, id 0xECE9814B.
final class privacyValueAllowPremium : PrivacyRule
{
    enum uint tlId = 0xECE9814B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyValueAllowBots`, id 0x21461B5D.
final class privacyValueAllowBots : PrivacyRule
{
    enum uint tlId = 0x21461B5D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `privacyValueDisallowBots`, id 0xF6A5F82F.
final class privacyValueDisallowBots : PrivacyRule
{
    enum uint tlId = 0xF6A5F82F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `accountDaysTTL`, id 0xB8D0AFDF.
final class accountDaysTTL : AccountDaysTTL
{
    enum uint tlId = 0xB8D0AFDF;

    int days;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `documentAttributeImageSize`, id 0x6C37C15C.
final class documentAttributeImageSize : DocumentAttribute
{
    enum uint tlId = 0x6C37C15C;

    int w;
    int h;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `documentAttributeAnimated`, id 0x11B58939.
final class documentAttributeAnimated : DocumentAttribute
{
    enum uint tlId = 0x11B58939;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `documentAttributeSticker`, id 0x6319D612.
final class documentAttributeSticker : DocumentAttribute
{
    enum uint tlId = 0x6319D612;

    uint flags;
    bool mask;
    string alt;
    InputStickerSet stickerset;
    MaskCoords mask_coords;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `documentAttributeVideo`, id 0x43C57C48.
final class documentAttributeVideo : DocumentAttribute
{
    enum uint tlId = 0x43C57C48;

    uint flags;
    bool round_message;
    bool supports_streaming;
    bool nosound;
    double duration;
    int w;
    int h;
    int preload_prefix_size;
    double video_start_ts;
    string video_codec;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `documentAttributeAudio`, id 0x9852F9C6.
final class documentAttributeAudio : DocumentAttribute
{
    enum uint tlId = 0x9852F9C6;

    uint flags;
    bool voice;
    int duration;
    string title;
    string performer;
    ubyte[] waveform;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `documentAttributeFilename`, id 0x15590068.
final class documentAttributeFilename : DocumentAttribute
{
    enum uint tlId = 0x15590068;

    string file_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `documentAttributeHasStickers`, id 0x9801D2F7.
final class documentAttributeHasStickers : DocumentAttribute
{
    enum uint tlId = 0x9801D2F7;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `documentAttributeCustomEmoji`, id 0xFD149899.
final class documentAttributeCustomEmoji : DocumentAttribute
{
    enum uint tlId = 0xFD149899;

    uint flags;
    bool free;
    bool text_color;
    string alt;
    InputStickerSet stickerset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stickerPack`, id 0x12B299D4.
final class stickerPack : StickerPack
{
    enum uint tlId = 0x12B299D4;

    string emoticon;
    Vector!(long) documents;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webPageEmpty`, id 0x211A1788.
final class webPageEmpty : WebPage
{
    enum uint tlId = 0x211A1788;

    uint flags;
    long id;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webPagePending`, id 0xB0D13E47.
final class webPagePending : WebPage
{
    enum uint tlId = 0xB0D13E47;

    uint flags;
    long id;
    string url;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webPage`, id 0xE89C45B2.
final class webPage : WebPage
{
    enum uint tlId = 0xE89C45B2;

    uint flags;
    bool has_large_media;
    bool video_cover_photo;
    long id;
    string url;
    string display_url;
    int hash;
    string type;
    string site_name;
    string title;
    string description;
    Photo photo;
    string embed_url;
    string embed_type;
    int embed_width;
    int embed_height;
    int duration;
    string author;
    Document document;
    Page cached_page;
    Vector!(WebPageAttribute) attributes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webPageNotModified`, id 0x7311CA11.
final class webPageNotModified : WebPage
{
    enum uint tlId = 0x7311CA11;

    uint flags;
    int cached_page_views;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `authorization`, id 0xAD01D61D.
final class authorization : Authorization
{
    enum uint tlId = 0xAD01D61D;

    uint flags;
    bool current;
    bool official_app;
    bool password_pending;
    bool encrypted_requests_disabled;
    bool call_requests_disabled;
    bool unconfirmed;
    long hash;
    string device_model;
    string platform;
    string system_version;
    int api_id;
    string app_name;
    string app_version;
    int date_created;
    int date_active;
    string ip;
    string country;
    string region;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `receivedNotifyMessage`, id 0xA384B779.
final class receivedNotifyMessage : ReceivedNotifyMessage
{
    enum uint tlId = 0xA384B779;

    int id;
    int flags;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatInviteExported`, id 0xA22CBD96.
final class chatInviteExported : ExportedChatInvite
{
    enum uint tlId = 0xA22CBD96;

    uint flags;
    bool revoked;
    bool permanent;
    bool request_needed;
    string link;
    long admin_id;
    int date;
    int start_date;
    int expire_date;
    int usage_limit;
    int usage;
    int requested;
    int subscription_expired;
    string title;
    StarsSubscriptionPricing subscription_pricing;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatInvitePublicJoinRequests`, id 0xED107AB7.
final class chatInvitePublicJoinRequests : ExportedChatInvite
{
    enum uint tlId = 0xED107AB7;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatInviteAlready`, id 0x5A686D7C.
final class chatInviteAlready : ChatInvite
{
    enum uint tlId = 0x5A686D7C;

    Chat chat;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatInvite`, id 0x5C9D3702.
final class chatInvite : ChatInvite
{
    enum uint tlId = 0x5C9D3702;

    uint flags;
    bool channel;
    bool broadcast;
    bool public_;
    bool megagroup;
    bool request_needed;
    bool verified;
    bool scam;
    bool fake;
    bool can_refulfill_subscription;
    string title;
    string about;
    Photo photo;
    int participants_count;
    Vector!(User) participants;
    int color;
    StarsSubscriptionPricing subscription_pricing;
    long subscription_form_id;
    BotVerification bot_verification;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatInvitePeek`, id 0x61695CB0.
final class chatInvitePeek : ChatInvite
{
    enum uint tlId = 0x61695CB0;

    Chat chat;
    int expires;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetEmpty`, id 0xFFB62B95.
final class inputStickerSetEmpty : InputStickerSet
{
    enum uint tlId = 0xFFB62B95;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetID`, id 0x9DE7A269.
final class inputStickerSetID : InputStickerSet
{
    enum uint tlId = 0x9DE7A269;

    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetShortName`, id 0x861CC8A0.
final class inputStickerSetShortName : InputStickerSet
{
    enum uint tlId = 0x861CC8A0;

    string short_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetAnimatedEmoji`, id 0x028703C8.
final class inputStickerSetAnimatedEmoji : InputStickerSet
{
    enum uint tlId = 0x028703C8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetDice`, id 0xE67F520E.
final class inputStickerSetDice : InputStickerSet
{
    enum uint tlId = 0xE67F520E;

    string emoticon;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetAnimatedEmojiAnimations`, id 0x0CDE3739.
final class inputStickerSetAnimatedEmojiAnimations : InputStickerSet
{
    enum uint tlId = 0x0CDE3739;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetPremiumGifts`, id 0xC88B3B02.
final class inputStickerSetPremiumGifts : InputStickerSet
{
    enum uint tlId = 0xC88B3B02;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetEmojiGenericAnimations`, id 0x04C4D4CE.
final class inputStickerSetEmojiGenericAnimations : InputStickerSet
{
    enum uint tlId = 0x04C4D4CE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetEmojiDefaultStatuses`, id 0x29D0F5EE.
final class inputStickerSetEmojiDefaultStatuses : InputStickerSet
{
    enum uint tlId = 0x29D0F5EE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetEmojiDefaultTopicIcons`, id 0x44C1F8E9.
final class inputStickerSetEmojiDefaultTopicIcons : InputStickerSet
{
    enum uint tlId = 0x44C1F8E9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetEmojiChannelDefaultStatuses`, id 0x49748553.
final class inputStickerSetEmojiChannelDefaultStatuses : InputStickerSet
{
    enum uint tlId = 0x49748553;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetTonGifts`, id 0x1CF671A0.
final class inputStickerSetTonGifts : InputStickerSet
{
    enum uint tlId = 0x1CF671A0;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stickerSet`, id 0x2DD14EDC.
final class stickerSet : StickerSet
{
    enum uint tlId = 0x2DD14EDC;

    uint flags;
    bool archived;
    bool official;
    bool masks;
    bool emojis;
    bool text_color;
    bool channel_emoji_status;
    bool creator;
    int installed_date;
    long id;
    long access_hash;
    string title;
    string short_name;
    Vector!(PhotoSize) thumbs;
    int thumb_dc_id;
    int thumb_version;
    long thumb_document_id;
    int count;
    int hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botCommand`, id 0x9852D6D2.
final class botCommand : BotCommand
{
    enum uint tlId = 0x9852D6D2;

    uint flags;
    bool ephemeral;
    string command;
    string description;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botInfo`, id 0x4D8A0299.
final class botInfo : BotInfo
{
    enum uint tlId = 0x4D8A0299;

    uint flags;
    bool has_preview_medias;
    long user_id;
    string description;
    Photo description_photo;
    Document description_document;
    Vector!(BotCommand) commands;
    BotMenuButton menu_button;
    string privacy_policy_url;
    BotAppSettings app_settings;
    BotVerifierSettings verifier_settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `keyboardButton`, id 0x2F67A72F.
final class keyboardButton : KeyboardButton
{
    enum uint tlId = 0x2F67A72F;

    uint flags;
    KeyboardButtonStyle style;
    string text;
    ButtonType type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `keyboardButtonRow`, id 0x77608B83.
final class keyboardButtonRow : KeyboardButtonRow
{
    enum uint tlId = 0x77608B83;

    Vector!(KeyboardButton) buttons;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `replyKeyboardHide`, id 0xA03E5B85.
final class replyKeyboardHide : ReplyMarkup
{
    enum uint tlId = 0xA03E5B85;

    uint flags;
    bool selective;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `replyKeyboardForceReply`, id 0x86B40B08.
final class replyKeyboardForceReply : ReplyMarkup
{
    enum uint tlId = 0x86B40B08;

    uint flags;
    bool single_use;
    bool selective;
    string placeholder;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `replyKeyboardMarkup`, id 0x85DD99D1.
final class replyKeyboardMarkup : ReplyMarkup
{
    enum uint tlId = 0x85DD99D1;

    uint flags;
    bool resize;
    bool single_use;
    bool selective;
    bool persistent;
    bool force_reply;
    Vector!(KeyboardButtonRow) rows;
    string placeholder;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `replyInlineMarkup`, id 0xB2B15770.
final class replyInlineMarkup : ReplyMarkup
{
    enum uint tlId = 0xB2B15770;

    uint flags;
    bool force_reply;
    Vector!(KeyboardInlineButtonRow) rows;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityUnknown`, id 0xBB92BA95.
final class messageEntityUnknown : MessageEntity
{
    enum uint tlId = 0xBB92BA95;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityMention`, id 0xFA04579D.
final class messageEntityMention : MessageEntity
{
    enum uint tlId = 0xFA04579D;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityHashtag`, id 0x6F635B0D.
final class messageEntityHashtag : MessageEntity
{
    enum uint tlId = 0x6F635B0D;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityBotCommand`, id 0x6CEF8AC7.
final class messageEntityBotCommand : MessageEntity
{
    enum uint tlId = 0x6CEF8AC7;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityUrl`, id 0x6ED02538.
final class messageEntityUrl : MessageEntity
{
    enum uint tlId = 0x6ED02538;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityEmail`, id 0x64E475C2.
final class messageEntityEmail : MessageEntity
{
    enum uint tlId = 0x64E475C2;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityBold`, id 0xBD610BC9.
final class messageEntityBold : MessageEntity
{
    enum uint tlId = 0xBD610BC9;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityItalic`, id 0x826F8B60.
final class messageEntityItalic : MessageEntity
{
    enum uint tlId = 0x826F8B60;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityCode`, id 0x28A20571.
final class messageEntityCode : MessageEntity
{
    enum uint tlId = 0x28A20571;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityPre`, id 0x73924BE0.
final class messageEntityPre : MessageEntity
{
    enum uint tlId = 0x73924BE0;

    int offset;
    int length;
    string language;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityTextUrl`, id 0x76A6D327.
final class messageEntityTextUrl : MessageEntity
{
    enum uint tlId = 0x76A6D327;

    int offset;
    int length;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityMentionName`, id 0xDC7B1140.
final class messageEntityMentionName : MessageEntity
{
    enum uint tlId = 0xDC7B1140;

    int offset;
    int length;
    long user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessageEntityMentionName`, id 0x208E68C9.
final class inputMessageEntityMentionName : MessageEntity
{
    enum uint tlId = 0x208E68C9;

    int offset;
    int length;
    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityPhone`, id 0x9B69E34B.
final class messageEntityPhone : MessageEntity
{
    enum uint tlId = 0x9B69E34B;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityCashtag`, id 0x4C4E743F.
final class messageEntityCashtag : MessageEntity
{
    enum uint tlId = 0x4C4E743F;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityUnderline`, id 0x9C4E7E8B.
final class messageEntityUnderline : MessageEntity
{
    enum uint tlId = 0x9C4E7E8B;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityStrike`, id 0xBF0693D4.
final class messageEntityStrike : MessageEntity
{
    enum uint tlId = 0xBF0693D4;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityBankCard`, id 0x761E6AF4.
final class messageEntityBankCard : MessageEntity
{
    enum uint tlId = 0x761E6AF4;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntitySpoiler`, id 0x32CA960F.
final class messageEntitySpoiler : MessageEntity
{
    enum uint tlId = 0x32CA960F;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityCustomEmoji`, id 0xC8CF05F8.
final class messageEntityCustomEmoji : MessageEntity
{
    enum uint tlId = 0xC8CF05F8;

    int offset;
    int length;
    long document_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityBlockquote`, id 0xF1CCAAAC.
final class messageEntityBlockquote : MessageEntity
{
    enum uint tlId = 0xF1CCAAAC;

    uint flags;
    bool collapsed;
    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityFormattedDate`, id 0x904AC7C7.
final class messageEntityFormattedDate : MessageEntity
{
    enum uint tlId = 0x904AC7C7;

    uint flags;
    bool relative;
    bool short_time;
    bool long_time;
    bool short_date;
    bool long_date;
    bool day_of_week;
    int offset;
    int length;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityDiffInsert`, id 0x71777116.
final class messageEntityDiffInsert : MessageEntity
{
    enum uint tlId = 0x71777116;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityDiffReplace`, id 0xC6C1E5A7.
final class messageEntityDiffReplace : MessageEntity
{
    enum uint tlId = 0xC6C1E5A7;

    int offset;
    int length;
    string old_text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityDiffDelete`, id 0x0652C1C5.
final class messageEntityDiffDelete : MessageEntity
{
    enum uint tlId = 0x0652C1C5;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageEntityTonAddress`, id 0xFDABBFCD.
final class messageEntityTonAddress : MessageEntity
{
    enum uint tlId = 0xFDABBFCD;

    int offset;
    int length;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputChannelEmpty`, id 0xEE8C1E86.
final class inputChannelEmpty : InputChannel
{
    enum uint tlId = 0xEE8C1E86;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputChannel`, id 0xF35AEC28.
final class inputChannel : InputChannel
{
    enum uint tlId = 0xF35AEC28;

    long channel_id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputChannelFromMessage`, id 0x5B934F9D.
final class inputChannelFromMessage : InputChannel
{
    enum uint tlId = 0x5B934F9D;

    InputPeer peer;
    int msg_id;
    long channel_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageRange`, id 0x0AE30253.
final class messageRange : MessageRange
{
    enum uint tlId = 0x0AE30253;

    int min_id;
    int max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelMessagesFilterEmpty`, id 0x94D42EE7.
final class channelMessagesFilterEmpty : ChannelMessagesFilter
{
    enum uint tlId = 0x94D42EE7;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelMessagesFilter`, id 0xCD77D957.
final class channelMessagesFilter : ChannelMessagesFilter
{
    enum uint tlId = 0xCD77D957;

    uint flags;
    bool exclude_new_messages;
    Vector!(MessageRange) ranges;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipant`, id 0x1BD54456.
final class channelParticipant : ChannelParticipant
{
    enum uint tlId = 0x1BD54456;

    uint flags;
    long user_id;
    int date;
    int subscription_until_date;
    string rank;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantSelf`, id 0xA9478A1A.
final class channelParticipantSelf : ChannelParticipant
{
    enum uint tlId = 0xA9478A1A;

    uint flags;
    bool via_request;
    long user_id;
    long inviter_id;
    int date;
    int subscription_until_date;
    string rank;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantCreator`, id 0x2FE601D3.
final class channelParticipantCreator : ChannelParticipant
{
    enum uint tlId = 0x2FE601D3;

    uint flags;
    long user_id;
    ChatAdminRights admin_rights;
    string rank;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantAdmin`, id 0x34C3BB53.
final class channelParticipantAdmin : ChannelParticipant
{
    enum uint tlId = 0x34C3BB53;

    uint flags;
    bool can_edit;
    bool self;
    long user_id;
    long inviter_id;
    long promoted_by;
    int date;
    ChatAdminRights admin_rights;
    string rank;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantBanned`, id 0xD5F0AD91.
final class channelParticipantBanned : ChannelParticipant
{
    enum uint tlId = 0xD5F0AD91;

    uint flags;
    bool left;
    Peer peer;
    long kicked_by;
    int date;
    ChatBannedRights banned_rights;
    string rank;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantLeft`, id 0x1B03F006.
final class channelParticipantLeft : ChannelParticipant
{
    enum uint tlId = 0x1B03F006;

    Peer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantsRecent`, id 0xDE3F3C79.
final class channelParticipantsRecent : ChannelParticipantsFilter
{
    enum uint tlId = 0xDE3F3C79;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantsAdmins`, id 0xB4608969.
final class channelParticipantsAdmins : ChannelParticipantsFilter
{
    enum uint tlId = 0xB4608969;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantsKicked`, id 0xA3B54985.
final class channelParticipantsKicked : ChannelParticipantsFilter
{
    enum uint tlId = 0xA3B54985;

    string q;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantsBots`, id 0xB0D1865B.
final class channelParticipantsBots : ChannelParticipantsFilter
{
    enum uint tlId = 0xB0D1865B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantsBanned`, id 0x1427A5E1.
final class channelParticipantsBanned : ChannelParticipantsFilter
{
    enum uint tlId = 0x1427A5E1;

    string q;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantsSearch`, id 0x0656AC4B.
final class channelParticipantsSearch : ChannelParticipantsFilter
{
    enum uint tlId = 0x0656AC4B;

    string q;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantsContacts`, id 0xBB6AE88D.
final class channelParticipantsContacts : ChannelParticipantsFilter
{
    enum uint tlId = 0xBB6AE88D;

    string q;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelParticipantsMentions`, id 0xE04B5CEB.
final class channelParticipantsMentions : ChannelParticipantsFilter
{
    enum uint tlId = 0xE04B5CEB;

    uint flags;
    string q;
    int top_msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineMessageMediaAuto`, id 0x3380C786.
final class inputBotInlineMessageMediaAuto : InputBotInlineMessage
{
    enum uint tlId = 0x3380C786;

    uint flags;
    bool invert_media;
    string message;
    Vector!(MessageEntity) entities;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineMessageText`, id 0x3DCD7A87.
final class inputBotInlineMessageText : InputBotInlineMessage
{
    enum uint tlId = 0x3DCD7A87;

    uint flags;
    bool no_webpage;
    bool invert_media;
    string message;
    Vector!(MessageEntity) entities;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineMessageMediaGeo`, id 0x96929A85.
final class inputBotInlineMessageMediaGeo : InputBotInlineMessage
{
    enum uint tlId = 0x96929A85;

    uint flags;
    InputGeoPoint geo_point;
    int heading;
    int period;
    int proximity_notification_radius;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineMessageMediaVenue`, id 0x417BBF11.
final class inputBotInlineMessageMediaVenue : InputBotInlineMessage
{
    enum uint tlId = 0x417BBF11;

    uint flags;
    InputGeoPoint geo_point;
    string title;
    string address;
    string provider;
    string venue_id;
    string venue_type;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineMessageMediaContact`, id 0xA6EDBFFD.
final class inputBotInlineMessageMediaContact : InputBotInlineMessage
{
    enum uint tlId = 0xA6EDBFFD;

    uint flags;
    string phone_number;
    string first_name;
    string last_name;
    string vcard;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineMessageGame`, id 0x4B425864.
final class inputBotInlineMessageGame : InputBotInlineMessage
{
    enum uint tlId = 0x4B425864;

    uint flags;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineMessageMediaInvoice`, id 0xD7E78225.
final class inputBotInlineMessageMediaInvoice : InputBotInlineMessage
{
    enum uint tlId = 0xD7E78225;

    uint flags;
    string title;
    string description;
    InputWebDocument photo;
    Invoice invoice;
    ubyte[] payload;
    string provider;
    DataJSON provider_data;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineMessageMediaWebPage`, id 0xBDDCC510.
final class inputBotInlineMessageMediaWebPage : InputBotInlineMessage
{
    enum uint tlId = 0xBDDCC510;

    uint flags;
    bool invert_media;
    bool force_large_media;
    bool force_small_media;
    bool optional;
    string message;
    Vector!(MessageEntity) entities;
    string url;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineMessageRichMessage`, id 0xB43DF56C.
final class inputBotInlineMessageRichMessage : InputBotInlineMessage
{
    enum uint tlId = 0xB43DF56C;

    uint flags;
    ReplyMarkup reply_markup;
    InputRichMessage rich_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineResult`, id 0x88BF9319.
final class inputBotInlineResult : InputBotInlineResult
{
    enum uint tlId = 0x88BF9319;

    uint flags;
    string id;
    string type;
    string title;
    string description;
    string url;
    InputWebDocument thumb;
    InputWebDocument content;
    InputBotInlineMessage send_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineResultPhoto`, id 0xA8D864A7.
final class inputBotInlineResultPhoto : InputBotInlineResult
{
    enum uint tlId = 0xA8D864A7;

    string id;
    string type;
    InputPhoto photo;
    InputBotInlineMessage send_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineResultDocument`, id 0xFFF8FDC4.
final class inputBotInlineResultDocument : InputBotInlineResult
{
    enum uint tlId = 0xFFF8FDC4;

    uint flags;
    string id;
    string type;
    string title;
    string description;
    InputDocument document;
    InputBotInlineMessage send_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineResultGame`, id 0x4FA417F2.
final class inputBotInlineResultGame : InputBotInlineResult
{
    enum uint tlId = 0x4FA417F2;

    string id;
    string short_name;
    InputBotInlineMessage send_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botInlineMessageMediaAuto`, id 0x764CF810.
final class botInlineMessageMediaAuto : BotInlineMessage
{
    enum uint tlId = 0x764CF810;

    uint flags;
    bool invert_media;
    string message;
    Vector!(MessageEntity) entities;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botInlineMessageText`, id 0x8C7F65E2.
final class botInlineMessageText : BotInlineMessage
{
    enum uint tlId = 0x8C7F65E2;

    uint flags;
    bool no_webpage;
    bool invert_media;
    string message;
    Vector!(MessageEntity) entities;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botInlineMessageMediaGeo`, id 0x051846FD.
final class botInlineMessageMediaGeo : BotInlineMessage
{
    enum uint tlId = 0x051846FD;

    uint flags;
    GeoPoint geo;
    int heading;
    int period;
    int proximity_notification_radius;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botInlineMessageMediaVenue`, id 0x8A86659C.
final class botInlineMessageMediaVenue : BotInlineMessage
{
    enum uint tlId = 0x8A86659C;

    uint flags;
    GeoPoint geo;
    string title;
    string address;
    string provider;
    string venue_id;
    string venue_type;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botInlineMessageMediaContact`, id 0x18D1CDC2.
final class botInlineMessageMediaContact : BotInlineMessage
{
    enum uint tlId = 0x18D1CDC2;

    uint flags;
    string phone_number;
    string first_name;
    string last_name;
    string vcard;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botInlineMessageMediaInvoice`, id 0x354A9B09.
final class botInlineMessageMediaInvoice : BotInlineMessage
{
    enum uint tlId = 0x354A9B09;

    uint flags;
    bool shipping_address_requested;
    bool test;
    string title;
    string description;
    WebDocument photo;
    string currency;
    long total_amount;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botInlineMessageMediaWebPage`, id 0x809AD9A6.
final class botInlineMessageMediaWebPage : BotInlineMessage
{
    enum uint tlId = 0x809AD9A6;

    uint flags;
    bool invert_media;
    bool force_large_media;
    bool force_small_media;
    bool manual;
    bool safe;
    string message;
    Vector!(MessageEntity) entities;
    string url;
    ReplyMarkup reply_markup;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botInlineMessageRichMessage`, id 0x0A617E7B.
final class botInlineMessageRichMessage : BotInlineMessage
{
    enum uint tlId = 0x0A617E7B;

    uint flags;
    ReplyMarkup reply_markup;
    RichMessage rich_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botInlineResult`, id 0x11965F3A.
final class botInlineResult : BotInlineResult
{
    enum uint tlId = 0x11965F3A;

    uint flags;
    string id;
    string type;
    string title;
    string description;
    string url;
    WebDocument thumb;
    WebDocument content;
    BotInlineMessage send_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botInlineMediaResult`, id 0x17DB940B.
final class botInlineMediaResult : BotInlineResult
{
    enum uint tlId = 0x17DB940B;

    uint flags;
    string id;
    string type;
    Photo photo;
    Document document;
    string title;
    string description;
    BotInlineMessage send_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `exportedMessageLink`, id 0x5DAB1AF4.
final class exportedMessageLink : ExportedMessageLink
{
    enum uint tlId = 0x5DAB1AF4;

    string link;
    string html;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageFwdHeader`, id 0x4E4DF4BB.
final class messageFwdHeader : MessageFwdHeader
{
    enum uint tlId = 0x4E4DF4BB;

    uint flags;
    bool imported;
    bool saved_out;
    Peer from_id;
    string from_name;
    int date;
    int channel_post;
    string post_author;
    Peer saved_from_peer;
    int saved_from_msg_id;
    Peer saved_from_id;
    string saved_from_name;
    int saved_date;
    string psa_type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineMessageID`, id 0x890C3D89.
final class inputBotInlineMessageID : InputBotInlineMessageID
{
    enum uint tlId = 0x890C3D89;

    int dc_id;
    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotInlineMessageID64`, id 0xB6D915D7.
final class inputBotInlineMessageID64 : InputBotInlineMessageID
{
    enum uint tlId = 0xB6D915D7;

    int dc_id;
    long owner_id;
    int id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineBotSwitchPM`, id 0x3C20629F.
final class inlineBotSwitchPM : InlineBotSwitchPM
{
    enum uint tlId = 0x3C20629F;

    string text;
    string start_param;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `topPeer`, id 0xEDCDC05B.
final class topPeer : TopPeer
{
    enum uint tlId = 0xEDCDC05B;

    Peer peer;
    double rating;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `topPeerCategoryBotsPM`, id 0xAB661B5B.
final class topPeerCategoryBotsPM : TopPeerCategory
{
    enum uint tlId = 0xAB661B5B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `topPeerCategoryBotsInline`, id 0x148677E2.
final class topPeerCategoryBotsInline : TopPeerCategory
{
    enum uint tlId = 0x148677E2;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `topPeerCategoryCorrespondents`, id 0x0637B7ED.
final class topPeerCategoryCorrespondents : TopPeerCategory
{
    enum uint tlId = 0x0637B7ED;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `topPeerCategoryGroups`, id 0xBD17A14A.
final class topPeerCategoryGroups : TopPeerCategory
{
    enum uint tlId = 0xBD17A14A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `topPeerCategoryChannels`, id 0x161D9628.
final class topPeerCategoryChannels : TopPeerCategory
{
    enum uint tlId = 0x161D9628;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `topPeerCategoryPhoneCalls`, id 0x1E76A78C.
final class topPeerCategoryPhoneCalls : TopPeerCategory
{
    enum uint tlId = 0x1E76A78C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `topPeerCategoryForwardUsers`, id 0xA8406CA9.
final class topPeerCategoryForwardUsers : TopPeerCategory
{
    enum uint tlId = 0xA8406CA9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `topPeerCategoryForwardChats`, id 0xFBEEC0F0.
final class topPeerCategoryForwardChats : TopPeerCategory
{
    enum uint tlId = 0xFBEEC0F0;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `topPeerCategoryBotsApp`, id 0xFD9E7BEC.
final class topPeerCategoryBotsApp : TopPeerCategory
{
    enum uint tlId = 0xFD9E7BEC;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `topPeerCategoryBotsGuestChat`, id 0x6C24F3DD.
final class topPeerCategoryBotsGuestChat : TopPeerCategory
{
    enum uint tlId = 0x6C24F3DD;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `topPeerCategoryPeers`, id 0xFB834291.
final class topPeerCategoryPeers : TopPeerCategoryPeers
{
    enum uint tlId = 0xFB834291;

    TopPeerCategory category;
    int count;
    Vector!(TopPeer) peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `draftMessageEmpty`, id 0x1B0C841A.
final class draftMessageEmpty : DraftMessage
{
    enum uint tlId = 0x1B0C841A;

    uint flags;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `draftMessage`, id 0x60FE3294.
final class draftMessage : DraftMessage
{
    enum uint tlId = 0x60FE3294;

    uint flags;
    bool no_webpage;
    bool invert_media;
    InputReplyTo reply_to;
    string message;
    Vector!(MessageEntity) entities;
    InputMedia media;
    int date;
    long effect;
    SuggestedPost suggested_post;
    RichMessage rich_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stickerSetCovered`, id 0x6410A5D2.
final class stickerSetCovered : StickerSetCovered
{
    enum uint tlId = 0x6410A5D2;

    StickerSet set;
    Document cover;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stickerSetMultiCovered`, id 0x3407E51B.
final class stickerSetMultiCovered : StickerSetCovered
{
    enum uint tlId = 0x3407E51B;

    StickerSet set;
    Vector!(Document) covers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stickerSetFullCovered`, id 0x40D13C0E.
final class stickerSetFullCovered : StickerSetCovered
{
    enum uint tlId = 0x40D13C0E;

    StickerSet set;
    Vector!(StickerPack) packs;
    Vector!(StickerKeyword) keywords;
    Vector!(Document) documents;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stickerSetNoCovered`, id 0x77B15D1C.
final class stickerSetNoCovered : StickerSetCovered
{
    enum uint tlId = 0x77B15D1C;

    StickerSet set;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `maskCoords`, id 0xAED6DBB2.
final class maskCoords : MaskCoords
{
    enum uint tlId = 0xAED6DBB2;

    int n;
    double x;
    double y;
    double zoom;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickeredMediaPhoto`, id 0x4A992157.
final class inputStickeredMediaPhoto : InputStickeredMedia
{
    enum uint tlId = 0x4A992157;

    InputPhoto id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickeredMediaDocument`, id 0x0438865B.
final class inputStickeredMediaDocument : InputStickeredMedia
{
    enum uint tlId = 0x0438865B;

    InputDocument id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `game`, id 0xBDF9653B.
final class game : Game
{
    enum uint tlId = 0xBDF9653B;

    uint flags;
    long id;
    long access_hash;
    string short_name;
    string title;
    string description;
    Photo photo;
    Document document;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputGameID`, id 0x032C3E77.
final class inputGameID : InputGame
{
    enum uint tlId = 0x032C3E77;

    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputGameShortName`, id 0xC331E80A.
final class inputGameShortName : InputGame
{
    enum uint tlId = 0xC331E80A;

    InputUser bot_id;
    string short_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `highScore`, id 0x73A379EB.
final class highScore : HighScore
{
    enum uint tlId = 0x73A379EB;

    int pos;
    long user_id;
    int score;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textEmpty`, id 0xDC3D824F.
final class textEmpty : RichText
{
    enum uint tlId = 0xDC3D824F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textPlain`, id 0x744694E0.
final class textPlain : RichText
{
    enum uint tlId = 0x744694E0;

    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textBold`, id 0x6724ABC4.
final class textBold : RichText
{
    enum uint tlId = 0x6724ABC4;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textItalic`, id 0xD912A59C.
final class textItalic : RichText
{
    enum uint tlId = 0xD912A59C;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textUnderline`, id 0xC12622C4.
final class textUnderline : RichText
{
    enum uint tlId = 0xC12622C4;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textStrike`, id 0x9BF8BB95.
final class textStrike : RichText
{
    enum uint tlId = 0x9BF8BB95;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textFixed`, id 0x6C3F19B9.
final class textFixed : RichText
{
    enum uint tlId = 0x6C3F19B9;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textUrl`, id 0x3C2884C1.
final class textUrl : RichText
{
    enum uint tlId = 0x3C2884C1;

    RichText text;
    string url;
    long webpage_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textEmail`, id 0xDE5A0DD6.
final class textEmail : RichText
{
    enum uint tlId = 0xDE5A0DD6;

    RichText text;
    string email;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textConcat`, id 0x7E6260D7.
final class textConcat : RichText
{
    enum uint tlId = 0x7E6260D7;

    Vector!(RichText) texts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textSubscript`, id 0xED6A8504.
final class textSubscript : RichText
{
    enum uint tlId = 0xED6A8504;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textSuperscript`, id 0xC7FB5E01.
final class textSuperscript : RichText
{
    enum uint tlId = 0xC7FB5E01;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textMarked`, id 0x034B8621.
final class textMarked : RichText
{
    enum uint tlId = 0x034B8621;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textPhone`, id 0x1CCB966A.
final class textPhone : RichText
{
    enum uint tlId = 0x1CCB966A;

    RichText text;
    string phone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textImage`, id 0x081CCF4F.
final class textImage : RichText
{
    enum uint tlId = 0x081CCF4F;

    long document_id;
    int w;
    int h;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textAnchor`, id 0x35553762.
final class textAnchor : RichText
{
    enum uint tlId = 0x35553762;

    RichText text;
    string name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textMath`, id 0x9D2EAC97.
final class textMath : RichText
{
    enum uint tlId = 0x9D2EAC97;

    string source;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textCustomEmoji`, id 0xA26156C0.
final class textCustomEmoji : RichText
{
    enum uint tlId = 0xA26156C0;

    long document_id;
    string alt;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textSpoiler`, id 0x4C2A5D62.
final class textSpoiler : RichText
{
    enum uint tlId = 0x4C2A5D62;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textMention`, id 0xCD24CF44.
final class textMention : RichText
{
    enum uint tlId = 0xCD24CF44;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textHashtag`, id 0x519524EA.
final class textHashtag : RichText
{
    enum uint tlId = 0x519524EA;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textBotCommand`, id 0x02FF29D3.
final class textBotCommand : RichText
{
    enum uint tlId = 0x02FF29D3;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textCashtag`, id 0x7B9E1801.
final class textCashtag : RichText
{
    enum uint tlId = 0x7B9E1801;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textAutoUrl`, id 0xAC6A83AA.
final class textAutoUrl : RichText
{
    enum uint tlId = 0xAC6A83AA;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textAutoEmail`, id 0xC556A45D.
final class textAutoEmail : RichText
{
    enum uint tlId = 0xC556A45D;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textAutoPhone`, id 0x24C26789.
final class textAutoPhone : RichText
{
    enum uint tlId = 0x24C26789;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textBankCard`, id 0xB956812D.
final class textBankCard : RichText
{
    enum uint tlId = 0xB956812D;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textMentionName`, id 0x01A9FBFC.
final class textMentionName : RichText
{
    enum uint tlId = 0x01A9FBFC;

    RichText text;
    long user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textDate`, id 0xA5B45E2B.
final class textDate : RichText
{
    enum uint tlId = 0xA5B45E2B;

    uint flags;
    bool relative;
    bool short_time;
    bool long_time;
    bool short_date;
    bool long_date;
    bool day_of_week;
    RichText text;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textDiff`, id 0x9686CB50.
final class textDiff : RichText
{
    enum uint tlId = 0x9686CB50;

    RichText text;
    RichText old_text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textButton`, id 0xAFC79CD6.
final class textButton : RichText
{
    enum uint tlId = 0xAFC79CD6;

    uint flags;
    RichText text;
    InlineButtonType type;
    RichButtonStyle style;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textTonAddress`, id 0x3CD2A36A.
final class textTonAddress : RichText
{
    enum uint tlId = 0x3CD2A36A;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockUnsupported`, id 0x13567E8A.
final class pageBlockUnsupported : PageBlock
{
    enum uint tlId = 0x13567E8A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockTitle`, id 0x70ABC3FD.
final class pageBlockTitle : PageBlock
{
    enum uint tlId = 0x70ABC3FD;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockSubtitle`, id 0x8FFA9A1F.
final class pageBlockSubtitle : PageBlock
{
    enum uint tlId = 0x8FFA9A1F;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockAuthorDate`, id 0xBAAFE5E0.
final class pageBlockAuthorDate : PageBlock
{
    enum uint tlId = 0xBAAFE5E0;

    RichText author;
    int published_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockHeader`, id 0xBFD064EC.
final class pageBlockHeader : PageBlock
{
    enum uint tlId = 0xBFD064EC;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockSubheader`, id 0xF12BB6E1.
final class pageBlockSubheader : PageBlock
{
    enum uint tlId = 0xF12BB6E1;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockParagraph`, id 0x467A0766.
final class pageBlockParagraph : PageBlock
{
    enum uint tlId = 0x467A0766;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockPreformatted`, id 0xC070D93E.
final class pageBlockPreformatted : PageBlock
{
    enum uint tlId = 0xC070D93E;

    RichText text;
    string language;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockFooter`, id 0x48870999.
final class pageBlockFooter : PageBlock
{
    enum uint tlId = 0x48870999;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockDivider`, id 0xDB20B188.
final class pageBlockDivider : PageBlock
{
    enum uint tlId = 0xDB20B188;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockAnchor`, id 0xCE0D37B0.
final class pageBlockAnchor : PageBlock
{
    enum uint tlId = 0xCE0D37B0;

    string name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockList`, id 0xE4E88011.
final class pageBlockList : PageBlock
{
    enum uint tlId = 0xE4E88011;

    Vector!(PageListItem) items;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockBlockquote`, id 0x66D1670B.
final class pageBlockBlockquote : PageBlock
{
    enum uint tlId = 0x66D1670B;

    uint flags;
    bool collapsed;
    RichText text;
    RichText caption;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockPullquote`, id 0x4F4456D3.
final class pageBlockPullquote : PageBlock
{
    enum uint tlId = 0x4F4456D3;

    RichText text;
    RichText caption;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockPhoto`, id 0x1759C560.
final class pageBlockPhoto : PageBlock
{
    enum uint tlId = 0x1759C560;

    uint flags;
    bool spoiler;
    long photo_id;
    PageCaption caption;
    string url;
    long webpage_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockVideo`, id 0x7C8FE7B6.
final class pageBlockVideo : PageBlock
{
    enum uint tlId = 0x7C8FE7B6;

    uint flags;
    bool autoplay;
    bool loop;
    bool spoiler;
    long video_id;
    PageCaption caption;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockCover`, id 0x39F23300.
final class pageBlockCover : PageBlock
{
    enum uint tlId = 0x39F23300;

    PageBlock cover;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockEmbed`, id 0xA8718DC5.
final class pageBlockEmbed : PageBlock
{
    enum uint tlId = 0xA8718DC5;

    uint flags;
    bool full_width;
    bool allow_scrolling;
    string url;
    string html;
    long poster_photo_id;
    int w;
    int h;
    PageCaption caption;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockEmbedPost`, id 0xF259A80B.
final class pageBlockEmbedPost : PageBlock
{
    enum uint tlId = 0xF259A80B;

    string url;
    long webpage_id;
    long author_photo_id;
    string author;
    int date;
    Vector!(PageBlock) blocks;
    PageCaption caption;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockCollage`, id 0x65A0FA4D.
final class pageBlockCollage : PageBlock
{
    enum uint tlId = 0x65A0FA4D;

    Vector!(PageBlock) items;
    PageCaption caption;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockSlideshow`, id 0x031F9590.
final class pageBlockSlideshow : PageBlock
{
    enum uint tlId = 0x031F9590;

    Vector!(PageBlock) items;
    PageCaption caption;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockChannel`, id 0xEF1751B5.
final class pageBlockChannel : PageBlock
{
    enum uint tlId = 0xEF1751B5;

    Chat channel;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockAudio`, id 0x804361EA.
final class pageBlockAudio : PageBlock
{
    enum uint tlId = 0x804361EA;

    long audio_id;
    PageCaption caption;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockKicker`, id 0x1E148390.
final class pageBlockKicker : PageBlock
{
    enum uint tlId = 0x1E148390;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockTable`, id 0xBF4DEA82.
final class pageBlockTable : PageBlock
{
    enum uint tlId = 0xBF4DEA82;

    uint flags;
    bool bordered;
    bool striped;
    bool compact;
    RichText title;
    Vector!(PageTableRow) rows;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockOrderedList`, id 0x1FD6F6C1.
final class pageBlockOrderedList : PageBlock
{
    enum uint tlId = 0x1FD6F6C1;

    uint flags;
    bool reversed;
    Vector!(PageListOrderedItem) items;
    int start;
    string type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockDetails`, id 0x76768BED.
final class pageBlockDetails : PageBlock
{
    enum uint tlId = 0x76768BED;

    uint flags;
    bool open;
    Vector!(PageBlock) blocks;
    RichText title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockRelatedArticles`, id 0x16115A96.
final class pageBlockRelatedArticles : PageBlock
{
    enum uint tlId = 0x16115A96;

    RichText title;
    Vector!(PageRelatedArticle) articles;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockMap`, id 0xA44F3EF6.
final class pageBlockMap : PageBlock
{
    enum uint tlId = 0xA44F3EF6;

    GeoPoint geo;
    int zoom;
    int w;
    int h;
    PageCaption caption;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockHeading1`, id 0xBAFF072F.
final class pageBlockHeading1 : PageBlock
{
    enum uint tlId = 0xBAFF072F;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockHeading2`, id 0x096B2AEC.
final class pageBlockHeading2 : PageBlock
{
    enum uint tlId = 0x096B2AEC;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockHeading3`, id 0x67E731AD.
final class pageBlockHeading3 : PageBlock
{
    enum uint tlId = 0x67E731AD;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockHeading4`, id 0xB532772B.
final class pageBlockHeading4 : PageBlock
{
    enum uint tlId = 0xB532772B;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockHeading5`, id 0xDBBE6C6A.
final class pageBlockHeading5 : PageBlock
{
    enum uint tlId = 0xDBBE6C6A;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockHeading6`, id 0x682A41A9.
final class pageBlockHeading6 : PageBlock
{
    enum uint tlId = 0x682A41A9;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockMath`, id 0x59080C20.
final class pageBlockMath : PageBlock
{
    enum uint tlId = 0x59080C20;

    string source;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockThinking`, id 0x3C29A3E2.
final class pageBlockThinking : PageBlock
{
    enum uint tlId = 0x3C29A3E2;

    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPageBlockMap`, id 0x574B617F.
final class inputPageBlockMap : PageBlock
{
    enum uint tlId = 0x574B617F;

    InputGeoPoint geo;
    int zoom;
    int w;
    int h;
    PageCaption caption;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockBlockquoteBlocks`, id 0x0E6E47C4.
final class pageBlockBlockquoteBlocks : PageBlock
{
    enum uint tlId = 0x0E6E47C4;

    Vector!(PageBlock) blocks;
    RichText caption;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockButtonRow`, id 0x6D640318.
final class pageBlockButtonRow : PageBlock
{
    enum uint tlId = 0x6D640318;

    uint flags;
    bool align_left;
    bool align_center;
    bool align_right;
    Vector!(PageButton) buttons;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageBlockDocument`, id 0x38FA3BA3.
final class pageBlockDocument : PageBlock
{
    enum uint tlId = 0x38FA3BA3;

    long document_id;
    PageCaption caption;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneCallDiscardReasonMissed`, id 0x85E42301.
final class phoneCallDiscardReasonMissed : PhoneCallDiscardReason
{
    enum uint tlId = 0x85E42301;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneCallDiscardReasonDisconnect`, id 0xE095C1A0.
final class phoneCallDiscardReasonDisconnect : PhoneCallDiscardReason
{
    enum uint tlId = 0xE095C1A0;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneCallDiscardReasonHangup`, id 0x57ADC690.
final class phoneCallDiscardReasonHangup : PhoneCallDiscardReason
{
    enum uint tlId = 0x57ADC690;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneCallDiscardReasonBusy`, id 0xFAF7E8C9.
final class phoneCallDiscardReasonBusy : PhoneCallDiscardReason
{
    enum uint tlId = 0xFAF7E8C9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneCallDiscardReasonMigrateConferenceCall`, id 0x9FBBF1F7.
final class phoneCallDiscardReasonMigrateConferenceCall : PhoneCallDiscardReason
{
    enum uint tlId = 0x9FBBF1F7;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `dataJSON`, id 0x7D748D04.
final class dataJSON : DataJSON
{
    enum uint tlId = 0x7D748D04;

    string data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `labeledPrice`, id 0xCB296BF8.
final class labeledPrice : LabeledPrice
{
    enum uint tlId = 0xCB296BF8;

    string label;
    long amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `invoice`, id 0x049EE584.
final class invoice : Invoice
{
    enum uint tlId = 0x049EE584;

    uint flags;
    bool test;
    bool name_requested;
    bool phone_requested;
    bool email_requested;
    bool shipping_address_requested;
    bool flexible;
    bool phone_to_provider;
    bool email_to_provider;
    bool recurring;
    string currency;
    Vector!(LabeledPrice) prices;
    long max_tip_amount;
    Vector!(long) suggested_tip_amounts;
    string terms_url;
    int subscription_period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `paymentCharge`, id 0xEA02C27E.
final class paymentCharge : PaymentCharge
{
    enum uint tlId = 0xEA02C27E;

    string id;
    string provider_charge_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `postAddress`, id 0x1E8CAAEB.
final class postAddress : PostAddress
{
    enum uint tlId = 0x1E8CAAEB;

    string street_line1;
    string street_line2;
    string city;
    string state;
    string country_iso2;
    string post_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `paymentRequestedInfo`, id 0x909C3F94.
final class paymentRequestedInfo : PaymentRequestedInfo
{
    enum uint tlId = 0x909C3F94;

    uint flags;
    string name;
    string phone;
    string email;
    PostAddress shipping_address;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `paymentSavedCredentialsCard`, id 0xCDC27A1F.
final class paymentSavedCredentialsCard : PaymentSavedCredentials
{
    enum uint tlId = 0xCDC27A1F;

    string id;
    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webDocument`, id 0x1C570ED1.
final class webDocument : WebDocument
{
    enum uint tlId = 0x1C570ED1;

    string url;
    long access_hash;
    int size;
    string mime_type;
    Vector!(DocumentAttribute) attributes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webDocumentNoProxy`, id 0xF9C8BCC6.
final class webDocumentNoProxy : WebDocument
{
    enum uint tlId = 0xF9C8BCC6;

    string url;
    int size;
    string mime_type;
    Vector!(DocumentAttribute) attributes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputWebDocument`, id 0x9BED434D.
final class inputWebDocument : InputWebDocument
{
    enum uint tlId = 0x9BED434D;

    string url;
    int size;
    string mime_type;
    Vector!(DocumentAttribute) attributes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputWebFileLocation`, id 0xC239D686.
final class inputWebFileLocation : InputWebFileLocation
{
    enum uint tlId = 0xC239D686;

    string url;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputWebFileGeoPointLocation`, id 0x9F2221C9.
final class inputWebFileGeoPointLocation : InputWebFileLocation
{
    enum uint tlId = 0x9F2221C9;

    InputGeoPoint geo_point;
    long access_hash;
    int w;
    int h;
    int zoom;
    int scale;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputWebFileAudioAlbumThumbLocation`, id 0xF46FE924.
final class inputWebFileAudioAlbumThumbLocation : InputWebFileLocation
{
    enum uint tlId = 0xF46FE924;

    uint flags;
    bool small;
    InputDocument document;
    string title;
    string performer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPaymentCredentialsSaved`, id 0xC10EB2CF.
final class inputPaymentCredentialsSaved : InputPaymentCredentials
{
    enum uint tlId = 0xC10EB2CF;

    string id;
    ubyte[] tmp_password;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPaymentCredentials`, id 0x3417D728.
final class inputPaymentCredentials : InputPaymentCredentials
{
    enum uint tlId = 0x3417D728;

    uint flags;
    bool save;
    DataJSON data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPaymentCredentialsApplePay`, id 0x0AA1C39F.
final class inputPaymentCredentialsApplePay : InputPaymentCredentials
{
    enum uint tlId = 0x0AA1C39F;

    DataJSON payment_data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPaymentCredentialsGooglePay`, id 0x8AC32801.
final class inputPaymentCredentialsGooglePay : InputPaymentCredentials
{
    enum uint tlId = 0x8AC32801;

    DataJSON payment_token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `shippingOption`, id 0xB6213CDF.
final class shippingOption : ShippingOption
{
    enum uint tlId = 0xB6213CDF;

    string id;
    string title;
    Vector!(LabeledPrice) prices;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStickerSetItem`, id 0x32DA9E9C.
final class inputStickerSetItem : InputStickerSetItem
{
    enum uint tlId = 0x32DA9E9C;

    uint flags;
    InputDocument document;
    string emoji;
    MaskCoords mask_coords;
    string keywords;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPhoneCall`, id 0x1E36FDED.
final class inputPhoneCall : InputPhoneCall
{
    enum uint tlId = 0x1E36FDED;

    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneCallEmpty`, id 0x5366C915.
final class phoneCallEmpty : PhoneCall
{
    enum uint tlId = 0x5366C915;

    long id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneCallWaiting`, id 0xC5226F17.
final class phoneCallWaiting : PhoneCall
{
    enum uint tlId = 0xC5226F17;

    uint flags;
    bool video;
    long id;
    long access_hash;
    int date;
    long admin_id;
    long participant_id;
    PhoneCallProtocol protocol;
    int receive_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneCallRequested`, id 0x14B0ED0C.
final class phoneCallRequested : PhoneCall
{
    enum uint tlId = 0x14B0ED0C;

    uint flags;
    bool video;
    long id;
    long access_hash;
    int date;
    long admin_id;
    long participant_id;
    ubyte[] g_a_hash;
    PhoneCallProtocol protocol;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneCallAccepted`, id 0x3660C311.
final class phoneCallAccepted : PhoneCall
{
    enum uint tlId = 0x3660C311;

    uint flags;
    bool video;
    long id;
    long access_hash;
    int date;
    long admin_id;
    long participant_id;
    ubyte[] g_b;
    PhoneCallProtocol protocol;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneCall`, id 0x30535AF5.
final class phoneCall : PhoneCall
{
    enum uint tlId = 0x30535AF5;

    uint flags;
    bool p2p_allowed;
    bool video;
    bool conference_supported;
    long id;
    long access_hash;
    int date;
    long admin_id;
    long participant_id;
    ubyte[] g_a_or_b;
    long key_fingerprint;
    PhoneCallProtocol protocol;
    Vector!(PhoneConnection) connections;
    int start_date;
    DataJSON custom_parameters;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneCallDiscarded`, id 0x50CA4DE1.
final class phoneCallDiscarded : PhoneCall
{
    enum uint tlId = 0x50CA4DE1;

    uint flags;
    bool need_rating;
    bool need_debug;
    bool video;
    long id;
    PhoneCallDiscardReason reason;
    int duration;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneConnection`, id 0x9CC123C7.
final class phoneConnection : PhoneConnection
{
    enum uint tlId = 0x9CC123C7;

    uint flags;
    bool tcp;
    long id;
    string ip;
    string ipv6;
    int port;
    ubyte[] peer_tag;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneConnectionWebrtc`, id 0x635FE375.
final class phoneConnectionWebrtc : PhoneConnection
{
    enum uint tlId = 0x635FE375;

    uint flags;
    bool turn;
    bool stun;
    long id;
    string ip;
    string ipv6;
    int port;
    string username;
    string password;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `phoneCallProtocol`, id 0xFC878FC8.
final class phoneCallProtocol : PhoneCallProtocol
{
    enum uint tlId = 0xFC878FC8;

    uint flags;
    bool udp_p2p;
    bool udp_reflector;
    int min_layer;
    int max_layer;
    Vector!(string) library_versions;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `cdnPublicKey`, id 0xC982EABA.
final class cdnPublicKey : CdnPublicKey
{
    enum uint tlId = 0xC982EABA;

    int dc_id;
    string public_key;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `cdnConfig`, id 0x5725E40A.
final class cdnConfig : CdnConfig
{
    enum uint tlId = 0x5725E40A;

    Vector!(CdnPublicKey) public_keys;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `langPackString`, id 0xCAD181F6.
final class langPackString : LangPackString
{
    enum uint tlId = 0xCAD181F6;

    string key;
    string value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `langPackStringPluralized`, id 0x6C47AC9F.
final class langPackStringPluralized : LangPackString
{
    enum uint tlId = 0x6C47AC9F;

    uint flags;
    string key;
    string zero_value;
    string one_value;
    string two_value;
    string few_value;
    string many_value;
    string other_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `langPackStringDeleted`, id 0x2979EEB2.
final class langPackStringDeleted : LangPackString
{
    enum uint tlId = 0x2979EEB2;

    string key;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `langPackDifference`, id 0xF385C1F6.
final class langPackDifference : LangPackDifference
{
    enum uint tlId = 0xF385C1F6;

    string lang_code;
    int from_version;
    int version_;
    Vector!(LangPackString) strings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `langPackLanguage`, id 0xEECA5CE3.
final class langPackLanguage : LangPackLanguage
{
    enum uint tlId = 0xEECA5CE3;

    uint flags;
    bool official;
    bool rtl;
    bool beta;
    string name;
    string native_name;
    string lang_code;
    string base_lang_code;
    string plural_code;
    int strings_count;
    int translated_count;
    string translations_url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeTitle`, id 0xE6DFB825.
final class channelAdminLogEventActionChangeTitle : ChannelAdminLogEventAction
{
    enum uint tlId = 0xE6DFB825;

    string prev_value;
    string new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeAbout`, id 0x55188A2E.
final class channelAdminLogEventActionChangeAbout : ChannelAdminLogEventAction
{
    enum uint tlId = 0x55188A2E;

    string prev_value;
    string new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeUsername`, id 0x6A4AFC38.
final class channelAdminLogEventActionChangeUsername : ChannelAdminLogEventAction
{
    enum uint tlId = 0x6A4AFC38;

    string prev_value;
    string new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangePhoto`, id 0x434BD2AF.
final class channelAdminLogEventActionChangePhoto : ChannelAdminLogEventAction
{
    enum uint tlId = 0x434BD2AF;

    Photo prev_photo;
    Photo new_photo;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionToggleInvites`, id 0x1B7907AE.
final class channelAdminLogEventActionToggleInvites : ChannelAdminLogEventAction
{
    enum uint tlId = 0x1B7907AE;

    bool new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionToggleSignatures`, id 0x26AE0971.
final class channelAdminLogEventActionToggleSignatures : ChannelAdminLogEventAction
{
    enum uint tlId = 0x26AE0971;

    bool new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionUpdatePinned`, id 0xE9E82C18.
final class channelAdminLogEventActionUpdatePinned : ChannelAdminLogEventAction
{
    enum uint tlId = 0xE9E82C18;

    Message message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionEditMessage`, id 0x709B2405.
final class channelAdminLogEventActionEditMessage : ChannelAdminLogEventAction
{
    enum uint tlId = 0x709B2405;

    Message prev_message;
    Message new_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionDeleteMessage`, id 0x42E047BB.
final class channelAdminLogEventActionDeleteMessage : ChannelAdminLogEventAction
{
    enum uint tlId = 0x42E047BB;

    Message message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionParticipantJoin`, id 0x183040D3.
final class channelAdminLogEventActionParticipantJoin : ChannelAdminLogEventAction
{
    enum uint tlId = 0x183040D3;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionParticipantLeave`, id 0xF89777F2.
final class channelAdminLogEventActionParticipantLeave : ChannelAdminLogEventAction
{
    enum uint tlId = 0xF89777F2;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionParticipantInvite`, id 0xE31C34D8.
final class channelAdminLogEventActionParticipantInvite : ChannelAdminLogEventAction
{
    enum uint tlId = 0xE31C34D8;

    ChannelParticipant participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionParticipantToggleBan`, id 0xE6D83D7E.
final class channelAdminLogEventActionParticipantToggleBan : ChannelAdminLogEventAction
{
    enum uint tlId = 0xE6D83D7E;

    ChannelParticipant prev_participant;
    ChannelParticipant new_participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionParticipantToggleAdmin`, id 0xD5676710.
final class channelAdminLogEventActionParticipantToggleAdmin : ChannelAdminLogEventAction
{
    enum uint tlId = 0xD5676710;

    ChannelParticipant prev_participant;
    ChannelParticipant new_participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeStickerSet`, id 0xB1C3CAA7.
final class channelAdminLogEventActionChangeStickerSet : ChannelAdminLogEventAction
{
    enum uint tlId = 0xB1C3CAA7;

    InputStickerSet prev_stickerset;
    InputStickerSet new_stickerset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionTogglePreHistoryHidden`, id 0x5F5C95F1.
final class channelAdminLogEventActionTogglePreHistoryHidden : ChannelAdminLogEventAction
{
    enum uint tlId = 0x5F5C95F1;

    bool new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionDefaultBannedRights`, id 0x2DF5FC0A.
final class channelAdminLogEventActionDefaultBannedRights : ChannelAdminLogEventAction
{
    enum uint tlId = 0x2DF5FC0A;

    ChatBannedRights prev_banned_rights;
    ChatBannedRights new_banned_rights;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionStopPoll`, id 0x8F079643.
final class channelAdminLogEventActionStopPoll : ChannelAdminLogEventAction
{
    enum uint tlId = 0x8F079643;

    Message message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeLinkedChat`, id 0x050C7AC8.
final class channelAdminLogEventActionChangeLinkedChat : ChannelAdminLogEventAction
{
    enum uint tlId = 0x050C7AC8;

    long prev_value;
    long new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeLocation`, id 0x0E6B76AE.
final class channelAdminLogEventActionChangeLocation : ChannelAdminLogEventAction
{
    enum uint tlId = 0x0E6B76AE;

    ChannelLocation prev_value;
    ChannelLocation new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionToggleSlowMode`, id 0x53909779.
final class channelAdminLogEventActionToggleSlowMode : ChannelAdminLogEventAction
{
    enum uint tlId = 0x53909779;

    int prev_value;
    int new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionStartGroupCall`, id 0x23209745.
final class channelAdminLogEventActionStartGroupCall : ChannelAdminLogEventAction
{
    enum uint tlId = 0x23209745;

    InputGroupCall call;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionDiscardGroupCall`, id 0xDB9F9140.
final class channelAdminLogEventActionDiscardGroupCall : ChannelAdminLogEventAction
{
    enum uint tlId = 0xDB9F9140;

    InputGroupCall call;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionParticipantMute`, id 0xF92424D2.
final class channelAdminLogEventActionParticipantMute : ChannelAdminLogEventAction
{
    enum uint tlId = 0xF92424D2;

    GroupCallParticipant participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionParticipantUnmute`, id 0xE64429C0.
final class channelAdminLogEventActionParticipantUnmute : ChannelAdminLogEventAction
{
    enum uint tlId = 0xE64429C0;

    GroupCallParticipant participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionToggleGroupCallSetting`, id 0x56D6A247.
final class channelAdminLogEventActionToggleGroupCallSetting : ChannelAdminLogEventAction
{
    enum uint tlId = 0x56D6A247;

    bool join_muted;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionParticipantJoinByInvite`, id 0xFE9FC158.
final class channelAdminLogEventActionParticipantJoinByInvite : ChannelAdminLogEventAction
{
    enum uint tlId = 0xFE9FC158;

    uint flags;
    bool via_chatlist;
    ExportedChatInvite invite;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionExportedInviteDelete`, id 0x5A50FCA4.
final class channelAdminLogEventActionExportedInviteDelete : ChannelAdminLogEventAction
{
    enum uint tlId = 0x5A50FCA4;

    ExportedChatInvite invite;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionExportedInviteRevoke`, id 0x410A134E.
final class channelAdminLogEventActionExportedInviteRevoke : ChannelAdminLogEventAction
{
    enum uint tlId = 0x410A134E;

    ExportedChatInvite invite;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionExportedInviteEdit`, id 0xE90EBB59.
final class channelAdminLogEventActionExportedInviteEdit : ChannelAdminLogEventAction
{
    enum uint tlId = 0xE90EBB59;

    ExportedChatInvite prev_invite;
    ExportedChatInvite new_invite;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionParticipantVolume`, id 0x3E7F6847.
final class channelAdminLogEventActionParticipantVolume : ChannelAdminLogEventAction
{
    enum uint tlId = 0x3E7F6847;

    GroupCallParticipant participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeHistoryTTL`, id 0x6E941A38.
final class channelAdminLogEventActionChangeHistoryTTL : ChannelAdminLogEventAction
{
    enum uint tlId = 0x6E941A38;

    int prev_value;
    int new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionParticipantJoinByRequest`, id 0xAFB6144A.
final class channelAdminLogEventActionParticipantJoinByRequest : ChannelAdminLogEventAction
{
    enum uint tlId = 0xAFB6144A;

    ExportedChatInvite invite;
    long approved_by;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionToggleNoForwards`, id 0xCB2AC766.
final class channelAdminLogEventActionToggleNoForwards : ChannelAdminLogEventAction
{
    enum uint tlId = 0xCB2AC766;

    bool new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionSendMessage`, id 0x278F2868.
final class channelAdminLogEventActionSendMessage : ChannelAdminLogEventAction
{
    enum uint tlId = 0x278F2868;

    Message message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeAvailableReactions`, id 0xBE4E0EF8.
final class channelAdminLogEventActionChangeAvailableReactions : ChannelAdminLogEventAction
{
    enum uint tlId = 0xBE4E0EF8;

    ChatReactions prev_value;
    ChatReactions new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeUsernames`, id 0xF04FB3A9.
final class channelAdminLogEventActionChangeUsernames : ChannelAdminLogEventAction
{
    enum uint tlId = 0xF04FB3A9;

    Vector!(string) prev_value;
    Vector!(string) new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionToggleForum`, id 0x02CC6383.
final class channelAdminLogEventActionToggleForum : ChannelAdminLogEventAction
{
    enum uint tlId = 0x02CC6383;

    bool new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionCreateTopic`, id 0x58707D28.
final class channelAdminLogEventActionCreateTopic : ChannelAdminLogEventAction
{
    enum uint tlId = 0x58707D28;

    ForumTopic topic;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionEditTopic`, id 0xF06FE208.
final class channelAdminLogEventActionEditTopic : ChannelAdminLogEventAction
{
    enum uint tlId = 0xF06FE208;

    ForumTopic prev_topic;
    ForumTopic new_topic;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionDeleteTopic`, id 0xAE168909.
final class channelAdminLogEventActionDeleteTopic : ChannelAdminLogEventAction
{
    enum uint tlId = 0xAE168909;

    ForumTopic topic;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionPinTopic`, id 0x5D8D353B.
final class channelAdminLogEventActionPinTopic : ChannelAdminLogEventAction
{
    enum uint tlId = 0x5D8D353B;

    uint flags;
    ForumTopic prev_topic;
    ForumTopic new_topic;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionToggleAntiSpam`, id 0x64F36DFC.
final class channelAdminLogEventActionToggleAntiSpam : ChannelAdminLogEventAction
{
    enum uint tlId = 0x64F36DFC;

    bool new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangePeerColor`, id 0x5796E780.
final class channelAdminLogEventActionChangePeerColor : ChannelAdminLogEventAction
{
    enum uint tlId = 0x5796E780;

    PeerColor prev_value;
    PeerColor new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeProfilePeerColor`, id 0x5E477B25.
final class channelAdminLogEventActionChangeProfilePeerColor : ChannelAdminLogEventAction
{
    enum uint tlId = 0x5E477B25;

    PeerColor prev_value;
    PeerColor new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeWallpaper`, id 0x31BB5D52.
final class channelAdminLogEventActionChangeWallpaper : ChannelAdminLogEventAction
{
    enum uint tlId = 0x31BB5D52;

    WallPaper prev_value;
    WallPaper new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeEmojiStatus`, id 0x3EA9FEB1.
final class channelAdminLogEventActionChangeEmojiStatus : ChannelAdminLogEventAction
{
    enum uint tlId = 0x3EA9FEB1;

    EmojiStatus prev_value;
    EmojiStatus new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionChangeEmojiStickerSet`, id 0x46D840AB.
final class channelAdminLogEventActionChangeEmojiStickerSet : ChannelAdminLogEventAction
{
    enum uint tlId = 0x46D840AB;

    InputStickerSet prev_stickerset;
    InputStickerSet new_stickerset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionToggleSignatureProfiles`, id 0x60A79C79.
final class channelAdminLogEventActionToggleSignatureProfiles : ChannelAdminLogEventAction
{
    enum uint tlId = 0x60A79C79;

    bool new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionParticipantSubExtend`, id 0x64642DB3.
final class channelAdminLogEventActionParticipantSubExtend : ChannelAdminLogEventAction
{
    enum uint tlId = 0x64642DB3;

    ChannelParticipant prev_participant;
    ChannelParticipant new_participant;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionToggleAutotranslation`, id 0xC517F77E.
final class channelAdminLogEventActionToggleAutotranslation : ChannelAdminLogEventAction
{
    enum uint tlId = 0xC517F77E;

    bool new_value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventActionParticipantEditRank`, id 0x5806B4EC.
final class channelAdminLogEventActionParticipantEditRank : ChannelAdminLogEventAction
{
    enum uint tlId = 0x5806B4EC;

    long user_id;
    string prev_rank;
    string new_rank;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEvent`, id 0x1FAD68CD.
final class channelAdminLogEvent : ChannelAdminLogEvent
{
    enum uint tlId = 0x1FAD68CD;

    long id;
    int date;
    long user_id;
    ChannelAdminLogEventAction action;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelAdminLogEventsFilter`, id 0xEA107AE4.
final class channelAdminLogEventsFilter : ChannelAdminLogEventsFilter
{
    enum uint tlId = 0xEA107AE4;

    uint flags;
    bool join;
    bool leave;
    bool invite;
    bool ban;
    bool unban;
    bool kick;
    bool unkick;
    bool promote;
    bool demote;
    bool info;
    bool settings;
    bool pinned;
    bool edit;
    bool delete_;
    bool group_call;
    bool invites;
    bool send;
    bool forums;
    bool sub_extend;
    bool edit_rank;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `popularContact`, id 0x5CE14175.
final class popularContact : PopularContact
{
    enum uint tlId = 0x5CE14175;

    long client_id;
    int importers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `recentMeUrlUnknown`, id 0x46E1D13D.
final class recentMeUrlUnknown : RecentMeUrl
{
    enum uint tlId = 0x46E1D13D;

    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `recentMeUrlUser`, id 0xB92C09E2.
final class recentMeUrlUser : RecentMeUrl
{
    enum uint tlId = 0xB92C09E2;

    string url;
    long user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `recentMeUrlChat`, id 0xB2DA71D2.
final class recentMeUrlChat : RecentMeUrl
{
    enum uint tlId = 0xB2DA71D2;

    string url;
    long chat_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `recentMeUrlChatInvite`, id 0xEB49081D.
final class recentMeUrlChatInvite : RecentMeUrl
{
    enum uint tlId = 0xEB49081D;

    string url;
    ChatInvite chat_invite;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `recentMeUrlStickerSet`, id 0xBC0A57DC.
final class recentMeUrlStickerSet : RecentMeUrl
{
    enum uint tlId = 0xBC0A57DC;

    string url;
    StickerSetCovered set;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputSingleMedia`, id 0x1CC6E91F.
final class inputSingleMedia : InputSingleMedia
{
    enum uint tlId = 0x1CC6E91F;

    uint flags;
    InputMedia media;
    long random_id;
    string message;
    Vector!(MessageEntity) entities;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webAuthorization`, id 0xA6F8F452.
final class webAuthorization : WebAuthorization
{
    enum uint tlId = 0xA6F8F452;

    long hash;
    long bot_id;
    string domain;
    string browser;
    string platform;
    int date_created;
    int date_active;
    string ip;
    string region;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessageID`, id 0xA676A322.
final class inputMessageID : InputMessage
{
    enum uint tlId = 0xA676A322;

    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessageReplyTo`, id 0xBAD88395.
final class inputMessageReplyTo : InputMessage
{
    enum uint tlId = 0xBAD88395;

    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessagePinned`, id 0x86872538.
final class inputMessagePinned : InputMessage
{
    enum uint tlId = 0x86872538;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessageCallbackQuery`, id 0xACFA1A7E.
final class inputMessageCallbackQuery : InputMessage
{
    enum uint tlId = 0xACFA1A7E;

    int id;
    long query_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputDialogPeer`, id 0xFCAAFEB7.
final class inputDialogPeer : InputDialogPeer
{
    enum uint tlId = 0xFCAAFEB7;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputDialogPeerFolder`, id 0x64600527.
final class inputDialogPeerFolder : InputDialogPeer
{
    enum uint tlId = 0x64600527;

    int folder_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputDialogPeerCommunity`, id 0x69EF72C4.
final class inputDialogPeerCommunity : InputDialogPeer
{
    enum uint tlId = 0x69EF72C4;

    InputChannel community;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `dialogPeer`, id 0xE56DBF05.
final class dialogPeer : DialogPeer
{
    enum uint tlId = 0xE56DBF05;

    Peer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `dialogPeerFolder`, id 0x514519E2.
final class dialogPeerFolder : DialogPeer
{
    enum uint tlId = 0x514519E2;

    int folder_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `dialogPeerCommunity`, id 0x2F65C8E4.
final class dialogPeerCommunity : DialogPeer
{
    enum uint tlId = 0x2F65C8E4;

    long community_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `fileHash`, id 0xF39B035C.
final class fileHash : FileHash
{
    enum uint tlId = 0xF39B035C;

    long offset;
    int limit;
    ubyte[] hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputClientProxy`, id 0x75588B3F.
final class inputClientProxy : InputClientProxy
{
    enum uint tlId = 0x75588B3F;

    string address;
    int port;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputSecureFileUploaded`, id 0x3334B0F0.
final class inputSecureFileUploaded : InputSecureFile
{
    enum uint tlId = 0x3334B0F0;

    long id;
    int parts;
    string md5_checksum;
    ubyte[] file_hash;
    ubyte[] secret;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputSecureFile`, id 0x5367E5BE.
final class inputSecureFile : InputSecureFile
{
    enum uint tlId = 0x5367E5BE;

    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureFileEmpty`, id 0x64199744.
final class secureFileEmpty : SecureFile
{
    enum uint tlId = 0x64199744;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureFile`, id 0x7D09C27E.
final class secureFile : SecureFile
{
    enum uint tlId = 0x7D09C27E;

    long id;
    long access_hash;
    long size;
    int dc_id;
    int date;
    ubyte[] file_hash;
    ubyte[] secret;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureData`, id 0x8AEABEC3.
final class secureData : SecureData
{
    enum uint tlId = 0x8AEABEC3;

    ubyte[] data;
    ubyte[] data_hash;
    ubyte[] secret;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `securePlainPhone`, id 0x7D6099DD.
final class securePlainPhone : SecurePlainData
{
    enum uint tlId = 0x7D6099DD;

    string phone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `securePlainEmail`, id 0x21EC5A5F.
final class securePlainEmail : SecurePlainData
{
    enum uint tlId = 0x21EC5A5F;

    string email;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypePersonalDetails`, id 0x9D2A81E3.
final class secureValueTypePersonalDetails : SecureValueType
{
    enum uint tlId = 0x9D2A81E3;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypePassport`, id 0x3DAC6A00.
final class secureValueTypePassport : SecureValueType
{
    enum uint tlId = 0x3DAC6A00;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypeDriverLicense`, id 0x06E425C4.
final class secureValueTypeDriverLicense : SecureValueType
{
    enum uint tlId = 0x06E425C4;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypeIdentityCard`, id 0xA0D0744B.
final class secureValueTypeIdentityCard : SecureValueType
{
    enum uint tlId = 0xA0D0744B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypeInternalPassport`, id 0x99A48F23.
final class secureValueTypeInternalPassport : SecureValueType
{
    enum uint tlId = 0x99A48F23;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypeAddress`, id 0xCBE31E26.
final class secureValueTypeAddress : SecureValueType
{
    enum uint tlId = 0xCBE31E26;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypeUtilityBill`, id 0xFC36954E.
final class secureValueTypeUtilityBill : SecureValueType
{
    enum uint tlId = 0xFC36954E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypeBankStatement`, id 0x89137C0D.
final class secureValueTypeBankStatement : SecureValueType
{
    enum uint tlId = 0x89137C0D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypeRentalAgreement`, id 0x8B883488.
final class secureValueTypeRentalAgreement : SecureValueType
{
    enum uint tlId = 0x8B883488;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypePassportRegistration`, id 0x99E3806A.
final class secureValueTypePassportRegistration : SecureValueType
{
    enum uint tlId = 0x99E3806A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypeTemporaryRegistration`, id 0xEA02EC33.
final class secureValueTypeTemporaryRegistration : SecureValueType
{
    enum uint tlId = 0xEA02EC33;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypePhone`, id 0xB320AADB.
final class secureValueTypePhone : SecureValueType
{
    enum uint tlId = 0xB320AADB;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueTypeEmail`, id 0x8E3CA7EE.
final class secureValueTypeEmail : SecureValueType
{
    enum uint tlId = 0x8E3CA7EE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValue`, id 0x187FA0CA.
final class secureValue : SecureValue
{
    enum uint tlId = 0x187FA0CA;

    uint flags;
    SecureValueType type;
    SecureData data;
    SecureFile front_side;
    SecureFile reverse_side;
    SecureFile selfie;
    Vector!(SecureFile) translation;
    Vector!(SecureFile) files;
    SecurePlainData plain_data;
    ubyte[] hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputSecureValue`, id 0xDB21D0A7.
final class inputSecureValue : InputSecureValue
{
    enum uint tlId = 0xDB21D0A7;

    uint flags;
    SecureValueType type;
    SecureData data;
    InputSecureFile front_side;
    InputSecureFile reverse_side;
    InputSecureFile selfie;
    Vector!(InputSecureFile) translation;
    Vector!(InputSecureFile) files;
    SecurePlainData plain_data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueHash`, id 0xED1ECDB0.
final class secureValueHash : SecureValueHash
{
    enum uint tlId = 0xED1ECDB0;

    SecureValueType type;
    ubyte[] hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueErrorData`, id 0xE8A40BD9.
final class secureValueErrorData : SecureValueError
{
    enum uint tlId = 0xE8A40BD9;

    SecureValueType type;
    ubyte[] data_hash;
    string field;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueErrorFrontSide`, id 0x00BE3DFA.
final class secureValueErrorFrontSide : SecureValueError
{
    enum uint tlId = 0x00BE3DFA;

    SecureValueType type;
    ubyte[] file_hash;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueErrorReverseSide`, id 0x868A2AA5.
final class secureValueErrorReverseSide : SecureValueError
{
    enum uint tlId = 0x868A2AA5;

    SecureValueType type;
    ubyte[] file_hash;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueErrorSelfie`, id 0xE537CED6.
final class secureValueErrorSelfie : SecureValueError
{
    enum uint tlId = 0xE537CED6;

    SecureValueType type;
    ubyte[] file_hash;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueErrorFile`, id 0x7A700873.
final class secureValueErrorFile : SecureValueError
{
    enum uint tlId = 0x7A700873;

    SecureValueType type;
    ubyte[] file_hash;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueErrorFiles`, id 0x666220E9.
final class secureValueErrorFiles : SecureValueError
{
    enum uint tlId = 0x666220E9;

    SecureValueType type;
    Vector!(ubyte[]) file_hash;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueError`, id 0x869D758F.
final class secureValueError : SecureValueError
{
    enum uint tlId = 0x869D758F;

    SecureValueType type;
    ubyte[] hash;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueErrorTranslationFile`, id 0xA1144770.
final class secureValueErrorTranslationFile : SecureValueError
{
    enum uint tlId = 0xA1144770;

    SecureValueType type;
    ubyte[] file_hash;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureValueErrorTranslationFiles`, id 0x34636DD8.
final class secureValueErrorTranslationFiles : SecureValueError
{
    enum uint tlId = 0x34636DD8;

    SecureValueType type;
    Vector!(ubyte[]) file_hash;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureCredentialsEncrypted`, id 0x33F0EA47.
final class secureCredentialsEncrypted : SecureCredentialsEncrypted
{
    enum uint tlId = 0x33F0EA47;

    ubyte[] data;
    ubyte[] hash;
    ubyte[] secret;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `savedPhoneContact`, id 0x1142BD56.
final class savedPhoneContact : SavedContact
{
    enum uint tlId = 0x1142BD56;

    string phone;
    string first_name;
    string last_name;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `passwordKdfAlgoUnknown`, id 0xD45AB096.
final class passwordKdfAlgoUnknown : PasswordKdfAlgo
{
    enum uint tlId = 0xD45AB096;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `passwordKdfAlgoSHA256SHA256PBKDF2HMACSHA512iter100000SHA256ModPow`, id 0x3A912D4A.
final class passwordKdfAlgoSHA256SHA256PBKDF2HMACSHA512iter100000SHA256ModPow : PasswordKdfAlgo
{
    enum uint tlId = 0x3A912D4A;

    ubyte[] salt1;
    ubyte[] salt2;
    int g;
    ubyte[] p;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `securePasswordKdfAlgoUnknown`, id 0x004A8537.
final class securePasswordKdfAlgoUnknown : SecurePasswordKdfAlgo
{
    enum uint tlId = 0x004A8537;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `securePasswordKdfAlgoPBKDF2HMACSHA512iter100000`, id 0xBBF2DDA0.
final class securePasswordKdfAlgoPBKDF2HMACSHA512iter100000 : SecurePasswordKdfAlgo
{
    enum uint tlId = 0xBBF2DDA0;

    ubyte[] salt;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `securePasswordKdfAlgoSHA512`, id 0x86471D92.
final class securePasswordKdfAlgoSHA512 : SecurePasswordKdfAlgo
{
    enum uint tlId = 0x86471D92;

    ubyte[] salt;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureSecretSettings`, id 0x1527BCAC.
final class secureSecretSettings : SecureSecretSettings
{
    enum uint tlId = 0x1527BCAC;

    SecurePasswordKdfAlgo secure_algo;
    ubyte[] secure_secret;
    long secure_secret_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputCheckPasswordEmpty`, id 0x9880F658.
final class inputCheckPasswordEmpty : InputCheckPasswordSRP
{
    enum uint tlId = 0x9880F658;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputCheckPasswordSRP`, id 0xD27FF082.
final class inputCheckPasswordSRP : InputCheckPasswordSRP
{
    enum uint tlId = 0xD27FF082;

    long srp_id;
    ubyte[] A;
    ubyte[] M1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureRequiredType`, id 0x829D99DA.
final class secureRequiredType : SecureRequiredType
{
    enum uint tlId = 0x829D99DA;

    uint flags;
    bool native_names;
    bool selfie_required;
    bool translation_required;
    SecureValueType type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `secureRequiredTypeOneOf`, id 0x027477B4.
final class secureRequiredTypeOneOf : SecureRequiredType
{
    enum uint tlId = 0x027477B4;

    Vector!(SecureRequiredType) types;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputAppEvent`, id 0x1D1B1245.
final class inputAppEvent : InputAppEvent
{
    enum uint tlId = 0x1D1B1245;

    double time;
    string type;
    long peer;
    JSONValue data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `jsonObjectValue`, id 0xC0DE1BD9.
final class jsonObjectValue : JSONObjectValue
{
    enum uint tlId = 0xC0DE1BD9;

    string key;
    JSONValue value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `jsonNull`, id 0x3F6D7B68.
final class jsonNull : JSONValue
{
    enum uint tlId = 0x3F6D7B68;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `jsonBool`, id 0xC7345E6A.
final class jsonBool : JSONValue
{
    enum uint tlId = 0xC7345E6A;

    bool value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `jsonNumber`, id 0x2BE0DFA4.
final class jsonNumber : JSONValue
{
    enum uint tlId = 0x2BE0DFA4;

    double value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `jsonString`, id 0xB71E767A.
final class jsonString : JSONValue
{
    enum uint tlId = 0xB71E767A;

    string value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `jsonArray`, id 0xF7444763.
final class jsonArray : JSONValue
{
    enum uint tlId = 0xF7444763;

    Vector!(JSONValue) value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `jsonObject`, id 0x99C1D49D.
final class jsonObject : JSONValue
{
    enum uint tlId = 0x99C1D49D;

    Vector!(JSONObjectValue) value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageTableCell`, id 0x34566B6A.
final class pageTableCell : PageTableCell
{
    enum uint tlId = 0x34566B6A;

    uint flags;
    bool header;
    bool align_center;
    bool align_right;
    bool valign_middle;
    bool valign_bottom;
    RichText text;
    int colspan;
    int rowspan;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageTableRow`, id 0xE0C0C5E5.
final class pageTableRow : PageTableRow
{
    enum uint tlId = 0xE0C0C5E5;

    Vector!(PageTableCell) cells;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageCaption`, id 0x6F747657.
final class pageCaption : PageCaption
{
    enum uint tlId = 0x6F747657;

    RichText text;
    RichText credit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageListItemText`, id 0x2F58683C.
final class pageListItemText : PageListItem
{
    enum uint tlId = 0x2F58683C;

    uint flags;
    bool checkbox;
    bool checked;
    RichText text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageListItemBlocks`, id 0x63CA67AA.
final class pageListItemBlocks : PageListItem
{
    enum uint tlId = 0x63CA67AA;

    uint flags;
    bool checkbox;
    bool checked;
    Vector!(PageBlock) blocks;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageListOrderedItemText`, id 0x15031189.
final class pageListOrderedItemText : PageListOrderedItem
{
    enum uint tlId = 0x15031189;

    uint flags;
    bool checkbox;
    bool checked;
    string num;
    RichText text;
    int value;
    string type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageListOrderedItemBlocks`, id 0x8FF2D5F0.
final class pageListOrderedItemBlocks : PageListOrderedItem
{
    enum uint tlId = 0x8FF2D5F0;

    uint flags;
    bool checkbox;
    bool checked;
    string num;
    Vector!(PageBlock) blocks;
    int value;
    string type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageRelatedArticle`, id 0xB390DC08.
final class pageRelatedArticle : PageRelatedArticle
{
    enum uint tlId = 0xB390DC08;

    uint flags;
    string url;
    long webpage_id;
    string title;
    string description;
    long photo_id;
    string author;
    int published_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `page`, id 0x98657F0D.
final class page : Page
{
    enum uint tlId = 0x98657F0D;

    uint flags;
    bool part;
    bool rtl;
    bool v2;
    string url;
    Vector!(PageBlock) blocks;
    Vector!(Photo) photos;
    Vector!(Document) documents;
    int views;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pollAnswer`, id 0x4B7D786A.
final class pollAnswer : PollAnswer
{
    enum uint tlId = 0x4B7D786A;

    uint flags;
    TextWithEntities text;
    ubyte[] option;
    MessageMedia media;
    Peer added_by;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPollAnswer`, id 0x199FED96.
final class inputPollAnswer : PollAnswer
{
    enum uint tlId = 0x199FED96;

    uint flags;
    TextWithEntities text;
    InputMedia media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `poll`, id 0x966E2DBF.
final class poll : Poll
{
    enum uint tlId = 0x966E2DBF;

    long id;
    uint flags;
    bool closed;
    bool public_voters;
    bool multiple_choice;
    bool quiz;
    bool open_answers;
    bool revoting_disabled;
    bool shuffle_answers;
    bool hide_results_until_close;
    bool creator;
    bool subscribers_only;
    TextWithEntities question;
    Vector!(PollAnswer) answers;
    int close_period;
    int close_date;
    Vector!(string) countries_iso2;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pollAnswerVoters`, id 0x3645230A.
final class pollAnswerVoters : PollAnswerVoters
{
    enum uint tlId = 0x3645230A;

    uint flags;
    bool chosen;
    bool correct;
    ubyte[] option;
    int voters;
    Vector!(Peer) recent_voters;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pollResults`, id 0xBA7BB15E.
final class pollResults : PollResults
{
    enum uint tlId = 0xBA7BB15E;

    uint flags;
    bool min;
    bool has_unread_votes;
    bool can_view_stats;
    Vector!(PollAnswerVoters) results;
    int total_voters;
    Vector!(Peer) recent_voters;
    string solution;
    Vector!(MessageEntity) solution_entities;
    MessageMedia solution_media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatOnlines`, id 0xF041E250.
final class chatOnlines : ChatOnlines
{
    enum uint tlId = 0xF041E250;

    int onlines;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `statsURL`, id 0x47A971E0.
final class statsURL : StatsURL
{
    enum uint tlId = 0x47A971E0;

    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatAdminRights`, id 0x5FB224D5.
final class chatAdminRights : ChatAdminRights
{
    enum uint tlId = 0x5FB224D5;

    uint flags;
    bool change_info;
    bool post_messages;
    bool edit_messages;
    bool delete_messages;
    bool ban_users;
    bool invite_users;
    bool pin_messages;
    bool add_admins;
    bool anonymous;
    bool manage_call;
    bool other;
    bool manage_topics;
    bool post_stories;
    bool edit_stories;
    bool delete_stories;
    bool manage_direct_messages;
    bool manage_ranks;
    bool manage_linked_peers;
    bool manage_welcome_messages;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatBannedRights`, id 0x9F120418.
final class chatBannedRights : ChatBannedRights
{
    enum uint tlId = 0x9F120418;

    uint flags;
    bool view_messages;
    bool send_messages;
    bool send_media;
    bool send_stickers;
    bool send_gifs;
    bool send_games;
    bool send_inline;
    bool embed_links;
    bool send_polls;
    bool change_info;
    bool invite_users;
    bool pin_messages;
    bool manage_topics;
    bool send_photos;
    bool send_videos;
    bool send_roundvideos;
    bool send_audios;
    bool send_voices;
    bool send_docs;
    bool send_plain;
    bool edit_rank;
    bool send_reactions;
    bool manage_linked_peers;
    int until_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputWallPaper`, id 0xE630B979.
final class inputWallPaper : InputWallPaper
{
    enum uint tlId = 0xE630B979;

    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputWallPaperSlug`, id 0x72091C80.
final class inputWallPaperSlug : InputWallPaper
{
    enum uint tlId = 0x72091C80;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputWallPaperNoFile`, id 0x967A462E.
final class inputWallPaperNoFile : InputWallPaper
{
    enum uint tlId = 0x967A462E;

    long id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `codeSettings`, id 0xAD253D78.
final class codeSettings : CodeSettings
{
    enum uint tlId = 0xAD253D78;

    uint flags;
    bool allow_flashcall;
    bool current_number;
    bool allow_app_hash;
    bool allow_missed_call;
    bool allow_firebase;
    bool unknown_number;
    Vector!(ubyte[]) logout_tokens;
    string token;
    bool app_sandbox;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallPaperSettings`, id 0x372EFCD0.
final class wallPaperSettings : WallPaperSettings
{
    enum uint tlId = 0x372EFCD0;

    uint flags;
    bool blur;
    bool motion;
    int background_color;
    int second_background_color;
    int third_background_color;
    int fourth_background_color;
    int intensity;
    int rotation;
    string emoticon;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `autoDownloadSettings`, id 0xBAA57628.
final class autoDownloadSettings : AutoDownloadSettings
{
    enum uint tlId = 0xBAA57628;

    uint flags;
    bool disabled;
    bool video_preload_large;
    bool audio_preload_next;
    bool phonecalls_less_data;
    bool stories_preload;
    int photo_size_max;
    long video_size_max;
    long file_size_max;
    int video_upload_maxbitrate;
    int small_queue_active_operations_max;
    int large_queue_active_operations_max;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiKeyword`, id 0xD5B3B9F9.
final class emojiKeyword : EmojiKeyword
{
    enum uint tlId = 0xD5B3B9F9;

    string keyword;
    Vector!(string) emoticons;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiKeywordDeleted`, id 0x236DF622.
final class emojiKeywordDeleted : EmojiKeyword
{
    enum uint tlId = 0x236DF622;

    string keyword;
    Vector!(string) emoticons;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiKeywordsDifference`, id 0x5CC761BD.
final class emojiKeywordsDifference : EmojiKeywordsDifference
{
    enum uint tlId = 0x5CC761BD;

    string lang_code;
    int from_version;
    int version_;
    Vector!(EmojiKeyword) keywords;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiURL`, id 0xA575739D.
final class emojiURL : EmojiURL
{
    enum uint tlId = 0xA575739D;

    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiLanguage`, id 0xB3FB5361.
final class emojiLanguage : EmojiLanguage
{
    enum uint tlId = 0xB3FB5361;

    string lang_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `folder`, id 0xFF544E65.
final class folder : Folder
{
    enum uint tlId = 0xFF544E65;

    uint flags;
    bool autofill_new_broadcasts;
    bool autofill_public_groups;
    bool autofill_new_correspondents;
    int id;
    string title;
    ChatPhoto photo;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputFolderPeer`, id 0xFBD2C296.
final class inputFolderPeer : InputFolderPeer
{
    enum uint tlId = 0xFBD2C296;

    InputPeer peer;
    int folder_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `folderPeer`, id 0xE9BAA668.
final class folderPeer : FolderPeer
{
    enum uint tlId = 0xE9BAA668;

    Peer peer;
    int folder_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `urlAuthResultRequest`, id 0x3CD623EC.
final class urlAuthResultRequest : UrlAuthResult
{
    enum uint tlId = 0x3CD623EC;

    uint flags;
    bool request_write_access;
    bool request_phone_number;
    bool match_codes_first;
    bool is_app;
    User bot;
    string domain;
    string browser;
    string platform;
    string ip;
    string region;
    Vector!(string) match_codes;
    long user_id_hint;
    string verified_app_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `urlAuthResultAccepted`, id 0x623A8FA0.
final class urlAuthResultAccepted : UrlAuthResult
{
    enum uint tlId = 0x623A8FA0;

    uint flags;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `urlAuthResultDefault`, id 0xA9D6DB1F.
final class urlAuthResultDefault : UrlAuthResult
{
    enum uint tlId = 0xA9D6DB1F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelLocationEmpty`, id 0xBFB5AD8B.
final class channelLocationEmpty : ChannelLocation
{
    enum uint tlId = 0xBFB5AD8B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `channelLocation`, id 0x209B82DB.
final class channelLocation : ChannelLocation
{
    enum uint tlId = 0x209B82DB;

    GeoPoint geo_point;
    string address;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `peerLocated`, id 0xCA461B5D.
final class peerLocated : PeerLocated
{
    enum uint tlId = 0xCA461B5D;

    Peer peer;
    int expires;
    int distance;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `peerSelfLocated`, id 0xF8EC284B.
final class peerSelfLocated : PeerLocated
{
    enum uint tlId = 0xF8EC284B;

    int expires;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `restrictionReason`, id 0xD072ACB4.
final class restrictionReason : RestrictionReason
{
    enum uint tlId = 0xD072ACB4;

    string platform;
    string reason;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputTheme`, id 0x3C5693E9.
final class inputTheme : InputTheme
{
    enum uint tlId = 0x3C5693E9;

    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputThemeSlug`, id 0xF5890DF1.
final class inputThemeSlug : InputTheme
{
    enum uint tlId = 0xF5890DF1;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `theme`, id 0xA00E67D6.
final class theme : Theme
{
    enum uint tlId = 0xA00E67D6;

    uint flags;
    bool creator;
    bool default_;
    bool for_chat;
    long id;
    long access_hash;
    string slug;
    string title;
    Document document;
    Vector!(ThemeSettings) settings;
    string emoticon;
    int installs_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `baseThemeClassic`, id 0xC3A12462.
final class baseThemeClassic : BaseTheme
{
    enum uint tlId = 0xC3A12462;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `baseThemeDay`, id 0xFBD81688.
final class baseThemeDay : BaseTheme
{
    enum uint tlId = 0xFBD81688;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `baseThemeNight`, id 0xB7B31EA8.
final class baseThemeNight : BaseTheme
{
    enum uint tlId = 0xB7B31EA8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `baseThemeTinted`, id 0x6D5F77EE.
final class baseThemeTinted : BaseTheme
{
    enum uint tlId = 0x6D5F77EE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `baseThemeArctic`, id 0x5B11125A.
final class baseThemeArctic : BaseTheme
{
    enum uint tlId = 0x5B11125A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputThemeSettings`, id 0x8FDE504F.
final class inputThemeSettings : InputThemeSettings
{
    enum uint tlId = 0x8FDE504F;

    uint flags;
    bool message_colors_animated;
    BaseTheme base_theme;
    int accent_color;
    int outbox_accent_color;
    Vector!(int) message_colors;
    InputWallPaper wallpaper;
    WallPaperSettings wallpaper_settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `themeSettings`, id 0xFA58B6D4.
final class themeSettings : ThemeSettings
{
    enum uint tlId = 0xFA58B6D4;

    uint flags;
    bool message_colors_animated;
    BaseTheme base_theme;
    int accent_color;
    int outbox_accent_color;
    Vector!(int) message_colors;
    WallPaper wallpaper;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webPageAttributeTheme`, id 0x54B56617.
final class webPageAttributeTheme : WebPageAttribute
{
    enum uint tlId = 0x54B56617;

    uint flags;
    Vector!(Document) documents;
    ThemeSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webPageAttributeStory`, id 0x2E94C3E7.
final class webPageAttributeStory : WebPageAttribute
{
    enum uint tlId = 0x2E94C3E7;

    uint flags;
    Peer peer;
    int id;
    StoryItem story;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webPageAttributeStickerSet`, id 0x50CC03D3.
final class webPageAttributeStickerSet : WebPageAttribute
{
    enum uint tlId = 0x50CC03D3;

    uint flags;
    bool emojis;
    bool text_color;
    Vector!(Document) stickers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webPageAttributeUniqueStarGift`, id 0xCF6F6DB8.
final class webPageAttributeUniqueStarGift : WebPageAttribute
{
    enum uint tlId = 0xCF6F6DB8;

    StarGift gift;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webPageAttributeStarGiftCollection`, id 0x31CAD303.
final class webPageAttributeStarGiftCollection : WebPageAttribute
{
    enum uint tlId = 0x31CAD303;

    Vector!(Document) icons;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webPageAttributeStarGiftAuction`, id 0x01C641C2.
final class webPageAttributeStarGiftAuction : WebPageAttribute
{
    enum uint tlId = 0x01C641C2;

    StarGift gift;
    int end_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webPageAttributeAiComposeTone`, id 0x7781FE18.
final class webPageAttributeAiComposeTone : WebPageAttribute
{
    enum uint tlId = 0x7781FE18;

    long emoji_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `bankCardOpenUrl`, id 0xF568028A.
final class bankCardOpenUrl : BankCardOpenUrl
{
    enum uint tlId = 0xF568028A;

    string url;
    string name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `dialogFilter`, id 0xAA472651.
final class dialogFilter : DialogFilter
{
    enum uint tlId = 0xAA472651;

    uint flags;
    bool contacts;
    bool non_contacts;
    bool groups;
    bool broadcasts;
    bool bots;
    bool exclude_muted;
    bool exclude_read;
    bool exclude_archived;
    bool title_noanimate;
    int id;
    TextWithEntities title;
    string emoticon;
    int color;
    Vector!(InputPeer) pinned_peers;
    Vector!(InputPeer) include_peers;
    Vector!(InputPeer) exclude_peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `dialogFilterDefault`, id 0x363293AE.
final class dialogFilterDefault : DialogFilter
{
    enum uint tlId = 0x363293AE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `dialogFilterChatlist`, id 0x96537BD7.
final class dialogFilterChatlist : DialogFilter
{
    enum uint tlId = 0x96537BD7;

    uint flags;
    bool has_my_invites;
    bool title_noanimate;
    int id;
    TextWithEntities title;
    string emoticon;
    int color;
    Vector!(InputPeer) pinned_peers;
    Vector!(InputPeer) include_peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `dialogFilterSuggested`, id 0x77744D4A.
final class dialogFilterSuggested : DialogFilterSuggested
{
    enum uint tlId = 0x77744D4A;

    DialogFilter filter;
    string description;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `statsDateRangeDays`, id 0xB637EDAF.
final class statsDateRangeDays : StatsDateRangeDays
{
    enum uint tlId = 0xB637EDAF;

    int min_date;
    int max_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `statsAbsValueAndPrev`, id 0xCB43ACDE.
final class statsAbsValueAndPrev : StatsAbsValueAndPrev
{
    enum uint tlId = 0xCB43ACDE;

    double current;
    double previous;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `statsPercentValue`, id 0xCBCE2FE0.
final class statsPercentValue : StatsPercentValue
{
    enum uint tlId = 0xCBCE2FE0;

    double part;
    double total;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `statsGraphAsync`, id 0x4A27EB2D.
final class statsGraphAsync : StatsGraph
{
    enum uint tlId = 0x4A27EB2D;

    string token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `statsGraphError`, id 0xBEDC9822.
final class statsGraphError : StatsGraph
{
    enum uint tlId = 0xBEDC9822;

    string error;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `statsGraph`, id 0x8EA464B6.
final class statsGraph : StatsGraph
{
    enum uint tlId = 0x8EA464B6;

    uint flags;
    DataJSON json;
    string zoom_token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `videoSize`, id 0xDE33B094.
final class videoSize : VideoSize
{
    enum uint tlId = 0xDE33B094;

    uint flags;
    string type;
    int w;
    int h;
    int size;
    double video_start_ts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `videoSizeEmojiMarkup`, id 0xF85C413C.
final class videoSizeEmojiMarkup : VideoSize
{
    enum uint tlId = 0xF85C413C;

    long emoji_id;
    Vector!(int) background_colors;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `videoSizeStickerMarkup`, id 0x0DA082FE.
final class videoSizeStickerMarkup : VideoSize
{
    enum uint tlId = 0x0DA082FE;

    InputStickerSet stickerset;
    long sticker_id;
    Vector!(int) background_colors;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `statsGroupTopPoster`, id 0x9D04AF9B.
final class statsGroupTopPoster : StatsGroupTopPoster
{
    enum uint tlId = 0x9D04AF9B;

    long user_id;
    int messages;
    int avg_chars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `statsGroupTopAdmin`, id 0xD7584C87.
final class statsGroupTopAdmin : StatsGroupTopAdmin
{
    enum uint tlId = 0xD7584C87;

    long user_id;
    int deleted;
    int kicked;
    int banned;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `statsGroupTopInviter`, id 0x535F779D.
final class statsGroupTopInviter : StatsGroupTopInviter
{
    enum uint tlId = 0x535F779D;

    long user_id;
    int invitations;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `globalPrivacySettings`, id 0xFE41B34F.
final class globalPrivacySettings : GlobalPrivacySettings
{
    enum uint tlId = 0xFE41B34F;

    uint flags;
    bool archive_and_mute_new_noncontact_peers;
    bool keep_archived_unmuted;
    bool keep_archived_folders;
    bool hide_read_marks;
    bool new_noncontact_peers_require_premium;
    bool display_gifts_button;
    long noncontact_peers_paid_stars;
    DisallowedGiftsSettings disallowed_gifts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageViews`, id 0x455B853D.
final class messageViews : MessageViews
{
    enum uint tlId = 0x455B853D;

    uint flags;
    int views;
    int forwards;
    MessageReplies replies;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageReplyHeader`, id 0x1B97DD66.
final class messageReplyHeader : MessageReplyHeader
{
    enum uint tlId = 0x1B97DD66;

    uint flags;
    bool reply_to_scheduled;
    bool forum_topic;
    bool quote;
    bool reply_to_ephemeral;
    int reply_to_msg_id;
    Peer reply_to_peer_id;
    MessageFwdHeader reply_from;
    MessageMedia reply_media;
    int reply_to_top_id;
    string quote_text;
    Vector!(MessageEntity) quote_entities;
    int quote_offset;
    int todo_item_id;
    ubyte[] poll_option;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageReplyStoryHeader`, id 0x0E5AF939.
final class messageReplyStoryHeader : MessageReplyHeader
{
    enum uint tlId = 0x0E5AF939;

    Peer peer;
    int story_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageReplies`, id 0x83D60FC2.
final class messageReplies : MessageReplies
{
    enum uint tlId = 0x83D60FC2;

    uint flags;
    bool comments;
    int replies;
    int replies_pts;
    Vector!(Peer) recent_repliers;
    long channel_id;
    int max_id;
    int read_max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `peerBlocked`, id 0xE8FD8014.
final class peerBlocked : PeerBlocked
{
    enum uint tlId = 0xE8FD8014;

    Peer peer_id;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `groupCallDiscarded`, id 0x7780BCB4.
final class groupCallDiscarded : GroupCall
{
    enum uint tlId = 0x7780BCB4;

    long id;
    long access_hash;
    int duration;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `groupCall`, id 0xEFB2B617.
final class groupCall : GroupCall
{
    enum uint tlId = 0xEFB2B617;

    uint flags;
    bool join_muted;
    bool can_change_join_muted;
    bool join_date_asc;
    bool schedule_start_subscribed;
    bool can_start_video;
    bool record_video_active;
    bool rtmp_stream;
    bool listeners_hidden;
    bool conference;
    bool creator;
    bool messages_enabled;
    bool can_change_messages_enabled;
    bool min;
    long id;
    long access_hash;
    int participants_count;
    string title;
    int stream_dc_id;
    int record_start_date;
    int schedule_date;
    int unmuted_video_count;
    int unmuted_video_limit;
    int version_;
    string invite_link;
    long send_paid_messages_stars;
    Peer default_send_as;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputGroupCall`, id 0xD8AA840F.
final class inputGroupCall : InputGroupCall
{
    enum uint tlId = 0xD8AA840F;

    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputGroupCallSlug`, id 0xFE06823F.
final class inputGroupCallSlug : InputGroupCall
{
    enum uint tlId = 0xFE06823F;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputGroupCallInviteMessage`, id 0x8C10603F.
final class inputGroupCallInviteMessage : InputGroupCall
{
    enum uint tlId = 0x8C10603F;

    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `groupCallParticipant`, id 0x2A3DC7AC.
final class groupCallParticipant : GroupCallParticipant
{
    enum uint tlId = 0x2A3DC7AC;

    uint flags;
    bool muted;
    bool left;
    bool can_self_unmute;
    bool just_joined;
    bool versioned;
    bool min;
    bool muted_by_you;
    bool volume_by_admin;
    bool self;
    bool video_joined;
    Peer peer;
    int date;
    int active_date;
    int source;
    int volume;
    string about;
    long raise_hand_rating;
    GroupCallParticipantVideo video;
    GroupCallParticipantVideo presentation;
    long paid_stars_total;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineQueryPeerTypeSameBotPM`, id 0x3081ED9D.
final class inlineQueryPeerTypeSameBotPM : InlineQueryPeerType
{
    enum uint tlId = 0x3081ED9D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineQueryPeerTypePM`, id 0x833C0FAC.
final class inlineQueryPeerTypePM : InlineQueryPeerType
{
    enum uint tlId = 0x833C0FAC;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineQueryPeerTypeChat`, id 0xD766C50A.
final class inlineQueryPeerTypeChat : InlineQueryPeerType
{
    enum uint tlId = 0xD766C50A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineQueryPeerTypeMegagroup`, id 0x5EC4BE43.
final class inlineQueryPeerTypeMegagroup : InlineQueryPeerType
{
    enum uint tlId = 0x5EC4BE43;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineQueryPeerTypeBroadcast`, id 0x6334EE9A.
final class inlineQueryPeerTypeBroadcast : InlineQueryPeerType
{
    enum uint tlId = 0x6334EE9A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineQueryPeerTypeBotPM`, id 0x0E3B2D0C.
final class inlineQueryPeerTypeBotPM : InlineQueryPeerType
{
    enum uint tlId = 0x0E3B2D0C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatInviteImporter`, id 0x8C5ADFD9.
final class chatInviteImporter : ChatInviteImporter
{
    enum uint tlId = 0x8C5ADFD9;

    uint flags;
    bool requested;
    bool via_chatlist;
    long user_id;
    int date;
    string about;
    long approved_by;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatAdminWithInvites`, id 0xF2ECEF23.
final class chatAdminWithInvites : ChatAdminWithInvites
{
    enum uint tlId = 0xF2ECEF23;

    long admin_id;
    int invites_count;
    int revoked_invites_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `groupCallParticipantVideoSourceGroup`, id 0xDCB118B7.
final class groupCallParticipantVideoSourceGroup : GroupCallParticipantVideoSourceGroup
{
    enum uint tlId = 0xDCB118B7;

    string semantics;
    Vector!(int) sources;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `groupCallParticipantVideo`, id 0x67753AC8.
final class groupCallParticipantVideo : GroupCallParticipantVideo
{
    enum uint tlId = 0x67753AC8;

    uint flags;
    bool paused;
    string endpoint;
    Vector!(GroupCallParticipantVideoSourceGroup) source_groups;
    int audio_source;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botCommandScopeDefault`, id 0x2F6CB2AB.
final class botCommandScopeDefault : BotCommandScope
{
    enum uint tlId = 0x2F6CB2AB;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botCommandScopeUsers`, id 0x3C4F04D8.
final class botCommandScopeUsers : BotCommandScope
{
    enum uint tlId = 0x3C4F04D8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botCommandScopeChats`, id 0x6FE1A881.
final class botCommandScopeChats : BotCommandScope
{
    enum uint tlId = 0x6FE1A881;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botCommandScopeChatAdmins`, id 0xB9AA606A.
final class botCommandScopeChatAdmins : BotCommandScope
{
    enum uint tlId = 0xB9AA606A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botCommandScopePeer`, id 0xDB9D897D.
final class botCommandScopePeer : BotCommandScope
{
    enum uint tlId = 0xDB9D897D;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botCommandScopePeerAdmins`, id 0x3FD863D1.
final class botCommandScopePeerAdmins : BotCommandScope
{
    enum uint tlId = 0x3FD863D1;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botCommandScopePeerUser`, id 0x0A1321F3.
final class botCommandScopePeerUser : BotCommandScope
{
    enum uint tlId = 0x0A1321F3;

    InputPeer peer;
    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatTheme`, id 0xC3DFFC04.
final class chatTheme : ChatTheme
{
    enum uint tlId = 0xC3DFFC04;

    string emoticon;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatThemeUniqueGift`, id 0x3458F9C8.
final class chatThemeUniqueGift : ChatTheme
{
    enum uint tlId = 0x3458F9C8;

    StarGift gift;
    Vector!(ThemeSettings) theme_settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sponsoredMessage`, id 0x7DBF8673.
final class sponsoredMessage : SponsoredMessage
{
    enum uint tlId = 0x7DBF8673;

    uint flags;
    bool recommended;
    bool can_report;
    ubyte[] random_id;
    string url;
    string title;
    string message;
    Vector!(MessageEntity) entities;
    Photo photo;
    MessageMedia media;
    PeerColor color;
    string button_text;
    string sponsor_info;
    string additional_info;
    int min_display_duration;
    int max_display_duration;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `searchResultsCalendarPeriod`, id 0xC9B0539F.
final class searchResultsCalendarPeriod : SearchResultsCalendarPeriod
{
    enum uint tlId = 0xC9B0539F;

    int date;
    int min_msg_id;
    int max_msg_id;
    int count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `searchResultPosition`, id 0x7F648B67.
final class searchResultPosition : SearchResultsPosition
{
    enum uint tlId = 0x7F648B67;

    int msg_id;
    int date;
    int offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `reactionCount`, id 0xA3D1CB80.
final class reactionCount : ReactionCount
{
    enum uint tlId = 0xA3D1CB80;

    uint flags;
    int chosen_order;
    Reaction reaction;
    int count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageReactions`, id 0x0A339F0B.
final class messageReactions : MessageReactions
{
    enum uint tlId = 0x0A339F0B;

    uint flags;
    bool min;
    bool can_see_list;
    bool reactions_as_tags;
    Vector!(ReactionCount) results;
    Vector!(MessagePeerReaction) recent_reactions;
    Vector!(MessageReactor) top_reactors;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `availableReaction`, id 0xC077EC01.
final class availableReaction : AvailableReaction
{
    enum uint tlId = 0xC077EC01;

    uint flags;
    bool inactive;
    bool premium;
    string reaction;
    string title;
    Document static_icon;
    Document appear_animation;
    Document select_animation;
    Document activate_animation;
    Document effect_animation;
    Document around_animation;
    Document center_icon;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messagePeerReaction`, id 0x8C79B63C.
final class messagePeerReaction : MessagePeerReaction
{
    enum uint tlId = 0x8C79B63C;

    uint flags;
    bool big;
    bool unread;
    bool my;
    Peer peer_id;
    int date;
    Reaction reaction;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `groupCallStreamChannel`, id 0x80EB48AF.
final class groupCallStreamChannel : GroupCallStreamChannel
{
    enum uint tlId = 0x80EB48AF;

    int channel;
    int scale;
    long last_timestamp_ms;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `attachMenuBotIconColor`, id 0x4576F3F0.
final class attachMenuBotIconColor : AttachMenuBotIconColor
{
    enum uint tlId = 0x4576F3F0;

    string name;
    int color;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `attachMenuBotIcon`, id 0xB2A7386B.
final class attachMenuBotIcon : AttachMenuBotIcon
{
    enum uint tlId = 0xB2A7386B;

    uint flags;
    string name;
    Document icon;
    Vector!(AttachMenuBotIconColor) colors;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `attachMenuBot`, id 0xD90D8DFE.
final class attachMenuBot : AttachMenuBot
{
    enum uint tlId = 0xD90D8DFE;

    uint flags;
    bool inactive;
    bool has_settings;
    bool request_write_access;
    bool show_in_attach_menu;
    bool show_in_side_menu;
    bool side_menu_disclaimer_needed;
    long bot_id;
    string short_name;
    Vector!(AttachMenuPeerType) peer_types;
    Vector!(AttachMenuBotIcon) icons;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `attachMenuBotsNotModified`, id 0xF1D88A5C.
final class attachMenuBotsNotModified : AttachMenuBots
{
    enum uint tlId = 0xF1D88A5C;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `attachMenuBots`, id 0x3C4301C0.
final class attachMenuBots : AttachMenuBots
{
    enum uint tlId = 0x3C4301C0;

    long hash;
    Vector!(AttachMenuBot) bots;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `attachMenuBotsBot`, id 0x93BF667F.
final class attachMenuBotsBot : AttachMenuBotsBot
{
    enum uint tlId = 0x93BF667F;

    AttachMenuBot bot;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webViewResultUrl`, id 0x4D22FF98.
final class webViewResultUrl : WebViewResult
{
    enum uint tlId = 0x4D22FF98;

    uint flags;
    bool fullsize;
    bool fullscreen;
    bool same_origin;
    long query_id;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webViewMessageSent`, id 0x0C94511C.
final class webViewMessageSent : WebViewMessageSent
{
    enum uint tlId = 0x0C94511C;

    uint flags;
    InputBotInlineMessageID msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botMenuButtonDefault`, id 0x7533A588.
final class botMenuButtonDefault : BotMenuButton
{
    enum uint tlId = 0x7533A588;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botMenuButtonCommands`, id 0x4258C205.
final class botMenuButtonCommands : BotMenuButton
{
    enum uint tlId = 0x4258C205;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botMenuButton`, id 0xC7B57CE6.
final class botMenuButton : BotMenuButton
{
    enum uint tlId = 0xC7B57CE6;

    string text;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `notificationSoundDefault`, id 0x97E8BEBE.
final class notificationSoundDefault : NotificationSound
{
    enum uint tlId = 0x97E8BEBE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `notificationSoundNone`, id 0x6F0C34DF.
final class notificationSoundNone : NotificationSound
{
    enum uint tlId = 0x6F0C34DF;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `notificationSoundLocal`, id 0x830B9AE4.
final class notificationSoundLocal : NotificationSound
{
    enum uint tlId = 0x830B9AE4;

    string title;
    string data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `notificationSoundRingtone`, id 0xFF6C8049.
final class notificationSoundRingtone : NotificationSound
{
    enum uint tlId = 0xFF6C8049;

    long id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `attachMenuPeerTypeSameBotPM`, id 0x7D6BE90E.
final class attachMenuPeerTypeSameBotPM : AttachMenuPeerType
{
    enum uint tlId = 0x7D6BE90E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `attachMenuPeerTypeBotPM`, id 0xC32BFA1A.
final class attachMenuPeerTypeBotPM : AttachMenuPeerType
{
    enum uint tlId = 0xC32BFA1A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `attachMenuPeerTypePM`, id 0xF146D31F.
final class attachMenuPeerTypePM : AttachMenuPeerType
{
    enum uint tlId = 0xF146D31F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `attachMenuPeerTypeChat`, id 0x0509113F.
final class attachMenuPeerTypeChat : AttachMenuPeerType
{
    enum uint tlId = 0x0509113F;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `attachMenuPeerTypeBroadcast`, id 0x7BFBDEFC.
final class attachMenuPeerTypeBroadcast : AttachMenuPeerType
{
    enum uint tlId = 0x7BFBDEFC;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoiceMessage`, id 0xC5B56859.
final class inputInvoiceMessage : InputInvoice
{
    enum uint tlId = 0xC5B56859;

    InputPeer peer;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoiceSlug`, id 0xC326CAEF.
final class inputInvoiceSlug : InputInvoice
{
    enum uint tlId = 0xC326CAEF;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoicePremiumGiftCode`, id 0x98986C0D.
final class inputInvoicePremiumGiftCode : InputInvoice
{
    enum uint tlId = 0x98986C0D;

    InputStorePaymentPurpose purpose;
    PremiumGiftCodeOption option;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoiceStars`, id 0x65F00CE3.
final class inputInvoiceStars : InputInvoice
{
    enum uint tlId = 0x65F00CE3;

    InputStorePaymentPurpose purpose;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoiceChatInviteSubscription`, id 0x34E793F1.
final class inputInvoiceChatInviteSubscription : InputInvoice
{
    enum uint tlId = 0x34E793F1;

    string hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoiceStarGift`, id 0xE8625E92.
final class inputInvoiceStarGift : InputInvoice
{
    enum uint tlId = 0xE8625E92;

    uint flags;
    bool hide_name;
    bool include_upgrade;
    InputPeer peer;
    long gift_id;
    TextWithEntities message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoiceStarGiftUpgrade`, id 0x4D818D5D.
final class inputInvoiceStarGiftUpgrade : InputInvoice
{
    enum uint tlId = 0x4D818D5D;

    uint flags;
    bool keep_original_details;
    InputSavedStarGift stargift;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoiceStarGiftTransfer`, id 0x4A5F5BD9.
final class inputInvoiceStarGiftTransfer : InputInvoice
{
    enum uint tlId = 0x4A5F5BD9;

    InputSavedStarGift stargift;
    InputPeer to_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoicePremiumGiftStars`, id 0xDABAB2EF.
final class inputInvoicePremiumGiftStars : InputInvoice
{
    enum uint tlId = 0xDABAB2EF;

    uint flags;
    InputUser user_id;
    int months;
    TextWithEntities message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoiceBusinessBotTransferStars`, id 0xF4997E42.
final class inputInvoiceBusinessBotTransferStars : InputInvoice
{
    enum uint tlId = 0xF4997E42;

    InputUser bot;
    long stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoiceStarGiftResale`, id 0xE9B0C658.
final class inputInvoiceStarGiftResale : InputInvoice
{
    enum uint tlId = 0xE9B0C658;

    uint flags;
    bool ton;
    bool show_name;
    string slug;
    InputPeer to_id;
    TextWithEntities message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoiceStarGiftPrepaidUpgrade`, id 0x9A0B48B8.
final class inputInvoiceStarGiftPrepaidUpgrade : InputInvoice
{
    enum uint tlId = 0x9A0B48B8;

    InputPeer peer;
    string hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoicePremiumAuthCode`, id 0x3E77F614.
final class inputInvoicePremiumAuthCode : InputInvoice
{
    enum uint tlId = 0x3E77F614;

    InputStorePaymentPurpose purpose;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoiceStarGiftDropOriginalDetails`, id 0x0923D8D1.
final class inputInvoiceStarGiftDropOriginalDetails : InputInvoice
{
    enum uint tlId = 0x0923D8D1;

    InputSavedStarGift stargift;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInvoiceStarGiftAuctionBid`, id 0x1ECAFA10.
final class inputInvoiceStarGiftAuctionBid : InputInvoice
{
    enum uint tlId = 0x1ECAFA10;

    uint flags;
    bool hide_name;
    bool update_bid;
    InputPeer peer;
    long gift_id;
    long bid_amount;
    TextWithEntities message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStorePaymentPremiumSubscription`, id 0xA6751E66.
final class inputStorePaymentPremiumSubscription : InputStorePaymentPurpose
{
    enum uint tlId = 0xA6751E66;

    uint flags;
    bool restore;
    bool upgrade;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStorePaymentGiftPremium`, id 0x616F7FE8.
final class inputStorePaymentGiftPremium : InputStorePaymentPurpose
{
    enum uint tlId = 0x616F7FE8;

    InputUser user_id;
    string currency;
    long amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStorePaymentPremiumGiftCode`, id 0xFB790393.
final class inputStorePaymentPremiumGiftCode : InputStorePaymentPurpose
{
    enum uint tlId = 0xFB790393;

    uint flags;
    Vector!(InputUser) users;
    InputPeer boost_peer;
    string currency;
    long amount;
    TextWithEntities message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStorePaymentPremiumGiveaway`, id 0x160544CA.
final class inputStorePaymentPremiumGiveaway : InputStorePaymentPurpose
{
    enum uint tlId = 0x160544CA;

    uint flags;
    bool only_new_subscribers;
    bool winners_are_visible;
    InputPeer boost_peer;
    Vector!(InputPeer) additional_peers;
    Vector!(string) countries_iso2;
    string prize_description;
    long random_id;
    int until_date;
    string currency;
    long amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStorePaymentStarsTopup`, id 0xF9A2A6CB.
final class inputStorePaymentStarsTopup : InputStorePaymentPurpose
{
    enum uint tlId = 0xF9A2A6CB;

    uint flags;
    long stars;
    string currency;
    long amount;
    InputPeer spend_purpose_peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStorePaymentStarsGift`, id 0x1D741EF7.
final class inputStorePaymentStarsGift : InputStorePaymentPurpose
{
    enum uint tlId = 0x1D741EF7;

    InputUser user_id;
    long stars;
    string currency;
    long amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStorePaymentStarsGiveaway`, id 0x751F08FA.
final class inputStorePaymentStarsGiveaway : InputStorePaymentPurpose
{
    enum uint tlId = 0x751F08FA;

    uint flags;
    bool only_new_subscribers;
    bool winners_are_visible;
    long stars;
    InputPeer boost_peer;
    Vector!(InputPeer) additional_peers;
    Vector!(string) countries_iso2;
    string prize_description;
    long random_id;
    int until_date;
    string currency;
    long amount;
    int users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStorePaymentAuthCode`, id 0x3FC18057.
final class inputStorePaymentAuthCode : InputStorePaymentPurpose
{
    enum uint tlId = 0x3FC18057;

    uint flags;
    bool restore;
    string phone_number;
    string phone_code_hash;
    int premium_days;
    string currency;
    long amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `paymentFormMethod`, id 0x88F8F21B.
final class paymentFormMethod : PaymentFormMethod
{
    enum uint tlId = 0x88F8F21B;

    string url;
    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiStatusEmpty`, id 0x2DE11AAE.
final class emojiStatusEmpty : EmojiStatus
{
    enum uint tlId = 0x2DE11AAE;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiStatus`, id 0xE7FF068A.
final class emojiStatus : EmojiStatus
{
    enum uint tlId = 0xE7FF068A;

    uint flags;
    long document_id;
    int until;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiStatusCollectible`, id 0x7184603B.
final class emojiStatusCollectible : EmojiStatus
{
    enum uint tlId = 0x7184603B;

    uint flags;
    long collectible_id;
    long document_id;
    string title;
    string slug;
    long pattern_document_id;
    int center_color;
    int edge_color;
    int pattern_color;
    int text_color;
    int until;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputEmojiStatusCollectible`, id 0x07141DBF.
final class inputEmojiStatusCollectible : EmojiStatus
{
    enum uint tlId = 0x07141DBF;

    uint flags;
    long collectible_id;
    int until;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `reactionEmpty`, id 0x79F5D419.
final class reactionEmpty : Reaction
{
    enum uint tlId = 0x79F5D419;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `reactionEmoji`, id 0x1B2286B8.
final class reactionEmoji : Reaction
{
    enum uint tlId = 0x1B2286B8;

    string emoticon;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `reactionCustomEmoji`, id 0x8935FC73.
final class reactionCustomEmoji : Reaction
{
    enum uint tlId = 0x8935FC73;

    long document_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `reactionPaid`, id 0x523DA4EB.
final class reactionPaid : Reaction
{
    enum uint tlId = 0x523DA4EB;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatReactionsNone`, id 0xEAFC32BC.
final class chatReactionsNone : ChatReactions
{
    enum uint tlId = 0xEAFC32BC;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatReactionsAll`, id 0x52928BCA.
final class chatReactionsAll : ChatReactions
{
    enum uint tlId = 0x52928BCA;

    uint flags;
    bool allow_custom;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `chatReactionsSome`, id 0x661D4037.
final class chatReactionsSome : ChatReactions
{
    enum uint tlId = 0x661D4037;

    Vector!(Reaction) reactions;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emailVerifyPurposeLoginSetup`, id 0x4345BE73.
final class emailVerifyPurposeLoginSetup : EmailVerifyPurpose
{
    enum uint tlId = 0x4345BE73;

    string phone_number;
    string phone_code_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emailVerifyPurposeLoginChange`, id 0x527D22EB.
final class emailVerifyPurposeLoginChange : EmailVerifyPurpose
{
    enum uint tlId = 0x527D22EB;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emailVerifyPurposePassport`, id 0xBBF51685.
final class emailVerifyPurposePassport : EmailVerifyPurpose
{
    enum uint tlId = 0xBBF51685;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emailVerificationCode`, id 0x922E55A9.
final class emailVerificationCode : EmailVerification
{
    enum uint tlId = 0x922E55A9;

    string code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emailVerificationGoogle`, id 0xDB909EC2.
final class emailVerificationGoogle : EmailVerification
{
    enum uint tlId = 0xDB909EC2;

    string token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emailVerificationApple`, id 0x96D074FD.
final class emailVerificationApple : EmailVerification
{
    enum uint tlId = 0x96D074FD;

    string token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `premiumSubscriptionOption`, id 0x5F2D1DF2.
final class premiumSubscriptionOption : PremiumSubscriptionOption
{
    enum uint tlId = 0x5F2D1DF2;

    uint flags;
    bool current;
    bool can_purchase_upgrade;
    string transaction;
    int months;
    string currency;
    long amount;
    string bot_url;
    string store_product;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sendAsPeer`, id 0xB81C7034.
final class sendAsPeer : SendAsPeer
{
    enum uint tlId = 0xB81C7034;

    uint flags;
    bool premium_required;
    Peer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageExtendedMediaPreview`, id 0xAD628CC8.
final class messageExtendedMediaPreview : MessageExtendedMedia
{
    enum uint tlId = 0xAD628CC8;

    uint flags;
    int w;
    int h;
    PhotoSize thumb;
    int video_duration;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageExtendedMedia`, id 0xEE479C64.
final class messageExtendedMedia : MessageExtendedMedia
{
    enum uint tlId = 0xEE479C64;

    MessageMedia media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `stickerKeyword`, id 0xFCFEB29C.
final class stickerKeyword : StickerKeyword
{
    enum uint tlId = 0xFCFEB29C;

    long document_id;
    Vector!(string) keyword;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `username`, id 0xB4073647.
final class username : Username
{
    enum uint tlId = 0xB4073647;

    uint flags;
    bool editable;
    bool active;
    bool deletable;
    bool expired;
    string username;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `forumTopicDeleted`, id 0x023F109B.
final class forumTopicDeleted : ForumTopic
{
    enum uint tlId = 0x023F109B;

    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `forumTopic`, id 0xFCDAD815.
final class forumTopic : ForumTopic
{
    enum uint tlId = 0xFCDAD815;

    uint flags;
    bool my;
    bool closed;
    bool pinned;
    bool short_;
    bool hidden;
    bool title_missing;
    int id;
    int date;
    Peer peer;
    string title;
    int icon_color;
    long icon_emoji_id;
    int top_message;
    int read_inbox_max_id;
    int read_outbox_max_id;
    int unread_count;
    int unread_mentions_count;
    int unread_reactions_count;
    int unread_poll_votes_count;
    Peer from_id;
    PeerNotifySettings notify_settings;
    DraftMessage draft;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `defaultHistoryTTL`, id 0x43B46B20.
final class defaultHistoryTTL : DefaultHistoryTTL
{
    enum uint tlId = 0x43B46B20;

    int period;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `exportedContactToken`, id 0x41BF109B.
final class exportedContactToken : ExportedContactToken
{
    enum uint tlId = 0x41BF109B;

    string url;
    int expires;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `requestPeerTypeUser`, id 0x5F3B8A00.
final class requestPeerTypeUser : RequestPeerType
{
    enum uint tlId = 0x5F3B8A00;

    uint flags;
    bool bot;
    bool premium;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `requestPeerTypeChat`, id 0xC9F06E1B.
final class requestPeerTypeChat : RequestPeerType
{
    enum uint tlId = 0xC9F06E1B;

    uint flags;
    bool creator;
    bool bot_participant;
    bool has_username;
    bool forum;
    ChatAdminRights user_admin_rights;
    ChatAdminRights bot_admin_rights;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `requestPeerTypeBroadcast`, id 0x339BEF6C.
final class requestPeerTypeBroadcast : RequestPeerType
{
    enum uint tlId = 0x339BEF6C;

    uint flags;
    bool creator;
    bool has_username;
    ChatAdminRights user_admin_rights;
    ChatAdminRights bot_admin_rights;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `requestPeerTypeCreateBot`, id 0x3E81E078.
final class requestPeerTypeCreateBot : RequestPeerType
{
    enum uint tlId = 0x3E81E078;

    uint flags;
    bool bot_managed;
    string suggested_name;
    string suggested_username;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiListNotModified`, id 0x481EADFA.
final class emojiListNotModified : EmojiList
{
    enum uint tlId = 0x481EADFA;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiList`, id 0x7A1E11D1.
final class emojiList : EmojiList
{
    enum uint tlId = 0x7A1E11D1;

    long hash;
    Vector!(long) document_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiGroup`, id 0x7A9ABDA9.
final class emojiGroup : EmojiGroup
{
    enum uint tlId = 0x7A9ABDA9;

    string title;
    long icon_emoji_id;
    Vector!(string) emoticons;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiGroupGreeting`, id 0x80D26CC7.
final class emojiGroupGreeting : EmojiGroup
{
    enum uint tlId = 0x80D26CC7;

    string title;
    long icon_emoji_id;
    Vector!(string) emoticons;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `emojiGroupPremium`, id 0x093BCF34.
final class emojiGroupPremium : EmojiGroup
{
    enum uint tlId = 0x093BCF34;

    string title;
    long icon_emoji_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `textWithEntities`, id 0x751F3146.
final class textWithEntities : TextWithEntities
{
    enum uint tlId = 0x751F3146;

    string text;
    Vector!(MessageEntity) entities;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `autoSaveSettings`, id 0xC84834CE.
final class autoSaveSettings : AutoSaveSettings
{
    enum uint tlId = 0xC84834CE;

    uint flags;
    bool photos;
    bool videos;
    long video_max_size;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `autoSaveException`, id 0x81602D47.
final class autoSaveException : AutoSaveException
{
    enum uint tlId = 0x81602D47;

    Peer peer;
    AutoSaveSettings settings;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotAppID`, id 0xA920BD7A.
final class inputBotAppID : InputBotApp
{
    enum uint tlId = 0xA920BD7A;

    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBotAppShortName`, id 0x908C0407.
final class inputBotAppShortName : InputBotApp
{
    enum uint tlId = 0x908C0407;

    InputUser bot_id;
    string short_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botAppNotModified`, id 0x5DA674B7.
final class botAppNotModified : BotApp
{
    enum uint tlId = 0x5DA674B7;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botApp`, id 0x95FCD1D6.
final class botApp : BotApp
{
    enum uint tlId = 0x95FCD1D6;

    uint flags;
    long id;
    long access_hash;
    string short_name;
    string title;
    string description;
    Photo photo;
    Document document;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineBotWebView`, id 0xB57295D5.
final class inlineBotWebView : InlineBotWebView
{
    enum uint tlId = 0xB57295D5;

    string text;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `readParticipantDate`, id 0x4A4FF172.
final class readParticipantDate : ReadParticipantDate
{
    enum uint tlId = 0x4A4FF172;

    long user_id;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputChatlistDialogFilter`, id 0xF3E0DA33.
final class inputChatlistDialogFilter : InputChatlist
{
    enum uint tlId = 0xF3E0DA33;

    int filter_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `exportedChatlistInvite`, id 0x0C5181AC.
final class exportedChatlistInvite : ExportedChatlistInvite
{
    enum uint tlId = 0x0C5181AC;

    uint flags;
    string title;
    string url;
    Vector!(Peer) peers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messagePeerVote`, id 0xB6CC2D5C.
final class messagePeerVote : MessagePeerVote
{
    enum uint tlId = 0xB6CC2D5C;

    Peer peer;
    ubyte[] option;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messagePeerVoteInputOption`, id 0x74CDA504.
final class messagePeerVoteInputOption : MessagePeerVote
{
    enum uint tlId = 0x74CDA504;

    Peer peer;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messagePeerVoteMultiple`, id 0x4628F6E6.
final class messagePeerVoteMultiple : MessagePeerVote
{
    enum uint tlId = 0x4628F6E6;

    Peer peer;
    Vector!(ubyte[]) options;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storyViews`, id 0x8D595CD6.
final class storyViews : StoryViews
{
    enum uint tlId = 0x8D595CD6;

    uint flags;
    bool has_viewers;
    int views_count;
    int forwards_count;
    Vector!(ReactionCount) reactions;
    int reactions_count;
    Vector!(long) recent_viewers;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storyItemDeleted`, id 0x51E6EE4F.
final class storyItemDeleted : StoryItem
{
    enum uint tlId = 0x51E6EE4F;

    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storyItemSkipped`, id 0xFFADC913.
final class storyItemSkipped : StoryItem
{
    enum uint tlId = 0xFFADC913;

    uint flags;
    bool close_friends;
    bool live;
    int id;
    int date;
    int expire_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storyItem`, id 0x16A4B93C.
final class storyItem : StoryItem
{
    enum uint tlId = 0x16A4B93C;

    uint flags;
    bool pinned;
    bool public_;
    bool close_friends;
    bool min;
    bool noforwards;
    bool edited;
    bool contacts;
    bool selected_contacts;
    bool out_;
    int id;
    int date;
    Peer from_id;
    StoryFwdHeader fwd_from;
    int expire_date;
    string caption;
    Vector!(MessageEntity) entities;
    MessageMedia media;
    Vector!(MediaArea) media_areas;
    Vector!(PrivacyRule) privacy;
    StoryViews views;
    Reaction sent_reaction;
    Vector!(int) albums;
    Document music;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storyView`, id 0xB0BDEAC5.
final class storyView : StoryView
{
    enum uint tlId = 0xB0BDEAC5;

    uint flags;
    bool blocked;
    bool blocked_my_stories_from;
    long user_id;
    int date;
    Reaction reaction;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storyViewPublicForward`, id 0x9083670B.
final class storyViewPublicForward : StoryView
{
    enum uint tlId = 0x9083670B;

    uint flags;
    bool blocked;
    bool blocked_my_stories_from;
    Message message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storyViewPublicRepost`, id 0xBD74CF49.
final class storyViewPublicRepost : StoryView
{
    enum uint tlId = 0xBD74CF49;

    uint flags;
    bool blocked;
    bool blocked_my_stories_from;
    Peer peer_id;
    StoryItem story;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReplyToMessage`, id 0x3BD4B7C2.
final class inputReplyToMessage : InputReplyTo
{
    enum uint tlId = 0x3BD4B7C2;

    uint flags;
    int reply_to_msg_id;
    int top_msg_id;
    InputPeer reply_to_peer_id;
    string quote_text;
    Vector!(MessageEntity) quote_entities;
    int quote_offset;
    InputPeer monoforum_peer_id;
    int todo_item_id;
    ubyte[] poll_option;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReplyToStory`, id 0x5881323A.
final class inputReplyToStory : InputReplyTo
{
    enum uint tlId = 0x5881323A;

    InputPeer peer;
    int story_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReplyToMonoForum`, id 0x69D66C45.
final class inputReplyToMonoForum : InputReplyTo
{
    enum uint tlId = 0x69D66C45;

    InputPeer monoforum_peer_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputReplyToEphemeralMessage`, id 0x4119B95E.
final class inputReplyToEphemeralMessage : InputReplyTo
{
    enum uint tlId = 0x4119B95E;

    int id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `exportedStoryLink`, id 0x3FC9053B.
final class exportedStoryLink : ExportedStoryLink
{
    enum uint tlId = 0x3FC9053B;

    string link;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storiesStealthMode`, id 0x712E27FD.
final class storiesStealthMode : StoriesStealthMode
{
    enum uint tlId = 0x712E27FD;

    uint flags;
    int active_until_date;
    int cooldown_until_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `mediaAreaCoordinates`, id 0xCFC9E002.
final class mediaAreaCoordinates : MediaAreaCoordinates
{
    enum uint tlId = 0xCFC9E002;

    uint flags;
    double x;
    double y;
    double w;
    double h;
    double rotation;
    double radius;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `mediaAreaVenue`, id 0xBE82DB9C.
final class mediaAreaVenue : MediaArea
{
    enum uint tlId = 0xBE82DB9C;

    MediaAreaCoordinates coordinates;
    GeoPoint geo;
    string title;
    string address;
    string provider;
    string venue_id;
    string venue_type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaAreaVenue`, id 0xB282217F.
final class inputMediaAreaVenue : MediaArea
{
    enum uint tlId = 0xB282217F;

    MediaAreaCoordinates coordinates;
    long query_id;
    string result_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `mediaAreaGeoPoint`, id 0xCAD5452D.
final class mediaAreaGeoPoint : MediaArea
{
    enum uint tlId = 0xCAD5452D;

    uint flags;
    MediaAreaCoordinates coordinates;
    GeoPoint geo;
    GeoPointAddress address;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `mediaAreaSuggestedReaction`, id 0x14455871.
final class mediaAreaSuggestedReaction : MediaArea
{
    enum uint tlId = 0x14455871;

    uint flags;
    bool dark;
    bool flipped;
    MediaAreaCoordinates coordinates;
    Reaction reaction;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `mediaAreaChannelPost`, id 0x770416AF.
final class mediaAreaChannelPost : MediaArea
{
    enum uint tlId = 0x770416AF;

    MediaAreaCoordinates coordinates;
    long channel_id;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMediaAreaChannelPost`, id 0x2271F2BF.
final class inputMediaAreaChannelPost : MediaArea
{
    enum uint tlId = 0x2271F2BF;

    MediaAreaCoordinates coordinates;
    InputChannel channel;
    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `mediaAreaUrl`, id 0x37381085.
final class mediaAreaUrl : MediaArea
{
    enum uint tlId = 0x37381085;

    MediaAreaCoordinates coordinates;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `mediaAreaWeather`, id 0x49A6549C.
final class mediaAreaWeather : MediaArea
{
    enum uint tlId = 0x49A6549C;

    MediaAreaCoordinates coordinates;
    string emoji;
    double temperature_c;
    int color;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `mediaAreaStarGift`, id 0x5787686D.
final class mediaAreaStarGift : MediaArea
{
    enum uint tlId = 0x5787686D;

    MediaAreaCoordinates coordinates;
    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `peerStories`, id 0x9A35E999.
final class peerStories : PeerStories
{
    enum uint tlId = 0x9A35E999;

    uint flags;
    Peer peer;
    int max_read_id;
    Vector!(StoryItem) stories;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `premiumGiftCodeOption`, id 0x257E962B.
final class premiumGiftCodeOption : PremiumGiftCodeOption
{
    enum uint tlId = 0x257E962B;

    uint flags;
    int users;
    int months;
    string store_product;
    int store_quantity;
    string currency;
    long amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `prepaidGiveaway`, id 0xB2539D54.
final class prepaidGiveaway : PrepaidGiveaway
{
    enum uint tlId = 0xB2539D54;

    long id;
    int months;
    int quantity;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `prepaidStarsGiveaway`, id 0x9A9D77E0.
final class prepaidStarsGiveaway : PrepaidGiveaway
{
    enum uint tlId = 0x9A9D77E0;

    long id;
    long stars;
    int quantity;
    int boosts;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `boost`, id 0x4B3E14D6.
final class boost : Boost
{
    enum uint tlId = 0x4B3E14D6;

    uint flags;
    bool gift;
    bool giveaway;
    bool unclaimed;
    string id;
    long user_id;
    int giveaway_msg_id;
    int date;
    int expires;
    string used_gift_slug;
    int multiplier;
    long stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `myBoost`, id 0xC448415C.
final class myBoost : MyBoost
{
    enum uint tlId = 0xC448415C;

    uint flags;
    int slot;
    Peer peer;
    int date;
    int expires;
    int cooldown_until_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storyFwdHeader`, id 0xB826E150.
final class storyFwdHeader : StoryFwdHeader
{
    enum uint tlId = 0xB826E150;

    uint flags;
    bool modified;
    Peer from;
    string from_name;
    int story_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `postInteractionCountersMessage`, id 0xE7058E7F.
final class postInteractionCountersMessage : PostInteractionCounters
{
    enum uint tlId = 0xE7058E7F;

    int msg_id;
    int views;
    int forwards;
    int reactions;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `postInteractionCountersStory`, id 0x8A480E27.
final class postInteractionCountersStory : PostInteractionCounters
{
    enum uint tlId = 0x8A480E27;

    int story_id;
    int views;
    int forwards;
    int reactions;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `publicForwardMessage`, id 0x01F2BF4A.
final class publicForwardMessage : PublicForward
{
    enum uint tlId = 0x01F2BF4A;

    Message message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `publicForwardStory`, id 0xEDF3ADD0.
final class publicForwardStory : PublicForward
{
    enum uint tlId = 0xEDF3ADD0;

    Peer peer;
    StoryItem story;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `peerColor`, id 0xB54B5ACF.
final class peerColor : PeerColor
{
    enum uint tlId = 0xB54B5ACF;

    uint flags;
    int color;
    long background_emoji_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `peerColorCollectible`, id 0xB9C0639A.
final class peerColorCollectible : PeerColor
{
    enum uint tlId = 0xB9C0639A;

    uint flags;
    long collectible_id;
    long gift_emoji_id;
    long background_emoji_id;
    int accent_color;
    Vector!(int) colors;
    int dark_accent_color;
    Vector!(int) dark_colors;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPeerColorCollectible`, id 0xB8EA86A9.
final class inputPeerColorCollectible : PeerColor
{
    enum uint tlId = 0xB8EA86A9;

    long collectible_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storyReaction`, id 0x6090D6D5.
final class storyReaction : StoryReaction
{
    enum uint tlId = 0x6090D6D5;

    Peer peer_id;
    int date;
    Reaction reaction;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storyReactionPublicForward`, id 0xBBAB2643.
final class storyReactionPublicForward : StoryReaction
{
    enum uint tlId = 0xBBAB2643;

    Message message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storyReactionPublicRepost`, id 0xCFCD0F13.
final class storyReactionPublicRepost : StoryReaction
{
    enum uint tlId = 0xCFCD0F13;

    Peer peer_id;
    StoryItem story;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `savedDialog`, id 0xBD87CB6C.
final class savedDialog : SavedDialog
{
    enum uint tlId = 0xBD87CB6C;

    uint flags;
    bool pinned;
    Peer peer;
    int top_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `monoForumDialog`, id 0x64407EA7.
final class monoForumDialog : SavedDialog
{
    enum uint tlId = 0x64407EA7;

    uint flags;
    bool unread_mark;
    bool nopaid_messages_exception;
    Peer peer;
    int top_message;
    int read_inbox_max_id;
    int read_outbox_max_id;
    int unread_count;
    int unread_reactions_count;
    DraftMessage draft;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `savedReactionTag`, id 0xCB6FF828.
final class savedReactionTag : SavedReactionTag
{
    enum uint tlId = 0xCB6FF828;

    uint flags;
    Reaction reaction;
    string title;
    int count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `outboxReadDate`, id 0x3BB842AC.
final class outboxReadDate : OutboxReadDate
{
    enum uint tlId = 0x3BB842AC;

    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `smsJob`, id 0xE6A1EEB8.
final class smsJob : SmsJob
{
    enum uint tlId = 0xE6A1EEB8;

    string job_id;
    string phone_number;
    string text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessWeeklyOpen`, id 0x120B1AB9.
final class businessWeeklyOpen : BusinessWeeklyOpen
{
    enum uint tlId = 0x120B1AB9;

    int start_minute;
    int end_minute;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessWorkHours`, id 0x8C92B098.
final class businessWorkHours : BusinessWorkHours
{
    enum uint tlId = 0x8C92B098;

    uint flags;
    bool open_now;
    string timezone_id;
    Vector!(BusinessWeeklyOpen) weekly_open;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessLocation`, id 0xAC5C1AF7.
final class businessLocation : BusinessLocation
{
    enum uint tlId = 0xAC5C1AF7;

    uint flags;
    GeoPoint geo_point;
    string address;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBusinessRecipients`, id 0x6F8B32AA.
final class inputBusinessRecipients : InputBusinessRecipients
{
    enum uint tlId = 0x6F8B32AA;

    uint flags;
    bool existing_chats;
    bool new_chats;
    bool contacts;
    bool non_contacts;
    bool exclude_selected;
    Vector!(InputUser) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessRecipients`, id 0x21108FF7.
final class businessRecipients : BusinessRecipients
{
    enum uint tlId = 0x21108FF7;

    uint flags;
    bool existing_chats;
    bool new_chats;
    bool contacts;
    bool non_contacts;
    bool exclude_selected;
    Vector!(long) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessAwayMessageScheduleAlways`, id 0xC9B9E2B9.
final class businessAwayMessageScheduleAlways : BusinessAwayMessageSchedule
{
    enum uint tlId = 0xC9B9E2B9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessAwayMessageScheduleOutsideWorkHours`, id 0xC3F2F501.
final class businessAwayMessageScheduleOutsideWorkHours : BusinessAwayMessageSchedule
{
    enum uint tlId = 0xC3F2F501;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessAwayMessageScheduleCustom`, id 0xCC4D9ECC.
final class businessAwayMessageScheduleCustom : BusinessAwayMessageSchedule
{
    enum uint tlId = 0xCC4D9ECC;

    int start_date;
    int end_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBusinessGreetingMessage`, id 0x0194CB3B.
final class inputBusinessGreetingMessage : InputBusinessGreetingMessage
{
    enum uint tlId = 0x0194CB3B;

    int shortcut_id;
    InputBusinessRecipients recipients;
    int no_activity_days;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessGreetingMessage`, id 0xE519ABAB.
final class businessGreetingMessage : BusinessGreetingMessage
{
    enum uint tlId = 0xE519ABAB;

    int shortcut_id;
    BusinessRecipients recipients;
    int no_activity_days;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBusinessAwayMessage`, id 0x832175E0.
final class inputBusinessAwayMessage : InputBusinessAwayMessage
{
    enum uint tlId = 0x832175E0;

    uint flags;
    bool offline_only;
    int shortcut_id;
    BusinessAwayMessageSchedule schedule;
    InputBusinessRecipients recipients;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessAwayMessage`, id 0xEF156A5C.
final class businessAwayMessage : BusinessAwayMessage
{
    enum uint tlId = 0xEF156A5C;

    uint flags;
    bool offline_only;
    int shortcut_id;
    BusinessAwayMessageSchedule schedule;
    BusinessRecipients recipients;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `timezone`, id 0xFF9289F5.
final class timezone : Timezone
{
    enum uint tlId = 0xFF9289F5;

    string id;
    string name;
    int utc_offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `quickReply`, id 0x0697102B.
final class quickReply : QuickReply
{
    enum uint tlId = 0x0697102B;

    int shortcut_id;
    string shortcut;
    int top_message;
    int count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputQuickReplyShortcut`, id 0x24596D41.
final class inputQuickReplyShortcut : InputQuickReplyShortcut
{
    enum uint tlId = 0x24596D41;

    string shortcut;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputQuickReplyShortcutId`, id 0x01190CF1.
final class inputQuickReplyShortcutId : InputQuickReplyShortcut
{
    enum uint tlId = 0x01190CF1;

    int shortcut_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `connectedBot`, id 0x033ED001.
final class connectedBot : ConnectedBot
{
    enum uint tlId = 0x033ED001;

    uint flags;
    long bot_id;
    BusinessBotRecipients recipients;
    BusinessBotRights rights;
    string device;
    int date;
    string location;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `birthday`, id 0x6C8E1E06.
final class birthday : Birthday
{
    enum uint tlId = 0x6C8E1E06;

    uint flags;
    int day;
    int month;
    int year;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botBusinessConnection`, id 0x8F34B2F5.
final class botBusinessConnection : BotBusinessConnection
{
    enum uint tlId = 0x8F34B2F5;

    uint flags;
    bool disabled;
    string connection_id;
    long user_id;
    int dc_id;
    int date;
    BusinessBotRights rights;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBusinessIntro`, id 0x09C469CD.
final class inputBusinessIntro : InputBusinessIntro
{
    enum uint tlId = 0x09C469CD;

    uint flags;
    string title;
    string description;
    InputDocument sticker;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessIntro`, id 0x5A0A066D.
final class businessIntro : BusinessIntro
{
    enum uint tlId = 0x5A0A066D;

    uint flags;
    string title;
    string description;
    Document sticker;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputCollectibleUsername`, id 0xE39460A9.
final class inputCollectibleUsername : InputCollectible
{
    enum uint tlId = 0xE39460A9;

    string username;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputCollectiblePhone`, id 0xA2E214A4.
final class inputCollectiblePhone : InputCollectible
{
    enum uint tlId = 0xA2E214A4;

    string phone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBusinessBotRecipients`, id 0xC4E5921E.
final class inputBusinessBotRecipients : InputBusinessBotRecipients
{
    enum uint tlId = 0xC4E5921E;

    uint flags;
    bool existing_chats;
    bool new_chats;
    bool contacts;
    bool non_contacts;
    bool exclude_selected;
    Vector!(InputUser) users;
    Vector!(InputUser) exclude_users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessBotRecipients`, id 0xB88CF373.
final class businessBotRecipients : BusinessBotRecipients
{
    enum uint tlId = 0xB88CF373;

    uint flags;
    bool existing_chats;
    bool new_chats;
    bool contacts;
    bool non_contacts;
    bool exclude_selected;
    Vector!(long) users;
    Vector!(long) exclude_users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `contactBirthday`, id 0x1D998733.
final class contactBirthday : ContactBirthday
{
    enum uint tlId = 0x1D998733;

    long contact_id;
    Birthday birthday;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `missingInvitee`, id 0x628C9224.
final class missingInvitee : MissingInvitee
{
    enum uint tlId = 0x628C9224;

    uint flags;
    bool premium_would_allow_invite;
    bool premium_required_for_pm;
    long user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputBusinessChatLink`, id 0x11679FA7.
final class inputBusinessChatLink : InputBusinessChatLink
{
    enum uint tlId = 0x11679FA7;

    uint flags;
    string message;
    Vector!(MessageEntity) entities;
    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessChatLink`, id 0xB4AE666F.
final class businessChatLink : BusinessChatLink
{
    enum uint tlId = 0xB4AE666F;

    uint flags;
    string link;
    string message;
    Vector!(MessageEntity) entities;
    string title;
    int views;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `requestedPeerUser`, id 0xD62FF46A.
final class requestedPeerUser : RequestedPeer
{
    enum uint tlId = 0xD62FF46A;

    uint flags;
    long user_id;
    string first_name;
    string last_name;
    string username;
    Photo photo;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `requestedPeerChat`, id 0x7307544F.
final class requestedPeerChat : RequestedPeer
{
    enum uint tlId = 0x7307544F;

    uint flags;
    long chat_id;
    string title;
    Photo photo;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `requestedPeerChannel`, id 0x8BA403E4.
final class requestedPeerChannel : RequestedPeer
{
    enum uint tlId = 0x8BA403E4;

    uint flags;
    long channel_id;
    string title;
    string username;
    Photo photo;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sponsoredMessageReportOption`, id 0x430D3150.
final class sponsoredMessageReportOption : SponsoredMessageReportOption
{
    enum uint tlId = 0x430D3150;

    string text;
    ubyte[] option;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `reactionNotificationsFromContacts`, id 0xBAC3A61A.
final class reactionNotificationsFromContacts : ReactionNotificationsFrom
{
    enum uint tlId = 0xBAC3A61A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `reactionNotificationsFromAll`, id 0x4B9E22A0.
final class reactionNotificationsFromAll : ReactionNotificationsFrom
{
    enum uint tlId = 0x4B9E22A0;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `reactionsNotifySettings`, id 0x71E4EA58.
final class reactionsNotifySettings : ReactionsNotifySettings
{
    enum uint tlId = 0x71E4EA58;

    uint flags;
    ReactionNotificationsFrom messages_notify_from;
    ReactionNotificationsFrom stories_notify_from;
    ReactionNotificationsFrom poll_votes_notify_from;
    NotificationSound sound;
    bool show_previews;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `availableEffect`, id 0x93C3E27E.
final class availableEffect : AvailableEffect
{
    enum uint tlId = 0x93C3E27E;

    uint flags;
    bool premium_required;
    long id;
    string emoticon;
    long static_icon_id;
    long effect_sticker_id;
    long effect_animation_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `factCheck`, id 0xB89BFCCF.
final class factCheck : FactCheck
{
    enum uint tlId = 0xB89BFCCF;

    uint flags;
    bool need_check;
    string country;
    TextWithEntities text;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsTransactionPeerUnsupported`, id 0x95F2BFE4.
final class starsTransactionPeerUnsupported : StarsTransactionPeer
{
    enum uint tlId = 0x95F2BFE4;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsTransactionPeerAppStore`, id 0xB457B375.
final class starsTransactionPeerAppStore : StarsTransactionPeer
{
    enum uint tlId = 0xB457B375;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsTransactionPeerPlayMarket`, id 0x7B560A0B.
final class starsTransactionPeerPlayMarket : StarsTransactionPeer
{
    enum uint tlId = 0x7B560A0B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsTransactionPeerPremiumBot`, id 0x250DBAF8.
final class starsTransactionPeerPremiumBot : StarsTransactionPeer
{
    enum uint tlId = 0x250DBAF8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsTransactionPeerFragment`, id 0xE92FD902.
final class starsTransactionPeerFragment : StarsTransactionPeer
{
    enum uint tlId = 0xE92FD902;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsTransactionPeer`, id 0xD80DA15D.
final class starsTransactionPeer : StarsTransactionPeer
{
    enum uint tlId = 0xD80DA15D;

    Peer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsTransactionPeerAds`, id 0x60682812.
final class starsTransactionPeerAds : StarsTransactionPeer
{
    enum uint tlId = 0x60682812;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsTransactionPeerAPI`, id 0xF9677AAD.
final class starsTransactionPeerAPI : StarsTransactionPeer
{
    enum uint tlId = 0xF9677AAD;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsTopupOption`, id 0x0BD915C0.
final class starsTopupOption : StarsTopupOption
{
    enum uint tlId = 0x0BD915C0;

    uint flags;
    bool extended;
    long stars;
    string store_product;
    string currency;
    long amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsTransaction`, id 0x13659EB0.
final class starsTransaction : StarsTransaction
{
    enum uint tlId = 0x13659EB0;

    uint flags;
    bool refund;
    bool pending;
    bool failed;
    bool gift;
    bool reaction;
    bool stargift_upgrade;
    bool business_transfer;
    bool stargift_resale;
    bool posts_search;
    bool stargift_prepaid_upgrade;
    bool stargift_drop_original_details;
    bool phonegroup_message;
    bool stargift_auction_bid;
    bool offer;
    string id;
    StarsAmount amount;
    int date;
    StarsTransactionPeer peer;
    string title;
    string description;
    WebDocument photo;
    int transaction_date;
    string transaction_url;
    ubyte[] bot_payload;
    int msg_id;
    Vector!(MessageMedia) extended_media;
    int subscription_period;
    int giveaway_post_id;
    StarGift stargift;
    int floodskip_number;
    int starref_commission_permille;
    Peer starref_peer;
    StarsAmount starref_amount;
    int paid_messages;
    int premium_gift_months;
    int ads_proceeds_from_date;
    int ads_proceeds_to_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `foundStory`, id 0xE87ACBC0.
final class foundStory : FoundStory
{
    enum uint tlId = 0xE87ACBC0;

    Peer peer;
    StoryItem story;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `geoPointAddress`, id 0xDE4C5D93.
final class geoPointAddress : GeoPointAddress
{
    enum uint tlId = 0xDE4C5D93;

    uint flags;
    string country_iso2;
    string state;
    string city;
    string street;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsRevenueStatus`, id 0xFEBE5491.
final class starsRevenueStatus : StarsRevenueStatus
{
    enum uint tlId = 0xFEBE5491;

    uint flags;
    bool withdrawal_enabled;
    StarsAmount current_balance;
    StarsAmount available_balance;
    StarsAmount overall_revenue;
    int next_withdrawal_at;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStarsTransaction`, id 0x206AE6D1.
final class inputStarsTransaction : InputStarsTransaction
{
    enum uint tlId = 0x206AE6D1;

    uint flags;
    bool refund;
    string id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsGiftOption`, id 0x5E0589F1.
final class starsGiftOption : StarsGiftOption
{
    enum uint tlId = 0x5E0589F1;

    uint flags;
    bool extended;
    long stars;
    string store_product;
    string currency;
    long amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botPreviewMedia`, id 0x23E91BA3.
final class botPreviewMedia : BotPreviewMedia
{
    enum uint tlId = 0x23E91BA3;

    int date;
    MessageMedia media;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsSubscriptionPricing`, id 0x05416D58.
final class starsSubscriptionPricing : StarsSubscriptionPricing
{
    enum uint tlId = 0x05416D58;

    int period;
    long amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsSubscription`, id 0x2E6EAB1A.
final class starsSubscription : StarsSubscription
{
    enum uint tlId = 0x2E6EAB1A;

    uint flags;
    bool canceled;
    bool can_refulfill;
    bool missing_balance;
    bool bot_canceled;
    string id;
    Peer peer;
    int until_date;
    StarsSubscriptionPricing pricing;
    string chat_invite_hash;
    string title;
    WebDocument photo;
    string invoice_slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageReactor`, id 0x4BA3A95A.
final class messageReactor : MessageReactor
{
    enum uint tlId = 0x4BA3A95A;

    uint flags;
    bool top;
    bool my;
    bool anonymous;
    Peer peer_id;
    int count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsGiveawayOption`, id 0x94CE852A.
final class starsGiveawayOption : StarsGiveawayOption
{
    enum uint tlId = 0x94CE852A;

    uint flags;
    bool extended;
    bool default_;
    long stars;
    int yearly_boosts;
    string store_product;
    string currency;
    long amount;
    Vector!(StarsGiveawayWinnersOption) winners;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsGiveawayWinnersOption`, id 0x54236209.
final class starsGiveawayWinnersOption : StarsGiveawayWinnersOption
{
    enum uint tlId = 0x54236209;

    uint flags;
    bool default_;
    int users;
    long per_user_stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGift`, id 0x313A9547.
final class starGift : StarGift
{
    enum uint tlId = 0x313A9547;

    uint flags;
    bool limited;
    bool sold_out;
    bool birthday;
    bool require_premium;
    bool limited_per_user;
    bool peer_color_available;
    bool auction;
    long id;
    Document sticker;
    long stars;
    int availability_remains;
    int availability_total;
    long availability_resale;
    long convert_stars;
    int first_sale_date;
    int last_sale_date;
    long upgrade_stars;
    long resell_min_stars;
    string title;
    Peer released_by;
    int per_user_total;
    int per_user_remains;
    int locked_until_date;
    string auction_slug;
    int gifts_per_round;
    int auction_start_date;
    int upgrade_variants;
    StarGiftBackground background;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftUnique`, id 0x85F0A9CD.
final class starGiftUnique : StarGift
{
    enum uint tlId = 0x85F0A9CD;

    uint flags;
    bool require_premium;
    bool resale_ton_only;
    bool theme_available;
    bool burned;
    bool crafted;
    long id;
    long gift_id;
    string title;
    string slug;
    int num;
    Peer owner_id;
    string owner_name;
    string owner_address;
    Vector!(StarGiftAttribute) attributes;
    int availability_issued;
    int availability_total;
    string gift_address;
    Vector!(StarsAmount) resell_amount;
    Peer released_by;
    long value_amount;
    string value_currency;
    long value_usd_amount;
    Peer theme_peer;
    PeerColor peer_color;
    Peer host_id;
    int offer_min_stars;
    int craft_chance_permille;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `messageReportOption`, id 0x7903E3D9.
final class messageReportOption : MessageReportOption
{
    enum uint tlId = 0x7903E3D9;

    string text;
    ubyte[] option;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `reportResultChooseOption`, id 0xF0E4E0B6.
final class reportResultChooseOption : ReportResult
{
    enum uint tlId = 0xF0E4E0B6;

    string title;
    Vector!(MessageReportOption) options;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `reportResultAddComment`, id 0x6F09AC31.
final class reportResultAddComment : ReportResult
{
    enum uint tlId = 0x6F09AC31;

    uint flags;
    bool optional;
    ubyte[] option;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `reportResultReported`, id 0x8DB33C4B.
final class reportResultReported : ReportResult
{
    enum uint tlId = 0x8DB33C4B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botAppSettings`, id 0xC99B1950.
final class botAppSettings : BotAppSettings
{
    enum uint tlId = 0xC99B1950;

    uint flags;
    ubyte[] placeholder_path;
    int background_color;
    int background_dark_color;
    int header_color;
    int header_dark_color;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starRefProgram`, id 0xDD0C66F2.
final class starRefProgram : StarRefProgram
{
    enum uint tlId = 0xDD0C66F2;

    uint flags;
    long bot_id;
    int commission_permille;
    int duration_months;
    int end_date;
    StarsAmount daily_revenue_per_user;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `connectedBotStarRef`, id 0x19A13F71.
final class connectedBotStarRef : ConnectedBotStarRef
{
    enum uint tlId = 0x19A13F71;

    uint flags;
    bool revoked;
    string url;
    int date;
    long bot_id;
    int commission_permille;
    int duration_months;
    long participants;
    long revenue;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsAmount`, id 0xBBB6B4A3.
final class starsAmount : StarsAmount
{
    enum uint tlId = 0xBBB6B4A3;

    long amount;
    int nanos;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsTonAmount`, id 0x74AEE3E0.
final class starsTonAmount : StarsAmount
{
    enum uint tlId = 0x74AEE3E0;

    long amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botVerifierSettings`, id 0xA12AEFFF.
final class botVerifierSettings : BotVerifierSettings
{
    enum uint tlId = 0xA12AEFFF;

    uint flags;
    bool can_modify_custom_description;
    long icon;
    string company;
    TextWithEntities custom_description;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `botVerification`, id 0xF72E0ED9.
final class botVerification : BotVerification
{
    enum uint tlId = 0xF72E0ED9;

    long bot_id;
    long icon;
    TextWithEntities description;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributeModel`, id 0x565251E2.
final class starGiftAttributeModel : StarGiftAttribute
{
    enum uint tlId = 0x565251E2;

    uint flags;
    bool crafted;
    string name;
    Document document;
    StarGiftAttributeRarity rarity;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributePattern`, id 0x4E7085EA.
final class starGiftAttributePattern : StarGiftAttribute
{
    enum uint tlId = 0x4E7085EA;

    string name;
    Document document;
    StarGiftAttributeRarity rarity;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributeBackdrop`, id 0x9F2504E4.
final class starGiftAttributeBackdrop : StarGiftAttribute
{
    enum uint tlId = 0x9F2504E4;

    string name;
    int backdrop_id;
    int center_color;
    int edge_color;
    int pattern_color;
    int text_color;
    StarGiftAttributeRarity rarity;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributeOriginalDetails`, id 0xE0BFF26C.
final class starGiftAttributeOriginalDetails : StarGiftAttribute
{
    enum uint tlId = 0xE0BFF26C;

    uint flags;
    Peer sender_id;
    Peer recipient_id;
    int date;
    TextWithEntities message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `savedStarGift`, id 0x41DF43FC.
final class savedStarGift : SavedStarGift
{
    enum uint tlId = 0x41DF43FC;

    uint flags;
    bool name_hidden;
    bool unsaved;
    bool refunded;
    bool can_upgrade;
    bool pinned_to_top;
    bool upgrade_separate;
    Peer from_id;
    int date;
    StarGift gift;
    TextWithEntities message;
    int msg_id;
    long saved_id;
    long convert_stars;
    long upgrade_stars;
    int can_export_at;
    long transfer_stars;
    int can_transfer_at;
    int can_resell_at;
    Vector!(int) collection_id;
    string prepaid_upgrade_hash;
    long drop_original_details_stars;
    int gift_num;
    int can_craft_at;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputSavedStarGiftUser`, id 0x69279795.
final class inputSavedStarGiftUser : InputSavedStarGift
{
    enum uint tlId = 0x69279795;

    int msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputSavedStarGiftChat`, id 0xF101AA7F.
final class inputSavedStarGiftChat : InputSavedStarGift
{
    enum uint tlId = 0xF101AA7F;

    InputPeer peer;
    long saved_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputSavedStarGiftSlug`, id 0x2085C238.
final class inputSavedStarGiftSlug : InputSavedStarGift
{
    enum uint tlId = 0x2085C238;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `paidReactionPrivacyDefault`, id 0x206AD49E.
final class paidReactionPrivacyDefault : PaidReactionPrivacy
{
    enum uint tlId = 0x206AD49E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `paidReactionPrivacyAnonymous`, id 0x1F0C1AD9.
final class paidReactionPrivacyAnonymous : PaidReactionPrivacy
{
    enum uint tlId = 0x1F0C1AD9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `paidReactionPrivacyPeer`, id 0xDC6CFCF0.
final class paidReactionPrivacyPeer : PaidReactionPrivacy
{
    enum uint tlId = 0xDC6CFCF0;

    InputPeer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `requirementToContactEmpty`, id 0x050A9839.
final class requirementToContactEmpty : RequirementToContact
{
    enum uint tlId = 0x050A9839;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `requirementToContactPremium`, id 0xE581E4E9.
final class requirementToContactPremium : RequirementToContact
{
    enum uint tlId = 0xE581E4E9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `requirementToContactPaidMessages`, id 0xB4F67E93.
final class requirementToContactPaidMessages : RequirementToContact
{
    enum uint tlId = 0xB4F67E93;

    long stars_amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `businessBotRights`, id 0xA0624CF7.
final class businessBotRights : BusinessBotRights
{
    enum uint tlId = 0xA0624CF7;

    uint flags;
    bool reply;
    bool read_messages;
    bool delete_sent_messages;
    bool delete_received_messages;
    bool edit_name;
    bool edit_bio;
    bool edit_profile_photo;
    bool edit_username;
    bool view_gifts;
    bool sell_gifts;
    bool change_gift_settings;
    bool transfer_and_upgrade_gifts;
    bool transfer_stars;
    bool manage_stories;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `disallowedGiftsSettings`, id 0x71F276C4.
final class disallowedGiftsSettings : DisallowedGiftsSettings
{
    enum uint tlId = 0x71F276C4;

    uint flags;
    bool disallow_unlimited_stargifts;
    bool disallow_limited_stargifts;
    bool disallow_unique_stargifts;
    bool disallow_premium_gifts;
    bool disallow_stargifts_from_channels;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `sponsoredPeer`, id 0xC69708D3.
final class sponsoredPeer : SponsoredPeer
{
    enum uint tlId = 0xC69708D3;

    uint flags;
    ubyte[] random_id;
    Peer peer;
    string sponsor_info;
    string additional_info;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributeIdModel`, id 0x48AAAE3C.
final class starGiftAttributeIdModel : StarGiftAttributeId
{
    enum uint tlId = 0x48AAAE3C;

    long document_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributeIdPattern`, id 0x4A162433.
final class starGiftAttributeIdPattern : StarGiftAttributeId
{
    enum uint tlId = 0x4A162433;

    long document_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributeIdBackdrop`, id 0x1F01C757.
final class starGiftAttributeIdBackdrop : StarGiftAttributeId
{
    enum uint tlId = 0x1F01C757;

    int backdrop_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributeCounter`, id 0x2EB1B658.
final class starGiftAttributeCounter : StarGiftAttributeCounter
{
    enum uint tlId = 0x2EB1B658;

    StarGiftAttributeId attribute;
    int count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pendingSuggestion`, id 0xE7E82E12.
final class pendingSuggestion : PendingSuggestion
{
    enum uint tlId = 0xE7E82E12;

    string suggestion;
    TextWithEntities title;
    TextWithEntities description;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `todoItem`, id 0xCBA9A52F.
final class todoItem : TodoItem
{
    enum uint tlId = 0xCBA9A52F;

    int id;
    TextWithEntities title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `todoList`, id 0x49B92A26.
final class todoList : TodoList
{
    enum uint tlId = 0x49B92A26;

    uint flags;
    bool others_can_append;
    bool others_can_complete;
    TextWithEntities title;
    Vector!(TodoItem) list;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `todoCompletion`, id 0x221BB5E4.
final class todoCompletion : TodoCompletion
{
    enum uint tlId = 0x221BB5E4;

    int id;
    Peer completed_by;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `suggestedPost`, id 0x0E8E37E5.
final class suggestedPost : SuggestedPost
{
    enum uint tlId = 0x0E8E37E5;

    uint flags;
    bool accepted;
    bool rejected;
    StarsAmount price;
    int schedule_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starsRating`, id 0x1B0E4F07.
final class starsRating : StarsRating
{
    enum uint tlId = 0x1B0E4F07;

    uint flags;
    int level;
    long current_level_stars;
    long stars;
    long next_level_stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftCollection`, id 0x9D6B13B0.
final class starGiftCollection : StarGiftCollection
{
    enum uint tlId = 0x9D6B13B0;

    uint flags;
    int collection_id;
    string title;
    Document icon;
    int gifts_count;
    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `storyAlbum`, id 0x9325705A.
final class storyAlbum : StoryAlbum
{
    enum uint tlId = 0x9325705A;

    uint flags;
    int album_id;
    string title;
    Photo icon_photo;
    Document icon_video;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `searchPostsFlood`, id 0x3E0B5B6A.
final class searchPostsFlood : SearchPostsFlood
{
    enum uint tlId = 0x3E0B5B6A;

    uint flags;
    bool query_is_free;
    int total_daily;
    int remains;
    int wait_till;
    long stars_amount;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `profileTabPosts`, id 0xB98CD696.
final class profileTabPosts : ProfileTab
{
    enum uint tlId = 0xB98CD696;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `profileTabGifts`, id 0x4D4BD46A.
final class profileTabGifts : ProfileTab
{
    enum uint tlId = 0x4D4BD46A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `profileTabMedia`, id 0x72C64955.
final class profileTabMedia : ProfileTab
{
    enum uint tlId = 0x72C64955;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `profileTabFiles`, id 0xAB339C00.
final class profileTabFiles : ProfileTab
{
    enum uint tlId = 0xAB339C00;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `profileTabMusic`, id 0x9F27D26E.
final class profileTabMusic : ProfileTab
{
    enum uint tlId = 0x9F27D26E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `profileTabVoice`, id 0xE477092E.
final class profileTabVoice : ProfileTab
{
    enum uint tlId = 0xE477092E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `profileTabLinks`, id 0xD3656499.
final class profileTabLinks : ProfileTab
{
    enum uint tlId = 0xD3656499;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `profileTabGifs`, id 0xA2C0F695.
final class profileTabGifs : ProfileTab
{
    enum uint tlId = 0xA2C0F695;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputChatThemeEmpty`, id 0x83268483.
final class inputChatThemeEmpty : InputChatTheme
{
    enum uint tlId = 0x83268483;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputChatTheme`, id 0xC93DE95C.
final class inputChatTheme : InputChatTheme
{
    enum uint tlId = 0xC93DE95C;

    string emoticon;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputChatThemeUniqueGift`, id 0x87E5DFE4.
final class inputChatThemeUniqueGift : InputChatTheme
{
    enum uint tlId = 0x87E5DFE4;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftUpgradePrice`, id 0x99EA331D.
final class starGiftUpgradePrice : StarGiftUpgradePrice
{
    enum uint tlId = 0x99EA331D;

    int date;
    long upgrade_stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `groupCallMessage`, id 0x1A8AFC7E.
final class groupCallMessage : GroupCallMessage
{
    enum uint tlId = 0x1A8AFC7E;

    uint flags;
    bool from_admin;
    int id;
    Peer from_id;
    int date;
    TextWithEntities message;
    long paid_message_stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `groupCallDonor`, id 0xEE430C85.
final class groupCallDonor : GroupCallDonor
{
    enum uint tlId = 0xEE430C85;

    uint flags;
    bool top;
    bool my;
    Peer peer_id;
    long stars;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `recentStory`, id 0x711D692D.
final class recentStory : RecentStory
{
    enum uint tlId = 0x711D692D;

    uint flags;
    bool live;
    int max_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `auctionBidLevel`, id 0x310240CC.
final class auctionBidLevel : AuctionBidLevel
{
    enum uint tlId = 0x310240CC;

    int pos;
    long amount;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAuctionStateNotModified`, id 0xFE333952.
final class starGiftAuctionStateNotModified : StarGiftAuctionState
{
    enum uint tlId = 0xFE333952;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAuctionState`, id 0x771A4E66.
final class starGiftAuctionState : StarGiftAuctionState
{
    enum uint tlId = 0x771A4E66;

    int version_;
    int start_date;
    int end_date;
    long min_bid_amount;
    Vector!(AuctionBidLevel) bid_levels;
    Vector!(long) top_bidders;
    int next_round_at;
    int last_gift_num;
    int gifts_left;
    int current_round;
    int total_rounds;
    Vector!(StarGiftAuctionRound) rounds;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAuctionStateFinished`, id 0x972DABBF.
final class starGiftAuctionStateFinished : StarGiftAuctionState
{
    enum uint tlId = 0x972DABBF;

    uint flags;
    int start_date;
    int end_date;
    long average_price;
    int listed_count;
    int fragment_listed_count;
    string fragment_listed_url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAuctionUserState`, id 0x2EEED1C4.
final class starGiftAuctionUserState : StarGiftAuctionUserState
{
    enum uint tlId = 0x2EEED1C4;

    uint flags;
    bool returned;
    long bid_amount;
    int bid_date;
    long min_bid_amount;
    Peer bid_peer;
    int acquired_count;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAuctionAcquiredGift`, id 0x42B00348.
final class starGiftAuctionAcquiredGift : StarGiftAuctionAcquiredGift
{
    enum uint tlId = 0x42B00348;

    uint flags;
    bool name_hidden;
    Peer peer;
    int date;
    long bid_amount;
    int round;
    int pos;
    TextWithEntities message;
    int gift_num;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftActiveAuctionState`, id 0xD31BC45D.
final class starGiftActiveAuctionState : StarGiftActiveAuctionState
{
    enum uint tlId = 0xD31BC45D;

    StarGift gift;
    StarGiftAuctionState state;
    StarGiftAuctionUserState user_state;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStarGiftAuction`, id 0x02E16C98.
final class inputStarGiftAuction : InputStarGiftAuction
{
    enum uint tlId = 0x02E16C98;

    long gift_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputStarGiftAuctionSlug`, id 0x7AB58308.
final class inputStarGiftAuctionSlug : InputStarGiftAuction
{
    enum uint tlId = 0x7AB58308;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `passkey`, id 0x98613EBF.
final class passkey : Passkey
{
    enum uint tlId = 0x98613EBF;

    uint flags;
    string id;
    string name;
    int date;
    long software_emoji_id;
    int last_usage_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPasskeyResponseRegister`, id 0x3E63935C.
final class inputPasskeyResponseRegister : InputPasskeyResponse
{
    enum uint tlId = 0x3E63935C;

    DataJSON client_data;
    ubyte[] attestation_data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPasskeyResponseLogin`, id 0xC31FC14A.
final class inputPasskeyResponseLogin : InputPasskeyResponse
{
    enum uint tlId = 0xC31FC14A;

    DataJSON client_data;
    ubyte[] authenticator_data;
    ubyte[] signature;
    string user_handle;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputPasskeyCredentialPublicKey`, id 0x3C27B78F.
final class inputPasskeyCredentialPublicKey : InputPasskeyCredential
{
    enum uint tlId = 0x3C27B78F;

    string id;
    string raw_id;
    InputPasskeyResponse response;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftBackground`, id 0xAFF56398.
final class starGiftBackground : StarGiftBackground
{
    enum uint tlId = 0xAFF56398;

    int center_color;
    int edge_color;
    int text_color;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAuctionRound`, id 0x3AAE0528.
final class starGiftAuctionRound : StarGiftAuctionRound
{
    enum uint tlId = 0x3AAE0528;

    int num;
    int duration;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAuctionRoundExtendable`, id 0x0AA021E5.
final class starGiftAuctionRoundExtendable : StarGiftAuctionRound
{
    enum uint tlId = 0x0AA021E5;

    int num;
    int duration;
    int extend_top;
    int extend_window;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributeRarity`, id 0x36437737.
final class starGiftAttributeRarity : StarGiftAttributeRarity
{
    enum uint tlId = 0x36437737;

    int permille;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributeRarityUncommon`, id 0xDBCE6389.
final class starGiftAttributeRarityUncommon : StarGiftAttributeRarity
{
    enum uint tlId = 0xDBCE6389;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributeRarityRare`, id 0xF08D516B.
final class starGiftAttributeRarityRare : StarGiftAttributeRarity
{
    enum uint tlId = 0xF08D516B;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributeRarityEpic`, id 0x78FBF3A8.
final class starGiftAttributeRarityEpic : StarGiftAttributeRarity
{
    enum uint tlId = 0x78FBF3A8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `starGiftAttributeRarityLegendary`, id 0xCEF7E7A8.
final class starGiftAttributeRarityLegendary : StarGiftAttributeRarity
{
    enum uint tlId = 0xCEF7E7A8;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `keyboardButtonStyle`, id 0x4FDD3430.
final class keyboardButtonStyle : KeyboardButtonStyle
{
    enum uint tlId = 0x4FDD3430;

    uint flags;
    bool bg_primary;
    bool bg_danger;
    bool bg_success;
    long icon;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputMessageReadMetric`, id 0x402B4495.
final class inputMessageReadMetric : InputMessageReadMetric
{
    enum uint tlId = 0x402B4495;

    int msg_id;
    long view_id;
    int time_in_view_ms;
    int active_time_in_view_ms;
    int height_to_viewport_ratio_permille;
    int seen_range_ratio_permille;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputAiComposeToneDefault`, id 0x1FE9A9BF.
final class inputAiComposeToneDefault : InputAiComposeTone
{
    enum uint tlId = 0x1FE9A9BF;

    string tone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputAiComposeToneID`, id 0x0773C080.
final class inputAiComposeToneID : InputAiComposeTone
{
    enum uint tlId = 0x0773C080;

    long id;
    long access_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputAiComposeToneSlug`, id 0x1FA01357.
final class inputAiComposeToneSlug : InputAiComposeTone
{
    enum uint tlId = 0x1FA01357;

    string slug;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputAiComposeToneSingleUse`, id 0x0E0C35AF.
final class inputAiComposeToneSingleUse : InputAiComposeTone
{
    enum uint tlId = 0x0E0C35AF;

    string custom_prompt;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `aiComposeTone`, id 0xCFF63EA9.
final class aiComposeTone : AiComposeTone
{
    enum uint tlId = 0xCFF63EA9;

    uint flags;
    bool creator;
    long id;
    long access_hash;
    string slug;
    string title;
    long emoji_id;
    string prompt;
    int installs_count;
    long author_id;
    AiComposeToneExample example_english;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `aiComposeToneDefault`, id 0x9BAD6414.
final class aiComposeToneDefault : AiComposeTone
{
    enum uint tlId = 0x9BAD6414;

    string tone;
    long emoji_id;
    string title;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `aiComposeToneExample`, id 0xF1D628EC.
final class aiComposeToneExample : AiComposeToneExample
{
    enum uint tlId = 0xF1D628EC;

    TextWithEntities from;
    TextWithEntities to;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `joinChatBotResultApproved`, id 0xAE152A69.
final class joinChatBotResultApproved : JoinChatBotResult
{
    enum uint tlId = 0xAE152A69;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `joinChatBotResultDeclined`, id 0x0EFA0194.
final class joinChatBotResultDeclined : JoinChatBotResult
{
    enum uint tlId = 0x0EFA0194;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `joinChatBotResultQueued`, id 0x98A3A840.
final class joinChatBotResultQueued : JoinChatBotResult
{
    enum uint tlId = 0x98A3A840;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `joinChatBotResultWebView`, id 0xD6E3B813.
final class joinChatBotResultWebView : JoinChatBotResult
{
    enum uint tlId = 0xD6E3B813;

    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `webDomainException`, id 0x933CA597.
final class webDomainException : WebDomainException
{
    enum uint tlId = 0x933CA597;

    uint flags;
    string domain;
    string url;
    string title;
    long favicon;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputRichFilePhoto`, id 0x9B00622B.
final class inputRichFilePhoto : InputRichFile
{
    enum uint tlId = 0x9B00622B;

    string id;
    InputPhoto photo;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputRichFileDocument`, id 0x83281DBD.
final class inputRichFileDocument : InputRichFile
{
    enum uint tlId = 0x83281DBD;

    string id;
    InputDocument document;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputRichMessage`, id 0xE4C449FC.
final class inputRichMessage : InputRichMessage
{
    enum uint tlId = 0xE4C449FC;

    uint flags;
    bool rtl;
    bool noautolink;
    Vector!(PageBlock) blocks;
    Vector!(InputPhoto) photos;
    Vector!(InputDocument) documents;
    Vector!(InputUser) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputRichMessageHTML`, id 0xDACB836A.
final class inputRichMessageHTML : InputRichMessage
{
    enum uint tlId = 0xDACB836A;

    uint flags;
    bool rtl;
    bool noautolink;
    string html;
    Vector!(InputRichFile) files;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputRichMessageMarkdown`, id 0x004B572C.
final class inputRichMessageMarkdown : InputRichMessage
{
    enum uint tlId = 0x004B572C;

    uint flags;
    bool rtl;
    bool noautolink;
    string markdown;
    Vector!(InputRichFile) files;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `richMessage`, id 0xBAF39D8B.
final class richMessage : RichMessage
{
    enum uint tlId = 0xBAF39D8B;

    uint flags;
    bool rtl;
    bool part;
    Vector!(PageBlock) blocks;
    Vector!(Photo) photos;
    Vector!(Document) documents;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `communityPeer`, id 0x76141EBD.
final class communityPeer : CommunityPeer
{
    enum uint tlId = 0x76141EBD;

    uint flags;
    bool can_view_history;
    bool visible;
    Peer peer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `communityPeerRequest`, id 0x7BEAFA85.
final class communityPeerRequest : CommunityPeerRequest
{
    enum uint tlId = 0x7BEAFA85;

    uint flags;
    bool visible;
    Peer peer;
    long requested_by;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `ephemeralMessage`, id 0xDD27BEE9.
final class ephemeralMessage : EphemeralMessage
{
    enum uint tlId = 0xDD27BEE9;

    uint flags;
    bool out_;
    bool welcome_template;
    bool invert_media;
    bool noforwards;
    int id;
    Peer from_id;
    Peer peer_id;
    long receiver_id;
    int top_msg_id;
    int date;
    string message;
    Vector!(MessageEntity) entities;
    MessageMedia media;
    ReplyMarkup reply_markup;
    MessageReplyHeader reply_to;
    RichMessage rich_message;
    long chat_instance;
    int anchor_msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `buttonTypeDefault`, id 0xC9DD90E9.
final class buttonTypeDefault : ButtonType
{
    enum uint tlId = 0xC9DD90E9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `buttonTypeRequestPhone`, id 0xDF3D36F9.
final class buttonTypeRequestPhone : ButtonType
{
    enum uint tlId = 0xDF3D36F9;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `buttonTypeRequestGeoLocation`, id 0x9BEEE140.
final class buttonTypeRequestGeoLocation : ButtonType
{
    enum uint tlId = 0x9BEEE140;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `buttonTypeRequestPoll`, id 0xAACFFF84.
final class buttonTypeRequestPoll : ButtonType
{
    enum uint tlId = 0xAACFFF84;

    uint flags;
    bool quiz;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `buttonTypeRequestPeer`, id 0x4F58A237.
final class buttonTypeRequestPeer : ButtonType
{
    enum uint tlId = 0x4F58A237;

    uint flags;
    int button_id;
    RequestPeerType peer_type;
    int max_quantity;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputButtonTypeRequestPeer`, id 0x3FE268FE.
final class inputButtonTypeRequestPeer : ButtonType
{
    enum uint tlId = 0x3FE268FE;

    uint flags;
    bool name_requested;
    bool username_requested;
    bool photo_requested;
    int button_id;
    RequestPeerType peer_type;
    int max_quantity;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `buttonTypeSimpleWebView`, id 0xC01A597A.
final class buttonTypeSimpleWebView : ButtonType
{
    enum uint tlId = 0xC01A597A;

    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineButtonTypeUrl`, id 0xECA4F8D4.
final class inlineButtonTypeUrl : InlineButtonType
{
    enum uint tlId = 0xECA4F8D4;

    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineButtonTypeUrlAuth`, id 0xBFD02DA2.
final class inlineButtonTypeUrlAuth : InlineButtonType
{
    enum uint tlId = 0xBFD02DA2;

    uint flags;
    string fwd_text;
    string url;
    int button_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInlineButtonTypeUrlAuth`, id 0x9961BCB4.
final class inputInlineButtonTypeUrlAuth : InlineButtonType
{
    enum uint tlId = 0x9961BCB4;

    uint flags;
    bool request_write_access;
    string fwd_text;
    string url;
    InputUser bot;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineButtonTypeWebView`, id 0x3BCAB5B4.
final class inlineButtonTypeWebView : InlineButtonType
{
    enum uint tlId = 0x3BCAB5B4;

    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineButtonTypeCallback`, id 0x2955BC38.
final class inlineButtonTypeCallback : InlineButtonType
{
    enum uint tlId = 0x2955BC38;

    uint flags;
    bool requires_password;
    ubyte[] data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineButtonTypeGame`, id 0x5CD3709D.
final class inlineButtonTypeGame : InlineButtonType
{
    enum uint tlId = 0x5CD3709D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineButtonTypeBuy`, id 0x48BAD7A5.
final class inlineButtonTypeBuy : InlineButtonType
{
    enum uint tlId = 0x48BAD7A5;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineButtonTypeSwitchInline`, id 0x93773FF5.
final class inlineButtonTypeSwitchInline : InlineButtonType
{
    enum uint tlId = 0x93773FF5;

    uint flags;
    bool same_peer;
    string query;
    Vector!(InlineQueryPeerType) peer_types;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineButtonTypeUserProfile`, id 0x3FA33FCF.
final class inlineButtonTypeUserProfile : InlineButtonType
{
    enum uint tlId = 0x3FA33FCF;

    long user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputInlineButtonTypeUserProfile`, id 0x53F3CE5A.
final class inputInlineButtonTypeUserProfile : InlineButtonType
{
    enum uint tlId = 0x53F3CE5A;

    InputUser user_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineButtonTypeCopy`, id 0xB41D3272.
final class inlineButtonTypeCopy : InlineButtonType
{
    enum uint tlId = 0xB41D3272;

    string copy_text;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inlineButtonTypeDisabled`, id 0xA438619D.
final class inlineButtonTypeDisabled : InlineButtonType
{
    enum uint tlId = 0xA438619D;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `keyboardInlineButton`, id 0x11C1A322.
final class keyboardInlineButton : KeyboardInlineButton
{
    enum uint tlId = 0x11C1A322;

    uint flags;
    KeyboardButtonStyle style;
    string text;
    InlineButtonType type;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `keyboardInlineButtonRow`, id 0x19420AF6.
final class keyboardInlineButtonRow : KeyboardInlineButtonRow
{
    enum uint tlId = 0x19420AF6;

    Vector!(KeyboardInlineButton) buttons;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `richButtonStyle`, id 0x03C610BD.
final class richButtonStyle : RichButtonStyle
{
    enum uint tlId = 0x03C610BD;

    uint flags;
    bool bg_primary;
    bool bg_danger;
    bool bg_success;
    bool link;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `pageButton`, id 0x692A5488.
final class pageButton : PageButton
{
    enum uint tlId = 0x692A5488;

    uint flags;
    RichText text;
    InlineButtonType type;
    RichButtonStyle style;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `currencyRate`, id 0x30D9743C.
final class currencyRate : CurrencyRate
{
    enum uint tlId = 0x30D9743C;

    string currency;
    double rate;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `onrampMethodAvailability`, id 0x9EC8C6A8.
final class onrampMethodAvailability : OnrampMethodAvailability
{
    enum uint tlId = 0x9EC8C6A8;

    uint flags;
    bool available;
    string payment_method;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `onrampProviderInfo`, id 0x0DC27582.
final class onrampProviderInfo : OnrampProviderInfo
{
    enum uint tlId = 0x0DC27582;

    uint flags;
    bool supports_base_currencies;
    bool supports_limits;
    bool supports_quote;
    string id;
    string name;
    Vector!(string) crypto_currencies;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `onrampAvailability`, id 0xF9C84973.
final class onrampAvailability : OnrampAvailability
{
    enum uint tlId = 0xF9C84973;

    uint flags;
    bool allowed;
    bool buy_allowed;
    string country_code;
    string state;
    Vector!(OnrampMethodAvailability) methods;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `onrampLimits`, id 0x7BE2677E.
final class onrampLimits : OnrampLimits
{
    enum uint tlId = 0x7BE2677E;

    string base_currency;
    string base_min_amount;
    string base_max_amount;
    string crypto_min_amount;
    string crypto_max_amount;
    string payment_method;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `onrampQuote`, id 0x7A8011E9.
final class onrampQuote : OnrampQuote
{
    enum uint tlId = 0x7A8011E9;

    string base_currency;
    string base_amount;
    string crypto_currency;
    string crypto_amount;
    string crypto_price;
    string fee_amount;
    string extra_fee_amount;
    string network_fee_amount;
    string total_amount;
    string payment_method;
    int expires_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `onrampSession`, id 0xD1E42E24.
final class onrampSession : OnrampSession
{
    enum uint tlId = 0xD1E42E24;

    string provider;
    string session_id;
    string url;
    int expires_date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `walletStateEmpty`, id 0x9CB9B2EC.
final class walletStateEmpty : WalletState
{
    enum uint tlId = 0x9CB9B2EC;

    uint flags;
    bool creating;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `walletState`, id 0x95C5346B.
final class walletState : WalletState
{
    enum uint tlId = 0x95C5346B;

    uint flags;
    bool backup_enabled;
    bool can_export_phrase;
    bool can_enable_backup;
    string address;
    ubyte[] public_key;
    long balance;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `walletUserAddress`, id 0xFE78EECC.
final class walletUserAddress : WalletUserAddress
{
    enum uint tlId = 0xFE78EECC;

    uint flags;
    long user_id;
    string address;
    ubyte[] public_key;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `walletTransactionPeerUser`, id 0xD4EA706D.
final class walletTransactionPeerUser : WalletTransactionPeer
{
    enum uint tlId = 0xD4EA706D;

    uint flags;
    long user_id;
    string address;
    string domain;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `walletTransactionPeerAddress`, id 0x062CC1BC.
final class walletTransactionPeerAddress : WalletTransactionPeer
{
    enum uint tlId = 0x062CC1BC;

    uint flags;
    string address;
    string domain;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `walletTransactionPeerOnramp`, id 0xE595186E.
final class walletTransactionPeerOnramp : WalletTransactionPeer
{
    enum uint tlId = 0xE595186E;

    uint flags;
    string address;
    string domain;
    string provider_name;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `walletTransactionPeerUnsupported`, id 0x728BED5A.
final class walletTransactionPeerUnsupported : WalletTransactionPeer
{
    enum uint tlId = 0x728BED5A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `walletTransaction`, id 0x952DC143.
final class walletTransaction : WalletTransaction
{
    enum uint tlId = 0x952DC143;

    uint flags;
    bool incoming;
    bool gasless;
    bool failed;
    bool key_change;
    bool comment_encrypted;
    string id;
    long amount;
    long fee;
    int date;
    WalletTransactionPeer peer;
    string comment;
    string tx_hash;
    wallet_NftItem nft;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `walletOwnershipProof`, id 0x60BCCB0D.
final class walletOwnershipProof : WalletOwnershipProof
{
    enum uint tlId = 0x60BCCB0D;

    int timestamp;
    ubyte[] signature;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputWalletNew`, id 0x63A440DC.
final class inputWalletNew : InputWalletReplacement
{
    enum uint tlId = 0x63A440DC;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `inputWalletImported`, id 0x66A66A3B.
final class inputWalletImported : InputWalletReplacement
{
    enum uint tlId = 0x66A66A3B;

    uint flags;
    ubyte[] public_key;
    ubyte[] anchor_public_key;
    WalletOwnershipProof proof;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `tonConnectManifest`, id 0x12229264.
final class tonConnectManifest : TonConnectManifest
{
    enum uint tlId = 0x12229264;

    uint flags;
    string url;
    string name;
    WebDocument icon;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `tonConnectSession`, id 0x126556C6.
final class tonConnectSession : TonConnectSession
{
    enum uint tlId = 0x126556C6;

    uint flags;
    bool pending;
    bool closing;
    bool closed;
    long id;
    string dapp_client_id;
    string client_id;
    ubyte[] nonce;
    TonConnectManifest manifest;
    int manifest_error;
    int date;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `tonConnectNextEventId`, id 0x582464E3.
final class tonConnectNextEventId : TonConnectNextEventId
{
    enum uint tlId = 0x582464E3;

    long event_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `tonConnectRequest`, id 0xA15F8513.
final class tonConnectRequest : TonConnectRequest
{
    enum uint tlId = 0xA15F8513;

    uint flags;
    long session_id;
    int msg_id;
    ubyte[] body_;
    int expires;
    string topic;
    string trace_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

