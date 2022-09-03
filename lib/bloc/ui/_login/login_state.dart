part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginStateNavigateIn extends LoginState {
  const LoginStateNavigateIn();
}

class LoginStateNavigating extends LoginState {
  final LoginOption currentOption;
  final LoginOption toWordOption;

  const LoginStateNavigating(
      {required this.currentOption, required this.toWordOption,
      });
}