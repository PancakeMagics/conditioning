part of 'auth_event_bloc.dart';

@immutable
abstract class AuthEventUserState extends AuthState {
  const AuthEventUserState({
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AuthEventUserStateForgotPassword extends AuthEventUserState {
  final bool hasSentEmail;

  const AuthEventUserStateForgotPassword({
    required this.hasSentEmail,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AuthEventUserStateChoosingLogin extends AuthEventUserState {
  final List<AuthEventUser> authEventUserList;

  const AuthEventUserStateChoosingLogin({
    required this.authEventUserList,
    super.loadingText,
    super.exception,
  }) : super(isLoading: false);
}


class AuthEventUserStateLogin extends AuthEventUserState {
  final AuthEventUser? authEventUser;

  const AuthEventUserStateLogin({
    required this.authEventUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AuthEventUserStateLogout extends AuthEventUserStateLogin {
  const AuthEventUserStateLogout({
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(authEventUser: null);
}