part of 'org_bloc.dart';

@immutable
abstract class OrgState extends StoreOrgsState {
  final StoreOrg org;

  const OrgState({
    required this.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(orgList: null);
}

class OrgStateDataStore extends OrgState {
  const OrgStateDataStore({
    required super.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

@immutable
abstract class OrgNavigationState extends OrgState {
  const OrgNavigationState({
    required super.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgNavigationStateHomeToDocumention extends OrgNavigationState {
  const OrgNavigationStateHomeToDocumention({
    required super.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgNavigationStateHomeToGroup extends OrgNavigationState {
  const OrgNavigationStateHomeToGroup({
    required super.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgNavigationStateGroupToDocumention extends OrgNavigationState {
  const OrgNavigationStateGroupToDocumention({
    required super.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgNavigationStateGroupToHome extends OrgNavigationState {
  const OrgNavigationStateGroupToHome({
    required super.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgNavigationStateDocumentionToGroup extends OrgNavigationState {
  const OrgNavigationStateDocumentionToGroup({
    required super.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgNavigationStateDocumentionToHome extends OrgNavigationState {
  const OrgNavigationStateDocumentionToHome({
    required super.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}