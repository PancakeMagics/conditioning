import 'package:bloc/bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_event.dart';
import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth_state.dart';

part 'auth_event_event.dart';

part 'auth_event_state.dart';

class AuthEventBloc<S extends AuthEventUserState> extends AuthBloc<S> {
  AuthEventUser? _authEventUser;

  AuthEventBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
  }) : super(prefs: prefs, authProvider: authProvider) {
    on<AuthEventUserEventLogin>((event, emit) async {
      await _eventUserLoginTryCatch(emit, () async {
        _authEventUser = await authProvider.eventLoginAndNotify(
            email: event.email, password: event.password) as AuthEventUser;
      });
    });
    on<AuthEventUserEventRegisterAndLogin>((event, emit) async {
      await _eventUserLoginTryCatch(emit, () async {
        _authEventUser = await authProvider.eventRegisterAndLoginAndNotify(
            email: event.email, password: event.password) as AuthEventUser;
      });
    });
    on<AuthEventUserEventLogout>((event, emit) async {
      try {
        await authProvider.eventLogout();
        authAppUser = null;
        emit(const AuthEventUserStateLogout(isLoading: false));
      } on Exception catch (e) {
        emit(AuthEventUserStateLogout(exception: e, isLoading: false));
      }
    });
  }

  _eventUserLoginTryCatch(Emitter<AuthState> emit, Function function) async {
    emit(const AuthEventUserStateLogin(authEventUser: null, isLoading: true));
    try {
      await function();
      emit(AuthEventUserStateLogin(
          isLoading: false, authEventUser: _authEventUser));
    } on Exception catch (e) {
      emit(AuthEventUserStateLogin(authEventUser: _authEventUser, exception: e, isLoading: false));
    }
  }
}
