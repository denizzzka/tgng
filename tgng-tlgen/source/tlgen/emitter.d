/**
 * Emits D source from a parsed TL scheme.
 *
 * The layout follows the generator pattern used by TDLib and grammers: the
 * output is split per namespace under `types/`, functions live under
 * `functions/`, and a `package.d` re-exports everything.
 */
module tlgen.emitter;

import std.algorithm : canFind, filter, map, sort, uniq;
import std.array : appender, array, join;
import std.conv : to;
import std.string : format, replace, startsWith;

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

    auto symbols = buildSymbols(scheme, options.packageName);

    string[] modulePaths;
    foreach (ns; namespaces(types)) {
        auto modulePath = "types/" ~ typeModuleName(ns);
        modulePaths ~= modulePath;
        files ~= emitNamespace(ns, types, symbols, options, false);
    }
    foreach (ns; namespaces(functions)) {
        auto modulePath = "functions/" ~ functionModuleName(ns);
        modulePaths ~= modulePath;
        files ~= emitNamespace(ns, functions, symbols, options, true);
    }

    files ~= EmittedFile("package.d", emitPackage(options, modulePaths));
    return files;
}

/// Maps every generated constructor class name to the type module that
/// declares it, so a module can import exactly the siblings it mentions.
private struct SymbolTable
{
    /// fully qualified module name, e.g. `tgcapi.gen.types.common_types`.
    string[string] modules;

    void addConstructor(string className, string ns, string packageName)
    {
        modules[className] = packageName ~ ".types." ~ typeModuleName(ns);
    }

    string lookup(string className) const pure
    {
        auto found = className in modules;
        return found is null ? "" : *found;
    }
}

private SymbolTable buildSymbols(const TlScheme scheme, string packageName)
{
    SymbolTable symbols;
    foreach (c; scheme.combinators) {
        if (c.isFunction)
            continue;
        // A constructor is a class named after the full TL name, declared in
        // the types module of its own namespace.
        symbols.addConstructor(dIdent(c.name), c.namespace_(), packageName);
    }
    return symbols;
}

private string[] namespaces(const TlCombinator[] combinators)
{
    return combinators.map!(c => c.namespace_()).array.sort().uniq().array;
}

private string typeModuleName(string ns)
{
    return (ns.length == 0 ? "common" : dIdent(ns)) ~ "_types";
}

private string functionModuleName(string ns)
{
    return (ns.length == 0 ? "common" : dIdent(ns)) ~ "_functions";
}

private EmittedFile emitNamespace(string ns, const TlCombinator[] combinators,
        const SymbolTable symbols, EmitOptions options, bool isFunctions)
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
    auto moduleName = isFunctions ? functionModuleName(ns) : typeModuleName(ns);
    auto dir = isFunctions ? "functions" : "types";
    auto selfModule = options.packageName ~ "." ~ dir ~ "." ~ moduleName;

    auto buffer = appender!string;
    buffer ~= "/// Generated from the TL scheme. Do not edit.\n";
    buffer ~= format("/// %s\n", options.sourceNote);
    buffer ~= format("module %s;\n", selfModule);

    auto imports = moduleImports(selected, symbols, selfModule);
    if (imports.length > 0) {
        buffer ~= "\n";
        foreach (imported; imports)
            buffer ~= format("import %s;\n", imported);
    }
    buffer ~= "\n";

    if (!isFunctions)
        buffer ~= emitSumTypes(selected);

    foreach (c; selected)
        buffer ~= emitCombinator(c);

    return EmittedFile(format("%s/%s.d", dir, moduleName), buffer.data);
}

/// The type modules this module must import to resolve the classes it
/// references: every non-primitive field type, vector element and result that
/// lives in another module. Importing only what is needed keeps the module
/// graph acyclic.
private string[] moduleImports(const TlCombinator[] combinators,
        const SymbolTable symbols, string self)
{
    string[] names;
    foreach (c; combinators) {
        foreach (arg; c.args) {
            auto base = arg.baseType();
            if (base == "true")
                continue;
            auto element = isVector(base) ? vectorElement(base) : base;
            names ~= referencedClass(element);
        }
        if (!c.isFunction && c.result.length > 0 && !isPrimitive(c.result))
            names ~= referencedClass(c.result);
    }

    string[] modules;
    foreach (name; names) {
        if (name.length == 0)
            continue;
        auto target = symbols.lookup(name);
        if (target.length == 0 || target == self)
            continue;
        if (!modules.canFind(target))
            modules ~= target;
    }
    return modules.sort().array;
}

/// The D class a field type refers to, or `""` for primitives and the generic
/// query placeholder.
private string referencedClass(string tlType)
{
    if (tlType.length == 0 || isPrimitive(tlType) || tlType[0] == '!')
        return "";
    return dIdent(tlType);
}

/// Emits one `abstract class` per TL result type, listing its constructors.
private string emitSumTypes(const TlCombinator[] combinators)
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
        buffer ~= "    abstract uint tlIdValue() const nothrow;\n";
        foreach (member; members)
            buffer ~= format("    // constructor: %s\n", member);
        buffer ~= "}\n\n";
    }
    return buffer.data;
}

/// Emits one concrete class for a constructor or a method.
private string emitCombinator(TlCombinator c)
{
    auto buffer = appender!string;
    auto name = dIdent(c.name);
    auto base = c.isFunction ? "" : baseClass(c.result);

    buffer ~= format("/// TL %s `%s`, id 0x%08X.\n", c.isFunction ? "function" : "constructor",
        c.name, c.id);
    buffer ~= format("final class %s%s\n{\n", name,
        base.length > 0 ? " : " ~ base : "");
    buffer ~= format("    enum uint tlId = 0x%08X;\n", c.id);

    if (c.args.length > 0) {
        buffer ~= "\n";
        foreach (arg; c.args)
            buffer ~= emitField(arg);
    }

    buffer ~= "\n";
    buffer ~= "    override uint tlIdValue() const nothrow { return tlId; }\n";
    buffer ~= "}\n\n";
    return buffer.data;
}

private string emitField(TlArg arg)
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
        return "";
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
        && tlType[$ - 1] == '>';
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

private string emitPackage(EmitOptions options, string[] modulePaths)
{
    auto buffer = appender!string;
    buffer ~= "/// Generated from the TL scheme. Do not edit.\n";
    buffer ~= format("/// %s\n", options.sourceNote);
    buffer ~= format("module %s;\n\n", options.packageName);

    foreach (modulePath; modulePaths.sort()) {
        auto fqn = options.packageName ~ "." ~ modulePath.replace("/", ".");
        buffer ~= format("public import %s;\n", fqn);
    }
    return buffer.data;
}
