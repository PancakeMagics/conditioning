import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/store/entities/providers/store_user_provider.dart';
import 'package:conditioning/service/store/entities/store_user.dart';
import 'package:conditioning/service/store/entities/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../store_bloc.dart';

part 'store_users_event.dart';

part 'store_users_state.dart';

abstract class StoreUsersBloc<S extends StoreUsersState> extends StoreBloc<S> {
  final Set<StoreUser> userSet = <StoreUser>{};

  StoreUsersBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
    required StoreUserProvider storeProvider,
  }) : super(prefs: prefs, authProvider: authProvider, storeProvider: storeProvider) {
    on<UsersStoreEventFilterByLocation>((event, emit) async {
      // TODO: implement

      emit(StoreUsersStateRelativeStore(isLoading: false, userList: userSet.toList()) as S);
    });
    on<UsersStoreEventFilterByText>((event, emit) async {
      // TODO: implement
      emit(StoreUsersStateRelativeStore(isLoading: false, userList: userSet.toList()) as S);
    });

    on<UsersStoreEventRestore>((event, emit) async {
      // TODO: implement if user have some groupUsers

      userSet.addAll(await storeProvider.getPublicAppUsers());
      emit(StoreUsersStateRelativeStore(isLoading: false, userList: userSet.toList()) as S);
    });
  }
}
