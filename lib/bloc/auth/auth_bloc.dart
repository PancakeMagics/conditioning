import 'package:conditioning/bloc/auth/auth_event.dart';
import 'package:conditioning/bloc/auth/auth_state.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/auth/entities/auth_user.dart';
import 'app/app_bloc.dart';

abstract class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthAppUser? authAppUser;
  AuthBloc({required AuthProvider authProvider}) : super(const AuthStateInitialYet(isLoading: true)) {
    on<AuthEventInitialize>((event, emit) async {
      emit(const AuthStateInitialYet(isLoading: true));
      try {
        await authProvider.initialize();
        if (authProvider.currentAuthUser == null) {
          emit(const AppUserStateLoginYet(isLoading: false));
        } else {
          authAppUser = authProvider.currentAuthUser as AuthAppUser;
          emit(AppUserStateLogin(authAppUser: authAppUser, isLoading: false));
        }
      } on Exception catch (e) {
        emit(AuthStateInitialYet(isLoading: false, exception: e));
      }
    });
  }
}