part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginStateInitialYet extends LoginState {
  const LoginStateInitialYet();
}

class LoginStateInitial extends LoginState {
  final LoginOption initialLoginOption;
  const LoginStateInitial({required this.initialLoginOption});
}

class LoginStateNavigation extends LoginState {
  final LoginOption currentOption;
  final LoginOption toWordOption;
  const LoginStateNavigation({required this.currentOption, required this.toWordOption});
}