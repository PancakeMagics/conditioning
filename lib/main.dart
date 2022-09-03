import 'package:conditioning/bloc/login_option.dart';
import 'package:conditioning/ui/screens/_login/_setup/login_screens_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

void main() {
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
        child: const LoginScreensProvider(
          loginOption: LoginOption.app,
          enableLoginScreensNavigation: true,
          navigationSetUpFinished: false,
        ),
      ),
    );
  }
}
