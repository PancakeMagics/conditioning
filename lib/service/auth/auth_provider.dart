import 'package:flutter/material.dart';
import 'entities/auth_user.dart';

@immutable
abstract class AuthProvider {
  Future<void> initialize();
  AuthAppUser? get authAppUser;
  List<AuthUser> get authUserList;

  //app
  Future<AuthUser> appLoginAndNotify({
  required String email,
    required String password,
  });
  Future<AuthUser> appRegisterAndLoginAndNotify({
    required String email,
    required String password,
  });
  Future<void> appLogout();

  //org
  Future<AuthUser> orgLoginAndNotify({
    required String email,
    required String password,
  });
  Future<AuthUser> orgRegisterAndLoginAndNotify({
    required String email,
    required String password,
  });
  Future<void> orgLogout();

  //event
  Future<AuthUser> eventLoginAndNotify({
    required String email,
    required String password,
  });
  Future<AuthUser> eventRegisterAndLoginAndNotify({
    required String email,
    required String password,
  });
  Future<void> eventLogout();


  Future<void> sendEmailVerification();
  Future<void> sendPasswordReset({required String toEmail});
}
