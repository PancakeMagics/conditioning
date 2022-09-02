part of 'auth_event_bloc.dart';

@immutable
abstract class AuthEventUserEvent extends AuthEvent {
  const AuthEventUserEvent();
}

class AuthEventUserEventCheckIfLogin extends AuthEventUserEvent {
  const AuthEventUserEventCheckIfLogin();
}

class AuthEventUserEventLogin extends AuthEventUserEvent {
  final String email;
  final String password;
  const AuthEventUserEventLogin({required this.email, required this.password});
}

class AuthEventUserEventForgotPassword extends AuthEventUserEvent {
  final String email;
  const AuthEventUserEventForgotPassword({required this.email});
}

class AuthEventUserEventRegisterAndLogin extends AuthEventUserEvent {
  final String userName;
  final String email;
  final String password;
  const AuthEventUserEventRegisterAndLogin({required this.userName, required this.email, required this.password});
}

class AuthEventUserEventLogout extends AuthEventUserEvent {
  const AuthEventUserEventLogout();
}
