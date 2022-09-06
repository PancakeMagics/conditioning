import 'package:conditioning/bloc/services/store/events/store_events_bloc.dart';
import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/store/entities/store_event.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../service/store/entities/providers/store_event_provider.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc<S extends EventState> extends StoreEventsBloc<S> {
  EventBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
    required StoreEventProvider storeProvider,
  }) : super(prefs: prefs, authProvider: authProvider, storeProvider: storeProvider) {
    on<EventEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
