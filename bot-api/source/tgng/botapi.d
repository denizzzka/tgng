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
