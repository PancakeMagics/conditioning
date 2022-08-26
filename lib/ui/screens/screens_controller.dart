
import 'dart:developer';

import 'package:conditioning/bloc/auth/auth_bloc.dart';
import 'package:conditioning/bloc/auth/blocs/bloc_screens.dart';
import 'package:conditioning/bloc/auth/states/app/state_app_login.dart';
import 'package:conditioning/bloc/auth/states/state_screen_to_screen.dart';
import 'package:conditioning/service/l10n/util.dart';
import 'package:conditioning/ui/animations/slide_in_widget.dart';
import 'package:conditioning/ui/elements/view_loading.dart';
import 'package:conditioning/ui/screens/0_base/screen_app_login.dart';
import 'package:conditioning/ui/screens/0_base/screen_explore.dart';
import 'package:conditioning/ui/screens/1_user/screen_friends.dart';
import 'package:conditioning/ui/screens/1_user/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;

class ScreensController extends StatefulWidget {
  const ScreensController({Key? key}) : super(key: key);

  @override
  State<ScreensController> createState() => _ScreensControllerState();
}

class _ScreensControllerState extends State<ScreensController> {
  @override
  Widget build(BuildContext context) {
    context.read<ScreensBloc>().add(const AuthEventInitialize());

    return BlocConsumer<ScreensBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingView().show(context: context, text: context.loc.loading);
        } else {
          LoadingView().hide();
        }
      },
      builder: (context, state) {
        log(context.read<ScreensBloc>().state.toString());

        if (state is AuthStateAppUserLoginYet) {
          return const SlideWidgetBuilder(
            slideDirection: SlideDirection.downWord,
            isSlideIn: true,
            child: AppLoginScreen(),
          );
        } else if (state is AuthStateAppUserLogin) {
          if (state is ScreensStateHomeToExplore) {
            return Stack(
              children: const [
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.leftWord,
                  isSlideIn: false,
                  child: HomeScreen(),
                ),
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.leftWord,
                  isSlideIn: true,
                  child: ExploreScreen(),
                ),
              ],
            );
          } else if (state is ScreensStateHomeToFriend) {
            return Stack(
              children: const [
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.rightWord,
                  isSlideIn: false,
                  child: HomeScreen(),
                ),
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.rightWord,
                  isSlideIn: true,
                  child: FriendsScreen(),
                ),
              ],
            );
          } else if (state is ScreensStateFriendToHome) {
            return Stack(
              children: const [
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.leftWord,
                  isSlideIn: false,
                  child: FriendsScreen(),
                ),
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.leftWord,
                  isSlideIn: true,
                  child: HomeScreen(),
                ),
              ],
            );
          } else if (state is ScreensStateFriendToExplore) {
            return Stack(
              children: const [
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.leftWord,
                  isSlideIn: false,
                  child: FriendsScreen(),
                ),
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.leftWord,
                  isSlideIn: true,
                  child: ExploreScreen(),
                ),
              ],
            );
          } else if (state is ScreensStateExploreToFriend) {
            return Stack(
              children: const [
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.rightWord,
                  isSlideIn: false,
                  child: ExploreScreen(),
                ),
                //TODO: combine as a row
                // SlideWidgetBuilder(
                //   slideDirection: SlideDirection.rightWord,
                //   isSlideIn: true,
                //   child: HomeScreen(),
                // ),
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.rightWord,
                  isSlideIn: true,
                  child: FriendsScreen(),
                ),
              ],
            );
          } else if (state is ScreensStateExploreToHome) {
            return Stack(
              children: const [
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.rightWord,
                  isSlideIn: false,
                  child: ExploreScreen(),
                ),
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.rightWord,
                  isSlideIn: true,
                  child: HomeScreen(),
                ),
              ],
            );
          } else if (state is AppUserStateLogout) {
            return Stack(
              children: const [
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.upWord,
                  isSlideIn: false,
                  child: HomeScreen(),
                ),
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.upWord,
                  isSlideIn: true,
                  child: AppLoginScreen(),
                ),
              ],
            );
          } else {
            return Stack(
              children: const [
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.downWord,
                  isSlideIn: false,
                  child: AppLoginScreen(),
                ),
                SlideWidgetBuilder(
                  slideDirection: SlideDirection.downWord,
                  isSlideIn: true,
                  child: HomeScreen(),
                ),
              ],
            );
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
