part of 'org_bloc.dart';

@immutable
abstract class OrgEvent extends StoreOrgsEvent {
  const OrgEvent();
}

class OrgEventStoreHomeScreenData extends OrgEvent {
  const OrgEventStoreHomeScreenData();
}

class OrgEventStoreTeamScreenData extends OrgEvent {
  const OrgEventStoreTeamScreenData();
}

class OrgEventStoreDocumentionScreenData extends OrgEvent {
  const OrgEventStoreDocumentionScreenData();
}

// navigation events
@immutable
abstract class NavigationEvent extends OrgEvent {
  const NavigationEvent();
}

class OrgEventHomeToDocumention extends NavigationEvent {
  const OrgEventHomeToDocumention();
}

class OrgEventHomeToTeam extends NavigationEvent {
  const OrgEventHomeToTeam();
}

class OrgEventTeamToDocumention extends NavigationEvent {
  const OrgEventTeamToDocumention();
}

class OrgEventTeamToHome extends NavigationEvent {
  const OrgEventTeamToHome();
}

class OrgEventDocumentionToTeam extends NavigationEvent {
  const OrgEventDocumentionToTeam();
}

class OrgEventDocumentionToHome extends NavigationEvent {
  const OrgEventDocumentionToHome();
}