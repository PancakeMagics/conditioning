import 'package:conditioning/service/store/utils/animation_durations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' show AppLocalizations;

extension MyBuildContextExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;

  void showNotYetCompletedSnackBar() {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: SizedBox(
            height: 50,
            child: Center(
              child: Text(loc.notYetComplete),
            )),
        duration: longDuration,
      ),
    );
  }
}