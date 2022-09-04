part of 'explore_bloc.dart';

enum ExploreViewOption {
  user,
  org,
  event,
  topic,
}

/// explore user

@immutable
abstract class ExploreUserState extends StoreUsersState {
  const ExploreUserState({
    required super.userList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class ExploreUserStateAddFriend extends ExploreUserState {
  final User user;

  const ExploreUserStateAddFriend(
      {required this.user,
      required super.isLoading,
      super.loadingText,
      super.exception})
      : super(userList: null);
}

/// explore org
@immutable
abstract class ExploreOrgStateOrg extends StoreOrgsState {
  const ExploreOrgStateOrg({
    required super.orgList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class ExploreOrgStateLogin extends ExploreOrgStateOrg {
  final Org org;

  const ExploreOrgStateLogin({
    required this.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(orgList: null);
}

class ExploreOrgStateLoginCancel extends ExploreOrgStateOrg {
  const ExploreOrgStateLoginCancel({
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(orgList: null);
}


/// explore event
@immutable
class ExploreEventState extends StoreEventsState {
  const ExploreEventState({
    required super.eventList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class ExploreEventStateLogin extends ExploreEventState {
  final Event event;

  const ExploreEventStateLogin({
    required this.event,
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(eventList: null);
}

/// explore topic
@immutable
abstract class ExploreStateTopic extends StoreTopicsState {
  const ExploreStateTopic({
    required super.topicList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
