import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/store/entities/event.dart';
import 'package:conditioning/service/store/store_provider.dart';
import 'package:flutter/material.dart';

import '../store_bloc.dart';

part 'store_events_event.dart';
part 'store_events_state.dart';

abstract class StoreEventsBloc<S extends StoreEventsState> extends StoreBloc<S> {
  final Set<Event> eventSet = <Event>{};

  StoreEventsBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
    on<StoreEventsEventFilterByLocation>((event, emit) async {
      // TODO: implement

      emit(StoreEventsStateRelativeStore(isLoading: false, eventList: eventSet.toList()) as S);
    });
    on<StoreEventsEventFilterByText>((event, emit) async {
      // TODO: implement
      emit(StoreEventsStateRelativeStore(isLoading: false, eventList: eventSet.toList()) as S);
    });

    on<StoreEventsEventRestore>((event, emit) async {
      // TODO: implement if user have some groupEvents

      eventSet.addAll(await storeProvider.getPublicEvents());
      emit(StoreEventsStateRelativeStore(isLoading: false, eventList: eventSet.toList()) as S);
    });
  }
}
