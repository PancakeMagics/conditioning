import 'package:flutter/material.dart' show AppBarTheme, BuildContext, TextTheme, Theme, ThemeData;
import 'package:flutter_gen/gen_l10n/app_localizations.dart' show AppLocalizations;

extension Localization on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
}