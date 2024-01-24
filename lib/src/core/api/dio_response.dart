class DioResponse<T> {
  /// Custom code (can be based on internal definition)
  final DioResponseStatus status;

  /// Data returned by the interface
  final T? data;

  /// Need to add more
  /// .........

  DioResponse({
    this.data,
    required this.status,
  });

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"status\":\"$status\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}

enum DioResponseStatus {
  unknown,
  success,
  failure,
  unauthorized,
  serverError,
}
