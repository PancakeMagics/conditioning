
import 'package:conditioning/bloc/services/store/events/store_events_bloc.dart';
import 'package:conditioning/bloc/services/store/orgs/store_orgs_bloc.dart';
import 'package:conditioning/bloc/services/store/store_bloc.dart';
import 'package:conditioning/bloc/services/store/topics/store_topics_bloc.dart';
import 'package:conditioning/bloc/services/store/users/store_users_bloc.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/store/entities/event.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/store/entities/user.dart';
import 'package:conditioning/service/store/store_provider.dart';
import 'package:conditioning/ui/animations/pespen/pes_pen.dart';
import 'package:flutter/material.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class AppExploreUsersBloc extends StoreUsersBloc {
  AppExploreUsersBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
    on<ExploreUserEventAddFriend>((event, emit) async {
      emit(ExploreUserStateAddFriend(user: event.user, isLoading: false));
    });
    on<ExploreUserEventStoreUsersData>((event, emit) async {
      //TODO:
    });
  }
}

class AppExploreOrgsBloc extends StoreOrgsBloc {
  AppExploreOrgsBloc({
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
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
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
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
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(authProvider: authProvider, storeProvider: storeProvider) {
    on<ExploreEventEventLogin>((event, emit) async {
      emit(ExploreEventStateLogin(event: event.event, isLoading: false));
    });

    on<ExploreTopicEventStoreTopicsData>((event, emit) async {
      //TODO:
    });
  }
}