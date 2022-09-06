import 'dart:developer';

import 'package:conditioning/bloc/services/auth/auth_event.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/services/auth/org/auth_org_bloc.dart';
import 'package:conditioning/service/store/utils/animation_durations.dart';
import 'package:conditioning/ui/screens/org/org_screens_controller.dart';
import 'package:conditioning/ui/screens/org/org_screens_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener, ReadContext;

import 'screen_login_org.dart';

class LoginOrgScreensController extends StatefulWidget {
  const LoginOrgScreensController({
    Key? key,
    required this.enableLoginScreensNavigation,
    required this.enableBackToExploreScreenButton,
  }) : super(key: key);
  final bool enableLoginScreensNavigation;
  final bool enableBackToExploreScreenButton;

  @override
  State<LoginOrgScreensController> createState() =>
      _LoginOrgScreensControllerState();
}

class _LoginOrgScreensControllerState extends State<LoginOrgScreensController> {
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
      context.read<AuthOrgBloc>().add(const AuthEventInitialize());
    }

    return BlocListener<AuthOrgBloc<AuthOrgUserState>, AuthState>(
      listener: (context, state) {
        setState(() {
          if (state is AuthOrgUserStateLogin) {
            if (state.authOrgUser == null) {
              if (state is AuthOrgUserStateLogout) {
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
            child: LoginOrgScreen(
              enableLoginScreensNavigation: widget.enableLoginScreensNavigation,
              enableBackToExploreScreenButton: widget.enableBackToExploreScreenButton,
            ),
          ),
          AnimatedSlide(
            offset: _homeScreenOffset,
            duration: shortDuration,
            child: const OrgScreensControllerProvider(),
          ),
        ],
      ),
    );
  }
}
