part of 'orgs_bloc.dart';

class OrgStoreEventOrgsFilterByLocal extends StoreEvent {//TODO: find near org by localization
  const OrgStoreEventOrgsFilterByLocal();
}

class OrgStoreEventOrgsFilterByText extends StoreEvent {
  final String searchingText;
  const OrgStoreEventOrgsFilterByText({required this.searchingText,});
}

class OrgStoreEventTapOrg extends StoreEvent {
  final String orgId;
  const OrgStoreEventTapOrg({required this.orgId,});
}