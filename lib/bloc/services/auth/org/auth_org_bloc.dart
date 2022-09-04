import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_event.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';
import 'package:flutter/cupertino.dart';

import '../auth_state.dart';

part 'auth_org_event.dart';

part 'auth_org_state.dart';

class AuthOrgBloc<S extends AuthOrgUserState> extends AuthBloc<S> {
  AuthOrgUser? _authOrgUser;

  AuthOrgBloc({required AuthProvider authProvider})
      : super(authProvider: authProvider) {
    on<AuthOrgUserEventLogin>((event, emit) async {
      await _orgUserLoginTryCatch(emit, () async {
        _authOrgUser = await authProvider.orgLoginAndNotify(
            email: event.email, password: event.password) as AuthOrgUser;
      });
    });
    on<AuthOrgUserEventRegisterAndLogin>((event, emit) async {
      await _orgUserLoginTryCatch(emit, () async {
        _authOrgUser = await authProvider.orgRegisterAndLoginAndNotify(
            email: event.email, password: event.password) as AuthOrgUser;
      });
    });
    on<AuthOrgUserEventLogout>((event, emit) async {
      try {
        await authProvider.orgLogout();
        _authOrgUser = null;
        emit(const AuthOrgUserStateLogout(isLoading: false));
      } on Exception catch (e) {
        emit(AuthOrgUserStateLogout(exception: e, isLoading: false));
      }
    });
  }

  _orgUserLoginTryCatch(Emitter<AuthState> emit, Function function) async {
    emit(const AuthOrgUserStateLogin(authOrgUser: null, isLoading: true));
    try {
      await function();
      emit(AuthOrgUserStateLogin(isLoading: false, authOrgUser: _authOrgUser));
    } on Exception catch (e) {
      emit(AuthOrgUserStateLogin(authOrgUser: null, exception: e, isLoading: false));
    }
  }
}
