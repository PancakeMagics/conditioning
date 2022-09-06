import 'dart:developer';

import 'package:conditioning/bloc/bloc_exception.dart';
import 'package:conditioning/bloc/services/auth/app/auth_app_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_event.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/service/store/utils/animation_durations.dart';
import 'package:conditioning/ui/elements/_generics/my_animated_slide.dart';
import 'package:conditioning/ui/screens/_login/app/screen_login_app.dart';
import 'package:conditioning/ui/screens/app/app_screens_controller.dart';
import 'package:conditioning/ui/screens/app/app_screens_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener, ReadContext;

class LoginAppScreensController extends StatefulWidget {
  const LoginAppScreensController({
    Key? key,
    required this.enableLoginScreensNavigation,
  }) : super(key: key);
  final bool enableLoginScreensNavigation;

  @override
  State<LoginAppScreensController> createState() =>
      _LoginAppScreensControllerState();
}

class _LoginAppScreensControllerState extends State<LoginAppScreensController> {
  bool _initYet = true;
  late Offset _loginScreenOffset;
  late Offset _homeScreenOffset;

  @override
  void initState() {
    _loginScreenOffset = Offset.zero;
    _homeScreenOffset = const Offset(0.0, -1.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_initYet) {
      _initYet = false;
      context.read<AuthAppBloc>().add(const AuthEventInitialize());
    }

    return BlocListener<AuthAppBloc<AuthAppUserState>, AuthState>(
      listener: (context, state) {
        setState(() {
          if (state is AuthAppUserStateLogin) {
            if (state.authAppUser == null) {
              if (state is AuthAppUserStateLogout) {
                _loginScreenOffset = Offset.zero;
                _homeScreenOffset = const Offset(0.0, -1.0);
              } else {
                _loginScreenOffset = Offset.zero;
              }
            } else {
              _loginScreenOffset = const Offset(0.0, 1.0);
              _homeScreenOffset = Offset.zero;
            }
          }
        });
      },
      child: Stack(
        children: [
          AnimatedSlide(
            offset: _loginScreenOffset,
            duration: shortDuration,
            child: LoginAppScreen(
                enableLoginScreensNavigation:
                    widget.enableLoginScreensNavigation),
          ),
          AnimatedSlide(
            offset: _homeScreenOffset,
            duration: shortDuration,
            child: const AppScreensControllerProvider(),
          ),
        ],
      ),
    );
  }
}
