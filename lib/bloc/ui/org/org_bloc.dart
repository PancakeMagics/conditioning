import 'package:conditioning/bloc/services/store/orgs/store_orgs_bloc.dart';
import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/store/entities/providers/store_org_provider.dart';
import 'package:conditioning/service/store/entities/store_org.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'org_event.dart';
part 'org_state.dart';

class OrgBloc<S extends OrgState> extends StoreOrgBloc<S> {
  late StoreOrg org;

  OrgBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
    required StoreOrgProvider storeProvider,
  }) : super(prefs: prefs, authProvider: authProvider, storeProvider: storeProvider) {
    on<OrgEventStoreHomeScreenData>((event, emit) async {
      //TODO: handle store data, update ui
      try {
        // tempt:
        org = await storeProvider.createOrGetExistOrg(orgId: 'hi');
        emit(OrgStateDataStore(org: org, isLoading: false));
      } on Exception catch(e) {
        // emit(const OrgStateDataStoring(exception: e, isLoading: false));
      }
    });
    on<OrgEventStoreGroupScreenData>((event, emit) async {
      //TODO: handle store data, update ui
      try {
        // tempt:
        org = await storeProvider.createOrGetExistOrg(orgId: 'hi');
        emit(OrgStateDataStore(org: org, isLoading: false));
      } on Exception catch(e) {
        // emit(const OrgStateDataStoring(exception: e, isLoading: false));
      }
    });
    on<OrgEventStoreDocumentionScreenData>((event, emit) async {
      //TODO: handle store data, update ui
      try {
        // tempt:
        org = await storeProvider.createOrGetExistOrg(orgId: 'hi');
        emit(OrgStateDataStore(org: org, isLoading: false));
      } on Exception catch(e) {
        // emit(const OrgStateDataStoring(exception: e, isLoading: false));
      }
    });

    // navigation
    on<OrgEventHomeToGroup>((event, emit) async {
      emit(OrgNavigationStateHomeToGroup(isLoading: false, org: org) as S);
    });
    on<OrgEventHomeToDocumention>((event, emit) async {
      emit(OrgNavigationStateHomeToDocumention(isLoading: false, org: org) as S);
    });
    on<OrgEventGroupToDocumention>((event, emit) async {
      emit(OrgNavigationStateGroupToDocumention(isLoading: false, org: org) as S);
    });
    on<OrgEventDocumentionToGroup>((event, emit) async {
      emit(OrgNavigationStateDocumentionToGroup(isLoading: false, org: org) as S);
    });
    on<OrgEventDocumentionToHome>((event, emit) async {
      emit(OrgNavigationStateDocumentionToHome(isLoading: false, org: org) as S);
    });
    on<OrgEventGroupToHome>((event, emit) async {
      emit(OrgNavigationStateGroupToHome(isLoading: false, org: org) as S);
    });
  }
}
