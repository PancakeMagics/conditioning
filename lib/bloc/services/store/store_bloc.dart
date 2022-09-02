import 'package:conditioning/bloc/services/auth/app/auth_app_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_event.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/store/store_provider.dart';
import 'package:flutter/material.dart';

part 'store_event.dart';

part 'store_state.dart';

class StoreBloc<S extends StoreState> extends AuthAppBloc<S> {
  StoreBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider) {
    on<StoreEventInitialize>((event, emit) async {
      await storeProvider.initialize();
    });
  }
}
