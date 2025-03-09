import 'http_method.dart';
import 'http_status_code.dart';

class HttpPlatformResponse {
  String body;
  int? statusCode = HttpStatusCode.ok.code;
  String? method = HttpMethod.get.name;
  String url;
  dynamic headers;

  HttpPlatformResponse({
    required this.body,
    this.statusCode,
    this.method,
    required this.url,
    required this.headers,
  });
}
