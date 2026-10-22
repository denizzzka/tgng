# План: MTProto с нуля (новый пакет `mtp`, не пересекаясь со старым `mtproto`)

## Steps

- [x] Шаг 1. Инвентаризация и добор крипто-алгоритмов (SHA-1, RSA, факторизация pq)
- [x] Шаг 2. Расписать стыковку по референсу tdlib
- [x] Шаг 3. Реализация слоями снизу вверх, каждый слой с юнит-тестами
  - [x] 3.1 пакет, crypto, SHA-1, RSA, pq
  - [x] 3.2 шифроконтейнер (msg_key, KDF2 SHA-256, AES-IGE, паддинг 12..1024, `container.d`)
  - [x] 3.3 фреймлинг + obfuscated2 (`framing.d`, `obfuscated.d`)
  - [x] 3.4 DH-handshake (по официальной спеке `core.telegram.org/mtproto/auth_key.md`, скачана через прокси; чужой код — только для сверки)
    - [x] 3.4.1 RSA_PAD по спеке 4.1 (новая схема: reverse + SHA256 + AES-IGE + xor) вместо старой схемы в `rsa.d`
    - [x] 3.4.2 TL-кодирование/декодирование сообщений хендшейка (req_pq_multi, resPQ, req_DH_params, server_DH_*, client_DH_inner_data, dh_gen_*) — `tl.d`
    - [x] 3.4.3 tmp_aes KDF + расшифровка `encrypted_answer` — `dh.d` (`deriveTmpKeyIv`, `decryptAnswer`)
    - [x] 3.4.4 валидация dh_prime / g / g_a / g_b по спеке — `dh.d` (`validateDhParams`, `validatePrime`)
    - [x] 3.4.5 client_DH_inner_data, проверка new_nonce_hash1/2/3, server_salt, вывод auth_key — `dh.d`
    - [x] 3.4.6 фейковый in-memory сервер: юнит-тест всех веток dh_gen_* — `dhtest.d`
  - [x] 3.5 session/rpc
    - [x] 3.5.1 msg_id (серверные — чётные, клиентские — нечётные, по времени × 2^32), seq_no (content-related → 2n+1, иначе 2n), salt, session_id — `session.d`
    - [x] 3.5.2 конверт исходящих/входящих сообщений поверх `container.d` (msg_key, AES-IGE, паддинг)
    - [x] 3.5.3 rpc_result / rpc_error, связка запрос↔ответ по msg_id, очередь исходящих + переотправка — `rpc.d`
    - [x] 3.5.4 дедупликация входящих по msg_id, отбрасывание повторов и старых (time/seq_no окна) — `rpc.d` (`IncomingFilter`, `MessageIdDuplicateChecker`)
  - [x] 3.6 служебный слой
    - [x] 3.6.1 msg_container: сборка нескольких сообщений в один пакет, разбор входящего контера
    - [x] 3.6.2 msgs_ack: подтверждение входящих, списки acks при отправке
    - [x] 3.6.3 bad_msg_notification / bad_server_salt: реакция (новый salt, коррекция msg_id/seq_no, переотправка)
    - [x] 3.6.4 синхронизация времени (пинг/разница времени, влияние на msg_id и допуск bad_msg)
  - [x] 3.7 auth-заготовки
    - [x] 3.7.1 минимальный TL-codec для API-функций (auth.*, help.getConfig) — `api.d`: initConnection/invokeWithLayer, auth.sendCode/signIn, help.getConfig, разбор auth.SentCode/Authorization/config
    - [x] 3.7.2 auth.sendCode / auth.signIn заготовки (живой вход требует код из Telegram или токен бота)
- [x] Шаг 4. Интеграция с тестовым DC: handshake, help.getConfig, план тестов и auth
- Шаг 5. Фундамент для Bot API (MTProto-сторона, без телефона) - подробности в разделе ниже

## Правила ведения плана

- Если задача оказалась настолько сложной, что сессия на ней уже зацикливалась, — разбить её на подзадачи и внести их в план как полноправные подпункты (с теми же чекбоксами), а не пытаться решать «в лоб».
- Если пункт плана перестал быть нужен для достижения конечной цели — удалить его из плана.

## Границы работ

