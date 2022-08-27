part of 'app_bloc.dart';

class AppUserStateForgotPassword extends AppUserStateLoginYet {
  final bool hasSentEmail;
  const AppUserStateForgotPassword({
    required this.hasSentEmail,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppUserStateLogin extends AuthState {
  final AuthAppUser? authAppUser;

  const AppUserStateLogin({
    required this.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppUserStateLogout extends AppUserStateLogin {
  const AppUserStateLogout({
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(authAppUser: null);
}

class AppUserStateLogoutYet extends AppUserStateLogin {
  const AppUserStateLogoutYet({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}