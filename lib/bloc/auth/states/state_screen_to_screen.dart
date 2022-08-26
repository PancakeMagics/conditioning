
import 'package:conditioning/bloc/auth/auth_bloc.dart';

class ScreensStateHomeToExplore extends AuthStateAppUserLogin {
  const ScreensStateHomeToExplore({required super.authAppUser}): super(isLoading: false);
}

class ScreensStateHomeToFriend extends AuthStateAppUserLogin {
  const ScreensStateHomeToFriend({required super.authAppUser}): super(isLoading: false);
}

class ScreensStateFriendToExplore extends AuthStateAppUserLogin {
  const ScreensStateFriendToExplore({required super.authAppUser}): super(isLoading: false);
}

class ScreensStateFriendToHome extends AuthStateAppUserLogin {
  const ScreensStateFriendToHome({required super.authAppUser}): super(isLoading: false);
}

class ScreensStateExploreToFriend extends AuthStateAppUserLogin {
  const ScreensStateExploreToFriend({required super.authAppUser}): super(isLoading: false);
}

class ScreensStateExploreToHome extends AuthStateAppUserLogin {
  const ScreensStateExploreToHome({required super.authAppUser}): super(isLoading: false);
}