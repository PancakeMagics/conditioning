import 'package:conditioning/bloc/services/store/users/store_users_bloc.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/store/entities/user.dart';
import 'package:conditioning/service/store/store_provider.dart';
import 'package:flutter/material.dart';

import 'explore/explore_bloc.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc<S extends AppState> extends StoreUsersBloc<S> {
  late User user;

  AppBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
    on<AppUserEventStoreData>((event, emit) async {
      //TODO: handle store data, update ui
      // emit(const AppStateDataStoring(isLoading: true));
      try {
        // reality:
        // user = await storeProvider.createOrGetExistUser(userId: authAppUser!.id);

        // tempt:
        user = await storeProvider.createOrGetExistUser(userId: 'hi');
        emit(AppStateDataStore(user: user, isLoading: false));
      } on Exception catch(e) {
        // emit(const AppStateDataStoring(exception: e, isLoading: false));
      }
    });

    on<AppUserEventHomeToFriend>((event, emit) async {
      emit(AppNavigationStateHomeToFriend(isLoading: false, user: user) as S);
    });
    on<AppUserEventHomeToExplore>((event, emit) async {
      final option = user.appSetting.exploreViewOption;
      emit(AppNavigationStateHomeToExplore(option: option, isLoading: false, user: user) as S);
    });
    on<AppUserEventFriendToExplore>((event, emit) async {
      final option = user.appSetting.exploreViewOption;
      emit(AppNavigationStateFriendToExplore(option: option, isLoading: false, user: user) as S);
    });
    on<AppUserEventExploreToFriend>((event, emit) async {
      emit(AppNavigationStateExploreToFriend(isLoading: false, user: user) as S);
    });
    on<AppUserEventExploreToHome>((event, emit) async {
      emit(AppNavigationStateExploreToHome(isLoading: false, user: user) as S);
    });
    on<AppUserEventFriendToHome>((event, emit) async {
      emit(AppNavigationStateFriendToHome(isLoading: false, user: user) as S);
    });
  }
}