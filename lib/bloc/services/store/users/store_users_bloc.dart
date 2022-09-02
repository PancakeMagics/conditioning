import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/store/entities/user.dart';
import 'package:conditioning/service/store/store_provider.dart';
import 'package:flutter/material.dart';

import '../store_bloc.dart';

part 'store_users_event.dart';

part 'store_users_state.dart';

abstract class StoreUsersBloc<S extends StoreUsersState> extends StoreBloc<S> {
  final Set<User> userSet = <User>{};

  StoreUsersBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
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

      userSet.addAll(await storeProvider.getPublicUsers());
      emit(StoreUsersStateRelativeStore(isLoading: false, userList: userSet.toList()) as S);
    });
  }
}
