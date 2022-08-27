
import 'package:conditioning/bloc/auth/org/org_bloc.dart';

class OrgUserStateDocumention extends OrgUserStateLogin {
  const OrgUserStateDocumention({
    required super.authAppUser,
    required super.authOrgUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}