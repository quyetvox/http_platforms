class HttpPlatformResponse {
  String body;
  int statusCode;
  String method;
  String url;
  dynamic headers;

  HttpPlatformResponse({
    required this.body,
    this.statusCode = 200,
    this.method = "GET",
    required this.url,
    required this.headers,
  });
}