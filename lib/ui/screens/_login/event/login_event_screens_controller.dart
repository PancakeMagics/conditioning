import 'package:conditioning/bloc/services/auth/auth_event.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/services/auth/event/auth_event_bloc.dart';
import 'package:conditioning/service/settings/animation_durations.dart';
import 'package:conditioning/ui/screens/_login/event/screen_login_event.dart';
import 'package:conditioning/ui/screens/event/event_screens_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocListener, ReadContext;

class LoginEventScreensController extends StatefulWidget {
  const LoginEventScreensController({
    Key? key,
    required this.enableLoginScreensNavigation,
  }) : super(key: key);
  final bool enableLoginScreensNavigation;

  @override
  State<LoginEventScreensController> createState() =>
      _LoginEventScreensControllerState();
}

class _LoginEventScreensControllerState extends State<LoginEventScreensController> {
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
      context
          .read<AuthEventBloc>()
          .add(const AuthEventInitialize());
    }

    return BlocListener<AuthEventBloc<AuthEventUserState>, AuthState>(
      listener: (context, state) {
        if (state is AuthEventUserStateLogin) {
          if (state.authEventUser == null) {
            if (state.authEventUser == null) {
              if (state is AuthEventUserStateLogout) {
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
        }
      },
      child: Stack(
        children: [
          AnimatedSlide(
            offset: _loginScreenOffset,
            duration: shortDuration,
            child: LoginEventScreen(enableLoginScreensNavigation: widget.enableLoginScreensNavigation),
          ),
          AnimatedSlide(
            offset: _homeScreenOffset,
            duration: shortDuration,
            child: const EventScreensController(),
          ),
        ],
      ),
    );
  }
}
