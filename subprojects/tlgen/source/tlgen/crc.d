/**
 * CRC32 (IEEE) used by the TL scheme to identify constructors.
 *
 * The TL id of a combinator is `crc32(signature)`, where the signature is the
 * scheme line with the `#id` removed and with the trailing `= Result` kept,
 * for example `boolTrue = Bool` or
 * `inputPeerUser user_id:long access_hash:long = InputPeer`.
 */
module tlgen.crc;

uint crc32(const(char)[] data)
{
    static immutable uint[256] table = () {
        uint[256] result;
        foreach (i; 0 .. 256) {
            uint c = cast(uint) i;
            foreach (_; 0 .. 8)
                c = (c & 1) ? 0xEDB88320u ^ (c >> 1) : (c >> 1);
            result[i] = c;
        }
        return result;
    }();

    uint crc = 0xFFFFFFFFu;
    foreach (b; data)
        crc = table[(crc ^ b) & 0xFF] ^ (crc >> 8);
    return crc ^ 0xFFFFFFFFu;
}
