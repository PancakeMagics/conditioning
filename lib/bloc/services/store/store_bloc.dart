import 'package:conditioning/bloc/services/auth/app/auth_app_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_event.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/store/entities/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'store_event.dart';

part 'store_state.dart';

class StoreBloc<S extends StoreBlocState> extends AuthAppBloc<S> {
  StoreBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(prefs: prefs, authProvider: authProvider) {
    on<StoreBlocEventInitialize>((event, emit) async {
      await storeProvider.initialize();
    });
  }
}
