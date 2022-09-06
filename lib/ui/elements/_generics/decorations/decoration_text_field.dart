import 'package:flutter/material.dart';
import '../theme/my_colors.dart';

const decorationTextField = InputDecoration(
  labelStyle: TextStyle(
    color: MyColors.indyBlue,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: MyColors.indyBlue, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: MyColors.indyBlue, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.5),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.5),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);
