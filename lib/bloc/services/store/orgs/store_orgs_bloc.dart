import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/store/entities/providers/store_org_provider.dart';
import 'package:conditioning/service/store/entities/store_org.dart';
import 'package:conditioning/service/store/entities/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../store_bloc.dart';

part 'store_orgs_event.dart';
part 'store_orgs_state.dart';

abstract class StoreOrgBloc<S extends StoreOrgsState> extends StoreBloc<S> {
  final Set<StoreOrg> orgSet = <StoreOrg>{};

  StoreOrgBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
    required StoreOrgProvider storeProvider,
  }) : super(prefs: prefs, authProvider: authProvider, storeProvider: storeProvider) {
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