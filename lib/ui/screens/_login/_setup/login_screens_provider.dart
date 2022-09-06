import 'package:conditioning/service/utils/constants/option_login.dart';
import 'package:conditioning/bloc/services/auth/app/auth_app_bloc.dart';
import 'package:conditioning/bloc/services/auth/event/auth_event_bloc.dart';
import 'package:conditioning/bloc/services/auth/org/auth_org_bloc.dart';
import 'package:conditioning/bloc/ui/_login/login_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/entities/providers/local/preferences/shared_preference_utils.dart';
import 'package:conditioning/ui/screens/_login/app/login_app_screens_controller.dart';
import 'package:conditioning/ui/screens/_login/event/login_event_screens_controller.dart';
import 'package:conditioning/ui/screens/_login/org/login_org_screens_controller.dart';
import 'package:conditioning/ui/screens/_login/_setup/login_screens_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreensProvider extends StatelessWidget {
  const LoginScreensProvider({Key? key,
    required this.loginOption,
    required this.enableLoginScreensNavigation,
    required this.navigationSetUpFinished,
    required this.enableBackButton,
  }) : super(key: key);
  final LoginOption loginOption;
  final bool enableLoginScreensNavigation;
  final bool navigationSetUpFinished;
  final bool enableBackButton;

  @override
  Widget build(BuildContext context) {
    if (enableLoginScreensNavigation && !navigationSetUpFinished) {
      return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: LoginScreensController(initialOption: loginOption),
      );
    } else {
      final authProvider = AuthService.fromFirebase();
      final prefs = SharedPreferenceUtils().preferences!;
      switch (loginOption) {
        case LoginOption.app:
          return BlocProvider<AuthAppBloc<AuthAppUserState>>(
            create: (context) => AuthAppBloc(prefs: prefs, authProvider: authProvider),
            child: LoginAppScreensController(enableLoginScreensNavigation: enableLoginScreensNavigation),
          );
        case LoginOption.org:
          return BlocProvider<AuthOrgBloc<AuthOrgUserState>>(
            create: (context) => AuthOrgBloc(prefs: prefs, authProvider: authProvider),
            child: LoginOrgScreensController(enableLoginScreensNavigation: enableLoginScreensNavigation, enableBackToExploreScreenButton: enableBackButton),
          );
        case LoginOption.event:
          return BlocProvider<AuthEventBloc<AuthEventUserState>>(
            create: (context) => AuthEventBloc(prefs: prefs, authProvider: authProvider),
            child: LoginEventScreensController(enableLoginScreensNavigation: enableLoginScreensNavigation, enableBackToExploreScreenButton: enableBackButton),
          );
      }
    }
  }
}
