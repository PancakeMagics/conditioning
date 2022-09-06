import 'package:flutter/material.dart' show immutable;
import '../store_event.dart';
import 'provider.dart';

@immutable
abstract class StoreEventProvider extends StoreProvider {
  abstract final List<StoreEvent> eventList;
  const StoreEventProvider();

  Future<StoreEvent> createOrGetExistEvent({required String eventId});
  Future<Iterable<StoreEvent>> getPublicEvents();
  Future<Iterable<StoreEvent>> getUserEvents({required String eventId});
  Future<void> updateEventName({required String eventId, required String newName});
  Future<void> deleteEvent({required String eventId});
}