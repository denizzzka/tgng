# tgng

> **Work in progress.** The project is not finished yet; packages and APIs may change.

Telegram API for D: MTProto client, generated client API types and TL tooling.

## Packages

- `tgng` (root) - common library layer.
- `client-api` (`tgng:client-api`) - types and functions from `telegram_api.tl` and `mtproto_api.tl`.
- `tlgen` (`tgng:tlgen`) - TL scheme to D code generator.
- `mcp` (`tgng:mcp`) - MCP server over stdio; works as a regular user account, not a bot.
- `bot-api` (`tgng:bot-api`) - HTTP Bot API client: `sendMessage`, `getMe`, `getChat`, `getUpdates` with a persisted offset.
- `mtp` (`tgng:mtp`) - MTProto: framing, obfuscated2, SOCKS5, DH handshake, encrypted session, schema walker.

## Status

`mtp` completes a real DH handshake with the Telegram test DC through SOCKS5 and runs `help.getConfig` (MTProto 2.0: KDF2/SHA-256, AES-256-IGE, unencrypted handshake envelope, gzip). The Bot API foundation covers peers, messages, users, chats, updates and DC migration. Authorization needs a phone code from Telegram or a test bot token.

## Bot example

```d
import tgng.botapi.curl: CurlHttpClient;
import tgng.botapi.types: BaseApiUrl, ParseMode, SendMessageMethod;
import tgng.botapi.web: webBotApi;

void main()
{
    // proxy is optional, for example "http://127.0.0.1:8080"
    auto api = webBotApi(token, BaseApiUrl, new CurlHttpClient(proxy));

    auto me = api.getMe();
    writeln("bot: @", me.username);

    auto chat = api.getChat(chatId);
    writeln("chat: ", chat.title);

    SendMessageMethod msg;
    msg.chat_id = chatId;
    msg.text = "hello from tgng";
    msg.parse_mode = ParseMode.None;
    api.sendMessage(msg);
}
```

Receiving updates hides the offset and long-polls:

```d
api.processUpdates((ref Update update)
{
    if (update.kind == Update.Kind.message)
        writeln(update.chatId, ": ", update.text);
}, store, 5.minutes, ["message"]);
```

`store` is an `UpdateOffsetStore`. Implement `load`/`save` to persist `update_id + 1`
between runs; `MemoryUpdateOffsetStore` keeps it for tests only.

## Build and test

    cd mtp
    dub test

The bot example is also a live test. Put `TG_BOT_TOKEN`, `TG_CHAT_ID` and
`TG_PROXY` into `bot-api/.env` (ignored by git) and run:

    cd bot-api
    dub test

Without that file the live test is skipped. Set `TG_TEST_SEND=1` to also send
a message.

## License

Proprietary.
