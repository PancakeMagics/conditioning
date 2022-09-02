part of 'store_bloc.dart';

@immutable
abstract class StoreState extends AuthAppUserState {
  const StoreState({
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class StoreStateInitialYet extends StoreState {
  const StoreStateInitialYet({
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
