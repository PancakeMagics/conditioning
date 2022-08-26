
import 'package:conditioning/service/auth/entities/auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();

  AuthUser? get currentUser;
  Future<AuthUser> loginAndNotify({
  required String email,
    required String password,
});
  Future<AuthUser> registerAndLoginAndNotify({
    required String email,
    required String password,
  });

  Future<void> logout();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordReset({required String toEmail});
}
