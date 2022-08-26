part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  final bool isLoading;
  final String? loadingText;
  final Exception? exception;
  const AuthState({required this.isLoading, this.loadingText, this.exception});
}

class AuthStateAppUserInitialYet extends AuthState {
  const AuthStateAppUserInitialYet({
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AuthStateAppUserLoginYet extends AuthState {
  const AuthStateAppUserLoginYet({
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AuthStateAppUserLogin extends AuthState {
  final AuthAppUser? authAppUser;
  const AuthStateAppUserLogin({
    required this.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppUserStateEventUserLoginYet extends AuthStateAppUserLogin {
  const AppUserStateEventUserLoginYet({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppUserStateEventUserLogin extends AuthStateAppUserLogin {
  final AuthEventUser? authEventUser;
  const AppUserStateEventUserLogin({
    required super.authAppUser,
    required this.authEventUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppUserStateOrgLoginYet extends AuthStateAppUserLogin {
  const AppUserStateOrgLoginYet({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppUserStateOrgLogin extends AuthStateAppUserLogin {
  final AuthOrgUser? authOrgUser;
  const AppUserStateOrgLogin({
    required super.authAppUser,
    required this.authOrgUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
