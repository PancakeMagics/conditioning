import 'package:flutter/material.dart';

import 'my_colors.dart';

final appTheme = ThemeData(
  primaryColor: MyColors.spaceCadet,
  scaffoldBackgroundColor: MyColors.white,
  appBarTheme: const AppBarTheme(backgroundColor: MyColors.spaceCadet),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: MyColors.burgundy),
);
