import 'dart:developer';

import 'package:conditioning/bloc/bloc_exception.dart';
import 'package:conditioning/bloc/services/auth/app/auth_app_bloc.dart';
import 'package:conditioning/bloc/services/auth/auth_event.dart';
import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/services/auth/event/auth_event_bloc.dart';
import 'package:conditioning/bloc/services/auth/org/auth_org_bloc.dart';
import 'package:conditioning/bloc/login_option.dart';
import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:conditioning/ui/screens/_login/screen_login_app.dart';
import 'package:conditioning/ui/screens/_login/screen_login_event.dart';
import 'package:conditioning/ui/screens/_login/screen_login_org.dart';
import 'package:conditioning/ui/screens/app/app_screens_controller.dart';
import 'package:conditioning/ui/screens/event/event_screens_controller.dart';
import 'package:conditioning/ui/screens/org/org_screens_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, ReadContext;

class LoginBlocBuilder extends StatelessWidget {
  const LoginBlocBuilder({
    Key? key,
    required this.loginOption,
    required this.authState,
    required this.screenIsNavIn,
    required this.screenNavDirection,
  }) : super(key: key);
  final LoginOption loginOption;
  final AuthState authState;
  final bool screenIsNavIn;
  final NavDirection screenNavDirection;

  @override
  Widget build(BuildContext context) {
    switch (loginOption) {
      case LoginOption.app:
        // TODO:
        // return _initializing(context, widget.authState);

        if (authState is AuthStateInitialYet) {
          context
              .read<AuthAppBloc<AuthAppUserState>>()
              .add(const AuthEventInitialize());
          return const LinearProgressIndicator();
        } else {
          final state = authState as AuthAppUserState;
          return Stack(children: [..._getNavigationList(state)]);
        }
      case LoginOption.org:
        if (authState is AuthStateInitialYet) {
          context
              .read<AuthOrgBloc<AuthOrgUserState>>()
              .add(const AuthEventInitialize());
          return const LinearProgressIndicator();
        } else {
          final state = authState as AuthOrgUserState;
          return Stack(children: [..._getNavigationList(state)]);
        }
      case LoginOption.event:
        if (authState is AuthStateInitialYet) {
          context
              .read<AuthEventBloc<AuthEventUserState>>()
              .add(const AuthEventInitialize());
          return const LinearProgressIndicator();
        } else {
          final state = authState as AuthEventUserState;
          return Stack(children: [..._getNavigationList(state)]);
        }
    }
  }

  List<Widget> _getNavigationList<S extends AuthState>(S state) {
    if (state is AuthAppUserState) {
      if (state is AuthAppUserStateLogin) {
        if (state.authAppUser == null) {
          if (state is AuthAppUserStateLogout) {
            return <Widget>[
              const AppScreensController(
                  isNavIn: false, slideDirection: NavDirection.upWord),
              const LoginAppScreen(
                  isNavIn: true, slideDirection: NavDirection.upWord),
            ];
          } else {
            return <Widget>[
              LoginAppScreen(isNavIn: screenIsNavIn, slideDirection: screenNavDirection)
            ];
          }
        } else {
          return <Widget>[
            const LoginAppScreen(
                isNavIn: false, slideDirection: NavDirection.downWord),
            BlocProvider<AppBloc>(
                create: (context) => AppBloc(authProvider: AuthService.fromFirebase(), storeProvider: StoreService.fromFirebase()),
              child: const AppScreensController(
                  isNavIn: true, slideDirection: NavDirection.downWord),
            ),
          ];
        }
      }
    } else if (state is AuthOrgUserState) {
      if (state is AuthOrgUserStateLogin) {
        if (state.authOrgUser == null) {
          if (state is AuthOrgUserStateLogout) {
            return <Widget>[
              const OrgScreensController(
                  isNavIn: false, slideDirection: NavDirection.upWord),
              const LoginOrgScreen(
                  isNavIn: true, slideDirection: NavDirection.upWord),
            ];
          } else {
            return <Widget>[
              LoginOrgScreen(
                  isNavIn: screenIsNavIn, slideDirection: screenNavDirection),
            ];
          }
        } else {
          return <Widget>[
            const LoginAppScreen(
                isNavIn: false, slideDirection: NavDirection.downWord),
            const OrgScreensController(
                isNavIn: true, slideDirection: NavDirection.downWord),
          ];
        }
      }
    } else if (state is AuthEventUserState) {
      if (state is AuthEventUserStateLogin) {
        if (state.authEventUser == null) {
          if (state is AuthOrgUserEventLogout) {
            return <Widget>[
              const EventScreensController(
                  isNavIn: false, slideDirection: NavDirection.upWord),
              const LoginEventScreen(
                  isNavIn: true, slideDirection: NavDirection.upWord),
            ];
          } else {
            return <Widget>[
              LoginEventScreen(
                  isNavIn: screenIsNavIn, slideDirection: screenNavDirection),
            ];
          }
        } else {
          return <Widget>[
            const LoginEventScreen(
                isNavIn: false, slideDirection: NavDirection.downWord),
            const EventScreensController(
                isNavIn: true, slideDirection: NavDirection.downWord),
          ];
        }
      }
    } else {
      throw NoSuchBlocStateException(state: state);
    }
    return const <Widget>[LinearProgressIndicator()];
  }

  Widget _initializeIfYet(BuildContext context, AuthState state) {
    switch (loginOption) {
      case LoginOption.app:
        // TODO: Handle this case.
        break;
      case LoginOption.org:
        context.read<AuthOrgBloc>().add(const AuthEventInitialize());
        break;
      case LoginOption.event:
        context.read<AuthEventBloc>().add(const AuthEventInitialize());
        break;
    }
    // return Stack(children: [..._getBlocConsumerBuilderChildren(state)]);
    return Stack(children: const <Widget>[CircularProgressIndicator()]);
  }
}
