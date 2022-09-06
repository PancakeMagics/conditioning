import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/store/entities/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../store_bloc.dart';

part 'store_events_event.dart';
part 'store_events_state.dart';

abstract class StoreEventsBloc<S extends StoreEventsState> extends StoreBloc<S> {
  final Set<StoreBlocEvent> eventSet = <StoreBlocEvent>{};

  StoreEventsBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(prefs: prefs, authProvider: authProvider, storeProvider: storeProvider) {
    on<StoreEventsBlocEventFilterByLocation>((event, emit) async {
      // TODO: implement

      emit(StoreEventsStateRelativeStore(isLoading: false, eventList: eventSet.toList()) as S);
    });
    on<StoreEventsBlocEventFilterByText>((event, emit) async {
      // TODO: implement
      emit(StoreEventsStateRelativeStore(isLoading: false, eventList: eventSet.toList()) as S);
    });

    on<StoreEventsBlocEventRestore>((event, emit) async {
      // TODO: implement if user have some groupEvents

      // eventSet.addAll(await storeProvider.getPublicEvents());
      emit(StoreEventsStateRelativeStore(isLoading: false, eventList: eventSet.toList()) as S);
    });
  }
}
