
import 'package:flutter/material.dart';

@immutable
abstract class StorageProvider {
  Future<void> initialize();
}