/**
 * `tlgen` — a TL scheme to D code generator.
 *
 * Usage:
 *     dub run :tlgen
 *
 * The command reads the schemes from `subprojects/tgcapi/scheme` and writes the
 * generated D modules into `subprojects/tgcapi/source/tgcapi/gen`, overwriting
 * them in place.
 */
module app;

import std.file : exists, mkdirRecurse, readText, write;
import std.path : buildPath, dirName;
import std.stdio : stderr, writeln;
import std.string : join, split;

import tlgen.crc : crc32;
import tlgen.emitter : EmittedFile, EmitOptions, emit;
import tlgen.model : TlScheme, parseScheme;

/// Default paths, relative to the repository root.
private enum defaultSchemeDir = "subprojects/tgcapi/scheme";
private enum defaultOutputDir = "subprojects/tgcapi/source/tgcapi/gen";
private enum packageName = "tgcapi.gen";

void main(string[] args)
{
    string schemeDir = defaultSchemeDir;
    string outputDir = defaultOutputDir;

    parseArgs(args, schemeDir, outputDir);

    auto schemeFiles = ["telegram_api.tl", "mtproto_api.tl"];
    string[] sources;
    foreach (file; schemeFiles) {
        auto path = buildPath(schemeDir, file);
        if (!exists(path))
            continue;
        sources ~= readText(path);
    }

    if (sources.length == 0) {
        stderr.writeln("tlgen: no scheme files found in ", schemeDir);
        return;
    }

    auto scheme = parseScheme(sources);

    auto options = EmitOptions(outputDir, packageName,
        "Input: " ~ schemeFiles.join(", "));

    auto files = emit(scheme, options);
    foreach (file; files)
        writeFile(buildPath(outputDir, file.path), file.content);

    writeln("tlgen: wrote ", files.length, " file(s) to ", outputDir);
}

private void parseArgs(string[] args, ref string schemeDir, ref string outputDir)
{
    foreach (i, arg; args) {
        if (arg == "--scheme-dir" && i + 1 < args.length)
            schemeDir = args[i + 1];
        else if (arg == "--output" && i + 1 < args.length)
            outputDir = args[i + 1];
    }
}

private void writeFile(string path, string content)
{
    auto dir = dirName(path);
    if (!exists(dir))
        mkdirRecurse(dir);
    write(path, content);
}
