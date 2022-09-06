import 'package:conditioning/bloc/services/auth/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth_user.dart';

@immutable
abstract class AuthProvider {
  const AuthProvider();

  Future<void> initialize();
  AuthAppUser? get authAppUser;
  List<AuthUser> get authUserList;

  //app
  Future<AuthAppUser> appRegisterAndLoginAndNotify({
    required String email,
    required String password,
  });
  Future<AuthAppUser> appLoginAndNotify({
  required String email,
    required String password,
  });
  Future<void> appLogout();

  //org
  Future<AuthOrgUser> orgRegisterAndLoginAndNotify({
    required String email,
    required String password,
  });
  Future<AuthOrgUser> orgLoginAndNotify({
    required String email,
    required String password,
  });
  Future<void> orgLogout();

  //event
  Future<AuthEventUser> eventRegisterAndLoginAndNotify({
    required String email,
    required String password,
  });
  Future<AuthEventUser> eventLoginAndNotify({
    required String email,
    required String password,
  });
  Future<void> eventLogout();


  Future<void> sendEmailVerification();
  Future<void> sendPasswordReset({required String toEmail});
}
