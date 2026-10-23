module app;

import tgng.mcp.backend: NotLoggedInBackend;
import tgng.mcp.server: handleRequest;

import vibe.data.json: Json, parseJsonString;

import std.stdio: stdin, stdout, writeln;

void main()
{
	auto backend = new NotLoggedInBackend();

	foreach (line; stdin.byLine)
	{
		if (line.length == 0)
			continue;

		Json request;
		try
			request = parseJsonString(line.idup);
		catch (Exception)
		{
			stdout.writeln(`{"jsonrpc":"2.0","id":null,"error":{"code":-32700,"message":"Parse error"}}`);
			stdout.flush();
			continue;
		}

		auto response = handleRequest(request, backend);
		if (response.type == Json.Type.undefined)
			continue;

		stdout.writeln(response.toString);
		stdout.flush();
	}
}
