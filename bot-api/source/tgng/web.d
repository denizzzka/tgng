/// Bot API over the HTTP JSON protocol.
module tgng.web;

import tgng.botapi: BaseApiUrl, BotApi, Chat, ParseMode, SendMessageMethod,
	TelegramBotApiException, User;
import tgng.http: HttpClient;

import std.conv: to;
import std.json: JSONType, JSONValue, parseJSON;

/// HTTP implementation of `BotApi`.
class WebBotApi: BotApi
{
	private string _apiUrl;
	private HttpClient _http;

	this(string token, string baseUrl = BaseApiUrl, HttpClient httpClient = null) @safe
	{
		_apiUrl = baseUrl ~ token;
		_http = httpClient;
	}

	User getMe()
	{
		auto json = checkedResult("getMe", _http.sendGetRequest(_apiUrl ~ "/getMe"));

		User user;
		user.id = json.intField("id");
		user.is_bot = json.boolField("is_bot");
		user.first_name = json.stringField("first_name");
		user.username = json.stringField("username");
		return user;
	}

	Chat getChat(long chatId)
	{
		auto json = checkedResult("getChat",
			_http.sendGetRequest(_apiUrl ~ "/getChat?chat_id=" ~ chatId.to!string));

		Chat chat;
		chat.id = json.intField("id");
		chat.type = json.stringField("type");
		chat.title = json.stringField("title");
		chat.username = json.stringField("username");
		return chat;
	}

	void sendMessage(ref SendMessageMethod method)
	{
		JSONValue payload = [
			"chat_id": JSONValue(method.chat_id),
			"text": JSONValue(method.text),
		];
		if (method.parse_mode != ParseMode.None)
			payload["parse_mode"] = JSONValue(cast(string) method.parse_mode);

		checkedResult("sendMessage",
			_http.sendPostRequestJson(_apiUrl ~ "/sendMessage", payload.toString));
	}
}

/// Creates the HTTP backend.
BotApi webBotApi(string token, string baseUrl = BaseApiUrl, HttpClient httpClient = null) @safe
{
	return new WebBotApi(token, baseUrl, httpClient);
}

/// Parses a Bot API answer and throws `TelegramBotApiException` on failure.
private JSONValue checkedResult(string method, string answer)
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

private string stringField(JSONValue json, string name)
{
	auto value = field(json, name);
	return value.type == JSONType.string ? value.get!string : "";
}

private long intField(JSONValue json, string name)
{
	auto value = field(json, name);
	return value.type == JSONType.integer || value.type == JSONType.uinteger
		? value.get!long : 0;
}

private bool boolField(JSONValue json, string name)
{
	return field(json, name).type == JSONType.true_;
}
