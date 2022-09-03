part of 'store_topics_bloc.dart';

@immutable
abstract class StoreTopicsEvent extends StoreEvent {
  const StoreTopicsEvent();
}

class StoreTopicsEventFilterByLocation extends StoreTopicsEvent {
  const StoreTopicsEventFilterByLocation();
}

class StoreTopicsEventFilterByText extends StoreTopicsEvent {
  final String searchingText;
  const StoreTopicsEventFilterByText({required this.searchingText});
}

class StoreTopicsEventRestore extends StoreTopicsEvent {
  const StoreTopicsEventRestore();
}
