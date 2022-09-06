import 'package:flutter/material.dart' show immutable;

@immutable
abstract class StoreProvider {
  Future<void> initialize();
  const StoreProvider();
}