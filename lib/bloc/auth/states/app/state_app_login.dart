import 'package:conditioning/bloc/auth/auth_bloc.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';

class AppUserStateLogout extends AuthStateAppUserLogin {
  const AppUserStateLogout({
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(authAppUser: null);
}

class AppUserStateLogoutYet extends AuthStateAppUserLogin {
  const AppUserStateLogoutYet({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppUserStateExplore extends AuthStateAppUserLogin {
  const AppUserStateExplore({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppUserStateFriend extends AuthStateAppUserLogin {
  const AppUserStateFriend({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class AppUserStateLoginOrg extends AuthStateAppUserLogin {
  final AuthOrgUser? authOrgUser;
  const AppUserStateLoginOrg({
    required this.authOrgUser,
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

