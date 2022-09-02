import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:conditioning/bloc/login_option.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginStateInitialYet()) {
    on<LoginEventInitialize>((event, emit) => emit(LoginStateInitial(initialLoginOption: event.initLoginOption)));
    on<LoginEventAppToOrg>((event, emit) => emit(const LoginStateNavigation(currentOption: LoginOption.app, toWordOption: LoginOption.org)));
    on<LoginEventAppToEvent>((event, emit) => emit(const LoginStateNavigation(currentOption: LoginOption.app, toWordOption: LoginOption.event)));
    on<LoginEventOrgToApp>((event, emit) => emit(const LoginStateNavigation(currentOption: LoginOption.org, toWordOption: LoginOption.app)));
    on<LoginEventOrgToEvent>((event, emit) => emit(const LoginStateNavigation(currentOption: LoginOption.org, toWordOption: LoginOption.event)));
    on<LoginEventEventToApp>((event, emit) => emit(const LoginStateNavigation(currentOption: LoginOption.event, toWordOption: LoginOption.app)));
    on<LoginEventEventToOrg>((event, emit) => emit(const LoginStateNavigation(currentOption: LoginOption.event, toWordOption: LoginOption.org)));
  }
}
