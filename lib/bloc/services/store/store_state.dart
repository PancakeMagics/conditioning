part of 'store_bloc.dart';

@immutable
abstract class StoreBlocState extends AuthAppUserState {
  const StoreBlocState({
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class StoreBlocStateInitialYet extends StoreBlocState {
  const StoreBlocStateInitialYet({
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
