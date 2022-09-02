part of 'app_bloc.dart';

@immutable
abstract class AppUserEvent extends StoreUsersEvent {
  const AppUserEvent();
}

class AppUserEventStoreData extends AppUserEvent {
  const AppUserEventStoreData();
}

// navigation events
abstract class NavigationEvent extends AppUserEvent {
  const NavigationEvent();
}

class AppUserEventHomeToExplore extends NavigationEvent {
  const AppUserEventHomeToExplore();
}

class AppUserEventHomeToFriend extends NavigationEvent {
  const AppUserEventHomeToFriend();
}

class AppUserEventFriendToExplore extends NavigationEvent {
  const AppUserEventFriendToExplore();
}

class AppUserEventFriendToHome extends NavigationEvent {
  const AppUserEventFriendToHome();
}

class AppUserEventExploreToFriend extends NavigationEvent {
  const AppUserEventExploreToFriend();
}

class AppUserEventExploreToHome extends NavigationEvent {
  const AppUserEventExploreToHome();
}