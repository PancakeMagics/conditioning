part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

class LoginEventShowCurrentScreen extends LoginEvent {
  const LoginEventShowCurrentScreen();
}

class LoginEventAppToOrg extends LoginEvent {
  const LoginEventAppToOrg();
}

class LoginEventAppToEvent extends LoginEvent {
  const LoginEventAppToEvent();
}

class LoginEventOrgToEvent extends LoginEvent {
  const LoginEventOrgToEvent();
}

class LoginEventOrgToApp extends LoginEvent {
  const LoginEventOrgToApp();
}

class LoginEventEventToApp extends LoginEvent {
  const LoginEventEventToApp();
}

class LoginEventEventToOrg extends LoginEvent {
  const LoginEventEventToOrg();
}