- Новый subpackage `mtp` (пакет `tgng:mtp`). Старый `mtproto` удалён по просьбе пользователя и не импортируется.
- Крипто-примитивы копируем из `mtproto/source/tgng/mtproto/crypto.d` в новый пакет (нормальный код с тестами), дальше живут независимо.
- Весь ввод/вывод — через поточные `InputStream`/`OutputStream` из `vibe-stream` (и SOCKS5 — тоже stream): где возможно, никаких сырых сокетов и файловых дескрипторов вне stream-абстракции.
- TL handshake: классы типов берём из `client-api` (сгенерирован из `mtproto_api.tl`: `req_pq_multi`, `p_q_inner_data_dc`, `req_DH_params`, `server_DH_params_ok`, `dh_gen_ok/retry/fail` и т.д.), но сериализации там нет — TL-кодирование/декодирование для handshake пишем в `mtp` руками.

## Шаг 1. Инвентаризация алгоритмов

Уже было в старом `crypto.d` (скопировано в новый пакет):
- [x] AES-256-IGE — encrypted container
- [x] AES-256-CTR — obfuscated2
- [x] SHA-256, HMAC-SHA256
- [x] modPow — DH
- [x] randomBytes

Не хватало (добавлено):
- [x] SHA-1 нужен для tmp_KDF в handshake, RSA-фингерпринтов и хэшей new_nonce. msg_key и ключи сообщений используют KDF2 на SHA-256 (`deriveAesKeyIv`).
- [x] RSA encrypt — сырой RSA поверх modPow: 8 байт фингерпринта + payload + рандом-паддинг до 255 байт
- [x] факторизация pq — Pollard rho (векторы: `~/Dev/tdlib/tdutils/test/pq.cpp`)
- [x] gzip-декомпрессия `gzip_payload`: Phobos `std.zlib.uncompress(..., 47)`, сработала на живом `help.getConfig`

## Источник случайных чисел (проверить!)

- [x] Источник случайных чисел — OpenSSL `RAND_bytes` (CSPRNG) в `crypto.randomBytes`; ошибка OpenSSL превращается в исключение, а не тихий fallback.

## Шаг 3.4. Алгоритм DH-handshake по официальной спеке

Правило ведения плана: если пункт перестал быть нужен для достижения конечной цели, удалить его из плана.

Источник: `https://core.telegram.org/mtproto/auth_key.md` (скачан через прокси в `/tmp/opencode/auth_key.md`).
Формулы — дословно из спеки; чужой код (TDLib) — только для сверки. Каждый пункт = атомарная подзадача с тестом.

Общие соглашения (из преамбулы спеки):
- Большие числа — строки байт big-endian; `int`/`long`/`int128`/`int256` — little-endian.
- `long` из SHA1 = последние 8 байт 20-байтового дайджеста как LE-число.

### A. req_pq_multi → resPQ

- [x] A.1 Клиент шлёт `req_pq_multi#be7e8ef1 nonce:int128` (nonce — 16 случайных байт).
- [x] A.2 Сервер отвечает `resPQ#05162463 nonce:int128 server_nonce:int128 pq:string server_public_key_fingerprints:Vector long`.
- [x] A.3 Проверить: nonce совпадает с отправленным; взять server_nonce.
- [x] A.4 Сверить, что наш RSA-фингерпринт есть в `server_public_key_fingerprints`.
- [x] A.5 Факторизовать pq (p < q, оба нечётные простые; pq ≤ 2^63-1) — уже есть `pq.d`.

### B. RSA_PAD (спека 4.1) — заменяет старую схему в `rsa.d`

- [x] B.1 `new_nonce` — 32 случайных байта.
- [x] B.2 `data` = TL-сериализация `p_q_inner_data_dc#a9f55f95 pq p q nonce server_nonce new_nonce dc` (dc: к ID тестового DC прибавляется 10000); проверить `data.length ≤ 144`.
- [x] B.3 `data_with_padding` = data + рандом, ровно 192 байта.
- [x] B.4 `data_pad_reversed` = BYTE_REVERSE(data_with_padding) (реверс всех 192 байт).
- [x] B.5 Случайный 32-байтовый `temp_key`.
- [x] B.6 `data_with_hash` = data_pad_reversed + SHA256(temp_key + data_with_padding) → 224 байта.
- [x] B.7 `aes_encrypted` = AES256-IGE(data_with_hash, temp_key, IV = 0) → 224 байта.
- [x] B.8 `temp_key_xor` = temp_key XOR SHA256(aes_encrypted) → 32 байта.
- [x] B.9 `key_aes_encrypted` = temp_key_xor + aes_encrypted → ровно 256 байт; если это число ≥ модуля RSA — начать с п. B.5 заново.
- [x] B.10 `encrypted_data` = RSA(key_aes_encrypted) = key_aes_encrypted^e mod n, big-endian ровно 256 байт (ведущие нули дописать).

### C. req_DH_params → server_DH_params_ok

