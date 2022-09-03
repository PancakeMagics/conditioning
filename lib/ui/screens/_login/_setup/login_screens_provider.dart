import 'package:conditioning/bloc/login_option.dart';
import 'package:conditioning/bloc/services/auth/app/auth_app_bloc.dart';
import 'package:conditioning/bloc/services/auth/event/auth_event_bloc.dart';
import 'package:conditioning/bloc/services/auth/org/auth_org_bloc.dart';
import 'package:conditioning/bloc/ui/_login/login_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/ui/screens/_login/app/login_app_screens_controller.dart';
import 'package:conditioning/ui/screens/_login/event/login_event_screens_controller.dart';
import 'package:conditioning/ui/screens/_login/org/login_org_screens_controller.dart';
import 'package:conditioning/ui/screens/_login/_setup/login_screens_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;

class LoginScreensProvider extends StatelessWidget {
  const LoginScreensProvider({Key? key,
    required this.loginOption,
    required this.enableLoginScreensNavigation,
    required this.navigationSetUpFinished,
  }) : super(key: key);
  final LoginOption loginOption;
  final bool enableLoginScreensNavigation;
  final bool navigationSetUpFinished;

  @override
  Widget build(BuildContext context) {
    if (enableLoginScreensNavigation && !navigationSetUpFinished) {
      return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: LoginScreensController(initialOption: loginOption),
      );
    } else {
      final enable = enableLoginScreensNavigation;
      final authProvider = AuthService.fromFirebase();
      switch (loginOption) {
        case LoginOption.app:
          return BlocProvider<AuthAppBloc<AuthAppUserState>>(
            create: (context) => AuthAppBloc(authProvider: authProvider),
            child: LoginAppScreensController(enableLoginScreensNavigation: enable),
          );
        case LoginOption.org:
          return BlocProvider<AuthOrgBloc<AuthOrgUserState>>(
            create: (context) => AuthOrgBloc(authProvider: authProvider),
            child: LoginOrgScreensController(enableLoginScreensNavigation: enable),
          );
        case LoginOption.event:
          return BlocProvider<AuthEventBloc<AuthEventUserState>>(
            create: (context) => AuthEventBloc(authProvider: authProvider),
            child: LoginEventScreensController(enableLoginScreensNavigation: enable),
          );
      }
    }
  }
}
