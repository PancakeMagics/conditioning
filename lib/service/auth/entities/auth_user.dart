import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart' show immutable;

part 'auth_user_app.dart';

part 'auth_user_org.dart';

part 'auth_user_event.dart';

@immutable
abstract class AuthUser {
  final String id;
  final String? email;
  final bool registerNotVerified;
  final String? displayName;
  final bool? isAnonymous;
  final String? phoneNumber;
  final String? photoURL;

  const AuthUser({
    required this.id,
    required this.email,
    required this.registerNotVerified,
    required this.isAnonymous,
    this.displayName,
    this.photoURL,
    this.phoneNumber,
  });
}

enum AuthUserType {
  appUser,
  orgUser,
  eventUser,
}