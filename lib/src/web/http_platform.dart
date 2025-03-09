import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:http_platforms/src/model/http_platform_response.dart';
import 'package:mime/mime.dart';

class HttpPlatform {
  static Future<HttpPlatformResponse> get({
    required String url,
    Map<String, String>? headers,
    Map<String, String>? queryParam,
  }) async {
    Map<String, String> headerMap = {...headers ?? {}};
    final res = await html.HttpRequest.request(url,
        sendData: queryParam, method: 'GET', requestHeaders: headerMap);
    return HttpPlatformResponse(
        body: res.responseText ?? '', url: url, headers: headers);
  }

  static Future<HttpPlatformResponse> post({
    required String url,
    String body = '',
    Map<String, String>? headers,
  }) async {
    Map<String, String> headerMap = {...headers ?? {}};
    final res = await html.HttpRequest.request(url,
        sendData: body, method: 'POST', requestHeaders: headerMap);
    return HttpPlatformResponse(
        body: res.responseText ?? '', url: url, headers: headers);
  }

  static Future<HttpPlatformResponse> delete({
    required String url,
    String body = '',
    Map<String, String>? headers,
  }) async {
    Map<String, String> headerMap = {...headers ?? {}};
    final res = await html.HttpRequest.request(url,
        method: 'DELETE', sendData: body, requestHeaders: headerMap);
    return HttpPlatformResponse(
        body: res.responseText ?? '', url: url, headers: headers);
  }

  static Future<String?> postFormData({
    required String url,
    required String keyFile,
    required String fileName,
    required Uint8List fileData,
    Map<String, String>? body,
    Map<String, String>? headers,
  }) async {
    Map<String, String> headerMap = {...headers ?? {}};
    Uri uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri)
      ..fields.addAll(body ?? {})
      ..headers.addAll(headerMap);
    request.files.addAll([
      http.MultipartFile.fromBytes(
        keyFile,
        fileData,
        filename: fileName,
        contentType: MediaType.parse(lookupMimeType(fileName) ?? ''),
      ),
    ]);

    try {
      final response = await request.send();
      final res = await response.stream.bytesToString();
      return res;
    } catch (err) {
      return null;
    }
  }
}
