import 'dart:typed_data';
import 'model/http_platform_response.dart';

class HttpPlatform {
  static Future<HttpPlatformResponse> get({
    required String url,
    Map<String, String>? headers,
    Map<String, String>? queryParam,
  }) async {
    throw Exception('Unsupported Platform');
  }

  static Future<HttpPlatformResponse> post({
    required String url,
    String? body,
    Map<String, String>? headers,
  }) async {
    throw Exception('Unsupported Platform');
  }

  static Future<HttpPlatformResponse> delete({
    required String url,
    String? body,
    Map<String, String>? headers,
    Map<String, String>? queryParam,
  }) async {
    throw Exception('Unsupported Platform');
  }

  static Future<HttpPlatformResponse> postFormData({
    required String url,
    required String keyFile,
    required Uint8List fileData,
    Map<String, String>? body,
    Map<String, String>? headers,
  }) async {
    throw Exception('Unsupported Platform');
  }
}
