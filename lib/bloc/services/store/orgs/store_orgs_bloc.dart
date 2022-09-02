import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/store/store_provider.dart';
import 'package:flutter/material.dart';

import '../store_bloc.dart';

part 'store_orgs_event.dart';
part 'store_orgs_state.dart';

abstract class StoreOrgsBloc<S extends StoreOrgsState> extends StoreBloc<S> {
  final Set<Org> orgSet = <Org>{};

  StoreOrgsBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
    on<StoreOrgsEventFilterByLocation>((event, emit) async {
      // TODO: implement

      emit(StoreOrgsStateRelativeStore(isLoading: false, orgList: orgSet.toList()) as S);
    });
    on<StoreOrgsEventFilterByText>((event, emit) async {
      // TODO: implement
      emit(StoreOrgsStateRelativeStore(isLoading: false, orgList: orgSet.toList()) as S);
    });

    on<StoreOrgsEventRestore>((event, emit) async {
      // TODO: implement if there is some register yet orgs

      orgSet.addAll(await storeProvider.getPublicOrgs());
      emit(StoreOrgsStateRelativeStore(isLoading: false, orgList: orgSet.toList()) as S);
    });
  }
}