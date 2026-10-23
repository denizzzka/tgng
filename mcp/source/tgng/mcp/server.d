/// JSON-RPC 2.0 dispatch for the MCP tools.
module tgng.mcp.server;

import tgng.mcp.backend: Backend, NotLoggedInBackend;

import vibe.data.json: Json;

import std.exception: enforce;

enum serverName = "tgng-mcp";
enum serverVersion = "0.1.0";
enum defaultProtocolVersion = "2024-11-05";

/// Handles one request; returns an undefined Json for notifications.
Json handleRequest(Json request, Backend backend)
{
	if (request.type != Json.Type.object)
		return errorResponse(Json(), -32600, "Invalid Request");

	auto method = request["method"];
	if (method.type != Json.Type.string)
		return errorResponse(Json(), -32600, "Invalid Request");

	auto id = request["id"];
	bool isNotification = id.type == Json.Type.undefined;

	try
	{
		switch (method.get!string)
		{
		case "initialize":
			return resultResponse(id, initializeResult(request));
		case "ping":
			return resultResponse(id, Json.emptyObject);
		case "tools/list":
			return resultResponse(id, toolsList());
		case "tools/call":
			return resultResponse(id, callTool(request, backend));
		case "notifications/initialized":
			return Json();
		default:
			return isNotification ? Json() : errorResponse(id, -32601, "Method not found");
		}
	}
	catch (Exception e)
	{
		return isNotification ? Json() : errorResponse(id, -32603, e.msg);
	}
}

/// Answers `initialize` using the client's protocol version when given.
Json initializeResult(Json request)
{
	auto params = request["params"];
	auto requested = params["protocolVersion"];
	auto protocolVersion = requested.type == Json.Type.string
		? requested.get!string : defaultProtocolVersion;

	Json capabilities = Json.emptyObject;
	capabilities["tools"] = Json.emptyObject;

	Json info = Json.emptyObject;
	info["name"] = serverName;
	info["version"] = serverVersion;

	Json result = Json.emptyObject;
	result["protocolVersion"] = protocolVersion;
	result["capabilities"] = capabilities;
	result["serverInfo"] = info;
	return result;
}

/// The tools advertised to the client.
Json toolsList()
{
	Json tools = Json.emptyArray;
	tools ~= tool("get_me", "Return the logged-in Telegram account",
		schema([]));
	tools ~= tool("list_chats", "List recent chats",
		schema([field("limit", "integer", "Maximum number of chats, default 20")]));
	tools ~= tool("get_history", "Read recent messages of a chat",
		schema([
			field("peer", "string", "Chat username, title or id"),
			field("limit", "integer", "Maximum number of messages, default 20"),
		], ["peer"]));
	tools ~= tool("send_message", "Send a text message to a chat",
		schema([
			field("peer", "string", "Chat username, title or id"),
			field("text", "string", "Message text"),
		], ["peer", "text"]));

	Json result = Json.emptyObject;
	result["tools"] = tools;
	return result;
}

/// Runs `tools/call`.
Json callTool(Json request, Backend backend)
{
	auto params = request["params"];
	auto name = params["name"];
	enforce(name.type == Json.Type.string, "tools/call: name is required");

	auto args = params["arguments"];
	if (args.type != Json.Type.object)
		args = Json.emptyObject;

	try
	{
		switch (name.get!string)
		{
		case "get_me":
			return toolResult(backend.getMe().toString);
		case "list_chats":
			return toolResult(backend.listChats(intArg(args, "limit", 20)).toString);
		case "get_history":
			return toolResult(backend.getHistory(stringArg(args, "peer"),
				intArg(args, "limit", 20)).toString);
		case "send_message":
			return toolResult(backend.sendMessage(stringArg(args, "peer"),
				stringArg(args, "text")).toString);
		default:
			return toolError("unknown tool: " ~ name.get!string);
		}
	}
	catch (Exception e)
	{
		return toolError(e.msg);
	}
}

/// Builds one tool description.
private Json tool(string name, string description, Json inputSchema)
{
	Json tool = Json.emptyObject;
	tool["name"] = name;
	tool["description"] = description;
	tool["inputSchema"] = inputSchema;
	return tool;
}

/// Builds an object schema from the given properties.
private Json schema(Json[] properties, string[] required = null)
{
	Json props = Json.emptyObject;
	foreach (p; properties)
		props[p["name"].get!string] = p["schema"];

	Json inputSchema = Json.emptyObject;
	inputSchema["type"] = "object";
	inputSchema["properties"] = props;
	if (required.length > 0)
	{
		Json req = Json.emptyArray;
		foreach (name; required)
			req ~= name;
		inputSchema["required"] = req;
	}
	return inputSchema;
}

/// One property: name plus its schema and description.
private Json field(string name, string type, string description)
{
	Json prop = Json.emptyObject;
	prop["type"] = type;
	prop["description"] = description;

	Json pair = Json.emptyObject;
	pair["name"] = name;
	pair["schema"] = prop;
	return pair;
}

private string stringArg(Json args, string name)
{
	auto value = args[name];
	enforce(value.type == Json.Type.string, "argument `" ~ name ~ "` must be a string");
	return value.get!string;
}

private int intArg(Json args, string name, int fallback)
{
	auto value = args[name];
	if (value.type == Json.Type.undefined)
		return fallback;
	enforce(value.type == Json.Type.int_, "argument `" ~ name ~ "` must be an integer");
	return cast(int) value.get!long;
}

private Json toolResult(string text)
{
	Json item = Json.emptyObject;
	item["type"] = "text";
	item["text"] = text;

	Json result = Json.emptyObject;
	result["content"] = Json([item]);
	return result;
}

