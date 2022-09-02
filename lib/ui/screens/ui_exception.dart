
import 'package:flutter/material.dart';

@immutable
abstract class NavigationException implements Exception {
  const NavigationException();
}

class NoSuchNavigationLoginOption extends NavigationException {
  const NoSuchNavigationLoginOption();
}
