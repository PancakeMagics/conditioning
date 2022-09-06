part of 'store_bloc.dart';

@immutable
abstract class StoreBlocEvent extends AuthEvent {
  const StoreBlocEvent();
}

class StoreBlocEventInitialize extends StoreBlocEvent {
  const StoreBlocEventInitialize();
}
