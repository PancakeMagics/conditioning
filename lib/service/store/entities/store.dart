
import 'package:flutter/material.dart';

part 'store_user.dart';
part 'store_org.dart';
part 'store_event.dart';

@immutable
abstract class Store {
  final String id;
  final String name;
  const Store({required this.id, required this.name});
}