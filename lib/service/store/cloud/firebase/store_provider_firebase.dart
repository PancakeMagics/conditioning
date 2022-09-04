import 'package:conditioning/service/store/cloud/firebase/cloud_store_event.dart';
import 'package:conditioning/service/store/entities/topic.dart';

import '../../entities/event.dart';
import '../../entities/org.dart';
import '../../entities/user.dart';

class StoreProviderFirebase extends CloudStoreEvent {
  const StoreProviderFirebase._sharedInstance({
    required super.userList,
    required super.orgList,
    required super.eventList,
    required super.topicList,
  });

  factory StoreProviderFirebase() => _shared;
  static final StoreProviderFirebase _shared =
      StoreProviderFirebase._sharedInstance(
    //TODO:
    userList: List<User>.generate(
        10,
        (index) => User(
            id: '$index',
            name: 'userName of $index',
            email: '',
            registerNotVerified: false)),
    orgList: List<Org>.generate(
        50, (index) => Org(id: '$index', name: 'orgName of $index')),
    eventList: List<Event>.generate(
        10, (index) => Event(id: '$index', name: 'eventName of $index')),
    topicList: List<Topic>.generate(
        10, (index) => Topic(name: 'topicName of $index', userList: [], orgList: [], eventList: [])),
  );

  @override
  Future<void> initialize() {
    //TODO:
    return Future(() => null);
  }
}
