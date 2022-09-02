part of 'store_bloc.dart';

@immutable
abstract class StoreEvent extends AuthEvent {
  const StoreEvent();
}

class StoreEventInitialize extends StoreEvent {
  const StoreEventInitialize();
}
