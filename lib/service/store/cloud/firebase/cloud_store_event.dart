
import 'package:conditioning/service/store/cloud/firebase/cloud_store_org.dart';
import 'package:conditioning/service/store/entities/store.dart';

abstract class CloudStoreEvent extends CloudStoreOrg {//i think inheritance make code readable
  const CloudStoreEvent({required super.store});
  //TODO: implement firebase

  @override
  Future<StoreEvent> createOrGetExistEvent({required String eventId}) {
    return Future(() => const StoreEvent(id: 'cge id', name: 'cge name'));
  }

  @override
  Future<Iterable<StoreEvent>> getPublicEvents() {
    return Future(() => [const StoreEvent(id: 'gpe id', name: 'gpe name')]);
  }

  @override
  Future<Iterable<StoreEvent>> getUserEvents({required String eventId}) {
    return Future(() => [const StoreEvent(id: 'gue id', name: 'gue name')]);
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