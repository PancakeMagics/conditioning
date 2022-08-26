import 'package:bloc/bloc.dart' show Bloc;
import 'package:conditioning/bloc/auth/events/event_event_login.dart';
import 'package:conditioning/bloc/auth/events/event_org_login.dart';
import 'package:conditioning/bloc/auth/states/event/state_event_login.dart';
import 'package:conditioning/bloc/auth/states/org/state_org_login.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/event_app_login.dart';
import 'states/app/state_app_login.dart';
import 'states/app/state_app_login_yet.dart';

part 'auth_event.dart';

part 'auth_state.dart';

typedef AuthFunction = Function();

abstract class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthAppUser? authAppUser;
  AuthOrgUser? authOrgUser;
  AuthEventUser? authEventUser;

  AuthBloc({required AuthProvider authProvider})
      : super(const AuthStateAppUserInitialYet(isLoading: true)) {
    on<AuthEventInitialize>((event, emit) async {
      try {
        await authProvider.initialize();
        if (authProvider.currentAuthUser == null) {
          emit(const AuthStateAppUserLoginYet(isLoading: false));
        } else {
          authAppUser = authProvider.currentAuthUser as AuthAppUser;
          emit(AuthStateAppUserLogin(
              authAppUser: authAppUser, isLoading: false));
        }
      } on Exception catch (e) {
        emit(AuthStateAppUserLoginYet(exception: e, isLoading: false));
      }
    });

    on<AuthEventAppUserLogin>((event, emit) async {
      await _appUserLoginTryCatch(emit, () async {
        authAppUser = await authProvider.appLoginAndNotify(
            email: event.email, password: event.password) as AuthAppUser;
      });
    });
    on<AuthEventAppUserRegisterAndLogin>((event, emit) async {
      await _appUserLoginTryCatch(emit, () async {
        authAppUser = await authProvider.appRegisterAndLoginAndNotify(
            email: event.email, password: event.password) as AuthAppUser;
      });
    });

    on<AppUserEventOrgUserLogin>((event, emit) async {
      await _orgUserLoginTryCatch(emit, () async {
        authOrgUser = await authProvider.orgLoginAndNotify(
            email: event.email, password: event.password) as AuthOrgUser;
      });
    });
    on<AppUserEventOrgUserRegisterAndLogin>((event, emit) async {
      await _orgUserLoginTryCatch(emit, () async {
        authOrgUser = await authProvider.orgRegisterAndLoginAndNotify(
            email: event.email, password: event.password) as AuthOrgUser;
      });
    });

    on<AppUserEventEventUserLogin>((event, emit) async {
      await _eventUserLoginTryCatch(emit, () async {
        authEventUser = await authProvider.eventLoginAndNotify(
            email: event.email, password: event.password) as AuthEventUser;
      });
    });
    on<AppUserEventEventUserRegisterAndLogin>((event, emit) async {
      await _eventUserLoginTryCatch(emit, () async {
        authEventUser = await authProvider.eventRegisterAndLoginAndNotify(
            email: event.email, password: event.password) as AuthEventUser;
      });
    });

    on<AuthEventAppUserForgotPassword>((event, emit) async {
      emit(const AuthStateAppUserForgotPassword(
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
      emit(AuthStateAppUserForgotPassword(
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
    on<AppUserEventOrgUserLogout>((event, emit) async {
      try {
        await authProvider.orgLogout();
        authOrgUser = null;
        emit(OrgUserStateLogout(authAppUser: authAppUser, isLoading: false));
      } on Exception catch (e) {
        emit(OrgUserStateLogoutYet(
            exception: e,
            authAppUser: authAppUser,
            authOrgUser: authOrgUser,
            isLoading: false));
      }
    });
    on<AppUserEventEventUserLogout>((event, emit) async {
      try {
        await authProvider.eventLogout();
        authAppUser = null;
        emit(EventUserStateLogout(authAppUser: authAppUser, isLoading: false));
      } on Exception catch (e) {
        emit(EventUserStateLogoutYet(
            exception: e,
            authAppUser: authAppUser,
            authEventUser: authEventUser,
            isLoading: false));
      }
    });
  }

  _appUserLoginTryCatch(Emitter<AuthState> emit, AuthFunction function) async {
    emit(const AuthStateAppUserLoginYet(isLoading: true));
    try {
      await function();
      emit(AuthStateAppUserLogin(authAppUser: authAppUser, isLoading: false));
    } on Exception catch (e) {
      emit(AuthStateAppUserLoginYet(exception: e, isLoading: false));
    }
  }

  _eventUserLoginTryCatch(
      Emitter<AuthState> emit, AuthFunction function) async {
    emit(AppUserStateEventUserLoginYet(
        isLoading: true, authAppUser: authAppUser));
    try {
      await function();
      emit(AppUserStateEventUserLogin(
          isLoading: false,
          authAppUser: authAppUser,
          authEventUser: authEventUser));
    } on Exception catch (e) {
      emit(AppUserStateEventUserLoginYet(
          exception: e, isLoading: false, authAppUser: authAppUser));
    }
  }

  _orgUserLoginTryCatch(Emitter<AuthState> emit, AuthFunction function) async {
    emit(AppUserStateOrgLoginYet(isLoading: true, authAppUser: authAppUser));
    try {
      await function();
      emit(AppUserStateOrgLogin(
          isLoading: false,
          authAppUser: authAppUser,
          authOrgUser: authOrgUser));
    } on Exception catch (e) {
      emit(AppUserStateOrgLoginYet(
          exception: e, isLoading: false, authAppUser: authAppUser));
    }
  }
}
