part of 'auth_app_bloc.dart';

@immutable
abstract class AuthAppUserState extends AuthState {
  const AuthAppUserState({
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AuthAppUserStateLogin extends AuthAppUserState {
  final AuthAppUser? authAppUser;

  const AuthAppUserStateLogin({
    required this.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}


class AuthAppUserStateForgotPassword extends AuthAppUserState {
  final bool hasSentEmail;
  const AuthAppUserStateForgotPassword({
    required this.hasSentEmail,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AuthAppUserStateLogout extends AuthAppUserStateLogin {
  const AuthAppUserStateLogout({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

