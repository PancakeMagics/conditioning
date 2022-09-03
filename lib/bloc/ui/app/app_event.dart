part of 'app_bloc.dart';

@immutable
abstract class AppUserEvent extends StoreUsersEvent {
  const AppUserEvent();
}

class AppUserEventStoreHomeScreenData extends AppUserEvent {
  const AppUserEventStoreHomeScreenData();
}

class AppUserEventStoreFriendScreenData extends AppUserEvent {
  const AppUserEventStoreFriendScreenData();
}

// navigation events
abstract class NavigationEvent extends AppUserEvent {
  const NavigationEvent();
}

class AppEventHomeToExplore extends NavigationEvent {
  const AppEventHomeToExplore();
}

class AppEventHomeToFriend extends NavigationEvent {
  const AppEventHomeToFriend();
}

class AppEventFriendToExplore extends NavigationEvent {
  const AppEventFriendToExplore();
}

class AppEventFriendToHome extends NavigationEvent {
  const AppEventFriendToHome();
}

class AppEventExploreToFriend extends NavigationEvent {
  const AppEventExploreToFriend();
}

class AppEventExploreToHome extends NavigationEvent {
  const AppEventExploreToHome();
}