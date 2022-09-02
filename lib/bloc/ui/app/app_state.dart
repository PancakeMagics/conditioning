part of 'app_bloc.dart';

@immutable
abstract class AppState extends StoreUsersState {
  final User user;

  const AppState({
    required this.user,
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(userList: null);
}

class AppStateDataStore extends AppState {
  const AppStateDataStore({
    required super.user,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

@immutable
abstract class AppNavigationState extends AppState {
  const AppNavigationState({
    required super.user,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppNavigationStateHomeToExplore extends AppNavigationState {
  final ExploreViewOption option;

  const AppNavigationStateHomeToExplore({
    required this.option,
    required super.user,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppNavigationStateHomeToFriend extends AppNavigationState {
  const AppNavigationStateHomeToFriend({
    required super.user,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppNavigationStateFriendToExplore extends AppNavigationState {
  final ExploreViewOption option;

  const AppNavigationStateFriendToExplore({
    required this.option,
    required super.user,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppNavigationStateFriendToHome extends AppNavigationState {
  const AppNavigationStateFriendToHome({
    required super.user,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppNavigationStateExploreToFriend extends AppNavigationState {
  const AppNavigationStateExploreToFriend({
    required super.user,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppNavigationStateExploreToHome extends AppNavigationState {
  const AppNavigationStateExploreToHome({
    required super.user,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
