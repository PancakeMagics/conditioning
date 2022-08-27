
import 'package:conditioning/service/store/cloud/firebase/cloud_store_org.dart';
import '../../entities/event.dart';

abstract class CloudStoreEvent extends CloudStoreOrg {//i think inheritance make code readable
  const CloudStoreEvent({required super.userList, required super.orgList, required super.eventList,});
  //TODO: implement firebase

  @override
  Future<Event> createOrGetExistEvent({required String eventId}) {
    return Future(() => const Event(eventId: 'cge id', eventName: 'cge name'));
  }

  @override
  Future<Iterable<Event>> getPublicEvents() {
    return Future(() => [const Event(eventId: 'gpe id', eventName: 'gpe name')]);
  }

  @override
  Future<Iterable<Event>> getUserEvents({required String eventId}) {
    return Future(() => [const Event(eventId: 'gue id', eventName: 'gue name')]);
  }

  @override
  Future<void> updateEventName({required String eventId, required String newName}) {
    return Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> deleteEvent({required String eventId}) {
    return Future.delayed(const Duration(milliseconds: 500));
  }
}