/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module tg_client_api.functions.fragment_functions;

import tg_client_api.functions.tl_function;
import tg_client_api.types.common_types;

/// TL function `fragment.getCollectibleInfo`, id 0xBE1E85BA.
final class fragment_getCollectibleInfo : TlFunction
{
    enum uint tlId = 0xBE1E85BA;

    InputCollectible collectible;

    override uint tlIdValue() const nothrow { return tlId; }
}

