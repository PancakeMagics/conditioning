part of 'store_users_bloc.dart';

@immutable
abstract class StoreUsersEvent extends StoreBlocEvent {
  const StoreUsersEvent();
}

class UsersStoreEventFilterByLocation extends StoreBlocEvent {
  const UsersStoreEventFilterByLocation();
}

class UsersStoreEventFilterByText extends StoreBlocEvent {
  final String searchingText;
  const UsersStoreEventFilterByText({required this.searchingText,});
}

class UsersStoreEventRestore extends StoreBlocEvent {
  const UsersStoreEventRestore();
}
