/// Basic Bot API methods.
module tgng.telegram.basic;

import tgng.botapi: BotApi, checkedResult;

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
