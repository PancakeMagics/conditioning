import 'dart:developer';

import 'package:conditioning/bloc/bloc_exception.dart';
import 'package:conditioning/bloc/login_option.dart';
import 'package:conditioning/bloc/ui/_login/login_bloc.dart';
import 'package:conditioning/service/utils/extensions/pair.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:conditioning/ui/screens/_login/setup/login_bloc_provider.dart';
import 'package:conditioning/ui/screens/ui_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;

class LoginScreensController extends StatelessWidget {
  const LoginScreensController({
    Key? key,
    required this.enableLoginScreensNavigation,
    required this.loginOption,
  }) : super(key: key);
  final bool enableLoginScreensNavigation;
  final LoginOption loginOption;

  @override
  Widget build(BuildContext context) {
    context
        .read<LoginBloc>()
        .add(LoginEventInitialize(initLoginOption: loginOption));

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) =>
          Stack(children: [..._getWidgetList(state)]),
    );
  }

  List<Widget> _getWidgetList<S extends LoginState>(S state) {
    if (state is LoginStateInitialYet) {
      return const <Widget>[CircularProgressIndicator()];
    } else if (state is LoginStateInitial) {
      return <Widget>[
        LoginBlocProvider(
          enableLoginScreensNavigation: enableLoginScreensNavigation,
          screenIsNavIn: true,
          screenNavDirection: NavDirection.downWord,
          loginOption: loginOption,
        ),
      ];
    } else if (state is LoginStateNavigation) {
      log('state option: ${state.currentOption}');

      final currentOption = state.currentOption;
      final toWordOption = state.toWordOption;

      final Pair<NavDirection, Pair<LoginOption, LoginOption>> navPair;

      switch (currentOption) {
        case LoginOption.app:
          switch (toWordOption) {
            case LoginOption.org:
              navPair = const Pair(a: NavDirection.rightWord,
                  b: Pair(a: LoginOption.app, b: LoginOption.org));
              break;
            case LoginOption.event:
              navPair = const Pair(a: NavDirection.leftWord,
                  b: Pair(a: LoginOption.app, b: LoginOption.event));
              break;
            default: throw const NoSuchNavigationLoginOption();
          }
          break;
        case LoginOption.org:
          switch (toWordOption) {
            case LoginOption.app:
              navPair = const Pair(a: NavDirection.leftWord,
                  b: Pair(a: LoginOption.org, b: LoginOption.app));
              break;
            case LoginOption.event:
              navPair = const Pair(a: NavDirection.leftWord,
                  b: Pair(a: LoginOption.org, b: LoginOption.event));
              break;
            default: throw const NoSuchNavigationLoginOption();
          }
          break;
        case LoginOption.event:
          switch (toWordOption) {
            case LoginOption.app:
              navPair = const Pair(a: NavDirection.rightWord,
                  b: Pair(a: LoginOption.event, b: LoginOption.app));
              break;
            case LoginOption.org:
              navPair = const Pair(a: NavDirection.rightWord,
                  b: Pair(a: LoginOption.event, b: LoginOption.org));
              break;
            default: throw const NoSuchNavigationLoginOption();
          }
          break;
      }

      return [
        LoginBlocProvider(
          enableLoginScreensNavigation: true,
          screenIsNavIn: false,
          screenNavDirection: navPair.a,
          loginOption: navPair.b.a,
        ),
        LoginBlocProvider(
          enableLoginScreensNavigation: true,
          screenIsNavIn: true,
          screenNavDirection: navPair.a,
          loginOption: navPair.b.b,
        ),
      ];
    } else {
      throw NoSuchBlocStateException(state: state);
    }

    return <Widget>[];
  }
}
