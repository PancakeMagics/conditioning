part of 'store_users_bloc.dart';

@immutable
abstract class StoreUsersEvent extends StoreEvent {
  const StoreUsersEvent();
}

class UsersStoreEventFilterByLocation extends StoreEvent {
  const UsersStoreEventFilterByLocation();
}

class UsersStoreEventFilterByText extends StoreEvent {
  final String searchingText;
  const UsersStoreEventFilterByText({required this.searchingText,});
}

class UsersStoreEventRestore extends StoreEvent {
  const UsersStoreEventRestore();
}
