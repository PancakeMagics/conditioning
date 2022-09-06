part of 'store_orgs_bloc.dart';

@immutable
abstract class StoreOrgsEvent extends StoreBlocEvent {
  const StoreOrgsEvent();
}

class StoreOrgsEventFilterByLocation extends StoreBlocEvent {
  const StoreOrgsEventFilterByLocation();
}

class StoreOrgsEventFilterByText extends StoreBlocEvent {
  final String searchingText;
  const StoreOrgsEventFilterByText({required this.searchingText,});
}

class StoreOrgsEventRestore extends StoreBlocEvent {
  const StoreOrgsEventRestore();
}