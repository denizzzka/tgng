/**
 * Semantic model of a TL scheme and the parser that produces it.
 */
module tlgen.model;

import std.algorithm: canFind, endsWith, filter, map, startsWith;
import std.array: array, split;
import std.conv: to;
import std.string: indexOf, strip, stripRight;

/// One argument of a combinator, e.g. `peer:InputPeer` or `flags.0?peer`.
struct TlArg
{
    string name;       /// as written in the scheme, e.g. `user_id`
    string type;       /// type as written, e.g. `flags.0?InputPeer`, `Vector<long>`

    bool hasFlag;      /// the argument carries a presence bit of `flags`/`flags2`
    string flagMask;   /// `flags` or `flags2`
    int flagBit = -1;  /// bit index inside the mask
    bool isMask;       /// `true` for the `flags:#` argument itself

    /// Type without the `flags.N?` presence wrapper.
    string baseType() const pure
    {
        if (!hasFlag)
            return type;
        auto q = type.indexOf('?');
        return q < 0 ? type : type[q + 1 .. $];
    }

    bool isTrueFlag() const pure
    {
        return hasFlag && baseType() == "true";
    }
}

/// One combinator: a constructor or a method of the scheme.
struct TlCombinator
{
    string name;        /// full name, e.g. `messages.getHistory`
    uint id;            /// constructor id (CRC32 from the scheme)
    TlArg[] args;
    string result;      /// result type as written, e.g. `messages.Messages`
    bool isFunction;

    string namespace_() const pure
    {
        auto dot = name.indexOf('.');
        return dot < 0 ? "" : name[0 .. dot];
    }

    string bareName() const pure
    {
        auto dot = name.indexOf('.');
        return dot < 0 ? name : name[dot + 1 .. $];
    }
}

/// A whole parsed scheme.
struct TlScheme
{
    TlCombinator[] combinators;
}

/// Parses one or more `.tl` sources; sources are concatenated in order.
TlScheme parseScheme(const(string)[] sources)
{
    TlScheme scheme;
    bool functions = false;

    foreach (source; sources) {
        foreach (rawLine; source.split('\n')) {
            auto line = stripComment(rawLine.stripRight("\r")).strip;
            if (line.length == 0)
                continue;

            if (line.startsWith("---")) {
                functions = line.canFind("functions");
                continue;
            }

            foreach (stmt; line.split(';')) {
                stmt = stmt.strip;
                if (stmt.length == 0)
                    continue;
                auto parsed = parseStatement(stmt, functions);
                if (parsed.found)
                    scheme.combinators ~= parsed.combinator;
            }
        }
    }

    return scheme;
}

private string stripComment(string line) pure
{
    auto pos = line.indexOf("//");
    return pos < 0 ? line : line[0 .. pos];
}

/// Result of parsing one statement; `found` is false for builtin aliases and
/// for the builtin `vector` declaration, which are handled by the emitter.
struct ParsedStatement
{
    bool found;
    TlCombinator combinator;
}

/// Parses one `name#id args = Result` statement.
private ParsedStatement parseStatement(string stmt, bool isFunction)
{
    ParsedStatement parsed;

    auto eq = stmt.indexOf('=');
    if (eq < 0)
        return parsed;

    auto lhs = stmt[0 .. eq].strip;
    auto rhs = stmt[eq + 1 .. $].strip;

    uint id;
    bool hasId;
    auto hash = lhs.indexOf('#');
    if (hash > 0) {
        auto idStart = hash + 1;
        auto idEnd = idStart;
        while (idEnd < lhs.length && isHexDigit(lhs[idEnd]))
            idEnd++;
        if (idEnd > idStart) {
            id = to!uint(lhs[idStart .. idEnd], 16);
            hasId = true;
            lhs = (lhs[0 .. hash] ~ " " ~ lhs[idEnd .. $]).strip;
        }
    }

    auto tokens = lhs.split().filter!(t => t.length > 0).array;
    if (tokens.length == 0)
        return parsed;

    auto name = tokens[0];
    if (name == "?" || name == "vector")
        return parsed;
    if (!hasId)
        return parsed;

    TlCombinator c;
    c.name = name;
    c.id = id;
    c.isFunction = isFunction;

    foreach (tok; tokens[1 .. $]) {
        if (tok == "#" || tok == "[" || tok == "]")
            continue; // legacy `vector {t:Type} # [ t ]`
        if (tok.startsWith("{") && tok.endsWith("}"))
            continue; // generic parameter
        auto colon = tok.indexOf(':');
        if (colon < 0)
            continue;

        TlArg arg;
        arg.name = tok[0 .. colon];
        arg.type = tok[colon + 1 .. $];
        if (arg.type == "#") {
            arg.isMask = true;
        } else {
            auto q = arg.type.indexOf('?');
            if (q > 0) {
                auto maskPart = arg.type[0 .. q];
                auto dot = maskPart.indexOf('.');
                if (dot > 0) {
                    arg.hasFlag = true;
                    arg.flagMask = maskPart[0 .. dot];
                    arg.flagBit = to!int(maskPart[dot + 1 .. $]);
                }
            }
        }
        c.args ~= arg;
    }

    c.result = rhs;
    parsed.found = true;
    parsed.combinator = c;
    return parsed;
}

private bool isHexDigit(char ch) pure
{
    return (ch >= '0' && ch <= '9') || (ch >= 'a' && ch <= 'f') || (ch >= 'A' && ch <= 'F');
}
