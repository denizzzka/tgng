/// Bot API over the HTTP JSON protocol.
module tgng.botapi.web;

import tgng.botapi.types: BaseApiUrl, BotApi, Chat, ParseMode, SendMessageMethod,
	MemoryUpdateOffsetStore, TelegramBotApiException, Update, UpdateOffsetStore, User;
import tgng.botapi.http: HttpClient;

import core.thread: Thread;
import core.time: Duration, minutes, seconds;
import std.conv: to;
import std.exception: enforce;
import std.string: indexOf;
import std.json: JSONType, JSONValue, parseJSON;
import std.uri: encodeComponent;

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

	/// Fetches updates with long polling; `offset` confirms earlier ones.
	Update[] getUpdates(long offset, int timeoutSeconds, string[] allowed = null)
	{
		auto path = "/getUpdates?offset=" ~ offset.to!string
			~ "&timeout=" ~ timeoutSeconds.to!string;
		if (allowed !is null)
			path ~= "&allowed_updates=" ~ encodeComponent(allowedJson(allowed));

		auto json = checkedResult("getUpdates", _http.sendGetRequest(_apiUrl ~ path));
		Update[] updates;
		foreach (ref item; json.array)
			updates ~= parseUpdate(item);
		return updates;
	}

	/// Answers a callback query so the client stops showing a spinner.
	void answerCallbackQuery(string callbackQueryId)
	{
		checkedResult("answerCallbackQuery", _http.sendGetRequest(
			_apiUrl ~ "/answerCallbackQuery?callback_query_id=" ~ encodeComponent(callbackQueryId)));
	}

	/// Long-polls forever, hiding the offset and saving it after each update.
	void processUpdates(void delegate(ref Update) handler, UpdateOffsetStore store = null,
		Duration timeout = 5.minutes, string[] allowed = null,
		void delegate(Exception) onError = null, bool delegate() stop = null)
	{
		long offset = store !is null ? store.load() : 0;

		while (stop is null || !stop())
		{
			try
			{
				foreach (ref update; getUpdates(offset, cast(int) timeout.total!"seconds", allowed))
				{
					handler(update);
					offset = update.updateId + 1;
					if (store !is null)
						store.save(offset);
				}
			}
			catch (Exception e)
			{
				if (onError !is null)
					onError(e);
				else
					Thread.sleep(3.seconds);
			}
		}
	}
}

/// Builds a JSON array of update type names.
private string allowedJson(string[] allowed)
{
	JSONValue[] array;
	foreach (name; allowed)
		array ~= JSONValue(name);
	return JSONValue(array).toString;
}

/// Maps one Bot API Update object to the fields we expose.
private Update parseUpdate(JSONValue item)
{
	Update update;
	update.updateId = item.intField("update_id");

	auto message = item.field("message");
	if (message.type == JSONType.object)
	{
		update.kind = Update.Kind.message;
		update.chatId = message.field("chat").intField("id");
		update.text = message.stringField("text");
		return update;
	}

	auto edited = item.field("edited_message");
	if (edited.type == JSONType.object)
	{
		update.kind = Update.Kind.editedMessage;
		update.chatId = edited.field("chat").intField("id");
		update.text = edited.stringField("text");
		return update;
	}

	auto callback = item.field("callback_query");
	if (callback.type == JSONType.object)
	{
		update.kind = Update.Kind.callbackQuery;
		update.callbackQueryId = callback.stringField("id");
		update.chatId = callback.field("message").field("chat").intField("id");
		update.text = callback.stringField("data");
		return update;
	}

	update.kind = Update.Kind.other;
	return update;
}

/// Creates the HTTP backend.
WebBotApi webBotApi(string token, string baseUrl = BaseApiUrl, HttpClient httpClient = null) @safe
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

private class FakeUpdatesHttp: HttpClient
{
	JSONValue[] updates;
	long lastOffset = -1;

	string sendGetRequest(string url)
	{
		auto start = url.indexOf("offset=");
		auto end = url.indexOf('&', start);
		lastOffset = url[start + 7 .. end].to!long;

		JSONValue[] result;
		foreach (ref update; updates)
			if (update["update_id"].get!long >= lastOffset)
				result ~= update;

		JSONValue response = [
			"ok": JSONValue(true),
			"result": JSONValue(result),
		];
		return response.toString;
	}

	string sendPostRequestJson(string url, string bodyJson)
	{
		return "";
	}
}

private JSONValue textUpdate(long updateId, long chatId, string text)
{
	JSONValue message = [
		"message_id": JSONValue(updateId * 10),
		"chat": JSONValue(["id": JSONValue(chatId)]),
		"text": JSONValue(text),
	];
	return JSONValue(["update_id": JSONValue(updateId), "message": message]);
}

unittest // processUpdates hides the offset and saves it after each update
{
	auto http = new FakeUpdatesHttp;
	http.updates = [textUpdate(1, 100, "one"), textUpdate(2, 100, "two")];

	auto api = webBotApi("token", BaseApiUrl, http);
	auto store = new MemoryUpdateOffsetStore;
	string[] seen;
	int loops;

	api.processUpdates((ref Update update) { seen ~= update.text; }, store,
		0.seconds, ["message"], null, () => loops++ > 0);

	enforce(seen == ["one", "two"], "both updates");
	enforce(store.load() == 3, "offset is the last id plus one");
	enforce(http.lastOffset == 0, "first call starts at zero");
}

unittest // a restart with the stored offset does not re-read old updates
{
	auto http = new FakeUpdatesHttp;
	http.updates = [textUpdate(1, 100, "one"), textUpdate(2, 100, "two")];
	auto api = webBotApi("token", BaseApiUrl, http);
	auto store = new MemoryUpdateOffsetStore;
	store.save(3);

	enforce(api.getUpdates(store.load(), 0, ["message"]).length == 0, "nothing old");
	enforce(http.lastOffset == 3, "starts from the saved offset");
}

unittest // messages and callback queries are decoded
{
	auto http = new FakeUpdatesHttp;
	JSONValue callback = [
		"update_id": JSONValue(5),
		"callback_query": JSONValue([
			"id": JSONValue("abc"),
			"message": JSONValue(["chat": JSONValue(["id": JSONValue(7)])]),
			"data": JSONValue("pressed"),
		]),
	];
	http.updates = [textUpdate(4, 100, "hello"), callback];

	auto api = webBotApi("token", BaseApiUrl, http);
	auto updates = api.getUpdates(0, 0);

	enforce(updates.length == 2, "two updates");
	enforce(updates[0].kind == Update.Kind.message, "message kind");
	enforce(updates[0].chatId == 100 && updates[0].text == "hello", "message fields");
	enforce(updates[1].kind == Update.Kind.callbackQuery, "callback kind");
	enforce(updates[1].callbackQueryId == "abc" && updates[1].text == "pressed", "callback fields");
}
