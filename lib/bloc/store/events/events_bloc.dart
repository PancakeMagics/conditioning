import 'package:conditioning/bloc/store/store_bloc.dart';
import 'package:conditioning/service/store/store_provider.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends StoreBloc {
  EventsBloc({required StoreProvider storeProvider}) : super(storeProvider: storeProvider) {
    on<EventsStoreEventInitialize>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
