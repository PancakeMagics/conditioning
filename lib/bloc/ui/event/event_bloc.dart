import 'package:conditioning/bloc/services/store/events/store_events_bloc.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/store/entities/event.dart';
import 'package:conditioning/service/store/store_provider.dart';
import 'package:flutter/material.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc<S extends EventState> extends StoreEventsBloc<S> {
  EventBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
    on<EventEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
