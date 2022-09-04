part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends StoreUsersEvent {
  const AppEvent();
}

class AppEventStoreHomeScreenData extends AppEvent {
  const AppEventStoreHomeScreenData();
}

class AppEventStoreFriendScreenData extends AppEvent {
  const AppEventStoreFriendScreenData();
}

// navigation events
abstract class NavigationEvent extends AppEvent {
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