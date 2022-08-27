import 'package:conditioning/bloc/auth/auth_bloc.dart';
import 'package:conditioning/bloc/auth/auth_event.dart';
import 'package:conditioning/bloc/auth/auth_state.dart';
import 'package:conditioning/service/auth/auth_exception.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:developer' show log;

part 'app_event.dart';
part 'app_state.dart';

typedef AuthFunction = Function();

abstract class AppBloc extends AuthBloc {
  AuthAppUser? authAppUser;

  AppBloc({required AuthProvider authProvider}) : super(authProvider: authProvider) {
    on<AppUserEventCheckIfLogin>((event, emit) async {
      try {
        if (authProvider.currentAuthUser == null) {
          emit(const AppUserStateLoginYet(isLoading: false));
        } else {
          authAppUser = authProvider.currentAuthUser as AuthAppUser;
          emit(AppUserStateLogin(authAppUser: authAppUser, isLoading: false));
        }
      } on Exception catch (e) {
        emit(AppUserStateLoginYet(exception: e, isLoading: false));
      }
    });

    on<AppUserEventLogin>((event, emit) async {
      await _appUserLoginTryCatch(emit, () async {
        authAppUser = await authProvider.appLoginAndNotify(
            email: event.email, password: event.password) as AuthAppUser;
      });
    });
    on<AppUserEventRegisterAndLogin>((event, emit) async {
      await _appUserLoginTryCatch(emit, () async {
        authAppUser = await authProvider.appRegisterAndLoginAndNotify(
            email: event.email, password: event.password) as AuthAppUser;
      });
    });

    on<AppUserEventForgotPassword>((event, emit) async {
      emit(const AppUserStateForgotPassword(
          hasSentEmail: false, isLoading: true));
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
      emit(AppUserStateForgotPassword(
          exception: exception, isLoading: false, hasSentEmail: didSendEmail));
    });

    on<AppUserEventLogout>((event, emit) async {
      try {
        await authProvider.appLogout();
        authAppUser = null;
        emit(const AppUserStateLogout(isLoading: false));
      } on Exception catch (e) {
        emit(AppUserStateLogoutYet(
            exception: e, authAppUser: authAppUser, isLoading: false));
      }
    });
  }

  _appUserLoginTryCatch(Emitter<AuthState> emit, AuthFunction function) async {
    emit(const AppUserStateLoginYet(isLoading: true));
    try {
      await function();
      emit(AppUserStateLogin(authAppUser: authAppUser, isLoading: false));
    } on RegisterException catch (re) {
      emit(AppUserStateLoginYet(exception: re, isLoading: false));
    } on LoginException catch (le) {
      emit(AppUserStateLoginYet(exception: le, isLoading: false));
    } on Exception {
      rethrow;
    }
  }
}
