import 'package:conditioning/bloc/services/auth/app/auth_app_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/services/auth/event/auth_event_bloc.dart';
import 'package:conditioning/bloc/services/auth/org/auth_org_bloc.dart';
import 'package:conditioning/bloc/login_option.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:conditioning/ui/elements/view_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, BlocProvider;

import 'login_bloc_builder.dart';

class LoginBlocProvider extends StatelessWidget {
  const LoginBlocProvider({
    Key? key,
    required this.enableLoginScreensNavigation,
    required this.screenIsNavIn,
    required this.screenNavDirection,
    required this.loginOption,
  }) : super(key: key);
  final bool enableLoginScreensNavigation;
  final bool screenIsNavIn;
  final NavDirection screenNavDirection;
  final LoginOption loginOption;

  @override
  Widget build(BuildContext context) {
    final authProvider = AuthService.fromFirebase();
    switch (loginOption) {
      case LoginOption.app:
        return BlocProvider<AuthAppBloc>(
          create: (context) => AuthAppBloc(authProvider: authProvider),
          child: BlocConsumer<AuthAppBloc<AuthAppUserState>, AuthState>(
            builder: (context, state) => LoginBlocBuilder(screenIsNavIn: screenIsNavIn, screenNavDirection: screenNavDirection, loginOption: loginOption, authState: state,),
            listener: _getBlocConsumerListener,
          ),
        );
      case LoginOption.org:
        return BlocProvider<AuthOrgBloc>(
          create: (context) => AuthOrgBloc(authProvider: authProvider),
          child: BlocConsumer<AuthOrgBloc<AuthOrgUserState>, AuthState>(
            builder: (context, state) => LoginBlocBuilder(screenIsNavIn: screenIsNavIn, screenNavDirection: screenNavDirection, loginOption: loginOption, authState: state),
            listener: _getBlocConsumerListener,
          ),
        );
      case LoginOption.event:
        return BlocProvider<AuthEventBloc>(
          create: (context) => AuthEventBloc(authProvider: authProvider),
          child: BlocConsumer<AuthEventBloc<AuthEventUserState>, AuthState>(
            builder: (context, state) => LoginBlocBuilder(screenIsNavIn: screenIsNavIn, screenNavDirection: screenNavDirection, loginOption: loginOption, authState: state),
            listener: _getBlocConsumerListener,
          ),
        );
    }
  }

  void _getBlocConsumerListener(BuildContext context, AuthState state) {
    if (state.isLoading) {
      LoadingView().showOverlay(context: context);
    } else {
      LoadingView().hideOverlay();
    }
  }
}
