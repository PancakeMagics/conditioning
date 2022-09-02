part of 'auth_org_bloc.dart';

@immutable
abstract class AuthOrgUserEvent extends AuthEvent {
  const AuthOrgUserEvent();
}

class AuthOrgUserEventCheckIfLogin extends AuthOrgUserEvent {
  const AuthOrgUserEventCheckIfLogin();
}

class AuthOrgUserEventLogin extends AuthOrgUserEvent {
  final String email;
  final String password;
  const AuthOrgUserEventLogin({required this.email, required this.password});
}

class AuthOrgUserEventForgotPassword extends AuthOrgUserEvent {
  final String email;
  const AuthOrgUserEventForgotPassword({required this.email});
}

class AuthOrgUserEventRegisterAndLogin extends AuthOrgUserEvent {
  final String userName;
  final String email;
  final String password;
  const AuthOrgUserEventRegisterAndLogin({required this.userName, required this.email, required this.password});
}

class AuthOrgUserEventLogout extends AuthOrgUserEvent {
  const AuthOrgUserEventLogout();
}