- [x] C.1 Отправить `req_DH_params#d712e4be nonce server_nonce p q public_key_fingerprint encrypted_data`.
- [x] C.2 Ошибки −404 (перезапуск всего хендшейка) и −444 (тестовый DC не тому серверу) — распознавать и пробрасывать.
- [x] C.3 Ответ `server_DH_params_ok#d0e8075c nonce server_nonce encrypted_answer` (или server_DH_params_fail — тоже распознать по id).

### D. Расшифровка encrypted_answer (tmp_aes)

- [x] D.1 `tmp_aes_key` = SHA1(new_nonce + server_nonce) + substr(SHA1(server_nonce + new_nonce), 0, 12) → 32 байта.
- [x] D.2 `tmp_aes_iv` = substr(SHA1(server_nonce + new_nonce), 12, 8) + SHA1(new_nonce + new_nonce) + substr(new_nonce, 0, 4) → 32 байта.
- [x] D.3 `answer_with_hash` = AES256-IGE-decrypt(encrypted_answer, tmp_aes_key, tmp_aes_iv); длина кратна 16.
- [x] D.4 Разбор: `SHA1(answer) + answer + 0..15 рандома`; сверить SHA1(answer) с первыми 20 байтами.
- [x] D.5 `answer` = TL-декод `server_DH_inner_data#b5890dba nonce server_nonce g dh_prime g_a server_time`.
- [x] D.6 Проверить nonce и server_nonce; запомнить `server_time` (разница с локальным временем — для msg_id).

### E. Валидация (спека, «Client is expected to check»)

- [x] E.1 dh_prime: `2^2047 < p < 2^2048` (ровно 2048 бит), p и (p−1)/2 — простые (Miller–Rabin; кэшировать результат).
- [x] E.2 g ∈ {2..7} и условие на p mod 4g: g=2 → p mod 8 = 7; g=3 → p mod 3 = 2; g=4 → без условия; g=5 → p mod 5 ∈ {1,4}; g=6 → p mod 24 ∈ {19,23}; g=7 → p mod 7 ∈ {3,5,6}.
- [x] E.3 g, g_a, g_b ∈ (1, dh_prime−1); рекомендуется g_a, g_b ∈ [2^1984, dh_prime − 2^1984].
- [x] E.4 Известный dh_prime из спеки (256 байт, C71C…CC5B) — в таблицу «good primes», чтобы не перепроверять каждый раз; в юнит-тестах — положительный и отрицательный векторы валидации.

### F. set_client_DH_params

- [x] F.1 Случайный 2048-битный `b`; `g_b` = pow(g, b) mod dh_prime.
- [x] F.2 `data` = TL-сериализация `client_DH_inner_data#6643b654 nonce server_nonce retry_id g_b`; retry_id = 0 на первой попытке.
- [x] F.3 `data_with_hash` = SHA1(data) + data + 0..15 рандома, длина кратна 16.
- [x] F.4 `encrypted_data` = AES256-IGE(data_with_hash, tmp_aes_key, tmp_aes_iv).
- [x] F.5 Отправить `set_client_DH_params#f5045f1f nonce server_nonce encrypted_data`.

### G. Вывод ключа и ответы dh_gen_*

- [x] G.1 `auth_key` = pow(g_a, b) mod dh_prime, big-endian ровно 256 байт (ведущие нули).
- [x] G.2 `auth_key_hash` = последние 8 байт SHA1(auth_key) как LE-long (= auth_key_id).
- [x] G.3 `auth_key_aux_hash` = первые 8 байт SHA1(auth_key).
- [x] G.4 Ответ сервера один из: `dh_gen_ok#3bcbf734` / `dh_gen_retry#46dc1fb9` / `dh_gen_fail#a69dae02` — nonce, server_nonce, new_nonce_hashN.
- [x] G.5 `new_nonce_hashN` = substr(SHA1(new_nonce + [0x0N] + auth_key_aux_hash), 4, 16) — сверить для N=1,2,3.
- [x] G.6 dh_gen_retry → новая попытка (новый b, retry_id = auth_key_aux_hash предыдущей попытки); dh_gen_fail → ошибка хендшейка.
- [x] G.7 Успех: `server_salt` = substr(new_nonce, 0, 8) XOR substr(server_nonce, 0, 8); выбросить всё временное, оставить auth_key, auth_key_id, server_salt, server_time_diff.

### H. Юнит-тест на фейковом in-memory сервере

- [x] H.1 Фейковый сервер отвечает на req_pq_multi / req_DH_params / set_client_DH_params; RSA — сгенерировать тестовую пару (throwaway, в репозиторий не коммитить) или подложить известный приватный ключ.
- [x] H.2 Ветки: dh_gen_ok (сверка auth_key с обеих сторон, server_salt, auth_key_id), dh_gen_retry (повтор), dh_gen_fail (ошибка), неверный nonce, битый SHA1(answer), невалидный dh_prime/g/g_a.

