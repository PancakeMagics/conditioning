part of 'store_events_bloc.dart';

@immutable
abstract class StoreEventsState extends StoreBlocState {
  final List<StoreBlocEvent>? eventList;
  const StoreEventsState({
    required this.eventList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class StoreEventsStateAllStore extends StoreEventsState {
  const StoreEventsStateAllStore({
    required super.eventList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class StoreEventsStateRelativeStore extends StoreEventsState {
  const StoreEventsStateRelativeStore({
    required super.eventList,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
