

import 'package:conditioning/bloc/auth/auth_bloc.dart';
import 'package:conditioning/bloc/auth/events/others/event_screen_to_screen.dart';
import 'package:conditioning/bloc/auth/states/state_screen_to_screen.dart';

class ScreensBloc extends AuthBloc {
  ScreensBloc({required super.authProvider}) {
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