part of 'org_bloc.dart';

class OrgUserEventCheckIfLogin extends AuthEvent {
  const OrgUserEventCheckIfLogin();
}

class OrgUserEventLogin extends AuthEvent {
  final String email;
  final String password;
  const OrgUserEventLogin({required this.email, required this.password});
}

class OrgUserEventForgotPassword extends AuthEvent {
  final String email;
  const OrgUserEventForgotPassword({required this.email});
}

class OrgUserEventRegisterAndLogin extends AuthEvent {
  final String userName;
  final String email;
  final String password;
  const OrgUserEventRegisterAndLogin({required this.userName, required this.email, required this.password});
}

class OrgUserEventLogout extends AuthEvent {
  const OrgUserEventLogout();
}