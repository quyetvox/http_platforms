enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
  options,
  trace;

  String get name {
    switch (this) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.delete:
        return 'DELETE';
      case HttpMethod.patch:
        return 'PATCH';
      case HttpMethod.head:
        return 'HEAD';
      case HttpMethod.options:
        return 'OPTIONS';
      case HttpMethod.trace:
        return 'TRACE';
    }
  }
}
