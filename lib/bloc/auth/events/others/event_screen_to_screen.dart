import 'package:conditioning/bloc/auth/auth_bloc.dart';

class ScreensEventHomeToExplore extends AuthEvent {
  const ScreensEventHomeToExplore();
}

class ScreensEventHomeToFriend extends AuthEvent {
  const ScreensEventHomeToFriend();
}

class ScreensEventFriendToExplore extends AuthEvent {
  const ScreensEventFriendToExplore();
}

class ScreensEventFriendToHome extends AuthEvent {
  const ScreensEventFriendToHome();
}

class ScreensEventExploreToFriend extends AuthEvent {
  const ScreensEventExploreToFriend();
}

class ScreensEventExploreToHome extends AuthEvent {
  const ScreensEventExploreToHome();
}