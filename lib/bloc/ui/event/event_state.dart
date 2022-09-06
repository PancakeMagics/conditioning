part of 'event_bloc.dart';

@immutable
abstract class EventState extends StoreEventsState {
  final StoreEvent event;

  const EventState({
    required this.event,
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(eventList: null);
}

class EventStateDataStore extends EventState {
  const EventStateDataStore({
    required super.event,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
