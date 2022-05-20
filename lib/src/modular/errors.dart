abstract class MeteorError implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const MeteorError(this.message, [this.stackTrace]);

  String _returnStackTrace() => stackTrace != null ? '\n${stackTrace.toString()}' : '';

  @override
  String toString() => '$runtimeType: $message${_returnStackTrace()}';
}

class GuardedRouteException extends MeteorError {
  GuardedRouteException(String path) : super(path);
}
