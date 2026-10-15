/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tgcapi.gen.types.wallet_types;

/// TL sum type `wallet.UserAddresses`.
abstract class wallet_UserAddresses
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_userAddresses
}

/// TL sum type `wallet.Transactions`.
abstract class wallet_Transactions
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_transactions
}

/// TL sum type `wallet.SecretPhraseParts`.
abstract class wallet_SecretPhraseParts
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_secretPhraseParts
}

/// TL sum type `wallet.EncryptedSecretPhrasePart`.
abstract class wallet_EncryptedSecretPhrasePart
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_encryptedSecretPhrasePart
}

/// TL sum type `wallet.HolderDc`.
abstract class wallet_HolderDc
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_holderDc
}

/// TL sum type `wallet.ProofChallenge`.
abstract class wallet_ProofChallenge
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_proofChallenge
}

/// TL sum type `wallet.TonConnectChallenge`.
abstract class wallet_TonConnectChallenge
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_tonConnectChallenge
}

/// TL sum type `wallet.TonConnectPending`.
abstract class wallet_TonConnectPending
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_tonConnectPending
}

/// TL sum type `wallet.TonConnectSessions`.
abstract class wallet_TonConnectSessions
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_tonConnectSessions
}

/// TL sum type `wallet.ExistingBalance`.
abstract class wallet_ExistingBalance
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_existingBalance
}

/// TL sum type `wallet.NftAttribute`.
abstract class wallet_NftAttribute
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_nftAttribute
}

/// TL sum type `wallet.NftItem`.
abstract class wallet_NftItem
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_nftItem
}

/// TL sum type `wallet.NftItems`.
abstract class wallet_NftItems
{
    /// The id of the concrete constructor.
    abstract uint tlIdValue() const nothrow;
    // constructor: wallet_nftItems
}

/// TL constructor `wallet.userAddresses`, id 0x928E7B55.
final class wallet_userAddresses : wallet_UserAddresses
{
    enum uint tlId = 0x928E7B55;

    Vector!(WalletUserAddress) addresses;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallet.transactions`, id 0x4322D5A5.
final class wallet_transactions : wallet_Transactions
{
    enum uint tlId = 0x4322D5A5;

    uint flags;
    long balance;
    Vector!(WalletTransaction) transactions;
    string next_offset;
    Vector!(Chat) chats;
    Vector!(User) users;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallet.secretPhraseParts`, id 0xE6D0EF01.
final class wallet_secretPhraseParts : wallet_SecretPhraseParts
{
    enum uint tlId = 0xE6D0EF01;

    string token;
    Vector!(int) dcs;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallet.encryptedSecretPhrasePart`, id 0x18E82537.
final class wallet_encryptedSecretPhrasePart : wallet_EncryptedSecretPhrasePart
{
    enum uint tlId = 0x18E82537;

    ubyte[] data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallet.holderDc`, id 0xF9D612EF.
final class wallet_holderDc : wallet_HolderDc
{
    enum uint tlId = 0xF9D612EF;

    int dc;
    ubyte[] public_key;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallet.proofChallenge`, id 0x99E41707.
final class wallet_proofChallenge : wallet_ProofChallenge
{
    enum uint tlId = 0x99E41707;

    string payload;
    int expires;
    string domain;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallet.tonConnectChallenge`, id 0x4BC89693.
final class wallet_tonConnectChallenge : wallet_TonConnectChallenge
{
    enum uint tlId = 0x4BC89693;

    ubyte[] challenge;
    long event_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallet.tonConnectPending`, id 0x85C0F124.
final class wallet_tonConnectPending : wallet_TonConnectPending
{
    enum uint tlId = 0x85C0F124;

    TonConnectSession session;
    Vector!(TonConnectRequest) requests;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallet.tonConnectSessions`, id 0x0E1F6896.
final class wallet_tonConnectSessions : wallet_TonConnectSessions
{
    enum uint tlId = 0x0E1F6896;

    Vector!(TonConnectSession) sessions;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallet.existingBalance`, id 0xBDE90A8D.
final class wallet_existingBalance : wallet_ExistingBalance
{
    enum uint tlId = 0xBDE90A8D;

    uint flags;
    bool has_balance;
    string url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallet.nftAttribute`, id 0x4C1EF10E.
final class wallet_nftAttribute : wallet_NftAttribute
{
    enum uint tlId = 0x4C1EF10E;

    string trait_type;
    string value;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallet.nftItem`, id 0x3441FD1C.
final class wallet_nftItem : wallet_NftItem
{
    enum uint tlId = 0x3441FD1C;

    uint flags;
    string collection_address;
    string address;
    string owner_address;
    string index;
    string name;
    string description;
    WebDocument image;
    WebDocument image_small;
    WebDocument content_url;
    WebDocument lottie;
    Vector!(wallet_NftAttribute) attributes;
    DataJSON extra;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL constructor `wallet.nftItems`, id 0x794D486F.
final class wallet_nftItems : wallet_NftItems
{
    enum uint tlId = 0x794D486F;

    uint flags;
    Vector!(wallet_NftItem) items;
    string next_offset;

    override uint tlIdValue() const nothrow { return tlId; }
}

