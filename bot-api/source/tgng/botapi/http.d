/// HTTP transport the Bot API talks through.
module tgng.botapi.http;

/// Minimal client interface; applications provide the implementation.
interface HttpClient
{
	string sendGetRequest(string url);
	string sendPostRequestJson(string url, string bodyJson);
}
