part of 'explore_bloc.dart';

enum ExploreViewOption {
  user,
  org,
  event,
  topic,
}

class ExploreStateUser extends StoreUsersState {
  const ExploreStateUser({
    required super.userList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class ExploreStateOrg extends StoreOrgsState {
  const ExploreStateOrg({
    required super.orgList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class ExploreStateEvent extends StoreEventsState {
  const ExploreStateEvent({
    required super.eventList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class ExploreStateUserDetail extends ExploreStateUser {
  final PesItem<User> user;

  const ExploreStateUserDetail(
      {required this.user,
      required super.isLoading,
      super.loadingText,
      super.exception})
      : super(userList: null);
}

class ExploreStateOrgDetail extends ExploreStateOrg {
  final PesItem<Org> org;

  const ExploreStateOrgDetail({
    required this.org,
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(orgList: null);
}

class ExploreStateEventDetail extends ExploreStateEvent {
  final PesItem<Event> event;

  const ExploreStateEventDetail({
    required this.event,
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(eventList: null);
}


// TODO:
// class ExploreStateTopic extends StoreState {
//   const ExploreStateTopic({
//     required super.eventList,
//     required super.isLoading,
//     super.loadingText,
//     super.exception,
//   });
// }
