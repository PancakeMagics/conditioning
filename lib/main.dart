import 'package:conditioning/bloc/app_user/app_user_bloc.dart';
import 'package:conditioning/service/auth/auth_provider_firebase.dart';
import 'package:conditioning/service/l10n/util.dart';
import 'package:conditioning/ui/animations/slide_in_widget.dart';
import 'package:conditioning/ui/elements/view_loading.dart';
import 'package:conditioning/ui/screens/0_base/screen_app_login.dart';
import 'package:conditioning/ui/screens/1_user/screen_app_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

import 'dart:developer' show log;

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
        create: (context) => AppUserBloc(authProvider: AuthProviderFirebase()),
        child: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<AppUserBloc>().add(const AppUserEventInitialize());

    return BlocConsumer<AppUserBloc, AppUserState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingView().show(context: context, text: context.loc.loading);
        } else {
          LoadingView().hide();
        }
      },
      builder: (context, state) {
        log(context.read<AppUserBloc>().state.toString());

        if (state is AppUserStateLoginYet) {
          return const AppLoginScreen(slideDirection: SlideDirection.upWord, isSlideIn: true,);
        } else if (state is AppUserStateLogin) {
          return const AppUserScreen();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
