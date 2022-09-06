import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/store/entities/store_topic.dart';
import 'package:conditioning/service/store/entities/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../store_bloc.dart';

part 'store_topics_event.dart';
part 'store_topics_state.dart';

abstract class StoreTopicsBloc<S extends StoreTopicsState> extends StoreBloc<S> {
  final Set<StoreTopic> topicSet = <StoreTopic>{};

  StoreTopicsBloc({
    required SharedPreferences prefs,
    required AuthProvider authProvider,
    required StoreProvider storeProvider,
  }) : super(prefs: prefs, authProvider: authProvider, storeProvider: storeProvider) {
    on<StoreTopicsEventFilterByLocation>((event, emit) async {
      // TODO: implement

      emit(StoreTopicsStateRelativeStore(isLoading: false, topicList: topicSet.toList()) as S);
    });
    on<StoreTopicsEventFilterByText>((event, emit) async {
      // TODO: implement
      emit(StoreTopicsStateRelativeStore(isLoading: false, topicList: topicSet.toList()) as S);
    });

    on<StoreTopicsEventRestore>((event, emit) async {
      // TODO: implement if user have some interest topic
      // TODO: implement topic in storeProvider
      // topicSet.addAll(await storeProvider.getPublicEvents());

      emit(StoreTopicsStateRelativeStore(isLoading: false, topicList: topicSet.toList()) as S);
    });
  }
}
