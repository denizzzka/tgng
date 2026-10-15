/**
 * Mapping from TL names to D identifiers.
 *
 * TL keeps snake_case, and the generated D code keeps it as well: only the
 * characters that D does not accept in identifiers are replaced, so `user_id`
 * stays `user_id` and `messages.getHistory` becomes `messages_getHistory`.
 */
module tlgen.naming;

import std.string : replace;

/// Reserved D words that would otherwise collide with generated members.
private immutable string[] keywords = [
    "abstract", "alias", "align", "asm", "assert", "auto", "body", "bool",
    "break", "byte", "case", "cast", "catch", "cdouble", "cent", "cfloat",
    "char", "class", "const", "continue", "creal", "dchar", "debug", "default",
    "delegate", "delete", "deprecated", "do", "double", "else", "enum", "export",
    "extern", "false", "final", "finally", "float", "for", "foreach", "foreach_reverse",
    "function", "goto", "idouble", "if", "ifloat", "immutable", "import", "in",
    "inout", "int", "interface", "invariant", "ireal", "is", "lazy", "long",
    "macro", "mixin", "module", "new", "nothrow", "null", "out", "override",
    "package", "pragma", "private", "protected", "public", "pure", "real", "ref",
    "return", "scope", "shared", "short", "static", "struct", "super", "switch",
    "synchronized", "template", "this", "throw", "true", "try", "typeid", "typeof",
    "ubyte", "uint", "ulong", "union", "unittest", "ushort", "version", "void",
    "wchar", "while", "with", "__FILE__", "__LINE__", "__gshared", "__traits",
];

/// Escapes one TL identifier into a legal D identifier, keeping snake_case.
string dIdent(string tlName)
{
    auto result = tlName.replace(".", "_");
    if (result.length == 0)
        return result;
    if (result[0] >= '0' && result[0] <= '9')
        result = "_" ~ result;
    foreach (keyword; keywords) {
        if (result == keyword)
            return result ~ "_";
    }
    return result;
}
