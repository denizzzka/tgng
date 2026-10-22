# tgng

> **Work in progress.** The project is not finished yet; packages and APIs may change.

Telegram API for D: MTProto client, generated client API types and TL tooling.

## Packages

- `tgng` (root) - common library layer.
- `client-api` (`tgng:client-api`) - types and functions from `telegram_api.tl` and `mtproto_api.tl`.
- `tlgen` (`tgng:tlgen`) - TL scheme to D code generator.
- `mtp` (`tgng:mtp`) - MTProto: framing, obfuscated2, SOCKS5, DH handshake, encrypted session, schema walker.

## Status

`mtp` completes a real DH handshake with the Telegram test DC through SOCKS5 and runs `help.getConfig` (MTProto 2.0: KDF2/SHA-256, AES-256-IGE, unencrypted handshake envelope, gzip). The Bot API foundation covers peers, messages, users, chats, updates and DC migration. Authorization needs a phone code from Telegram or a test bot token.

## Build and test

    cd mtp
    dub test

## License

Proprietary.
