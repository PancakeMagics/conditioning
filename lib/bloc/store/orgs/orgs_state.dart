part of 'orgs_bloc.dart';

abstract class OrgStoreState extends StoreState {
  const OrgStoreState();
}

class OrgStoreStateFilterYet extends OrgStoreState {
  const OrgStoreStateFilterYet();
}

class OrgStoreStateFiltered extends OrgStoreState {
  final List<Org> orgList;
  const OrgStoreStateFiltered({required this.orgList});
}

class OrgStoreStateTapped extends OrgStoreState {
  final Org org;
  const OrgStoreStateTapped({required this.org});
}