private Json toolError(string message)
{
	auto result = toolResult(message);
	result["isError"] = true;
	return result;
}

private Json resultResponse(Json id, Json result)
{
	Json response = Json.emptyObject;
	response["jsonrpc"] = "2.0";
	response["id"] = id;
	response["result"] = result;
	return response;
}

private Json errorResponse(Json id, int code, string message)
{
	Json error = Json.emptyObject;
	error["code"] = code;
	error["message"] = message;

	Json response = Json.emptyObject;
	response["jsonrpc"] = "2.0";
	response["id"] = id;
	response["error"] = error;
	return response;
}

unittest // initialize echoes the client version and declares tools
{
	import vibe.data.json: parseJsonString;

	auto response = handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18"}}`),
		new NotLoggedInBackend);
	enforce(response["result"]["protocolVersion"].get!string == "2025-06-18", "version");
	enforce(response["result"]["capabilities"]["tools"].type == Json.Type.object, "tools");
}

unittest // tools/list advertises the four tools
{
	import vibe.data.json: parseJsonString;

	auto response = handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","id":2,"method":"tools/list"}`), new NotLoggedInBackend);
	auto tools = response["result"]["tools"];
	enforce(tools.length == 4, "four tools");
	enforce(tools[0]["name"].get!string == "get_me", "first tool");
}

unittest // notifications get no response, unknown methods get an error
{
	import vibe.data.json: parseJsonString;

	enforce(handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","method":"notifications/initialized"}`), new NotLoggedInBackend)
		.type == Json.Type.undefined, "notification");

	auto response = handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","id":3,"method":"nope"}`), new NotLoggedInBackend);
	enforce(response["error"]["code"].get!long == -32601, "method not found");
}

unittest // tool calls go through the backend and report its errors
{
	import vibe.data.json: parseJsonString;

	auto response = handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","id":4,"method":"tools/call","params":{"name":"get_me"}}`),
		new NotLoggedInBackend);
	enforce(response["result"]["isError"].get!bool, "backend error is reported");
}

private class FakeBackend: Backend
{
	Json getMe()
	{
		Json user = Json.emptyObject;
		user["id"] = 42;
		user["username"] = "tester";
		return user;
	}

	Json listChats(int limit)
	{
		Json result = Json.emptyObject;
		result["limit"] = limit;
		return result;
	}

	Json getHistory(string peer, int limit)
	{
		Json result = Json.emptyObject;
		result["peer"] = peer;
		result["limit"] = limit;
		return result;
	}

	Json sendMessage(string peer, string text)
	{
		Json result = Json.emptyObject;
		result["peer"] = peer;
		result["text"] = text;
		return result;
	}
}

unittest // successful tool calls reach the backend and return its data
{
	import vibe.data.json: parseJsonString;

	auto backend = new FakeBackend;

	auto me = handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","id":1,"method":"tools/call","params":{"name":"get_me"}}`), backend);
	enforce(me["result"].type == Json.Type.object, "tool result");
	enforce(me["result"]["isError"].type == Json.Type.undefined, "no error");
	auto userJson = parseJsonString(me["result"]["content"][0]["text"].get!string);
	enforce(userJson["username"].get!string == "tester", "username");

	auto chats = handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"list_chats"}}`), backend);
	auto chatJson = parseJsonString(chats["result"]["content"][0]["text"].get!string);
	enforce(chatJson["limit"].get!long == 20, "default limit");

	auto explicitLimit = handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{"name":"list_chats","arguments":{"limit":5}}}`),
		backend);
	auto explicitJson = parseJsonString(explicitLimit["result"]["content"][0]["text"].get!string);
	enforce(explicitJson["limit"].get!long == 5, "explicit limit");
}

unittest // broken tool arguments become tool errors, not crashes
{
	import vibe.data.json: parseJsonString;

	auto backend = new FakeBackend;

	auto missing = handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","id":4,"method":"tools/call","params":{"name":"send_message","arguments":{"peer":"x"}}}`),
		backend);
	enforce(missing["result"]["isError"].get!bool, "missing text is an error");

	auto wrongType = handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","id":5,"method":"tools/call","params":{"name":"get_history","arguments":{"peer":"x","limit":"many"}}}`),
		backend);
	enforce(wrongType["result"]["isError"].get!bool, "wrong limit type is an error");

	auto unknown = handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","id":6,"method":"tools/call","params":{"name":"nope"}}`), backend);
	enforce(unknown["result"]["isError"].get!bool, "unknown tool is an error");
}

unittest // malformed requests and ids
{
	import vibe.data.json: parseJsonString;

	auto backend = new FakeBackend;

	auto noMethod = handleRequest(parseJsonString(`{"jsonrpc":"2.0","id":7}`), backend);
	enforce(noMethod["error"]["code"].get!long == -32600, "invalid request");

	auto notObject = handleRequest(parseJsonString(`"hello"`), backend);
	enforce(notObject["error"]["code"].get!long == -32600, "non-object request");

	auto stringId = handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","id":"abc","method":"ping"}`), backend);
	enforce(stringId["id"].get!string == "abc", "string id is preserved");
	enforce(stringId["result"].type == Json.Type.object, "ping result");

	auto defaultVersion = handleRequest(parseJsonString(
		`{"jsonrpc":"2.0","id":8,"method":"initialize","params":{}}`), backend);
	enforce(defaultVersion["result"]["protocolVersion"].get!string == defaultProtocolVersion,
		"default protocol version");
}
