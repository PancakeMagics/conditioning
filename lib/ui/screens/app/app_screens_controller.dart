import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/store/utils/animation_durations.dart';
import 'package:conditioning/service/utils/constants/option_explore_view.dart';
import 'package:conditioning/ui/elements/_generics/loading/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'explore/screen_explore.dart';
import 'friends/screen_friends.dart';
import 'home/screen_home.dart';

class AppScreensController extends StatefulWidget {
  const AppScreensController({Key? key}) : super(key: key);

  @override
  State<AppScreensController> createState() => _AppScreensControllerState();
}

class _AppScreensControllerState extends State<AppScreensController> {
  ExploreViewOption _exploreViewOption = ExploreViewOption.org;
  late Offset _homeOffset;
  late Offset _friendOffset;
  late Offset _exploreOffset;

  @override
  void initState() {
    _friendOffset = const Offset(-1.0, 0.0);
    _homeOffset = Offset.zero;
    _exploreOffset = const Offset(1.0, 0.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_homeOffset == Offset.zero) {
      context.read<AppBloc>().add(const AppEventStoreHomeScreenData());
    } else if (_friendOffset == Offset.zero) {
      context.read<AppBloc>().add(const AppEventStoreFriendScreenData());
    }

    return BlocListener<AppBloc, AuthState>(
      listener: (context, state) {
        if (state is AppStateDataStore) {
          loadingListener(context, state);
        } else if (state is AppNavigationState) {
          setState(() {
            if (state is AppNavigationStateHomeToExplore) {
              _exploreViewOption = state.option;
              _exploreOffset = Offset.zero;
              _homeOffset = const Offset(-1.0, 0.0);
              _friendOffset = const Offset(-2.0, 0.0);
            } else if (state is AppNavigationStateHomeToFriend) {
              _friendOffset = Offset.zero;
              _homeOffset = const Offset(1.0, 0.0);
              _exploreOffset = const Offset(2.0, 0.0);
            } else if (state is AppNavigationStateFriendToHome) {
              _homeOffset = Offset.zero;
              _friendOffset = const Offset(-1.0, 0.0);
              _exploreOffset = const Offset(1.0, 0.0);
            } else if (state is AppNavigationStateFriendToExplore) {
              _exploreViewOption = state.option;
              _exploreOffset = Offset.zero;
              _homeOffset = const Offset(-1.0, 0.0);
              _friendOffset = const Offset(-2.0, 0.0);
            } else if (state is AppNavigationStateExploreToFriend) {
              _friendOffset = Offset.zero;
              _homeOffset = const Offset(1.0, 0.0);
              _exploreOffset = const Offset(2.0, 0.0);
            } else if (state is AppNavigationStateExploreToHome) {
              _homeOffset = Offset.zero;
              _friendOffset = const Offset(-1.0, 0.0);
              _exploreOffset = const Offset(1.0, 0.0);
            }
          });
        }
      },
      child: Stack(
        children: [
          AnimatedSlide(
            offset: _friendOffset,
            duration: shortDuration,
            child: const AppFriendsScreen(),
          ),
          AnimatedSlide(
            offset: _homeOffset,
            duration: shortDuration,
            child: const AppHomeScreen(),
          ),
          AnimatedSlide(
            offset: _exploreOffset,
            duration: shortDuration,
            child: AppExploreScreen(viewOption: _exploreViewOption),
          ),
        ],
      ),
    );
  }
}
