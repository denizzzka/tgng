/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.wallet_functions;

import tg_client_api.functions.tl_function;
import tg_client_api.types.common_types;
import tg_client_api.types.vector;

/// TL function `wallet.getState`, id 0xAB83B33A.
final class wallet_getState : TlFunction
{
    enum uint tlId = 0xAB83B33A;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.getUserAddresses`, id 0x5275DFDD.
final class wallet_getUserAddresses : TlFunction
{
    enum uint tlId = 0x5275DFDD;

    uint flags;
    bool force;
    Vector!(InputUser) id;
    Vector!(string) addresses;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.getTransactions`, id 0xA8830A83.
final class wallet_getTransactions : TlFunction
{
    enum uint tlId = 0xA8830A83;

    uint flags;
    bool inbound;
    bool outbound;
    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.getTransactionsByIDs`, id 0x811CEAB6.
final class wallet_getTransactionsByIDs : TlFunction
{
    enum uint tlId = 0x811CEAB6;

    Vector!(string) id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.getTransactionsByMsgHash`, id 0xA6BB795D.
final class wallet_getTransactionsByMsgHash : TlFunction
{
    enum uint tlId = 0xA6BB795D;

    Vector!(string) msg_hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.exportSecretPhrase`, id 0x9077C9AC.
final class wallet_exportSecretPhrase : TlFunction
{
    enum uint tlId = 0x9077C9AC;

    uint flags;
    InputCheckPasswordSRP password;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.fetchEncryptedSecretPhrasePart`, id 0xF53925CF.
final class wallet_fetchEncryptedSecretPhrasePart : TlFunction
{
    enum uint tlId = 0xF53925CF;

    string token;
    ubyte[] public_key;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.replaceWallet`, id 0xD8C72EEC.
final class wallet_replaceWallet : TlFunction
{
    enum uint tlId = 0xD8C72EEC;

    uint flags;
    InputWalletReplacement wallet;
    InputCheckPasswordSRP password;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.disableBackup`, id 0x0B0BF0DA.
final class wallet_disableBackup : TlFunction
{
    enum uint tlId = 0x0B0BF0DA;

    uint flags;
    InputCheckPasswordSRP password;
    ubyte[] new_public_key;
    WalletOwnershipProof proof;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.getBackupHolderDcs`, id 0xD179D494.
final class wallet_getBackupHolderDcs : TlFunction
{
    enum uint tlId = 0xD179D494;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.enableBackup`, id 0x4500C525.
final class wallet_enableBackup : TlFunction
{
    enum uint tlId = 0x4500C525;

    uint flags;
    Vector!(ubyte[]) parts;
    ubyte[] new_public_key;
    WalletOwnershipProof proof;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.getProofChallenge`, id 0x2025E697.
final class wallet_getProofChallenge : TlFunction
{
    enum uint tlId = 0x2025E697;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.sendTransfer`, id 0xD9E5D9E2.
final class wallet_sendTransfer : TlFunction
{
    enum uint tlId = 0xD9E5D9E2;

    uint flags;
    ubyte[] data_normal;
    ubyte[] data_gasless;
    InputUser user_id;
    long random_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.getGaslessInfo`, id 0x742DF0A1.
final class wallet_getGaslessInfo : TlFunction
{
    enum uint tlId = 0x742DF0A1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.getExistingWaltBalance`, id 0x691F4360.
final class wallet_getExistingWaltBalance : TlFunction
{
    enum uint tlId = 0x691F4360;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.getNfts`, id 0x8C12F3A4.
final class wallet_getNfts : TlFunction
{
    enum uint tlId = 0x8C12F3A4;

    string offset;
    int limit;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.tonConnectCreateSession`, id 0xCC931046.
final class wallet_tonConnectCreateSession : TlFunction
{
    enum uint tlId = 0xCC931046;

    string dapp_client_id;
    string manifest_url;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.tonConnectRegisterKey`, id 0x338BCF1C.
final class wallet_tonConnectRegisterKey : TlFunction
{
    enum uint tlId = 0x338BCF1C;

    long session_id;
    string client_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.tonConnectSubmitConnectResult`, id 0xC2C00779.
final class wallet_tonConnectSubmitConnectResult : TlFunction
{
    enum uint tlId = 0xC2C00779;

    uint flags;
    bool error;
    long session_id;
    ubyte[] challenge_answer;
    ubyte[] body_;
    string trace_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.tonConnectGetPending`, id 0x11AEE065.
final class wallet_tonConnectGetPending : TlFunction
{
    enum uint tlId = 0x11AEE065;

    uint flags;
    string dapp_client_id;
    long session_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.tonConnectClaimRequest`, id 0x66B57B41.
final class wallet_tonConnectClaimRequest : TlFunction
{
    enum uint tlId = 0x66B57B41;

    uint flags;
    bool declined;
    long session_id;
    int msg_id;
    string app_request_id;
    ubyte[] challenge_answer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.tonConnectSubmitResponse`, id 0xFAC67D3C.
final class wallet_tonConnectSubmitResponse : TlFunction
{
    enum uint tlId = 0xFAC67D3C;

    uint flags;
    long session_id;
    int msg_id;
    ubyte[] body_;
    string trace_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.tonConnectNextEventId`, id 0x775D7244.
final class wallet_tonConnectNextEventId : TlFunction
{
    enum uint tlId = 0x775D7244;

    long session_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.tonConnectCloseSession`, id 0xD63F61CE.
final class wallet_tonConnectCloseSession : TlFunction
{
    enum uint tlId = 0xD63F61CE;

    uint flags;
    long session_id;
    ubyte[] body_;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `wallet.tonConnectGetSessions`, id 0xA7FFB56E.
final class wallet_tonConnectGetSessions : TlFunction
{
    enum uint tlId = 0xA7FFB56E;

    override uint tlIdValue() const nothrow { return tlId; }
}

