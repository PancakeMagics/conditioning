import 'package:bloc/bloc.dart' show Bloc;
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';
import 'package:conditioning/service/store/entities/store_user.dart';
import 'package:flutter/material.dart';

part 'app_user_event.dart';
part 'app_user_state.dart';

class AppUserBloc extends Bloc<AppUserEvent, AppUserState> {
  AppUserBloc({required AuthProvider authProvider}) : super(const AppUserStateInitial(isLoading: true)) {
    on<AppUserEventInitialize>((event, emit) async {
      try {
        await authProvider.initialize();
        final authUser = authProvider.currentUser;
        if (authUser == null) {
          emit(const AppUserStateLoginYet(isLoading: false));
        } else {
          emit(AppUserStateLogin(authUser: authUser));
        }
      } on Exception catch(e) {
        emit(AppUserStateLoginYet(exception: e, isLoading: false));
      }
    });

    on<AppUserEventLogin>((event, emit) async {
      emit(const AppUserStateLoginYet(isLoading: true));

      try {
        final authUser = await authProvider.loginAndNotify(email: event.email, password: event.password);
        emit(AppUserStateLogin(authUser: authUser));

      } on Exception catch(e) {
        emit(AppUserStateLoginYet(exception: e, isLoading: false));
      }
    });

    on<AppUserEventRegisterAndLogin>((event, emit) async {
      emit(const AppUserStateLoginYet(isLoading: true));

      try {
        final authUser = await authProvider.registerAndLoginAndNotify(email: event.email, password: event.password);
        emit(AppUserStateLogin(authUser: authUser));
      } on Exception catch(e) {
        emit(AppUserStateLoginYet(exception: e, isLoading: false));
      }
    });

    on<AppUserEventForgotPassword>((event, emit) async {
      emit(const AppUserStateForgotPassword(hasSentEmail: false, isLoading: true));

      bool didSendEmail;
      Exception? exception;
      try {
        await authProvider.sendPasswordReset(toEmail: event.email);
        didSendEmail = true;
        exception = null;

      } on Exception catch(e) {
        didSendEmail = false;
        exception = e;
      }
      emit(AppUserStateForgotPassword(exception: exception, isLoading: false, hasSentEmail: didSendEmail));
    });


    on<AppUserEventLogout>((event, emit) async {
      try {
        await authProvider.logout();
        emit(const AppUserStateLoginYet(isLoading: false));
      } on Exception catch (e) {
        emit(AppUserStateLoginYet(exception: e, isLoading: false));
      }
    });
  }
}
