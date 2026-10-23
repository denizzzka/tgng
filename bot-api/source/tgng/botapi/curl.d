/// HTTP client backed by libcurl.
module tgng.botapi.curl;

import tgng.botapi.http: HttpClient;

import std.array: appender;
import std.net.curl: HTTP, ThrowOnError;

/// Synchronous client; honours libcurl proxy settings when `proxy` is set.
final class CurlHttpClient: HttpClient
{
	private string _proxy;

	this(string proxy = null) @safe
	{
		_proxy = proxy;
	}

	string sendGetRequest(string url)
	{
		return request(url, HTTP.Method.get, null);
	}

	string sendPostRequestJson(string url, string bodyJson)
	{
		return request(url, HTTP.Method.post, bodyJson);
	}

	private string request(string url, HTTP.Method method, string body)
	{
		auto content = appender!(ubyte[])();
		auto http = HTTP(url);
		if (_proxy.length > 0)
			http.proxy = _proxy;

		http.method = method;
		if (body.length > 0)
			http.setPostData(cast(const(void)[]) body, "application/json");

		http.onReceive = (ubyte[] data)
		{
			content ~= data;
			return data.length;
		};

		http.perform(ThrowOnError.no);
		return cast(string) content.data.idup;
	}
}
