/// Generated from the TL scheme. Do not edit.
/// Input: telegram_api.tl, mtproto_api.tl
module client_api.gen.functions.aicompose_functions;

/// TL function `aicompose.createTone`, id 0x4AA83913.
final class aicompose_createTone
{
    enum uint tlId = 0x4AA83913;

    uint flags;
    bool display_author;
    long emoji_id;
    string title;
    string prompt;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `aicompose.updateTone`, id 0x903BCF59.
final class aicompose_updateTone
{
    enum uint tlId = 0x903BCF59;

    uint flags;
    InputAiComposeTone tone;
    bool display_author;
    long emoji_id;
    string title;
    string prompt;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `aicompose.saveTone`, id 0x1782CBB1.
final class aicompose_saveTone
{
    enum uint tlId = 0x1782CBB1;

    InputAiComposeTone tone;
    bool unsave;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `aicompose.deleteTone`, id 0xDD39316A.
final class aicompose_deleteTone
{
    enum uint tlId = 0xDD39316A;

    InputAiComposeTone tone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `aicompose.getTone`, id 0xB2E8BA03.
final class aicompose_getTone
{
    enum uint tlId = 0xB2E8BA03;

    InputAiComposeTone tone;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `aicompose.getTones`, id 0xABD59201.
final class aicompose_getTones
{
    enum uint tlId = 0xABD59201;

    long hash;

    override uint tlIdValue() const nothrow { return tlId; }
}

/// TL function `aicompose.getToneExample`, id 0xD1B4AB14.
final class aicompose_getToneExample
{
    enum uint tlId = 0xD1B4AB14;

    InputAiComposeTone tone;
    int num;

    override uint tlIdValue() const nothrow { return tlId; }
}

