import 'package:conditioning/bloc/services/store/orgs/store_orgs_bloc.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/store/store_provider.dart';
import 'package:flutter/material.dart';

part 'org_event.dart';
part 'org_state.dart';

class OrgBloc<S extends OrgState> extends StoreOrgsBloc<S> {
  late Org org;

  OrgBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
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
    on<OrgEventStoreTeamScreenData>((event, emit) async {
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
    on<OrgEventHomeToTeam>((event, emit) async {
      emit(OrgNavigationStateHomeToTeam(isLoading: false, org: org) as S);
    });
    on<OrgEventHomeToDocumention>((event, emit) async {
      emit(OrgNavigationStateHomeToDocumention(isLoading: false, org: org) as S);
    });
    on<OrgEventTeamToDocumention>((event, emit) async {
      emit(OrgNavigationStateTeamToDocumention(isLoading: false, org: org) as S);
    });
    on<OrgEventDocumentionToTeam>((event, emit) async {
      emit(OrgNavigationStateDocumentionToTeam(isLoading: false, org: org) as S);
    });
    on<OrgEventDocumentionToHome>((event, emit) async {
      emit(OrgNavigationStateDocumentionToHome(isLoading: false, org: org) as S);
    });
    on<OrgEventTeamToHome>((event, emit) async {
      emit(OrgNavigationStateTeamToHome(isLoading: false, org: org) as S);
    });
  }
}
