import 'package:conditioning/bloc/services/store/orgs/store_orgs_bloc.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/store/store_provider.dart';
import 'package:flutter/material.dart';

part 'org_event.dart';
part 'org_state.dart';

class OrgBloc<S extends OrgState> extends StoreOrgsBloc<S> {
  OrgBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
    on<OrgEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
