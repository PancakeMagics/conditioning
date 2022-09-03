
import 'package:conditioning/service/settings/animation_durations.dart';
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:flutter/material.dart';

extension NotYetComplete on BuildContext {
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