## Шаг 2. Стыковка (референс — ~/Dev/tdlib)

- Handshake: `DhHandshake.cpp` + `Handshake.cpp`: req_pq_multi → resPQ (факторизация pq, сверка server_public_key_fingerprints) → req_DH_params (RSA-шифрование) → server_DH_inner_data (tmp_KDF, проверки g/p/a) → set_client_DH_params → dh_gen_ok (сверка SHA-1-хэшей new_nonce)
- Контейнер: `KDF.cpp` (msg_key → aes_key/iv, KDF2 SHA-256, X=0 для клиент→сервер, X=8 обратно), `CryptoStorer.h` (salt, seq_no, msg_id), паддинг 12..1024 случайных байт
- Транспорт: `IStreamTransport.cpp` (abridged/intermediate), obfuscated2 (`RawConnection.cpp`/`ProxySecret.cpp`)
- Служебный слой: `AuthData.cpp`/`SessionConnection.cpp` — msgs_ack, bad_msg_notification, bad_server_salt, msg_container, синхронизация времени. Без него сервер разрывает соединение даже при успешном handshake

## Шаг 3. Реализация от мелкого к крупному (каждый слой — юнит-тесты)

1. [x] Пакет + скопированный crypto + SHA-1 (с комментарием, см. шаг 1) + RSA + факторизация pq. Векторы: `tdutils/test/pq.cpp`, `tdutils/test/crypto.cpp`, NIST/RFC
2. [x] Шифроконтейнер: msg_key, KDF, AES-IGE, паддинг 0..15 — фикстуры
3. [x] Фреймлинг (abridged/intermediate) и obfuscated2 — round-trip
4. [x] DH-handshake целиком — юнит с фейковым сервером (in-memory stream), все ветки dh_gen_*
5. [x] Session/rpc: msg_id/seq_no/acks/bad_msg, rpc_result/rpc_error
6. [x] Служебный слой: msgs_ack, bad_msg_notification, bad_server_salt, msg_container, синхронизация времени
7. [x] auth.sendCode/signIn — заготовки

## Шаг 4. Интеграция с официальным тестовым сервером + тестирование

- [x] 4.1 Тестовый DC + RSA-ключ + SOCKS5-транспорт (vibe-stream:socks): рукопожатие с 149.154.167.40 через Tor 127.0.0.1:9050 проходит, authKeyId получен, authKey 256 байт, timeOffset -6 (probe)
  Что было неверно: unencrypted-обёртка (auth_key_id 0, msg_id, length) не добавлялась; fingerprint считался с префиксом конструктора (по спеке и TDLib - только n и e); в resPQ не читался конструктор Vector; SHA-1 в encrypted_answer сверялся с хвостом вместо answer без padding. Сеть не блокировала: TDLib через тот же Tor получает connectionStateReady.
- [x] 4.2 Доходит до dh_gen_ok (performHandshake возвращает результат)
  - [x] 4.2.1 help.getConfig поверх ключа: invokeWithLayer(initConnection(help.getConfig)) через Tor, ответ rpc_result с config#cc1a241e (560 байт, gzip_packed распаковывается)
- [x] 4.3 auth.sendCode / signIn (разбит на 4.3.1 и 4.3.2)
  - [x] 4.3.1 TL-кодировщики `auth.sendCode` / `auth.signIn`, разбор `auth.sentCode` (phone_code_hash) и признак `auth.authorization`; юнит-тесты
  - [FAILED] 4.3.2 Живой `sendCode` / `signIn` на тестовом DC
    Причина: `auth.sendCode` на DC 2 даёт PHONE_MIGRATE_1, на DC 1 проходит (тип sentCodeTypeApp, phone_code_hash получен), но код `12345` отклоняется с PHONE_CODE_INVALID: тестовый DC доставляет код в существующую сессию приложения, а её нет. Обход `auth.importBotAuthorization` реализован, но токена нет: Telegram публикует только sample `api_id`/`api_hash`, токены ботов выдаёт @BotFather и они не публикуются (проверены core.telegram.org, исходники TDLib и его тесты). С фиктивным токеном сервер отвечает API_ID_INVALID. Нужен номер/аккаунт или токен тестового бота от пользователя; тогда пункт можно переоткрыть.
