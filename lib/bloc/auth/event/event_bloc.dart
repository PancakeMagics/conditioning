import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:conditioning/bloc/auth/app/app_bloc.dart';
import 'package:conditioning/bloc/auth/auth_event.dart';
import 'package:meta/meta.dart';

import '../../../service/auth/auth_provider.dart';
import '../../../service/auth/entities/auth_user.dart';
import '../auth_state.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends AppBloc {
  AuthEventUser? authEventUser;

  EventBloc({required AuthProvider authProvider}) : super(authProvider: authProvider) {
    on<EventUserEventLogin>((event, emit) async {
      await _eventUserLoginTryCatch(emit, () async {
        authEventUser = await authProvider.eventLoginAndNotify(
            email: event.email, password: event.password) as AuthEventUser;
      });
    });
    on<EventUserEventRegisterAndLogin>((event, emit) async {
      await _eventUserLoginTryCatch(emit, () async {
        authEventUser = await authProvider.eventRegisterAndLoginAndNotify(
            email: event.email, password: event.password) as AuthEventUser;
      });
    });
    on<EventUserEventLogout>((event, emit) async {
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

  _eventUserLoginTryCatch(
      Emitter<AuthState> emit, AuthFunction function) async {
    emit(EventUserStateLoginYet(
        isLoading: true, authAppUser: authAppUser));
    try {
      await function();
      emit(EventUserStateLogin(
          isLoading: false,
          authAppUser: authAppUser,
          authEventUser: authEventUser));
    } on Exception catch (e) {
      emit(EventUserStateLoginYet(
          exception: e, isLoading: false, authAppUser: authAppUser));
    }
  }
}
