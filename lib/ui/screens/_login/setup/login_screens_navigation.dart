import 'package:conditioning/bloc/login_option.dart';
import 'package:conditioning/service/utils/extensions/pair.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:conditioning/ui/screens/_login/setup/login_bloc_provider.dart';
import 'package:flutter/material.dart';

class LoginScreensNavigation extends StatelessWidget {
  const LoginScreensNavigation({
    Key? key,
    required this.currentOption,
    required this.toWordOption,
  }) : super(key: key);
  final LoginOption currentOption;
  final LoginOption toWordOption;

  @override
  Widget build(BuildContext context) {
    final Pair<NavDirection, Pair<LoginOption?, LoginOption>> navPair;

    switch (currentOption) {
      case LoginOption.app:
        switch (toWordOption) {
          case LoginOption.app:
            navPair = const Pair(a: NavDirection.downWord,
                b: Pair(a: null, b: LoginOption.app));
            break;
          case LoginOption.org:
            navPair = const Pair(a: NavDirection.rightWord,
                b: Pair(a: LoginOption.app, b: LoginOption.org));
            break;
          case LoginOption.event:
            navPair = const Pair(a: NavDirection.leftWord,
                b: Pair(a: LoginOption.app, b: LoginOption.event));
            break;
        }
        break;
      case LoginOption.org:
        switch (toWordOption) {
          case LoginOption.org:
            navPair = const Pair(a: NavDirection.downWord,
                b: Pair(a: null, b: LoginOption.app));
            break;
          case LoginOption.app:
            navPair = const Pair(a: NavDirection.leftWord,
                b: Pair(a: LoginOption.org, b: LoginOption.app));
            break;
          case LoginOption.event:
            navPair = const Pair(a: NavDirection.leftWord,
                b: Pair(a: LoginOption.org, b: LoginOption.event));
        }
        break;
      case LoginOption.event:
        switch (toWordOption) {
          case LoginOption.event:
            navPair = const Pair(a: NavDirection.downWord,
                b: Pair(a: null, b: LoginOption.event));
            break;
          case LoginOption.app:
            navPair = const Pair(a: NavDirection.rightWord,
                b: Pair(a: LoginOption.event, b: LoginOption.app));
            break;
          case LoginOption.org:
            navPair = const Pair(a: NavDirection.rightWord,
                b: Pair(a: LoginOption.event, b: LoginOption.org));
            break;
        }
        break;
    }

    return Stack(
      children: [
        // navPair.b.a != null ? LoginBlocProvider(
        //   screenIsNavIn: false,
        //   screenNavDirection: navPair.a,
        //   loginOption: navPair.b.a!,
        // ) : Container(),
        // LoginBlocProvider(
        //   screenIsNavIn: true,
        //   screenNavDirection: navPair.a,
        //   loginOption: navPair.b.b,
        // ),
      ],
    );
  }
}
