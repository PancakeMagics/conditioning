part of 'explore_bloc.dart';

class ExploreEventUserOnTap extends StoreEvent {
  final PesItem<User> userItem;
  const ExploreEventUserOnTap({required this.userItem});
}

class ExploreEventOrgOnTap extends StoreEvent {
  final PesItem<Org> orgItem;
  const ExploreEventOrgOnTap({required this.orgItem});
}

class ExploreEventEventOnTap extends StoreEvent {
  final PesItem<Event> eventItem;
  const ExploreEventEventOnTap({required this.eventItem});
}