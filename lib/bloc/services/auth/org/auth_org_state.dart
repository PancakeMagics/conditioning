part of 'auth_org_bloc.dart';

@immutable
abstract class AuthOrgUserState extends AuthState {
  const AuthOrgUserState({
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AuthOrgUserStateForgotPassword extends AuthOrgUserState {
  final bool hasSentEmail;

  const AuthOrgUserStateForgotPassword({
    required this.hasSentEmail,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AuthOrgUserStateChoosingLogin extends AuthOrgUserState {
  final List<AuthOrgUser> authOrgUserList;

  const AuthOrgUserStateChoosingLogin({
    required this.authOrgUserList,
    super.loadingText,
    super.exception,
  }) : super(isLoading: false);
}

class AuthOrgUserStateLogin extends AuthOrgUserState {
  final AuthOrgUser? authOrgUser;

  const AuthOrgUserStateLogin({
    required this.authOrgUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AuthOrgUserStateLogout extends AuthOrgUserStateLogin {
  const AuthOrgUserStateLogout({
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(authOrgUser: null);
}
