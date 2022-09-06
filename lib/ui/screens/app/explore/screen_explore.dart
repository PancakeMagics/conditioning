import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/entities/providers/store_event_provider.dart';
import 'package:conditioning/service/store/entities/providers/store_org_provider.dart';
import 'package:conditioning/service/store/entities/providers/store_topic_provider.dart';
import 'package:conditioning/service/store/entities/providers/store_user_provider.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/service/utils/constants/option_explore_view.dart';
import 'package:conditioning/service/utils/constants/option_store.dart';
import 'package:conditioning/service/store/entities/providers/local/preferences/shared_preference_utils.dart';
import 'package:conditioning/ui/screens/app/explore/views/view_explore_event.dart';
import 'package:conditioning/ui/screens/app/explore/views/view_explore_org.dart';
import 'package:conditioning/ui/screens/app/explore/views/view_explore_topic.dart';
import 'package:conditioning/ui/screens/app/explore/views/view_explore_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppExploreScreen extends StatelessWidget {
  const AppExploreScreen({
    Key? key,
    required this.viewOption,
  }) : super(key: key);
  final ExploreViewOption viewOption;

  @override
  Widget build(BuildContext context) {
    final authProvider = AuthService.fromFirebase();
    final prefs = SharedPreferenceUtils().preferences!;

    switch (viewOption) {
      case ExploreViewOption.user:
        final storeProvider =
            StoreService.getFromFirebase(storeOption: StoreOption.user)
                as StoreUserProvider;
        return BlocProvider<AppExploreUserBloc>(
          create: (context) => AppExploreUserBloc(
              prefs: prefs,
              authProvider: authProvider,
              storeProvider: storeProvider),
          child: ExploreUserView(userList: storeProvider.appUserList),
        );
      case ExploreViewOption.org:
        final storeProvider =
            StoreService.getFromFirebase(storeOption: StoreOption.org)
                as StoreOrgProvider;
        return BlocProvider<AppExploreOrgBloc>(
          create: (context) => AppExploreOrgBloc(
              prefs: prefs,
              authProvider: authProvider,
              storeProvider: storeProvider),
          child: ExploreOrgView(orgList: storeProvider.orgList),
        );
      case ExploreViewOption.event:
        final storeProvider =
            StoreService.getFromFirebase(storeOption: StoreOption.org)
                as StoreEventProvider;
        return BlocProvider<AppExploreEventsBloc>(
          create: (context) => AppExploreEventsBloc(
              prefs: prefs,
              authProvider: authProvider,
              storeProvider: storeProvider),
          child: ExploreEventView(eventList: storeProvider.eventList),
        );
      case ExploreViewOption.topic:
        final storeProvider =
            StoreService.getFromFirebase(storeOption: StoreOption.org)
                as StoreTopicProvider;
        return BlocProvider<AppExploreTopicsBloc>(
          create: (context) => AppExploreTopicsBloc(
              prefs: prefs,
              authProvider: authProvider,
              storeProvider: storeProvider),
          child: ExploreTopicView(topicList: storeProvider.topicList),
        );
    }
  }
}
