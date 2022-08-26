import 'package:flutter/material.dart';

@immutable
class AuthUser {
  final String id;
  final String email;
  final bool registerNotVerified;
  const AuthUser({
    required this.id,
    required this.email,
    required this.registerNotVerified,
});
  // factory AuthUser.fromFirebase(User)
}
