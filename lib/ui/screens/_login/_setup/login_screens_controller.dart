import 'package:conditioning/bloc/bloc_exception.dart';
import 'package:conditioning/service/utils/constants/option_login.dart';
import 'package:conditioning/bloc/ui/_login/login_bloc.dart';
import 'package:conditioning/service/store/utils/animation_durations.dart';
import 'package:conditioning/service/store/entities/providers/local/preferences/shared_preference_utils.dart';
import 'package:conditioning/ui/screens/_login/_setup/login_screens_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener, ReadContext;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreensController extends StatefulWidget {
  const LoginScreensController({Key? key, required this.initialOption}) : super(key: key);
  final LoginOption initialOption;

  @override
  State<LoginScreensController> createState() => _LoginScreensControllerState();
}

class _LoginScreensControllerState extends State<LoginScreensController> {
  late Offset _loginAppOffset;
  late Offset _loginOrgOffset;
  late Offset _loginEventOffset;
  late LoginOption _currentOption;
  late Curve _animationCurve;

  @override
  void initState() {
    _currentOption = widget.initialOption;
    switch (widget.initialOption) {
      case LoginOption.app:
        _loginAppOffset = const Offset(0.0, -1.0);
        _loginOrgOffset = const Offset(-1.0, 0.0);
        _loginEventOffset = const Offset(1.0, 0.0);
        break;
      case LoginOption.org:
        _loginOrgOffset = const Offset(0.0, -1.0);
        _loginAppOffset = const Offset(-1.0, 0.0);
        _loginEventOffset = const Offset(1.0, 0.0);
        break;
      case LoginOption.event:
        _loginEventOffset = const Offset(0.0, -1.0);
        _loginOrgOffset = const Offset(-1.0, 0.0);
        _loginAppOffset = const Offset(1.0, 0.0);
        break;
    }

    // MySharedPreference().preferences!;
    // TODO
    // _animationCurve = widget.prefs.getString('curve');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<LoginBloc>().add(const LoginEventShowCurrentScreen());
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        setState(() {
          if (state is LoginStateNavigateIn) {
            switch (_currentOption) {
              case LoginOption.app:
                _loginAppOffset = Offset.zero;
                break;
              case LoginOption.org:
                _loginOrgOffset = Offset.zero;
                break;
              case LoginOption.event:
                _loginEventOffset = Offset.zero;
                break;
            }
          }
          if (state is LoginStateNavigating) {
            final currentOption = state.currentOption;
            final toWordOption = state.toWordOption;
            switch (currentOption) {
              case LoginOption.app:
                switch (toWordOption) {
                  case LoginOption.app:
                    throw NoSuchBlocStateException(state: state);
                  case LoginOption.org:
                    _currentOption = LoginOption.org;
                    _loginAppOffset = const Offset(1.0, 0.0);
                    break;
                  case LoginOption.event:
                    _currentOption = LoginOption.event;
                    _loginAppOffset = const Offset(-1.0, 0.0);
                    break;
                }
                break;
              case LoginOption.org:
                switch (toWordOption) {
                  case LoginOption.app:
                    _currentOption = LoginOption.app;
                    _loginOrgOffset = const Offset(-1.0, 0.0);
                    break;
                  case LoginOption.org:
                  case LoginOption.event:
                    throw NoSuchBlocStateException(state: state);
                }
                break;
              case LoginOption.event:
                switch (toWordOption) {
                  case LoginOption.app:
                    _currentOption = LoginOption.app;
                    _loginEventOffset = const Offset(1.0, 0.0);
                    break;
                  case LoginOption.org:
                  case LoginOption.event:
                    throw NoSuchBlocStateException(state: state);
                }
                break;
            }
          }
        });
      },
      child: Stack(
        children: [
          AnimatedSlide(
            offset: _loginAppOffset,
            duration: shortDuration,
            child: AnimatedOpacity(
              opacity: _loginAppOffset == Offset.zero ? 1.0 : 0.0,
              duration: shortDuration,
              child: const LoginScreensProvider(
                loginOption: LoginOption.app,
                enableLoginScreensNavigation: true,
                navigationSetUpFinished: true,
                enableBackButton: false,
              ),
            ),
          ),
          AnimatedSlide(
            offset: _loginOrgOffset,
            duration: shortDuration,
            child: AnimatedOpacity(
              opacity: _loginOrgOffset == Offset.zero ? 1.0 : 0.0,
              duration: shortDuration,
              child: const LoginScreensProvider(
                loginOption: LoginOption.org,
                enableLoginScreensNavigation: true,
                navigationSetUpFinished: true,
                enableBackButton: false,
              ),
            ),
          ),
          AnimatedSlide(
            offset: _loginEventOffset,
            duration: shortDuration,
            child: AnimatedOpacity(
              opacity: _loginEventOffset == Offset.zero ? 1.0 : 0.0,
              duration: shortDuration,
              child: const LoginScreensProvider(
                loginOption: LoginOption.event,
                enableLoginScreensNavigation: true,
                navigationSetUpFinished: true,
                enableBackButton: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
