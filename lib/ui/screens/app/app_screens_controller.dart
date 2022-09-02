import 'dart:developer';

import 'package:conditioning/bloc/bloc_exception.dart';
import 'package:conditioning/bloc/services/auth/auth_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:conditioning/ui/elements/view_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'explore/screen_explore.dart';
import 'friends/screen_friends.dart';
import 'home/screen_home.dart';

class AppScreensController extends StatefulWidget {
  const AppScreensController({
    Key? key,
    required this.isNavIn,
    required this.slideDirection,
  }) : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;

  @override
  State<AppScreensController> createState() => _AppScreensControllerState();
}

class _AppScreensControllerState extends State<AppScreensController> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AuthState>(
      builder: _getBlocConsumerBuilder,
      listener: (context, state) {
        if (state.isLoading) {
          LoadingView().showOverlay(context: context);
        } else {
          LoadingView().hideOverlay();
        }
      },
    );
  }

  Widget _getBlocConsumerBuilder(BuildContext context, AuthState state) =>
      Stack(children: [..._getBlocConsumerBuilderChildren(context, state)]);

  List<Widget> _getBlocConsumerBuilderChildren<S extends AuthState>(BuildContext context, S authState) {
    if (authState is AuthStateInitialYet) {
      context.read<AppBloc>().add(const AppUserEventStoreData());
      return const <Widget>[CircularProgressIndicator()];
    } else {
      log('state1: $authState');
      final state = authState as AppState;
      log('state2: $state');

      if (state is AppStateDataStore) {
        return const <Widget>[
          HomeScreen(isNavIn: true, slideDirection: NavDirection.downWord),
        ];
      } else if (state is AppNavigationState) {
        if (state is AppNavigationStateHomeToExplore) {
          return <Widget>[
            const HomeScreen(
                isNavIn: false, slideDirection: NavDirection.leftWord),
            ExploreScreen(
                isNavIn: true,
                slideDirection: NavDirection.leftWord,
                viewOption: state.option),
          ];
        } else if (state is AppNavigationStateHomeToFriend) {
          return const <Widget>[
            HomeScreen(isNavIn: false, slideDirection: NavDirection.rightWord),
            FriendsScreen(isNavIn: true, slideDirection: NavDirection.rightWord),
          ];
        } else if (state is AppNavigationStateFriendToHome) {
          return const <Widget>[
            FriendsScreen(isNavIn: false, slideDirection: NavDirection.leftWord),
            HomeScreen(isNavIn: true, slideDirection: NavDirection.leftWord),
          ];
        } else if (state is AppNavigationStateFriendToExplore) {
          return <Widget>[
            const FriendsScreen(
                isNavIn: false, slideDirection: NavDirection.leftLeftWordForLeft),
            const HomeScreen(
                isNavIn: false,
                slideDirection: NavDirection.leftLeftWordForMeddle),
            ExploreScreen(
                isNavIn: true,
                slideDirection: NavDirection.leftLeftWordForRight,
                viewOption: state.option),
          ];
        } else if (state is AppNavigationStateExploreToFriend) {
          return const <Widget>[
            ExploreScreen(
                isNavIn: false,
                slideDirection: NavDirection.rightRightWordForRight,
                viewOption: null),
            HomeScreen(
                isNavIn: false,
                slideDirection: NavDirection.rightRightWordForMeddle),
            FriendsScreen(
                isNavIn: true,
                slideDirection: NavDirection.rightRightWordForLeft),
          ];
        } else if (state is AppNavigationStateExploreToHome) {
          return const <Widget>[
            ExploreScreen(
                isNavIn: false,
                slideDirection: NavDirection.rightWord,
                viewOption: null),
            HomeScreen(isNavIn: true, slideDirection: NavDirection.rightWord),
          ];
        }
      }
    }

    throw NoSuchBlocStateException(state: authState);
  }
}
