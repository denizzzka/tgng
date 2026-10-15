# PLAN

## Цель

Библиотечный пакет `tgng` на D: Telegram API для клиентов и ботов.

- Общая транспортная часть — в корневом (библиотечном) пакете.
- Bot API и клиентский MTProto — в отдельных D-пакетах.
- Начинаем с клиентского MTProto.
- Зависимость `telega` не тянем — всё своё.

## Структура пакетов

- `tgng` (корень) — библиотека, общий слой (transport, socks5, rpc, crypto-интерфейсы).
- `client-api` (`tgng:client-api`) — сгенерированные типы и функции из TL-схем (`telegram_api.tl`, `mtproto_api.tl`), `targetType "sourceLibrary"`.
- `tlgen` (`tgng:tlgen`) — генератор TL-схемы в D-код, `targetType "executable"`.

## Транспорт (решение)

Один стек, не отдельные режимы:

```
TCP -> [SOCKS5] -> [obfuscated2] -> abridged/intermediate -> MTProto-фреймы
```

- HTTP-транспорт не делаем.
- SOCKS5 — переиспользуем `vibe-stream:socks` (модуль `vibe.stream.socks`), тянем зависимость на `vibe-stream`.
- obfuscated2 — позже, каркас закладываем сразу.

## Подключение vibe-stream

SOCKS5 живёт в ветке `add_socks5_squash` (коммит `9be6e2d`) репозитория `vibe-stream` и выделен в подпакет `socks`.

- Отдельный worktree: `/home/denizzz/Dev/vibe-stream-socks`, ветка `socks-dep` (от `9be6e2d`).
- Зависимость: `dependency "vibe-stream:socks" path="/home/denizzz/Dev/vibe-stream-socks"`.
- Сборка проверена: `dub build` в `tgng` проходит.

## Криптография (решение)

- botan/openssl через C-биндинги.
- Поверх C-биндингов — обёртка в стиле `vibe.stream`, чтобы вписать в общий транспорт.
- Настоящий AES-IGE (не заглушки) — возможен интеграционный тест с реальным Telegram уже на этапе 1.

## Этап 1. Каркас клиентского MTProto

- [ ] `transport` — TCP-соединение, отправка/приём MTProto-фреймов (abridged).
- [x] `socks5` — через `vibe-stream:socks`.
- [ ] `rpc` — сериализация/десериализация `rpc_query`/`rpc_result`, конверт.
- [ ] `session` — DC, ключи, `auth_key` (структура/заглушка).
- [ ] `auth` — заготовки `auth.sendCode`/`auth.signIn`.
- [ ] Криптография: интерфейсы `AuthKey`, `encrypt`/`decrypt`; реализация AES-IGE поверх botan/openssl.

## Открытые вопросы

- Тестовые `api_id`/`api_hash`: получить на my.telegram.org, хранить в тестовом конфиге.
- Выбор C-библиотеки криптографии: botan или openssl (что удобнее в окружении сборки).

## Этап 2. Интеграционные тесты

- [ ] Тесты с реальным тестовым Telegram через SOCKS5-прокси.
- [ ] Требуются тестовые `api_id`/`api_hash` и телефон.

## Этап 3. Bot API

- [ ] Отдельный D-пакет поверх общего слоя.
