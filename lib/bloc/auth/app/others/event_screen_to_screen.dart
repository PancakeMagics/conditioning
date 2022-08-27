import 'package:conditioning/bloc/auth/auth_event.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ScreenEvent extends AuthEvent {
  const ScreenEvent();
}

class ScreensEventHomeToExplore extends ScreenEvent {
  const ScreensEventHomeToExplore();
}

class ScreensEventHomeToFriend extends ScreenEvent {
  const ScreensEventHomeToFriend();
}

class ScreensEventFriendToExplore extends ScreenEvent {
  const ScreensEventFriendToExplore();
}

class ScreensEventFriendToHome extends ScreenEvent {
  const ScreensEventFriendToHome();
}

class ScreensEventExploreToFriend extends ScreenEvent {
  const ScreensEventExploreToFriend();
}

class ScreensEventExploreToHome extends ScreenEvent {
  const ScreensEventExploreToHome();
}