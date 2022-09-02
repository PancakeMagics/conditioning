part of 'auth_app_bloc.dart';

@immutable
abstract class AuthAppUserEvent extends AuthEvent {
  const AuthAppUserEvent();
}

class AuthAppUserEventLogin extends AuthAppUserEvent {
  final String email;
  final String password;
  const AuthAppUserEventLogin({required this.email, required this.password});
}

class AuthAppUserEventForgotPassword extends AuthAppUserEvent {
  final String email;
  const AuthAppUserEventForgotPassword({required this.email});
}

class AuthAppUserEventRegisterAndLogin extends AuthAppUserEvent {
  final String userName;
  final String email;
  final String password;
  const AuthAppUserEventRegisterAndLogin({required this.userName, required this.email, required this.password});
}

class AuthAppUserEventLogout extends AuthAppUserEvent {
  const AuthAppUserEventLogout();
}
