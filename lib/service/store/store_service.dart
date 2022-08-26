import 'package:conditioning/service/store/cloud/firebase/store_provider_firebase.dart';
import 'package:conditioning/service/store/entities/store.dart';
import 'package:conditioning/service/store/store_provider.dart';

class StoreService implements StoreProvider {
  final StoreProvider _storeProvider;

  const StoreService(this._storeProvider);

  factory StoreService.fromCloudFirebase() =>
      StoreService(StoreProviderFirebase());

  @override
  Future<StoreEvent> createOrGetExistEvent({required String eventId}) =>
      _storeProvider.createOrGetExistEvent(eventId: eventId);

  @override
  Future<StoreOrg> createOrGetExistOrg({required String orgId}) =>
      _storeProvider.createOrGetExistOrg(orgId: orgId);

  @override
  Future<StoreUser> createOrGetExistUser({required String userId}) =>
      _storeProvider.createOrGetExistUser(userId: userId);

  @override
  Future<void> deleteEvent({required String eventId}) =>
      _storeProvider.deleteEvent(eventId: eventId);

  @override
  Future<void> deleteOrg({required String orgId}) =>
      _storeProvider.deleteOrg(orgId: orgId);

  @override
  Future<void> deleteUser({required String userId}) =>
      _storeProvider.deleteUser(userId: userId);

  @override
  Future<Iterable<StoreEvent>> getPublicEvents() =>
      _storeProvider.getPublicEvents();

  @override
  Future<Iterable<StoreOrg>> getPublicOrgs() => _storeProvider.getPublicOrgs();

  @override
  Future<Iterable<StoreUser>> getPublicUsers() =>
      _storeProvider.getPublicUsers();

  @override
  Future<Iterable<StoreEvent>> getUserEvents({required String eventId}) =>
      _storeProvider.getUserEvents(eventId: eventId);

  @override
  Future<Iterable<StoreUser>> getUserFriends({required String userId}) =>
      _storeProvider.getUserFriends(userId: userId);

  @override
  Future<Iterable<StoreOrg>> getUserOrgs({required String orgId}) =>
      _storeProvider.getUserOrgs(orgId: orgId);

  @override
  // TODO: implement store
  get store => _storeProvider.store;

  @override
  Future<void> updateEventName(
          {required String eventId, required String newName}) =>
      _storeProvider.updateEventName(eventId: eventId, newName: newName);

  @override
  Future<void> updateOrgName(
          {required String orgId, required String newName}) =>
      _storeProvider.updateOrgName(orgId: orgId, newName: newName);

  @override
  Future<void> updateUserName(
          {required String userId, required String newName}) =>
      _storeProvider.updateUserName(userId: userId, newName: newName);
}
