
import 'entities/store.dart';

abstract class StoreProvider {
  final store;
  const StoreProvider({required this.store});

  Future<StoreUser> createOrGetExistUser({required String userId});
  Future<Iterable<StoreUser>> getPublicUsers();
  Future<Iterable<StoreUser>> getUserFriends({required String userId});
  Future<void> updateUserName({required String userId, required String newName});
  Future<void> deleteUser({required String userId});

  Future<StoreOrg> createOrGetExistOrg({required String orgId});
  Future<Iterable<StoreOrg>> getPublicOrgs();
  Future<Iterable<StoreOrg>> getUserOrgs({required String orgId});
  Future<void> updateOrgName({required String orgId, required String newName});
  Future<void> deleteOrg({required String orgId});

  Future<StoreEvent> createOrGetExistEvent({required String eventId});
  Future<Iterable<StoreEvent>> getPublicEvents();
  Future<Iterable<StoreEvent>> getUserEvents({required String eventId});
  Future<void> updateEventName({required String eventId, required String newName});
  Future<void> deleteEvent({required String eventId});
}