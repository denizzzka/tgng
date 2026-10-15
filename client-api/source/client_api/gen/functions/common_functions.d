/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.functions.common_functions;

/// TL function `invokeWithBusinessConnectionPrefix`, id 0xDD289F8E.
final class invokeWithBusinessConnectionPrefix
{
    enum uint tlId = 0xDD289F8E;

    string connection_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeWithGooglePlayIntegrityPrefix`, id 0x1DF92984.
final class invokeWithGooglePlayIntegrityPrefix
{
    enum uint tlId = 0x1DF92984;

    string nonce;
    string token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeWithApnsSecretPrefix`, id 0x0DAE54F8.
final class invokeWithApnsSecretPrefix
{
    enum uint tlId = 0x0DAE54F8;

    string nonce;
    string secret;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeWithReCaptchaPrefix`, id 0xADBB0F94.
final class invokeWithReCaptchaPrefix
{
    enum uint tlId = 0xADBB0F94;

    string token;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeAfterMsg`, id 0xCB9F372D.
final class invokeAfterMsg
{
    enum uint tlId = 0xCB9F372D;

    long msg_id;
    TlObject query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeAfterMsgs`, id 0x3DC4B4F0.
final class invokeAfterMsgs
{
    enum uint tlId = 0x3DC4B4F0;

    Vector!(long) msg_ids;
    TlObject query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `initConnection`, id 0xC1CD5EA9.
final class initConnection
{
    enum uint tlId = 0xC1CD5EA9;

    uint flags;
    int api_id;
    string device_model;
    string system_version;
    string app_version;
    string system_lang_code;
    string lang_pack;
    string lang_code;
    InputClientProxy proxy;
    JSONValue params;
    TlObject query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeWithLayer`, id 0xDA9B0D0D.
final class invokeWithLayer
{
    enum uint tlId = 0xDA9B0D0D;

    int layer;
    TlObject query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeWithoutUpdates`, id 0xBF9459B7.
final class invokeWithoutUpdates
{
    enum uint tlId = 0xBF9459B7;

    TlObject query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeWithMessagesRange`, id 0x365275F2.
final class invokeWithMessagesRange
{
    enum uint tlId = 0x365275F2;

    MessageRange range;
    TlObject query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeWithTakeout`, id 0xACA9FD2E.
final class invokeWithTakeout
{
    enum uint tlId = 0xACA9FD2E;

    long takeout_id;
    TlObject query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeWithBusinessConnection`, id 0xDD289F8E.
final class invokeWithBusinessConnection
{
    enum uint tlId = 0xDD289F8E;

    string connection_id;
    TlObject query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeWithGooglePlayIntegrity`, id 0x1DF92984.
final class invokeWithGooglePlayIntegrity
{
    enum uint tlId = 0x1DF92984;

    string nonce;
    string token;
    TlObject query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeWithApnsSecret`, id 0x0DAE54F8.
final class invokeWithApnsSecret
{
    enum uint tlId = 0x0DAE54F8;

    string nonce;
    string secret;
    TlObject query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `invokeWithReCaptcha`, id 0xADBB0F94.
final class invokeWithReCaptcha
{
    enum uint tlId = 0xADBB0F94;

    string token;
    TlObject query;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `resPQ`, id 0x05162463.
final class resPQ
{
    enum uint tlId = 0x05162463;

    ubyte[16] nonce;
    ubyte[16] server_nonce;
    string pq;
    Vector!(long) server_public_key_fingerprints;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `p_q_inner_data_dc`, id 0xA9F55F95.
final class p_q_inner_data_dc
{
    enum uint tlId = 0xA9F55F95;

    string pq;
    string p;
    string q;
    ubyte[16] nonce;
    ubyte[16] server_nonce;
    ubyte[32] new_nonce;
    int dc;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `p_q_inner_data_temp_dc`, id 0x56FDDF88.
final class p_q_inner_data_temp_dc
{
    enum uint tlId = 0x56FDDF88;

    string pq;
    string p;
    string q;
    ubyte[16] nonce;
    ubyte[16] server_nonce;
    ubyte[32] new_nonce;
    int dc;
    int expires_in;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `server_DH_params_ok`, id 0xD0E8075C.
final class server_DH_params_ok
{
    enum uint tlId = 0xD0E8075C;

    ubyte[16] nonce;
    ubyte[16] server_nonce;
    string encrypted_answer;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `server_DH_inner_data`, id 0xB5890DBA.
final class server_DH_inner_data
{
    enum uint tlId = 0xB5890DBA;

    ubyte[16] nonce;
    ubyte[16] server_nonce;
    int g;
    string dh_prime;
    string g_a;
    int server_time;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `client_DH_inner_data`, id 0x6643B654.
final class client_DH_inner_data
{
    enum uint tlId = 0x6643B654;

    ubyte[16] nonce;
    ubyte[16] server_nonce;
    long retry_id;
    string g_b;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `dh_gen_ok`, id 0x3BCBF734.
final class dh_gen_ok
{
    enum uint tlId = 0x3BCBF734;

    ubyte[16] nonce;
    ubyte[16] server_nonce;
    ubyte[16] new_nonce_hash1;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `dh_gen_retry`, id 0x46DC1FB9.
final class dh_gen_retry
{
    enum uint tlId = 0x46DC1FB9;

    ubyte[16] nonce;
    ubyte[16] server_nonce;
    ubyte[16] new_nonce_hash2;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `dh_gen_fail`, id 0xA69DAE02.
final class dh_gen_fail
{
    enum uint tlId = 0xA69DAE02;

