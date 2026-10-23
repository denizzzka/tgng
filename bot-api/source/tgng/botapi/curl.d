/// HTTP client backed by libcurl.
module tgng.botapi.curl;

import tgng.botapi.http: HttpClient;

import std.algorithm.iteration: splitter;
import std.algorithm.searching: countUntil, endsWith, startsWith;
import std.array: appender;
import std.conv: to;
import std.string: strip;
import std.exception: enforce;
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

/// Starts a one-shot server, performs one request and returns the raw text.
private string captureRequest(scope string delegate(string url) request, out string response)
{
	import std.socket: AddressFamily, InternetAddress, ProtocolType, Socket, SocketType;
	import core.thread: Thread;

	auto listener = new Socket(AddressFamily.INET, SocketType.STREAM, ProtocolType.TCP);
	listener.bind(new InternetAddress("127.0.0.1", 0));
	listener.listen(1);
	auto port = (cast(InternetAddress) listener.localAddress).port;

	string captured;
	auto server = new Thread({
		auto conn = listener.accept();
		ubyte[4096] buffer;
		ubyte[] data;

		size_t headerEnd = size_t.max;
		while (headerEnd == size_t.max)
		{
			auto n = conn.receive(buffer[]);
			if (n == 0)
				break;
			data ~= buffer[0 .. n];
			headerEnd = data.countUntil("\r\n\r\n");
		}

		size_t length;
		if (headerEnd != size_t.max)
		{
			foreach (line; splitter(cast(string) data[0 .. headerEnd], "\r\n"))
				if (line.startsWith("Content-Length:"))
					length = line["Content-Length:".length .. $].strip.to!size_t;

			auto bodyStart = headerEnd + 4;
			while (data.length - bodyStart < length)
			{
				auto n = conn.receive(buffer[]);
				if (n == 0)
					break;
				data ~= buffer[0 .. n];
			}
		}

		captured = cast(string) data.idup;
		conn.send("HTTP/1.1 200 OK\r\nContent-Length: 2\r\nConnection: close\r\n\r\nok");
		conn.close();
	});
	server.start();

	response = request("http://127.0.0.1:" ~ port.to!string ~ "/post");
	server.join();
	listener.close();
	return captured;
}

unittest // POST keeps the JSON body and its content type
{
	import std.algorithm.searching: canFind;

	auto client = new CurlHttpClient;
	string response;
	auto raw = captureRequest((string url) => client.sendPostRequestJson(url, `{"text":"hi"}`), response);

	enforce(response == "ok", "response body");
	enforce(raw.startsWith("POST /post HTTP/1.1"), "POST method");
	enforce(raw.canFind("Content-Type: application/json"), "JSON content type");
	enforce(!raw.canFind("multipart/form-data"), "not multipart");
	enforce(!raw.canFind("application/x-www-form-urlencoded"), "not form encoded");
	enforce(raw.endsWith(`{"text":"hi"}`), "raw JSON body");
}

unittest // GET sends no body
{
	auto client = new CurlHttpClient;
	string response;
	auto raw = captureRequest((string url) => client.sendGetRequest(url), response);

	enforce(response == "ok", "response body");
	enforce(raw.startsWith("GET /post HTTP/1.1"), "GET method");
	enforce(raw.endsWith("\r\n\r\n"), "no request body");
}
