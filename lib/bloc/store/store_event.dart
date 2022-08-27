part of 'store_bloc.dart';

@immutable
abstract class StoreEvent {
  const StoreEvent();
}

class StoreEventInitialize extends StoreEvent {
  const StoreEventInitialize();
}
