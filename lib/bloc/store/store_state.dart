part of 'store_bloc.dart';

@immutable
abstract class StoreState {
  const StoreState();
}

class StoreStateInitialYet extends StoreState {
  const StoreStateInitialYet();
}

class StoreStateInitialed extends StoreState {
  const StoreStateInitialed();
}
