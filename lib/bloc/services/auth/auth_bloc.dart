import 'dart:developer';

import 'package:conditioning/bloc/bloc_exception.dart';
import 'package:conditioning/bloc/services/auth/auth_event.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/services/auth/event/auth_event_bloc.dart';
import 'package:conditioning/bloc/services/auth/org/auth_org_bloc.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/auth_app_bloc.dart';

abstract class AuthBloc<S extends AuthState> extends Bloc<AuthEvent, AuthState> {
  AuthAppUser? authAppUser;
  final List<AuthOrgUser> authOrgUserList = [];
  final List<AuthEventUser> authEventUserList = [];

  AuthBloc({required AuthProvider authProvider}) : super(const AuthStateInitialYet(isLoading: true)) {
    on<AuthEventInitialize>((event, emit) async {
      try {
        await authProvider.initialize();

        /// if logged, login as appUser
        if (S == AuthAppUserState) {
          final providerAuthUser = authProvider.authAppUser;
          if (providerAuthUser != null) {
            authAppUser = providerAuthUser;
            emit(AuthAppUserStateLogin(
                authAppUser: authAppUser, isLoading: false));

            /// user not logged
          } else {
            emit(
                const AuthAppUserStateLogin(authAppUser: null, isLoading: false)
                   );
          }

          /// if logged, choose to login as orgUser or eventUser
        } else {
          final providerAuthUserList = authProvider.authUserList;
          if (providerAuthUserList.isNotEmpty) {
            if (S == AuthOrgUserState) {
              authOrgUserList.addAll(providerAuthUserList as List<AuthOrgUser>);
              emit(AuthOrgUserStateChoosingLogin(
                  authOrgUserList: authOrgUserList));
            } else if (S == AuthEventUserState) {
              authEventUserList
                  .addAll(providerAuthUserList as List<AuthEventUser>);
              emit(AuthEventUserStateChoosingLogin(
                  authEventUserList: authEventUserList));
            } else {
              throw NoSuchBlocStateException(state: state);
            }

            /// user not logged
          } else {
            if (S == AuthOrgUserState) {
              emit(const AuthOrgUserStateLogin(
                  authOrgUser: null, isLoading: false));
            } else if (S == AuthEventUserState) {
              emit(const AuthEventUserStateLogin(
                  authEventUser: null, isLoading: false));
            } else {
              throw NoSuchBlocStateException(state: state);
            }
          }
        }
      } on NoSuchBlocStateException catch (e) {
        emit(AuthStateInitialYet(isLoading: false, exception: e));
      }
    });
  }
}
