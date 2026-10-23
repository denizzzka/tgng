/// Telegram access behind the MCP tools.
module tgng.mcp.backend;

import vibe.data.json: Json;

/// Raised when a tool cannot reach Telegram.
class McpBackendException: Exception
{
	this(string message, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		super(message, file, line);
	}
}

/// Operations exposed as MCP tools.
interface Backend
{
	Json getMe();
	Json listChats(int limit);
	Json getHistory(string peer, int limit);
	Json sendMessage(string peer, string text);
}

/// Stands in until a logged-in MTProto session exists.
class NotLoggedInBackend: Backend
{
	private static McpBackendException _error() @safe
	{
		return new McpBackendException("not logged in: run `tgng-mcp login` first");
	}

	Json getMe()
	{
		throw _error();
	}

	Json listChats(int limit)
	{
		throw _error();
	}

	Json getHistory(string peer, int limit)
	{
		throw _error();
	}

	Json sendMessage(string peer, string text)
	{
		throw _error();
	}
}