- [x] 4.4 Прогнать `dub test` по всем модулям `mtp` и зафиксировать результат: 18 модулей проходят (`dub test` в `mtp/`)
- [FAILED] 4.5 Реальный прогон: handshake + help.getConfig + auth на тестовом DC через SOCKS5
  Причина: handshake и help.getConfig проходят (проверено), auth не завершается по причине из 4.3.2 (нужен реальный номер/код).
- [x] 4.6 Старый пакет `mtproto` больше не существует: удалён по просьбе пользователя вместе с его `subPackage` в корневом `dub.sdl`
- [x] 4.7 Убедиться, что `api_id`/`api_hash` не попали в репозиторий: в `mtp/` только публичные sample-ключи TDLib в `probe/testcreds.d` (по решению пользователя)

## Шаг 5. Фундамент для Bot API (MTProto-сторона, без телефона)

Bot API живёт отдельным пакетом (см. корневой `PLAN.md`); здесь — то, что ему нужно от `mtp` и что можно делать до появления токена/номера. Все кодеки проверяются юнит-тестами на фиксированных векторах, живой прогон — за `MTP_BOT_TOKEN`.

- [x] 5.1 Bot-сессия (разбит на 5.1.1 и 5.1.2)
  - [x] 5.1.1 Фейковый in-memory RPC-сервер: принимает зашифрованное сообщение, отвечает `rpc_result` / `rpc_error` тем же ключом — `rtest.d`
  - [x] 5.1.2 Тест `auth.importBotAuthorization`: успех и ошибки ACCESS_TOKEN_INVALID / API_ID_INVALID
- [x] 5.2 Peer-типы: `inputPeerSelf`, `inputPeerUser`, `inputPeerChat`, `inputPeerChannel`; разбор `peerUser`/`peerChat`/`peerChannel` (`api.d`, юнит-тесты)
- [x] 5.3 `contacts.resolveUsername` → `InputPeer` для `@username` (`encodeContactsResolveUsername`, `decodeResolvedPeer`)
- [x] 5.4 `messages.sendMessage` (random_id, peer, message) + разбор `updateShortSentMessage` (`api.d`; сущности и остальные `updates` — в 5.8)
- [x] 5.5 `messages.editMessage`, `messages.deleteMessages`, `messages.setTyping` + разбор `messages.affectedMessages` (`api.d`)
- [x] 5.7 getMe / getChat (разбит)
  - [x] 5.7.1 getMe: `users.getUsers` с `inputUserSelf`, разбор первого `user#b1b8cc83` (id, имена, username, bot/self)
  - [x] 5.7.2 getChat: `messages.getChats` + разбор `chat#41cbf256` / `channel#d49f34c6` (id, title); полный `chatFull` не нужен для базового getChat
- [x] 5.8 Updates (разбит)
  - [x] 5.8.1 `updates.getState` + разбор `updates.state`; `updates.getDifference` + разбор `differenceEmpty` / `tooLong` / `slice` / `full`
  - [x] 5.8.2 Разбор контейнеров updates и самих update-объектов (разбит)
    - [x] 5.8.2.1 Обходчик TL-объектов: таблица `schema.d` (1369 конструкторов, генератор `mtp/tools/gen_schema.py`) и `tlwalk.d` (`skipObject`/`skipValue` для объектов, векторов, флагов `flags`/`flags2`)
    - [x] 5.8.2.2 Декодеры `message` (id/date/text) и базовых bot-updates (`updateNewMessage`, `updateEditMessage`, `updateDeleteMessages`, `updateMessageID`) — `objects.d`
    - [x] 5.8.2.3 Контейнеры `updates#74ae4240` / `updatesCombined` / `updateShort*` / `updatesTooLong`
- [x] 5.9 DC-миграция: `help.getNearestDc`, `auth.exportAuthorization` / `auth.importAuthorization`, `migrationDc` для `PHONE_MIGRATE_x` / `NETWORK_MIGRATE_x` / `USER_MIGRATE_x`
- [x] 5.10 `floodWaitSeconds` для `FLOOD_WAIT_x` / `FLOOD_PREMIUM_WAIT_x` (пауза и повтор — на стороне вызывающего)
- [FAILED] 5.11 Probe bot-режима за `MTP_BOT_TOKEN`: getMe → sendMessage
  Причина: нет токена тестового бота (см. 4.3.2); код готов, но живой прогон без токена невозможен.
- [x] 5.12 Юнит-тесты на все новые кодеки: round-trip, id сверены с `telegram_api.tl` TDLib

## Решения

- Имя пакета — `mtp`.
- SOCKS5-прокси для тестового DC — да, тот же `vibe-stream:socks`.
- Интеграция и тестирование объединены в последний шаг плана: реальный прогон и есть проверка интеграции.
