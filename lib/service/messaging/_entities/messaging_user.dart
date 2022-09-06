import 'package:conditioning/service/store/utils/app_settings.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MessagingUser {
  final String id;
  final String email;
  final String? name;
  const MessagingUser({required this.id, required this.email, this.name});
}
