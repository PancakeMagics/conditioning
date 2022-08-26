import 'package:conditioning/bloc/auth/auth_bloc.dart';

class AppUserStateOrgLoginYet extends AuthStateAppUserLogin {
  const AppUserStateOrgLoginYet({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppUserStateOrgUserForgotPassword extends AuthStateAppUserLogin {
  final bool hasSentEmail;
  const AppUserStateOrgUserForgotPassword({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    required this.hasSentEmail,
    super.exception,
  });
}

class AppUserStateOrgUserRegisterYet extends AuthStateAppUserLogin {
  final String? registerSuccessMessage;
  const AppUserStateOrgUserRegisterYet({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    required this.registerSuccessMessage,
    super.exception,
  });
}
