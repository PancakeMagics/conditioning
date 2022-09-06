import 'package:conditioning/bloc/services/auth/auth_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_event.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/service/auth/auth_exception.dart';
import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_app_event.dart';

part 'auth_app_state.dart';

class AuthAppBloc<S extends AuthAppUserState> extends AuthBloc<S> {
  AuthAppBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
  }) : super(prefs: prefs, authProvider: authProvider) {
    on<AuthAppUserEventLogin>((event, emit) async {
      await _appUserLoginTryCatch(emit, () async {
        authAppUser = await authProvider.appLoginAndNotify(
            email: event.email, password: event.password);
      });
    });
    on<AuthAppUserEventRegisterAndLogin>((event, emit) async {
      await _appUserLoginTryCatch(emit, () async {
        authAppUser = await authProvider.appRegisterAndLoginAndNotify(
            email: event.email, password: event.password);
      });
    });

    on<AuthAppUserEventForgotPassword>((event, emit) async {
      emit(const AuthAppUserStateForgotPassword(
          hasSentEmail: false, isLoading: true) as S);
      bool didSendEmail;
      Exception? exception;
      try {
        await authProvider.sendPasswordReset(toEmail: event.email);
        didSendEmail = true;
        exception = null;
      } on Exception catch (e) {
        didSendEmail = false;
        exception = e;
      }
      emit(AuthAppUserStateForgotPassword(
          exception: exception,
          isLoading: false,
          hasSentEmail: didSendEmail) as S);
    });

    on<AuthAppUserEventLogout>((event, emit) async {
      try {
        await authProvider.appLogout();
        authAppUser = null;
        emit(const AuthAppUserStateLogout(authAppUser: null, isLoading: false)
            as S);
      } on Exception catch (e) {
        emit(AuthAppUserStateLogout(
            authAppUser: null, exception: e, isLoading: false) as S);
      }
    });
  }

  _appUserLoginTryCatch(Emitter<AuthState> emit, Function function) async {
    emit(const AuthAppUserStateLogin(authAppUser: null, isLoading: true));
    try {
      await function();
      emit(AuthAppUserStateLogin(authAppUser: authAppUser, isLoading: false));

    } on RegisterException catch (re) {
      emit(AuthAppUserStateLogin(
          authAppUser: authAppUser, exception: re, isLoading: false));
    } on LoginException catch (le) {
      emit(AuthAppUserStateLogin(
          authAppUser: authAppUser, exception: le, isLoading: false));
    } on Exception {
      rethrow;
    }
  }
}
