import 'package:conditioning/bloc/auth/auth_bloc.dart';

class AppUserStateEventUserForgotPassword extends AppUserStateEventUserLoginYet {
  final bool hasSentEmail;
  const AppUserStateEventUserForgotPassword({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    required this.hasSentEmail,
    super.exception,
  });
}

class AppUserStateEventUserRegisterYet extends AppUserStateEventUserLoginYet {
  final String? registerSuccessMessage;
  const AppUserStateEventUserRegisterYet({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    required this.registerSuccessMessage,
    super.exception,
  });
}
