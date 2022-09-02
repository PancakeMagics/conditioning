import 'package:flutter/material.dart';

@immutable
abstract class AuthState {
  final bool isLoading;
  final String? loadingText;
  final Exception? exception;

  const AuthState({
    required this.isLoading,
    this.loadingText,
    this.exception,
  });
}

class AuthStateInitialYet extends AuthState {
  const AuthStateInitialYet({
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}