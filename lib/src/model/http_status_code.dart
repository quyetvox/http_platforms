enum HttpStatusCode {
  ok(200, "OK"),
  created(201, "Created"),
  noContent(204, "No Content"),
  badRequest(400, "Bad Request"),
  unauthorized(401, "Unauthorized"),
  forbidden(403, "Forbidden"),
  notFound(404, "Not Found"),
  internalServerError(500, "Internal Server Error");

  final int code;
  final String message;

  const HttpStatusCode(this.code, this.message);

  @override
  String toString() => "$code $message";
}
