import 'package:conditioning/service/store/entities/providers/local/preferences/shared_preference_utils.dart';
import 'package:conditioning/todo/ui/page_home.dart';
import 'package:conditioning/ui/screens/app/home/views/view_profile.dart';
import 'package:conditioning/ui/screens/org/org_screens_controller_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceUtils().preferences = await SharedPreferences.getInstance();

  // TODO: tempt initialization
  final app = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      title: 'Conditioning',
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
      home: Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // child: const LoginScreensProvider(
        //   loginOption: LoginOption.app,
        //   enableLoginScreensNavigation: true,
        //   navigationSetUpFinished: false,
        //   enableBackButton: false,
        // ),
        // child: const OrgScreensControllerProvider(),
        child: const HomePage(), // TODO:
      ),
    );
  }
}
