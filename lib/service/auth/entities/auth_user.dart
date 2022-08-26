import 'package:flutter/material.dart';

part 'auth_app_user.dart';
part 'auth_org_user.dart';
part 'auth_event_user.dart';

@immutable
abstract class AuthUser {
  final String id;
  final String email;
  final bool registerNotVerified;
  const AuthUser({required this.id, required this.email, required this.registerNotVerified});
}