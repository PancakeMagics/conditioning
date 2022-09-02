part of 'store_orgs_bloc.dart';

@immutable
abstract class StoreOrgsEvent extends StoreEvent {
  const StoreOrgsEvent();
}

class StoreOrgsEventFilterByLocation extends StoreEvent {
  const StoreOrgsEventFilterByLocation();
}

class StoreOrgsEventFilterByText extends StoreEvent {
  final String searchingText;
  const StoreOrgsEventFilterByText({required this.searchingText,});
}

class StoreOrgsEventRestore extends StoreEvent {
  const StoreOrgsEventRestore();
}