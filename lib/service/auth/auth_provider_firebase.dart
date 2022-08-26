
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';

class AuthProviderFirebase extends AuthProvider {
  @override
  Future<void> initialize() async {
    // TODO: implement initialize
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  // TODO: implement currentUser
  AuthUser? get currentUser => null;

  @override
  Future<AuthUser> loginAndNotify({required String email, required String password}) {
    // TODO: implement login
    return Future(() => const AuthUser(id: '00', email: 'login email', registerNotVerified: true));
  }

  @override
  Future<AuthUser> registerAndLoginAndNotify({required String email, required String password}) {
    // TODO: implement registerAndLogin
    return Future(() => const AuthUser(id: '00', email: 'register email', registerNotVerified: true));
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> sendPasswordReset({required String toEmail}) {
    // TODO: implement sendPasswordReset
    return Future.delayed(const Duration(seconds: 1));
  }
}
