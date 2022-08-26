import 'package:conditioning/bloc/auth/auth_bloc.dart';

class AuthEventAppUserLogin extends AuthEvent {
  final String email;
  final String password;
  const AuthEventAppUserLogin({required this.email, required this.password});
}

class AuthEventAppUserForgotPassword extends AuthEvent {
  final String email;
  const AuthEventAppUserForgotPassword({required this.email});
}

class AuthEventAppUserRegisterAndLogin extends AuthEvent {
  final String userName;
  final String email;
  final String password;
  const AuthEventAppUserRegisterAndLogin({required this.userName, required this.email, required this.password});
}

class AppUserEventLogout extends AuthEvent {
  const AppUserEventLogout();
}