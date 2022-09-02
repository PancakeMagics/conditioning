import 'package:flutter/material.dart';
import 'entities/event.dart';
import 'entities/org.dart';
import 'entities/user.dart';

@immutable
abstract class StoreProvider {
  Future<void> initialize();

  final List<User> userList;
  final List<Org> orgList;
  final List<Event> eventList;
  const StoreProvider({required this.userList, required this.orgList, required this.eventList});

  Future<User> createOrGetExistUser({required String userId});
  Future<Iterable<User>> getPublicUsers();
  Future<Iterable<User>> getUserFriends({required String userId});
  Future<void> updateUserName({required String userId, required String newName});
  Future<void> deleteUser({required String userId});

  Future<Org> createOrGetExistOrg({required String orgId});
  Future<Iterable<Org>> getPublicOrgs();
  Future<Iterable<Org>> getUserOrgs({required String orgId});
  Future<void> updateOrgName({required String orgId, required String newName});
  Future<void> deleteOrg({required String orgId});

  Future<Event> createOrGetExistEvent({required String eventId});
  Future<Iterable<Event>> getPublicEvents();
  Future<Iterable<Event>> getUserEvents({required String eventId});
  Future<void> updateEventName({required String eventId, required String newName});
  Future<void> deleteEvent({required String eventId});
}