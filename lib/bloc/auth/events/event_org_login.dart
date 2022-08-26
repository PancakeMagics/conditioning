import 'package:conditioning/bloc/auth/auth_bloc.dart';

class AppUserEventOrgUserLogin extends AuthEvent {
  final String email;
  final String password;
  const AppUserEventOrgUserLogin({required this.email, required this.password});
}

class AppUserEventOrgUserForgotPassword extends AuthEvent {
  final String email;
  const AppUserEventOrgUserForgotPassword({required this.email});
}

class AppUserEventOrgUserRegisterAndLogin extends AuthEvent {
  final String userName;
  final String email;
  final String password;
  const AppUserEventOrgUserRegisterAndLogin({required this.userName, required this.email, required this.password});
}

class AppUserEventOrgUserLogout extends AuthEvent {
  const AppUserEventOrgUserLogout();
}