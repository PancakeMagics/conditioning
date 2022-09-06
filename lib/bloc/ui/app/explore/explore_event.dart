part of 'explore_bloc.dart';

@immutable
abstract class ExploreEvent extends StoreBlocEvent {
  const ExploreEvent();
}

/// explore user
@immutable
abstract class ExploreUserEvent extends ExploreEvent {
  const ExploreUserEvent();
}
class ExploreUserEventStoreUsersData extends ExploreUserEvent {
  const ExploreUserEventStoreUsersData();
}

class ExploreUserEventAddFriend extends ExploreUserEvent {
  final StoreUser user;
  const ExploreUserEventAddFriend({required this.user});
}


/// explore org
@immutable
abstract class ExploreOrgEvent extends ExploreEvent {
  const ExploreOrgEvent();
}
class ExploreOrgEventStoreOrgsData extends ExploreOrgEvent {
  const ExploreOrgEventStoreOrgsData();
}
class ExploreOrgEventLogin extends ExploreOrgEvent {
  final StoreOrg org;
  const ExploreOrgEventLogin({required this.org});
}
class ExploreOrgEventLoginCancel extends StoreBlocEvent {
  const ExploreOrgEventLoginCancel();
}


/// explore event
@immutable
abstract class ExploreEventEvent extends ExploreEvent {
  const ExploreEventEvent();
}
class ExploreEventEventStoreEventsData extends ExploreEventEvent {
  const ExploreEventEventStoreEventsData();
}
class ExploreEventEventLogin extends ExploreEventEvent {
  final StoreEvent event;
  const ExploreEventEventLogin({required this.event});
}
class ExploreEventEventLoginCancel extends ExploreEventEvent {
  const ExploreEventEventLoginCancel();
}


/// explore topic
@immutable
abstract class ExploreTopicEvent extends ExploreEvent {
  const ExploreTopicEvent();
}
class ExploreTopicEventStoreTopicsData extends ExploreEventEvent {
  const ExploreTopicEventStoreTopicsData();
}
