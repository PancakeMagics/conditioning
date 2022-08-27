import 'package:conditioning/bloc/auth/app/app_bloc.dart';
import 'package:conditioning/bloc/auth/app/others/state_screen_to_screen.dart';

import '../../auth/app/others/event_screen_to_screen.dart';

class BaseBloc extends AppBloc {
  BaseBloc({required super.authProvider}) {
    on<ScreensEventHomeToFriend>((event, emit) async {
      emit(ScreensStateHomeToFriend(authAppUser: authAppUser));
    });
    on<ScreensEventHomeToExplore>((event, emit) async {
      emit(ScreensStateHomeToExplore(authAppUser: authAppUser));
    });
    on<ScreensEventExploreToFriend>((event, emit) async {
      emit(ScreensStateExploreToFriend(authAppUser: authAppUser));
    });
    on<ScreensEventExploreToHome>((event, emit) async {
      emit(ScreensStateExploreToHome(authAppUser: authAppUser));
    });
    on<ScreensEventFriendToExplore>((event, emit) async {
      emit(ScreensStateFriendToExplore(authAppUser: authAppUser));
    });
    on<ScreensEventFriendToHome>((event, emit) async {
      emit(ScreensStateFriendToHome(authAppUser: authAppUser));
    });
  }
}