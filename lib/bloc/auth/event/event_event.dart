part of 'event_bloc.dart';

class EventUserEventCheckIfLogin extends AuthEvent {
  const EventUserEventCheckIfLogin();
}

class EventUserEventLogin extends AuthEvent {
  final String email;
  final String password;
  const EventUserEventLogin({required this.email, required this.password});
}

class EventUserEventForgotPassword extends AuthEvent {
  final String email;
  const EventUserEventForgotPassword({required this.email});
}

class EventUserEventRegisterAndLogin extends AuthEvent {
  final String userName;
  final String email;
  final String password;
  const EventUserEventRegisterAndLogin({required this.userName, required this.email, required this.password});
}

class EventUserEventLogout extends AuthEvent {
  const EventUserEventLogout();
}
