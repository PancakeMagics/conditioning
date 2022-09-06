import 'package:conditioning/bloc/services/store/users/store_users_bloc.dart';
import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/store/entities/providers/store_user_provider.dart';
import 'package:conditioning/service/store/entities/store_user.dart';
import 'package:conditioning/service/utils/constants/option_explore_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'app_event.dart';

part 'app_state.dart';

class AppBloc<S extends AppState> extends StoreUsersBloc<S> {
  StoreUser? storeUser;

  AppBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
    required StoreUserProvider storeProvider,
  }) : super(prefs: prefs, authProvider: authProvider, storeProvider: storeProvider) {
    on<AppEventStoreHomeScreenData>((event, emit) async {
      emit(const AppStateDataStore(user: null, isLoading: true));
      try {
        //TODO: 1. get prefs
        // id = profileProvider.getPrefs(StorePath.userIdApp) ?? "";
        // displayName =
        //     profileProvider.getPrefs(StorePath.displayName) ?? "";
        //
        // photoUrl = profileProvider.getPrefs(StorePath.photoUrl) ?? "";
        // phoneNumber =
        //     profileProvider.getPrefs(StorePath.phoneNumber) ?? "";
        // aboutMe = profileProvider.getPrefs(StorePath.aboutMe) ?? "";

        // TODO: 2. get fireStore data


        // TODO: move this to authUserBloc
        // storeUser = await storeProvider.createOrGetExistUser(userId: 'idooo', type: AuthUserType.appUser, name: 'hello');

        emit(AppStateDataStore(user: storeUser, isLoading: false));
      } on Exception catch(e) {
        // emit(const AppStateDataStoring(exception: e, isLoading: false));
      }
    });
    on<AppEventStoreFriendScreenData>((event, emit) async {
      try {
        // tempt:
        // user = await storeProvider.createOrGetExistUser(userId: 'hi');
        emit(AppStateDataStore(user: storeUser, isLoading: false));
      } on Exception catch(e) {
        // emit(const AppStateDataStoring(exception: e, isLoading: false));
      }
    });

    on<AppEventHomeToFriend>((event, emit) async {
      emit(AppNavigationStateHomeToFriend(isLoading: false, user: storeUser) as S);
    });
    on<AppEventHomeToExplore>((event, emit) async {
      final option = storeUser?.appSetting.exploreViewOption;
      emit(AppNavigationStateHomeToExplore(option: option ?? ExploreViewOption.org, isLoading: false, user: storeUser) as S);
    });
    on<AppEventFriendToExplore>((event, emit) async {
      final option = storeUser?.appSetting.exploreViewOption;
      emit(AppNavigationStateFriendToExplore(option: option ?? ExploreViewOption.org, isLoading: false, user: storeUser) as S);
    });
    on<AppEventExploreToFriend>((event, emit) async {
      emit(AppNavigationStateExploreToFriend(isLoading: false, user: storeUser) as S);
    });
    on<AppEventExploreToHome>((event, emit) async {
      emit(AppNavigationStateExploreToHome(isLoading: false, user: storeUser) as S);
    });
    on<AppEventFriendToHome>((event, emit) async {
      emit(AppNavigationStateFriendToHome(isLoading: false, user: storeUser) as S);
    });
  }
}
