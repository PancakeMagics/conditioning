import 'package:conditioning/bloc/auth/auth_bloc.dart';

class AuthStateAppUserForgotPassword extends AuthStateAppUserLoginYet {
  final bool hasSentEmail;
  const AuthStateAppUserForgotPassword({
    required super.isLoading,
    super.loadingText,
    required this.hasSentEmail,
    super.exception,
  });
}

class AuthStateAppUserRegisterYet extends AuthStateAppUserLoginYet {
  final String? registerSuccessMessage;
  const AuthStateAppUserRegisterYet({
    required super.isLoading,
    super.loadingText,
    super.exception,
    this.registerSuccessMessage,
  });
}
