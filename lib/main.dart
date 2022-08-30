import 'package:conditioning/bloc/auth/org/org_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:conditioning/ui/screens/0_base/screen_app_login.dart';
import 'package:conditioning/ui/screens/2_org/screen_org_user.dart';
import 'package:conditioning/ui/screens/3_event/screen_event_user.dart';
import 'package:conditioning/ui/screens/screens_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

import 'dart:developer' show log;

import 'bloc/auth/event/event_bloc.dart';
import 'bloc/utils/screens/base_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryBrown = Color.fromARGB(255, 189, 166, 158);
    const secondaryBrown = Color.fromARGB(255, 109, 92, 90);
    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      title: 'Hello',
      theme: ThemeData(
        primaryColor: primaryBrown,
        primarySwatch: Colors.brown,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryBrown,
          elevation: 0.0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primaryBrown,
          selectedItemColor: Colors.black,
          elevation: 0.0,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: secondaryBrown,
          elevation: 10.0,
        ),

        // fontFamily: 'EasyWrite',
        // fontFamily: 'NotoSerifCJKtc',
        fontFamily: 'Setofont',
        textTheme: const TextTheme(
            // headlineSmall, Medium, Large, 1-6:
            // bodySmall, Medium, Large, 1-3:
            ),
      ),
      home: BlocProvider(
        create: (context) => BaseBloc(authProvider: AuthService.fromFirebase()),
        child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: const ScreensController()),
      ),
      routes: {
        '/explore-app': (context) => BlocProvider(
              create: (context) =>
                  BaseBloc(authProvider: AuthService.fromFirebase()),
              child: const AppLoginScreen(
                  isNavIn: true, slideDirection: NavDirection.leftWord),
            ),
        '/explore-org': (context) => BlocProvider(
              create: (context) =>
                  OrgBloc(authProvider: AuthService.fromFirebase()),
              child: const OrgScreen(
                isNavIn: true,
                slideDirection: NavDirection.leftWord,
              ),
            ),
        '/explore-event': (context) => BlocProvider(
              create: (context) =>
                  EventBloc(authProvider: AuthService.fromFirebase()),
              child: const EventScreen(
                isNavIn: true,
                slideDirection: NavDirection.leftWord,
              ),
            ),
      },
    );
  }
}
