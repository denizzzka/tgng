#!/usr/bin/env python3
"""Generates source/tgng/mtp/schema.d from TDLib's telegram_api.tl.

Usage: python3 mtp/tools/gen_schema.py ~/Dev/tdlib/td/generate/scheme/telegram_api.tl mtp/source/tgng/mtp/schema.d
"""
import re
import sys

src_path, out_path = sys.argv[1], sys.argv[2]
ctors = {}
dups = 0
with open(src_path) as f:
    for line in f:
        s = line.strip()
        if not s or s.startswith('//') or s.startswith('---'):
            continue
        m = re.match(r'^(\w+)#([0-9a-fA-F]+)\s+(.*?)=\s*(.+?);$', s)
        if not m:
            continue
        name, idhex, rest, _result = m.groups()
        fields = []
        for tok in rest.split():
            if tok.startswith('{') or ':' not in tok:
                continue
            fname, ftype = tok.split(':', 1)
            flag, flags_index = -1, 0
            mm = re.match(r'flags(2?)\.(\d+)\?(.*)$', ftype)
            if mm:
                flags_index = 1 if mm.group(1) == '2' else 0
                flag = int(mm.group(2))
                ftype = mm.group(3)
            fields.append((fname, ftype, flag, flags_index))
        cid = int(idhex, 16)
        if cid in ctors:
            dups += 1
            continue
        ctors[cid] = (name, fields)

def dstr(s):
    return '"' + s.replace('\\', '\\\\').replace('"', '\\"') + '"'

with open(out_path, 'w') as out:
    out.write('/// Generated from TDLib telegram_api.tl: constructor id to fields.\n')
    out.write('/// Do not edit by hand; regenerate with mtp/tools/gen_schema.py.\n')
    out.write('module tgng.mtp.schema;\n\n')
    out.write('/// One field of a constructor.\n')
    out.write('struct SchemaField\n{\n')
    out.write('\tstring name;\n\tstring type;\n')
    out.write('\t/// Flag bit when the field is optional, otherwise -1.\n')
    out.write('\tint flag;\n')
    out.write('\t/// 0 for flags, 1 for flags2.\n')
    out.write('\tint flagsIndex;\n}\n\n')
    out.write('/// One TL constructor and its fields in wire order.\n')
    out.write('struct SchemaConstructor\n{\n')
    out.write('\tuint id;\n\tstring name;\n\tSchemaField[] fields;\n}\n\n')
    out.write('/// All constructors, sorted by id for binary search.\n')
    out.write('immutable SchemaConstructor[] schemaConstructors = [\n')
    for cid in sorted(ctors):
        name, fields = ctors[cid]
        fparts = ', '.join(
            f'SchemaField({dstr(fn)}, {dstr(ft)}, {fl}, {fi})'
            for fn, ft, fl, fi in fields)
        out.write(f'\tSchemaConstructor(0x{cid:08X}, {dstr(name)}, [{fparts}]),\n')
    out.write('];\n\n')
    out.write('/// Finds a constructor by id, or null.\n')
    out.write('const(SchemaConstructor)* schemaFind(uint id) @safe nothrow\n{\n')
    out.write('\tsize_t lo = 0;\n\tsize_t hi = schemaConstructors.length;\n')
    out.write('\twhile (lo < hi)\n\t{\n')
    out.write('\t\tauto mid = (lo + hi) / 2;\n')
    out.write('\t\tif (schemaConstructors[mid].id < id)\n')
    out.write('\t\t\tlo = mid + 1;\n\t\telse\n\t\t\thi = mid;\n\t}\n')
    out.write('\tif (lo < schemaConstructors.length && schemaConstructors[lo].id == id)\n')
    out.write('\t\treturn &schemaConstructors[lo];\n')
    out.write('\treturn null;\n}\n')

print(f"constructors: {len(ctors)}, duplicates skipped: {dups}")
