part of 'app_user_bloc.dart';

@immutable
abstract class AppUserEvent {
  const AppUserEvent();
}

class AppUserEventInitialize extends AppUserEvent {
  const AppUserEventInitialize();
}

class AppUserEventLogin extends AppUserEvent {
  final String email;
  final String password;
  const AppUserEventLogin({required this.email, required this.password});
}

class AppUserEventForgotPassword extends AppUserEvent {
  final String email;
  const AppUserEventForgotPassword({required this.email});
}

class AppUserEventRegisterAndLogin extends AppUserEvent {
  final String userName;
  final String email;
  final String password;
  const AppUserEventRegisterAndLogin({required this.userName, required this.email, required this.password});
}

class AppUserEventLogout extends AppUserEvent {
  const AppUserEventLogout();
}