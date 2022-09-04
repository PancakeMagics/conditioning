part of 'org_bloc.dart';

@immutable
abstract class OrgState extends StoreOrgsState {
  final Org org;

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

class OrgNavigationStateHomeToTeam extends OrgNavigationState {
  const OrgNavigationStateHomeToTeam({
    required super.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgNavigationStateTeamToDocumention extends OrgNavigationState {
  const OrgNavigationStateTeamToDocumention({
    required super.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgNavigationStateTeamToHome extends OrgNavigationState {
  const OrgNavigationStateTeamToHome({
    required super.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class OrgNavigationStateDocumentionToTeam extends OrgNavigationState {
  const OrgNavigationStateDocumentionToTeam({
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