import '../../../store_event.dart';
import '../../store_event_provider.dart';

class StoreEventProviderFirestore extends StoreEventProvider {
  const StoreEventProviderFirestore._sharedInstance();
  factory StoreEventProviderFirestore() => _shared;
  static const StoreEventProviderFirestore _shared = StoreEventProviderFirestore._sharedInstance();

  //TODO: implement firebase
  @override
  Future<void> initialize() => Future(() => null);

  @override
  List<StoreEvent> get eventList => List<StoreEvent>.generate(
      10, (index) => StoreEvent(id: '$index', name: 'eventName of $index'));

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