    ubyte[16] nonce;
    ubyte[16] server_nonce;
    ubyte[16] new_nonce_hash3;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bind_auth_key_inner`, id 0x75A3F765.
final class bind_auth_key_inner
{
    enum uint tlId = 0x75A3F765;

    long nonce;
    long temp_auth_key_id;
    long perm_auth_key_id;
    long temp_session_id;
    int expires_at;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `rpc_error`, id 0x2144CA19.
final class rpc_error
{
    enum uint tlId = 0x2144CA19;

    int error_code;
    string error_message;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `rpc_answer_unknown`, id 0x5E2AD36E.
final class rpc_answer_unknown
{
    enum uint tlId = 0x5E2AD36E;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `rpc_answer_dropped_running`, id 0xCD78E586.
final class rpc_answer_dropped_running
{
    enum uint tlId = 0xCD78E586;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `rpc_answer_dropped`, id 0xA43AD8B7.
final class rpc_answer_dropped
{
    enum uint tlId = 0xA43AD8B7;

    long msg_id;
    int seq_no;
    int bytes;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `future_salt`, id 0x0949D9DC.
final class future_salt
{
    enum uint tlId = 0x0949D9DC;

    int valid_since;
    int valid_until;
    long salt;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `future_salts`, id 0xAE500895.
final class future_salts
{
    enum uint tlId = 0xAE500895;

    long req_msg_id;
    int now;
    Vector!(future_salt) salts;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `pong`, id 0x347773C5.
final class pong
{
    enum uint tlId = 0x347773C5;

    long msg_id;
    long ping_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `new_session_created`, id 0x9EC20908.
final class new_session_created
{
    enum uint tlId = 0x9EC20908;

    long first_msg_id;
    long unique_id;
    long server_salt;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `gzip_packed`, id 0x3072CFA1.
final class gzip_packed
{
    enum uint tlId = 0x3072CFA1;

    string packed_data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `msgs_ack`, id 0x62D6B459.
final class msgs_ack
{
    enum uint tlId = 0x62D6B459;

    Vector!(long) msg_ids;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bad_msg_notification`, id 0xA7EFF811.
final class bad_msg_notification
{
    enum uint tlId = 0xA7EFF811;

    long bad_msg_id;
    int bad_msg_seqno;
    int error_code;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `bad_server_salt`, id 0xEDAB447B.
final class bad_server_salt
{
    enum uint tlId = 0xEDAB447B;

    long bad_msg_id;
    int bad_msg_seqno;
    int error_code;
    long new_server_salt;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `msg_resend_req`, id 0x7D861A08.
final class msg_resend_req
{
    enum uint tlId = 0x7D861A08;

    Vector!(long) msg_ids;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `msgs_state_req`, id 0xDA69FB52.
final class msgs_state_req
{
    enum uint tlId = 0xDA69FB52;

    Vector!(long) msg_ids;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `msgs_state_info`, id 0x04DEB57D.
final class msgs_state_info
{
    enum uint tlId = 0x04DEB57D;

    long req_msg_id;
    string info;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `msgs_all_info`, id 0x8CC0D131.
final class msgs_all_info
{
    enum uint tlId = 0x8CC0D131;

    Vector!(long) msg_ids;
    string info;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `msg_detailed_info`, id 0x276D3EC6.
final class msg_detailed_info
{
    enum uint tlId = 0x276D3EC6;

    long msg_id;
    long answer_msg_id;
    int bytes;
    int status;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `msg_new_detailed_info`, id 0x809DB6DF.
final class msg_new_detailed_info
{
    enum uint tlId = 0x809DB6DF;

    long answer_msg_id;
    int bytes;
    int status;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `destroy_auth_key_ok`, id 0xF660E1D4.
final class destroy_auth_key_ok
{
    enum uint tlId = 0xF660E1D4;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `destroy_auth_key_none`, id 0x0A9F2259.
final class destroy_auth_key_none
{
    enum uint tlId = 0x0A9F2259;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `destroy_auth_key_fail`, id 0xEA109B13.
final class destroy_auth_key_fail
{
    enum uint tlId = 0xEA109B13;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `req_pq_multi`, id 0xBE7E8EF1.
final class req_pq_multi
{
    enum uint tlId = 0xBE7E8EF1;

    ubyte[16] nonce;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `req_DH_params`, id 0xD712E4BE.
final class req_DH_params
{
    enum uint tlId = 0xD712E4BE;

    ubyte[16] nonce;
    ubyte[16] server_nonce;
    string p;
    string q;
    long public_key_fingerprint;
    string encrypted_data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `set_client_DH_params`, id 0xF5045F1F.
final class set_client_DH_params
{
    enum uint tlId = 0xF5045F1F;

    ubyte[16] nonce;
    ubyte[16] server_nonce;
    string encrypted_data;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `rpc_drop_answer`, id 0x58E4A740.
final class rpc_drop_answer
{
    enum uint tlId = 0x58E4A740;

    long req_msg_id;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `get_future_salts`, id 0xB921BD04.
final class get_future_salts
{
    enum uint tlId = 0xB921BD04;

    int num;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `ping_delay_disconnect`, id 0xF3427B8C.
final class ping_delay_disconnect
{
    enum uint tlId = 0xF3427B8C;

    long ping_id;
    int disconnect_delay;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `http_wait`, id 0x9299359F.
final class http_wait
{
    enum uint tlId = 0x9299359F;

    int max_delay;
    int wait_after;
    int max_wait;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `destroy_auth_key`, id 0xD1435160.
final class destroy_auth_key
{
    enum uint tlId = 0xD1435160;

    override uint tlIdValue() const nothrow { return tlId; }
}

