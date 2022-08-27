
import 'package:conditioning/service/store/cloud/firebase/cloud_store_event.dart';

import '../../entities/event.dart';
import '../../entities/org.dart';
import '../../entities/user.dart';

class StoreProviderFirebase extends CloudStoreEvent {
  const StoreProviderFirebase._sharedInstance({required super.userList, required super.orgList, required super.eventList,});
  factory StoreProviderFirebase() => _shared;
  static final StoreProviderFirebase _shared = StoreProviderFirebase._sharedInstance(
    //TODO
    userList: List<User>.generate(10, (index) => User(userId: '$index', userName: 'userName of $index')),
    orgList: List<Org>.generate(50, (index) => Org(orgId: '$index', orgName: 'orgName of $index')),
    eventList: List<Event>.generate(10, (index) => Event(eventId: '$index', eventName: 'eventName of $index')),
  );
}
