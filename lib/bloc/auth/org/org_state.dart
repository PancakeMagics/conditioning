part of 'org_bloc.dart';

class OrgUserInitialYet extends AppUserStateLogin {
  const OrgUserInitialYet({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgUserInitialed extends AppUserStateLogin {
  const OrgUserInitialed({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgUserStateLoginYet extends OrgUserInitialed {
  const OrgUserStateLoginYet({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgUserStateRegisterYet extends OrgUserStateLoginYet {

  const OrgUserStateRegisterYet({

    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}


class OrgUserStateForgotPassword extends OrgUserStateLoginYet {
  final bool hasSentEmail;
  const OrgUserStateForgotPassword({
    required this.hasSentEmail,
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgUserStateLogin extends OrgUserInitialed {
  final AuthOrgUser? authOrgUser;
  const OrgUserStateLogin({
    required this.authOrgUser,
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgUserStateLogout extends OrgUserStateLogin {
  const OrgUserStateLogout({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(authOrgUser: null);
}

class OrgUserStateLogoutYet extends OrgUserStateLogin {
  const OrgUserStateLogoutYet({
    required super.authAppUser,
    required super.authOrgUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
