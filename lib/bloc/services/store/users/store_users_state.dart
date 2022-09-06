part of 'store_users_bloc.dart';

@immutable
abstract class StoreUsersState extends StoreBlocState {
  final List<StoreUser>? userList;
  const StoreUsersState({
    required this.userList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class StoreUsersStateAllStore extends StoreUsersState {
  const StoreUsersStateAllStore({
    required super.userList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class StoreUsersStateRelativeStore extends StoreUsersState {
  const StoreUsersStateRelativeStore({
    required super.userList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
