/// Bot API types and the backend-agnostic client interface.
module tgng.botapi.types;

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

/// The bot account.
struct User
{
	long id;
	bool is_bot;
	string first_name;
	string username;
}

/// The chat fields the client exposes.
struct Chat
{
	long id;
	string type;
	string title;
	string username;
}

/// What a bot client can do regardless of the wire protocol.
interface BotApi
{
	User getMe();
	Chat getChat(long chatId);
	void sendMessage(ref SendMessageMethod method);
}

/// One incoming update.
struct Update
{
	enum Kind
	{
		message,
		editedMessage,
		callbackQuery,
		other,
	}

	long updateId;
	Kind kind;
	long chatId;
	string text;
	string callbackQueryId;
}

/// Persists the next update offset across restarts.
interface UpdateOffsetStore
{
	long load();
	void save(long offset);
}

/// Keeps the offset only for the current process.
final class MemoryUpdateOffsetStore: UpdateOffsetStore
{
	private long _offset;

	long load()
	{
		return _offset;
	}

	void save(long offset)
	{
		_offset = offset;
	}
}
