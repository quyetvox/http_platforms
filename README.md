[![pub package](https://img.shields.io/pub/v/http.svg)](https://pub.dev/packages/http)
[![package publisher](https://img.shields.io/pub/publisher/http.svg)](https://pub.dev/packages/http/publisher)

A composable, Future-based library for making HTTP requests.

This package contains a set of high-level functions and classes that make it
easy to consume HTTP resources. It's multi-platform (mobile, desktop, and
browser) and supports multiple implementations.

## Using

The easiest way to use this library is via the top-level functions. They allow
you to make individual HTTP requests with minimal hassle:

```dart
import 'package:http_platforms/http_platforms.dart' as http;

var url = Uri.https('example.com', 'whatsit/create');
var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

print(await http.read(Uri.https('example.com', 'foobar.txt')));
```

> [!NOTE]
> Flutter applications may require
> [additional configuration](https://docs.flutter.dev/data-and-backend/networking#platform-notes)
> to make HTTP requests.

## Choosing an implementation

There are multiple implementations of the `package:http` [`Client`][client] interface. By default, `package:http` uses [`BrowserClient`][browserclient] on the web and [`IOClient`][ioclient] on all other platforms. You can choose a different [`Client`][client] implementation based on the needs of your application.

You can change implementations without changing your application code, except
for a few lines of [configuration](#2-configure-the-http-client).

Some well-supported implementations are:

| Implementation | Supported Platforms | SDK | Caching | HTTP3/QUIC | Platform Native | 
| -------------- | ------------------- | ----| ------- | ---------- | --------------- |
| `package:http` — [`IOClient`][ioclient] | Android, iOS, Linux, macOS, Windows | Dart, Flutter | ✅︎ | ✅︎ | ✅︎ |
| `package:http` — [`BrowserClient`][browserclient] | Web | Dart, Flutter | ― | ✅︎ | ✅︎ | Dart, Flutter |


## Configuration

To use an HTTP client implementation other than the default, you must:
1. Add the HTTP client as a dependency.
2. Configure the HTTP client.
3. Connect the HTTP client to the code that uses it.

### 1. Add the HTTP client as a dependency.

To add a package compatible with the Dart SDK to your project, use `dart pub add`.

For example:

```terminal
# Replace  "fetch_client" with the package that you want to use.
dart pub add fetch_client
```

To add a package that requires the Flutter SDK, use `flutter pub add`.

#### Supporting browser and native

If your application can be run in the browser and natively, you must put your
browser and native configurations in separate files and import the correct file
based on the platform.
