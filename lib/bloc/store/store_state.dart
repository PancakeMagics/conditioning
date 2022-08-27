part of 'store_bloc.dart';

@immutable
abstract class StoreState {
  final Exception? exception;
  const StoreState({this.exception});
}

class StoreStateInitialYet extends StoreState {
  const StoreStateInitialYet({super.exception});
}

class StoreStateInitialed extends StoreState {
  const StoreStateInitialed({super.exception});
}
