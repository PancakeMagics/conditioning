part of 'store_events_bloc.dart';

@immutable
abstract class StoreEventsEvent extends StoreEvent {
  const StoreEventsEvent();
}

class StoreEventsEventFilterByLocation extends StoreEventsEvent {
  const StoreEventsEventFilterByLocation();
}

class StoreEventsEventFilterByText extends StoreEventsEvent {
  final String searchingText;
  const StoreEventsEventFilterByText({required this.searchingText,});
}

class StoreEventsEventRestore extends StoreEventsEvent {
  const StoreEventsEventRestore();
}
