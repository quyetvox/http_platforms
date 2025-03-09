export 'http_platform_stub.dart'
    if (dart.library.html) 'web/http_platform.dart'
    if (dart.library.io) 'app/http_platform.dart';