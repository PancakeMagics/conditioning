import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'event_user_event.dart';
part 'event_user_state.dart';

class EventUserBloc extends Bloc<EventUserEvent, EventUserState> {
  EventUserBloc() : super(EventUserInitial()) {
    on<EventUserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
