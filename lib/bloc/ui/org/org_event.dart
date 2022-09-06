part of 'org_bloc.dart';

@immutable
abstract class OrgEvent extends StoreOrgsEvent {
  const OrgEvent();
}

class OrgEventStoreHomeScreenData extends OrgEvent {
  const OrgEventStoreHomeScreenData();
}

class OrgEventStoreGroupScreenData extends OrgEvent {
  const OrgEventStoreGroupScreenData();
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

class OrgEventHomeToGroup extends NavigationEvent {
  const OrgEventHomeToGroup();
}

class OrgEventGroupToDocumention extends NavigationEvent {
  const OrgEventGroupToDocumention();
}

class OrgEventGroupToHome extends NavigationEvent {
  const OrgEventGroupToHome();
}

class OrgEventDocumentionToGroup extends NavigationEvent {
  const OrgEventDocumentionToGroup();
}

class OrgEventDocumentionToHome extends NavigationEvent {
  const OrgEventDocumentionToHome();
}