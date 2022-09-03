import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:conditioning/bloc/login_option.dart';
import 'package:conditioning/ui/animations/navigation/my_animated_slide.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginStateNavigateIn()) {
    on<LoginEventShowCurrentScreen>((event, emit) => emit(const LoginStateNavigateIn()));

    on<LoginEventAppToOrg>((event, emit) => emit(const LoginStateNavigating(
        currentOption: LoginOption.app, toWordOption: LoginOption.org)));
    on<LoginEventAppToEvent>((event, emit) => emit(const LoginStateNavigating(
        currentOption: LoginOption.app, toWordOption: LoginOption.event)));
    on<LoginEventOrgToApp>((event, emit) => emit(const LoginStateNavigating(
        currentOption: LoginOption.org, toWordOption: LoginOption.app)));
    on<LoginEventOrgToEvent>((event, emit) => emit(const LoginStateNavigating(
        currentOption: LoginOption.org, toWordOption: LoginOption.event)));
    on<LoginEventEventToApp>((event, emit) => emit(const LoginStateNavigating(
        currentOption: LoginOption.event, toWordOption: LoginOption.app)));
    on<LoginEventEventToOrg>((event, emit) => emit(const LoginStateNavigating(
        currentOption: LoginOption.event, toWordOption: LoginOption.org)));
  }
}
