import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/animations/navigation/my_animated_slide.dart';
import 'package:conditioning/ui/animations/pespen/pes_pen.dart';
import 'package:conditioning/ui/animations/searchingbar/appbar_searching.dart';
import 'package:conditioning/ui/screens/app/explore/explore_views_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreViewsProvider extends StatelessWidget {
  const ExploreViewsProvider({Key? key, required this.viewOption}) : super(key: key);
  final ExploreViewOption viewOption;

  @override
  Widget build(BuildContext context) {
    final authProvider = AuthService.fromFirebase();
    final storeProvider = StoreService.fromFirebase();

    switch (viewOption) {
      case ExploreViewOption.user:
        return BlocProvider<ExploreUsersBloc>(
          create: (context) => ExploreUsersBloc(authProvider: authProvider, storeProvider: storeProvider),
          child: const ExploreViewsController(viewOption: ExploreViewOption.user),
        );
      case ExploreViewOption.org:
        return BlocProvider<ExploreOrgsBloc>(
          create: (context) => ExploreOrgsBloc(authProvider: authProvider, storeProvider: storeProvider),
          child: const ExploreViewsController(viewOption: ExploreViewOption.org),
        );
      case ExploreViewOption.event:
        return BlocProvider<ExploreEventsBloc>(
          create: (context) => ExploreEventsBloc(authProvider: authProvider, storeProvider: storeProvider),
          child: const ExploreViewsController(viewOption: ExploreViewOption.event),
        );
      case ExploreViewOption.topic:
        return BlocProvider<ExploreTopicsBloc>(
          create: (context) => ExploreTopicsBloc(authProvider: authProvider, storeProvider: storeProvider),
          child: const ExploreViewsController(viewOption: ExploreViewOption.topic),
        );
    }
  }
}
