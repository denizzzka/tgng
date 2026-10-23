/// Telegram Bot API entry point.
module tgng.botapi;

import tgng.http: HttpClient;

import std.json: JSONType, JSONValue, parseJSON;

enum BaseApiUrl = "https://api.telegram.org/bot";

/// Raised when the Bot API answers with `ok: false`.
class TelegramBotApiException: Exception
{
	int code;

	this(int code, string message, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		this.code = code;
		super(message, file, line);
	}
}

/// Holds the token and the HTTP client used by Bot API methods.
class BotApi
{
	private string _apiUrl;
	private HttpClient _http;

	this(string token, string baseUrl = BaseApiUrl, HttpClient httpClient = null) @safe
	{
		_apiUrl = baseUrl ~ token;
		_http = httpClient;
	}

	/// Sends a JSON body to a method and returns the response body.
	string postJson(string methodPath, string bodyJson)
	{
		return _http.sendPostRequestJson(_apiUrl ~ methodPath, bodyJson);
	}

	/// Calls a GET method and returns the response body.
	string getJson(string methodPath)
	{
		return _http.sendGetRequest(_apiUrl ~ methodPath);
	}
}

/// Parses a Bot API answer and throws `TelegramBotApiException` on failure.
JSONValue checkedResult(string method, string answer)
{
	auto json = parseJSON(answer);
	auto ok = json["ok"];
	if (ok.type == JSONType.true_)
		return json["result"];

	auto code = json["error_code"];
	auto description = json["description"];
	throw new TelegramBotApiException(
		code.type == JSONType.integer ? cast(int) code.get!long : 0,
		description.type == JSONType.string ? description.get!string : method ~ ": " ~ answer);
}

/// Returns a field or null; `JSONValue.opIndex` throws on a missing key.
private JSONValue field(JSONValue json, string name)
{
	if (json.type != JSONType.object)
		return JSONValue();

	foreach (key, ref value; json.object)
		if (key == name)
			return value;

	return JSONValue();
}

/// Reads a string field, or an empty string when absent.
string stringField(JSONValue json, string name)
{
	auto value = json.field(name);
	return value.type == JSONType.string ? value.get!string : "";
}

/// Reads an integer field, or zero when absent.
long intField(JSONValue json, string name)
{
	auto value = json.field(name);
	return value.type == JSONType.integer || value.type == JSONType.uinteger
		? value.get!long : 0;
}

/// Reads a boolean field, or false when absent.
bool boolField(JSONValue json, string name)
{
	return json.field(name).type == JSONType.true_;
}
