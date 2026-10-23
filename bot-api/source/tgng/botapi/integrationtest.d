/// Live bot check; skipped when the bot credentials are not configured.
module tgng.botapi.integrationtest;

import tgng.botapi.curl: CurlHttpClient;
import tgng.botapi.types: BaseApiUrl, ParseMode, SendMessageMethod, Update;
import tgng.botapi.web: webBotApi;

import std.conv: to;
import std.exception: enforce;
import std.file: exists, readText;
import std.process: environment;
import std.string: indexOf, splitLines, strip;

unittest // getMe, getChat and optionally sendMessage against the real bot
{
	if (environment.get("TG_BOT_TOKEN").length == 0)
		loadEnv(".env");

	auto token = environment.get("TG_BOT_TOKEN");
	if (token.length == 0)
		return; // no credentials, skip the live check

	auto api = webBotApi(token, BaseApiUrl, new CurlHttpClient(environment.get("TG_PROXY")));

	auto me = api.getMe();
	enforce(me.id != 0, "getMe returns an id");

	auto chatIdText = environment.get("TG_CHAT_ID");
	if (chatIdText.length == 0)
		return;

	auto chatId = chatIdText.to!long;
	auto chat = api.getChat(chatId);
	enforce(chat.id == chatId, "getChat returns the same chat");

	if (environment.get("TG_TEST_SEND") == "1")
	{
		SendMessageMethod msg;
		msg.chat_id = chatId;
		msg.text = "tgng bot-api integration test";
		msg.parse_mode = ParseMode.None;
		api.sendMessage(msg);
	}
}

/// Reads KEY=VALUE lines without overriding already set variables.
private void loadEnv(string path)
{
	if (!exists(path))
		return;

	foreach (line; readText(path).splitLines)
	{
		auto text = line.strip;
		if (text.length == 0 || text[0] == '#')
			continue;
		auto eq = text.indexOf('=');
		if (eq <= 0)
			continue;
		auto key = text[0 .. eq].strip;
		if (environment.get(key).length == 0)
			environment[key] = text[eq + 1 .. $].strip;
	}
}
