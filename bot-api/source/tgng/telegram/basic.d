/// Basic Bot API methods.
module tgng.telegram.basic;

import tgng.botapi: BotApi, boolField, checkedResult, intField, stringField;

import std.conv: to;
import std.json: JSONValue;

/// Text formatting mode.
enum ParseMode: string
{
	Markdown = "Markdown",
	MarkdownV2 = "MarkdownV2",
	HTML = "HTML",
	None = "",
}

/// `sendMessage` arguments.
struct SendMessageMethod
{
	long chat_id;
	string text;
	ParseMode parse_mode = ParseMode.None;
}

/// The bot account returned by `getMe`.
struct User
{
	long id;
	bool is_bot;
	string first_name;
	string username;
}

/// Returns the bot account.
User getMe(BotApi api)
{
	auto json = checkedResult("getMe", api.getJson("/getMe"));

	User user;
	user.id = json.intField("id");
	user.is_bot = json.boolField("is_bot");
	user.first_name = json.stringField("first_name");
	user.username = json.stringField("username");
	return user;
}

/// The chat fields `getChat` exposes.
struct Chat
{
	long id;
	string type;
	string title;
	string username;
}

/// Returns a chat by its id.
Chat getChat(BotApi api, long chatId)
{
	auto json = checkedResult("getChat",
		api.getJson("/getChat?chat_id=" ~ chatId.to!string));

	Chat chat;
	chat.id = json.intField("id");
	chat.type = json.stringField("type");
	chat.title = json.stringField("title");
	chat.username = json.stringField("username");
	return chat;
}

/// Sends one text message.
void sendMessage(BotApi api, ref SendMessageMethod method)
{
	JSONValue payload = [
		"chat_id": JSONValue(method.chat_id),
		"text": JSONValue(method.text),
	];
	if (method.parse_mode != ParseMode.None)
		payload["parse_mode"] = JSONValue(cast(string) method.parse_mode);

	checkedResult("sendMessage", api.postJson("/sendMessage", payload.toString));
}
