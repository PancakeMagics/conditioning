import 'package:conditioning/bloc/auth/auth_bloc.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';

class OrgUserStateLogout extends AppUserStateOrgLogin {
  const OrgUserStateLogout({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(authOrgUser: null);
}

class OrgUserStateLogoutYet extends AppUserStateOrgLogin {
  const OrgUserStateLogoutYet({
    required super.authAppUser,
    required super.authOrgUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgUserStateDocumention extends AppUserStateOrgLogin {
  const OrgUserStateDocumention({
    required super.authAppUser,
    required super.authOrgUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
