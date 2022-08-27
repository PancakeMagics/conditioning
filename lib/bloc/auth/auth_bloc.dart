

import 'package:conditioning/bloc/auth/auth_event.dart';
import 'package:conditioning/bloc/auth/auth_state.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthProvider authProvider}) : super(const AuthStateInitialYet(isLoading: true)) {
    on<AuthEventInitialize>((event, emit) async {
      try {
        await authProvider.initialize();
        emit(const AuthStateInitialed(isLoading: false));
      } on Exception catch (e) {
        emit(AuthStateInitialYet(isLoading: false, exception: e));
      }
    });
  }
}