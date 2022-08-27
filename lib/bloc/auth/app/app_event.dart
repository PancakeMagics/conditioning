part of 'app_bloc.dart';

class AppUserEventCheckIfLogin extends AuthEvent {
  const AppUserEventCheckIfLogin();
}

class AppUserEventLogin extends AuthEvent {
  final String email;
  final String password;
  const AppUserEventLogin({required this.email, required this.password});
}

class AppUserEventForgotPassword extends AuthEvent {
  final String email;
  const AppUserEventForgotPassword({required this.email});
}

class AppUserEventRegisterAndLogin extends AuthEvent {
  final String userName;
  final String email;
  final String password;
  const AppUserEventRegisterAndLogin({required this.userName, required this.email, required this.password});
}

class AppUserEventLogout extends AuthEvent {
  const AppUserEventLogout();
}