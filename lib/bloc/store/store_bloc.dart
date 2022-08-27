import 'package:bloc/bloc.dart';
import 'package:conditioning/service/store/store_provider.dart';
import 'package:flutter/material.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc({required StoreProvider storeProvider}) : super(const StoreStateInitialYet()) {
    on<StoreEventInitialize>((event, emit) {
      emit(const StoreStateInitialed());
    });
  }
}
