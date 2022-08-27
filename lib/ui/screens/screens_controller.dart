import 'dart:developer';
import 'package:conditioning/bloc/auth/auth_event.dart';
import 'package:conditioning/bloc/auth/app/others/state_screen_to_screen.dart';
import 'package:conditioning/service/intl/util.dart';
import 'package:conditioning/ui/animations/slide_in_widget.dart';
import 'package:conditioning/ui/elements/view_loading.dart';
import 'package:conditioning/ui/screens/0_base/screen_app_login.dart';
import 'package:conditioning/ui/screens/1_user/screen_explore.dart';
import 'package:conditioning/ui/screens/1_user/screen_friends.dart';
import 'package:conditioning/ui/screens/1_user/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;

import '../../bloc/auth/app/app_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/utils/screens/base_bloc.dart';

class ScreensController extends StatefulWidget {
  const ScreensController({Key? key}) : super(key: key);

  @override
  State<ScreensController> createState() => _ScreensControllerState();
}

class _ScreensControllerState extends State<ScreensController> {
  @override
  Widget build(BuildContext context) {
    context.read<BaseBloc>().add(const AuthEventInitialize());

    return BlocConsumer<BaseBloc, AuthState>(
      builder: (context, state) {
        log(context.read<BaseBloc>().state.toString());

        if (state is AppUserStateLoginYet) {
          return const AppLoginScreen(isSlideIn: true, slideDirection: SlideDirection.downWord,);
        } else if (state is AppUserStateLogin) {
          if (state is ScreensStateHomeToExplore) {
            return Stack(children: const [
              HomeScreen(isSlideIn: false, slideDirection: SlideDirection.leftWord),
              ExploreScreen(isSlideIn: true, slideDirection: SlideDirection.leftWord),
            ]);
          } else if (state is ScreensStateHomeToFriend) {
            return Stack(children: const [
              HomeScreen(isSlideIn: false, slideDirection: SlideDirection.rightWord),
              FriendsScreen(isSlideIn: true, slideDirection: SlideDirection.rightWord),
            ]);
          } else if (state is ScreensStateFriendToHome) {
            return Stack(children: const [
              FriendsScreen(isSlideIn: false, slideDirection: SlideDirection.leftWord),
              HomeScreen(isSlideIn: true, slideDirection: SlideDirection.leftWord),
            ]);
          } else if (state is ScreensStateFriendToExplore) {
            return Stack(children: const [
              FriendsScreen(isSlideIn: false, slideDirection: SlideDirection.leftLeftWordForLeft),
              HomeScreen(isSlideIn: false, slideDirection: SlideDirection.leftLeftWordForMeddle),
              ExploreScreen(isSlideIn: true, slideDirection: SlideDirection.leftLeftWordForRight),
            ]);
          } else if (state is ScreensStateExploreToFriend) {
            return Stack(children: const [
              ExploreScreen(isSlideIn: false, slideDirection: SlideDirection.rightRightWordForRight),
              HomeScreen(isSlideIn: false, slideDirection: SlideDirection.rightRightWordForMeddle),
              FriendsScreen(isSlideIn: true, slideDirection: SlideDirection.rightRightWordForLeft),
            ]);
          } else if (state is ScreensStateExploreToHome) {
            return Stack(children: const [
              ExploreScreen(isSlideIn: false, slideDirection: SlideDirection.rightWord),
              HomeScreen(isSlideIn: true, slideDirection: SlideDirection.rightWord),
            ]);
          } else if (state is AppUserStateLogout) {
            return Stack(children: const [
              HomeScreen(isSlideIn: false, slideDirection: SlideDirection.upWord),
              AppLoginScreen(isSlideIn: true, slideDirection: SlideDirection.upWord),
            ]);
          } else {
            return Stack(children: const [
              AppLoginScreen(isSlideIn: false, slideDirection: SlideDirection.downWord),
              HomeScreen(isSlideIn: true, slideDirection: SlideDirection.downWord),
            ]);
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
      listener: (context, state) {
        // if (state.isLoading) {
        //   LoadingView().show(context: context, text: context.loc.loading);
        // } else {
        //   LoadingView().hide();
        // }
      },
    );
  }
}
