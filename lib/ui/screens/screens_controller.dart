import 'dart:developer';
import 'package:conditioning/bloc/auth/auth_event.dart';
import 'package:conditioning/bloc/auth/app/others/state_screen_to_screen.dart';
import 'package:conditioning/service/intl/util.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
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
          return const AppLoginScreen(isNavIn: true, slideDirection: NavDirection.downWord);
        } else if (state is AppUserStateLogin) {
          if (state is ScreensStateHomeToExplore) {
            return Stack(children: const [
              HomeScreen(isNavIn: false, slideDirection: NavDirection.leftWord),
              ExploreScreen(isNavIn: true, slideDirection: NavDirection.leftWord),
            ]);
          } else if (state is ScreensStateHomeToFriend) {
            return Stack(children: const [
              HomeScreen(isNavIn: false, slideDirection: NavDirection.rightWord),
              FriendsScreen(isNavIn: true, slideDirection: NavDirection.rightWord),
            ]);
          } else if (state is ScreensStateFriendToHome) {
            return Stack(children: const [
              FriendsScreen(isNavIn: false, slideDirection: NavDirection.leftWord),
              HomeScreen(isNavIn: true, slideDirection: NavDirection.leftWord),
            ]);
          } else if (state is ScreensStateFriendToExplore) {
            return Stack(children: const [
              FriendsScreen(isNavIn: false, slideDirection: NavDirection.leftLeftWordForLeft),
              HomeScreen(isNavIn: false, slideDirection: NavDirection.leftLeftWordForMeddle),
              ExploreScreen(isNavIn: true, slideDirection: NavDirection.leftLeftWordForRight),
            ]);
          } else if (state is ScreensStateExploreToFriend) {
            return Stack(children: const [
              ExploreScreen(isNavIn: false, slideDirection: NavDirection.rightRightWordForRight),
              HomeScreen(isNavIn: false, slideDirection: NavDirection.rightRightWordForMeddle),
              FriendsScreen(isNavIn: true, slideDirection: NavDirection.rightRightWordForLeft),
            ]);
          } else if (state is ScreensStateExploreToHome) {
            return Stack(children: const [
              ExploreScreen(isNavIn: false, slideDirection: NavDirection.rightWord),
              HomeScreen(isNavIn: true, slideDirection: NavDirection.rightWord),
            ]);
          } else if (state is AppUserStateLogout) {
            return Stack(children: const [
              HomeScreen(isNavIn: false, slideDirection: NavDirection.upWord),
              AppLoginScreen(isNavIn: true, slideDirection: NavDirection.upWord),
            ]);
          } else {
            return Stack(children: const [
              AppLoginScreen(isNavIn: false, slideDirection: NavDirection.downWord),
              HomeScreen(isNavIn: true, slideDirection: NavDirection.downWord),
            ]);
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
      listener: (context, state) async {
        if (state.isLoading) {
          final loc = context.loc;

          if (state is AppUserStateLoginYet) {
            LoadingView().show(context: context, text: loc.loading);
            _waitAndShow(text: loc.loading_chat_weather);
            _waitAndShow(text: loc.loading_chat_weather_a);
            _waitAndShow(text: loc.loading_chat_food);
            _waitAndShow(text: loc.loading_chat_food_a);
            _waitAndShow(text: loc.loading_chat_rest);
            _waitAndShow(text: loc.loading_chat_phone);
            _waitAndShow(text: loc.loading_end);

          } else {
            LoadingView().show(context: context, text: loc.loading);
          }
        } else {
          LoadingView().hide();
        }
      },
    );
  }
  void _waitAndShow({required String text}) async {
    await Future.delayed(const Duration(seconds: 3));
    LoadingView().update(text: text);
  }
}
