/**
 * Emits D source from a parsed TL scheme.
 *
 * The layout follows the generator pattern used by TDLib and grammers: the
 * output is split per namespace under `types/`, functions live under
 * `functions/`, and a `package.d` re-exports everything.
 */
module tlgen.emitter;

import std.algorithm : canFind, endsWith, filter, map, sort, uniq;
import std.array : appender, array, join;
import std.conv : to;
import std.string : format, indexOf, replace, split, startsWith;

import tlgen.model : TlArg, TlCombinator, TlScheme;
import tlgen.naming : dIdent;

/// Everything that the emitter needs from the outside.
struct EmitOptions
{
    string outputDir;   /// root of the generated tree
    string packageName; /// D package the modules live in, e.g. `tgcapi.gen`
    string sourceNote;  /// header note with the input scheme paths
}

/// Files produced by one run: relative path -> contents.
struct EmittedFile
{
    string path;
    string content;
}

/// Turns a scheme into the set of files to write.
EmittedFile[] emit(TlScheme scheme, EmitOptions options)
{
    EmittedFile[] files;

    auto types = scheme.combinators.filter!(c => !c.isFunction).array;
    auto functions = scheme.combinators.filter!(c => c.isFunction).array;

    foreach (ns; namespaces(types))
        files ~= emitNamespace(ns, types, options, false);
    foreach (ns; namespaces(functions))
        files ~= emitNamespace(ns, functions, options, true);

    files ~= EmittedFile("package.d", emitPackage(options));
    return files;
}

private string[] namespaces(const TlCombinator[] combinators)
{
    return combinators.map!(c => c.namespace_()).array.sort().uniq().array;
}

private EmittedFile emitNamespace(string ns, const TlCombinator[] combinators,
        EmitOptions options, bool isFunctions)
{
    // Elements are copied into a mutable array so the emitters can take them
    // by value; the input scheme itself stays read-only.
    TlCombinator[] selected;
    foreach (c; combinators) {
        if (c.namespace_() != ns)
            continue;
        TlCombinator copy;
        copy.name = c.name;
        copy.id = c.id;
        copy.isFunction = c.isFunction;
        copy.result = c.result;
        copy.args = c.args.dup;
        selected ~= copy;
    }
    auto moduleName = (ns.length == 0 ? "common" : dIdent(ns))
        ~ (isFunctions ? "_functions" : "_types");
    auto dir = isFunctions ? "functions" : "types";

    auto buffer = appender!string;
    buffer ~= "/// Generated from the TL scheme. Do not edit.\n";
    buffer ~= format("/// %s\n", options.sourceNote);
    buffer ~= format("module %s.%s;\n\n", options.packageName, moduleName);
    buffer ~= format("import %s;\n\n", options.packageName);

    auto types = selected.filter!(c => !c.isFunction).array;
    if (!isFunctions && types.length > 0)
        buffer ~= emitSumTypes(types, options);

    foreach (c; selected)
        buffer ~= emitCombinator(c, options);

    return EmittedFile(format("%s/%s.d", dir, moduleName), buffer.data);
}

/// Emits one `abstract class` per TL result type, listing its constructors.
private string emitSumTypes(const TlCombinator[] combinators, EmitOptions options)
{
    string[] results;
    foreach (c; combinators) {
        if (c.result.length == 0 || c.result.startsWith("Vector") || isPrimitive(c.result))
            continue;
        if (!results.canFind(c.result))
            results ~= c.result;
    }

    auto buffer = appender!string;
    foreach (result; results) {
        auto base = dIdent(result);
        auto members = combinators.filter!(c => c.result == result)
            .map!(c => dIdent(c.name))
            .array.sort().uniq().array;

        buffer ~= format("/// TL sum type `%s`.\n", result);
        buffer ~= format("abstract class %s\n{\n", base);
        buffer ~= "    /// The id of the concrete constructor.\n";
        buffer ~= "    abstract uint tlId() const nothrow;\n";
        foreach (member; members)
            buffer ~= format("    // constructor: %s\n", member);
        buffer ~= "}\n\n";
    }
    return buffer.data;
}

/// Emits one concrete class for a constructor or a method.
private string emitCombinator(TlCombinator c, EmitOptions options)
{
    auto buffer = appender!string;
    auto name = dIdent(c.name);

    buffer ~= format("/// TL %s `%s`, id 0x%08X.\n", c.isFunction ? "function" : "constructor",
        c.name, c.id);
    buffer ~= format("final class %s%s\n{\n", name,
        c.isFunction ? "" : " : " ~ baseClass(c.result));
    buffer ~= format("    enum uint tlId = 0x%08X;\n", c.id);

    if (c.args.length > 0) {
        buffer ~= "\n";
        foreach (arg; c.args)
            buffer ~= emitField(arg, c);
    }

    buffer ~= "\n";
    buffer ~= format("    override uint tlIdValue() const nothrow { return tlId; }\n");
    buffer ~= "}\n\n";
    return buffer.data;
}

private string emitField(TlArg arg, TlCombinator c)
{
    if (arg.isMask)
        return format("    uint %s;\n", dIdent(arg.name));
    return format("    %s %s;\n", dType(arg), dIdent(arg.name));
}

/// The placeholder used for the type parameter of a `!X` query in an
/// `invoke*` combinator. Callers fill the real request type in themselves.
private enum genericQueryType = "TlObject";

private string baseClass(string result)
{
    if (result.length == 0 || isVector(result) || isPrimitive(result))
        return "Object";
    return dIdent(result);
}

/// Maps a TL type to the D type used in generated fields.
private string dType(TlArg arg)
{
    auto base = arg.baseType();
    if (arg.isTrueFlag())
        return "bool";
    if (isVector(base))
        return "Vector!(" ~ dTypeName(vectorElement(base)) ~ ")";
    return dTypeName(base);
}

/// TL writes vectors either as `Vector<T>` or, in the older mtproto syntax,
/// as `vector<T>`.
private bool isVector(string tlType)
{
    return (tlType.startsWith("Vector<") || tlType.startsWith("vector<"))
        && tlType.endsWith(">");
}

/// The `T` of a `Vector<T>` / `vector<T>` type.
private string vectorElement(string tlType)
{
    return tlType[7 .. $ - 1];
}

private string dTypeName(string tlType)
{
    if (tlType.length > 0 && tlType[0] == '!')
        return genericQueryType;
    switch (tlType) {
        case "int": return "int";
        case "long": return "long";
        case "double": return "double";
        case "int128": return "ubyte[16]";
        case "int256": return "ubyte[32]";
        case "string": return "string";
        case "bytes": return "ubyte[]";
        case "Bool": return "bool";
        case "true": return "bool";
        default: return dIdent(tlType);
    }
}

private bool isPrimitive(string tlType)
{
    switch (tlType) {
        case "int", "long", "double", "int128", "int256", "string", "bytes",
             "Bool", "true":
            return true;
        default:
            return false;
    }
}

private string emitPackage(EmitOptions options)
{
    return format("/// Generated from the TL scheme. Do not edit.\n"
        ~ "/// %s\n"
        ~ "module %s;\n",
        options.sourceNote, options.packageName);
}
