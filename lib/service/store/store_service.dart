import 'package:conditioning/service/store/cloud/firebase/store_provider_firebase.dart';
import 'package:conditioning/service/store/store_provider.dart';

import 'entities/event.dart';
import 'entities/org.dart';
import 'entities/user.dart';

class StoreService implements StoreProvider {
  final StoreProvider _storeProvider;

  const StoreService(this._storeProvider);

  factory StoreService.fromFirebase() => StoreService(StoreProviderFirebase());

  @override
  Future<void> initialize() => _storeProvider.initialize();

  @override
  List<Event> get eventList => _storeProvider.eventList;

  @override
  List<Org> get orgList => _storeProvider.orgList;

  @override
  List<User> get userList => _storeProvider.userList;

  @override
  Future<Event> createOrGetExistEvent({required String eventId}) =>
      _storeProvider.createOrGetExistEvent(eventId: eventId);

  @override
  Future<Org> createOrGetExistOrg({required String orgId}) =>
      _storeProvider.createOrGetExistOrg(orgId: orgId);

  @override
  Future<User> createOrGetExistUser({required String userId}) =>
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
  Future<Iterable<Event>> getPublicEvents() => _storeProvider.getPublicEvents();

  @override
  Future<Iterable<Org>> getPublicOrgs() => _storeProvider.getPublicOrgs();

  @override
  Future<Iterable<User>> getPublicUsers() => _storeProvider.getPublicUsers();

  @override
  Future<Iterable<Event>> getUserEvents({required String eventId}) =>
      _storeProvider.getUserEvents(eventId: eventId);

  @override
  Future<Iterable<User>> getUserFriends({required String userId}) =>
      _storeProvider.getUserFriends(userId: userId);

  @override
  Future<Iterable<Org>> getUserOrgs({required String orgId}) =>
      _storeProvider.getUserOrgs(orgId: orgId);

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
