import 'package:conditioning/bloc/auth/auth_bloc.dart';

class AppUserEventEventUserLogin extends AuthEvent {
  final String email;
  final String password;
  const AppUserEventEventUserLogin({required this.email, required this.password});
}

class AppUserEventEventUserForgotPassword extends AuthEvent {
  final String email;
  const AppUserEventEventUserForgotPassword({required this.email});
}

class AppUserEventEventUserRegisterAndLogin extends AuthEvent {
  final String userName;
  final String email;
  final String password;
  const AppUserEventEventUserRegisterAndLogin({required this.userName, required this.email, required this.password});
}

class AppUserEventEventUserLogout extends AuthEvent {
  const AppUserEventEventUserLogout();
}
