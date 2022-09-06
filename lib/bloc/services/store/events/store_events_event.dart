part of 'store_events_bloc.dart';

@immutable
abstract class StoreEventsBlocEvent extends StoreBlocEvent {
  const StoreEventsBlocEvent();
}

class StoreEventsBlocEventFilterByLocation extends StoreEventsBlocEvent {
  const StoreEventsBlocEventFilterByLocation();
}

class StoreEventsBlocEventFilterByText extends StoreEventsBlocEvent {
  final String searchingText;
  const StoreEventsBlocEventFilterByText({required this.searchingText,});
}

class StoreEventsBlocEventRestore extends StoreEventsBlocEvent {
  const StoreEventsBlocEventRestore();
}
