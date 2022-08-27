
import 'package:conditioning/bloc/auth/app/app_bloc.dart';
import 'package:conditioning/bloc/auth/auth_bloc.dart';

class ScreensStateHomeToExplore extends AppUserStateLogin {
  const ScreensStateHomeToExplore({required super.authAppUser}): super(isLoading: false);
}

class ScreensStateHomeToFriend extends AppUserStateLogin {
  const ScreensStateHomeToFriend({required super.authAppUser}): super(isLoading: false);
}

class ScreensStateFriendToExplore extends AppUserStateLogin {
  const ScreensStateFriendToExplore({required super.authAppUser}): super(isLoading: false);
}

class ScreensStateFriendToHome extends AppUserStateLogin {
  const ScreensStateFriendToHome({required super.authAppUser}): super(isLoading: false);
}

class ScreensStateExploreToFriend extends AppUserStateLogin {
  const ScreensStateExploreToFriend({required super.authAppUser}): super(isLoading: false);
}

class ScreensStateExploreToHome extends AppUserStateLogin {
  const ScreensStateExploreToHome({required super.authAppUser}): super(isLoading: false);
}