import 'package:flutter/cupertino.dart';

class KeyboardUtils {
  static bool isKeyboardShowing() => WidgetsBinding.instance.window.viewInsets.bottom > 0;
  static closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}