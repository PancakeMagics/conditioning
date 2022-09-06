
import 'package:conditioning/bloc/services/store/events/store_events_bloc.dart';
import 'package:conditioning/bloc/services/store/orgs/store_orgs_bloc.dart';
import 'package:conditioning/bloc/services/store/store_bloc.dart';
import 'package:conditioning/bloc/services/store/topics/store_topics_bloc.dart';
import 'package:conditioning/bloc/services/store/users/store_users_bloc.dart';
import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/store/entities/providers/store_event_provider.dart';
import 'package:conditioning/service/store/entities/providers/store_org_provider.dart';
import 'package:conditioning/service/store/entities/providers/store_topic_provider.dart';
import 'package:conditioning/service/store/entities/providers/store_user_provider.dart';
import 'package:conditioning/service/store/entities/store_event.dart';
import 'package:conditioning/service/store/entities/store_org.dart';
import 'package:conditioning/service/store/entities/store_user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class AppExploreUserBloc extends StoreUsersBloc {
  AppExploreUserBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
    required StoreUserProvider storeProvider,
  }) : super(prefs: prefs, authProvider: authProvider, storeProvider: storeProvider) {
    on<ExploreUserEventAddFriend>((event, emit) async {
      emit(ExploreUserStateAddFriend(user: event.user, isLoading: false));
    });
    on<ExploreUserEventStoreUsersData>((event, emit) async {
      //TODO:
    });
  }
}

class AppExploreOrgBloc extends StoreOrgBloc {
  AppExploreOrgBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
    required StoreOrgProvider storeProvider,
  }) : super(prefs: prefs, authProvider: authProvider, storeProvider: storeProvider) {
    on<ExploreOrgEventLogin>((event, emit) async {
      emit(ExploreOrgStateLogin(org: event.org, isLoading: false));
    });
    on<ExploreOrgEventLoginCancel>((event, emit) async {
      emit(const ExploreOrgStateLoginCancel(isLoading: false));
    });

    on<ExploreOrgEventStoreOrgsData>((event, emit) async {
      //TODO:
    });
  }
}

class AppExploreEventsBloc extends StoreEventsBloc {
  AppExploreEventsBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
    required StoreEventProvider storeProvider,
  }) : super(prefs: prefs, authProvider: authProvider, storeProvider: storeProvider) {
    on<ExploreEventEventLogin>((event, emit) async {
      emit(ExploreEventStateLogin(event: event.event, isLoading: false));
    });

    on<ExploreEventEventStoreEventsData>((event, emit) async {
      //TODO:
    });
  }
}

class AppExploreTopicsBloc extends StoreEventsBloc {
  AppExploreTopicsBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
    required StoreTopicProvider storeProvider,
  }) : super(prefs: prefs, authProvider: authProvider, storeProvider: storeProvider) {
    on<ExploreEventEventLogin>((event, emit) async {
      emit(ExploreEventStateLogin(event: event.event, isLoading: false));
    });

    on<ExploreTopicEventStoreTopicsData>((event, emit) async {
      //TODO:
    });
  }
}