import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/screens/app/explore/views/view_explore_event.dart';
import 'package:conditioning/ui/screens/app/explore/views/view_explore_org.dart';
import 'package:conditioning/ui/screens/app/explore/views/view_explore_topic.dart';
import 'package:conditioning/ui/screens/app/explore/views/view_explore_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppExploreScreen extends StatelessWidget {
  const AppExploreScreen({Key? key, required this.viewOption}) : super(key: key);
  final ExploreViewOption viewOption;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _getViewWithProvider(),
      ],
    );
  }

  Widget _getViewWithProvider() {
    final authProvider = AuthService.fromFirebase();
    final storeProvider = StoreService.fromFirebase();

    switch (viewOption) {
      case ExploreViewOption.user:
        return BlocProvider<AppExploreUsersBloc>(
          create: (context) => AppExploreUsersBloc(
              authProvider: authProvider, storeProvider: storeProvider),
          child: ExploreUserView(userList: storeProvider.userList),
        );
      case ExploreViewOption.org:
        return BlocProvider<AppExploreOrgsBloc>(
          create: (context) => AppExploreOrgsBloc(
              authProvider: authProvider, storeProvider: storeProvider),
          child: ExploreOrgView(orgList: storeProvider.orgList),
        );
      case ExploreViewOption.event:
        return BlocProvider<AppExploreEventsBloc>(
          create: (context) => AppExploreEventsBloc(
              authProvider: authProvider, storeProvider: storeProvider),
          child: ExploreEventView(eventList: storeProvider.eventList),
        );
      case ExploreViewOption.topic:
        return BlocProvider<AppExploreTopicsBloc>(
          create: (context) => AppExploreTopicsBloc(
              authProvider: authProvider, storeProvider: storeProvider),
          child: ExploreTopicView(topicList: storeProvider.topicList),
        );
    }
  }
}
