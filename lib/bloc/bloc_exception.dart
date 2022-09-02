

abstract class BlocException implements Exception {
  const BlocException();
}
abstract class BlocStateException extends BlocException {
  const BlocStateException();
}
class NoSuchBlocStateException extends BlocStateException {
  final dynamic state;
  const NoSuchBlocStateException({required this.state});
}
