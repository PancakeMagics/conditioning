
import 'package:conditioning/service/auth/auth_provider.dart';
import 'entities/auth_user.dart';

class AuthProviderFirebase extends AuthProvider {
  @override
  Future<void> initialize() async {
    // TODO: implement initialize
    return Future.delayed(const Duration(milliseconds: 0));
  }

  @override
  // TODO: implement currentUser
  AuthUser? get currentAuthUser => null;

  @override
  Future<AuthUser> appLoginAndNotify({required String email, required String password}) {
    // TODO: implement login
    return Future(() => const AuthAppUser(id: '00', email: 'app login email', registerNotVerified: true));
  }
  @override
  Future<AuthUser> appRegisterAndLoginAndNotify({required String email, required String password}) {
    // TODO: implement registerAndLogin
    return Future(() => const AuthAppUser(id: '00', email: 'app register email', registerNotVerified: true));
  }
  @override
  Future<void> appLogout() {
    // TODO: implement logout
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<AuthUser> eventLoginAndNotify({required String email, required String password}) {
    // TODO: implement login
    return Future(() => const AuthEventUser(id: '00', email: 'event login email', registerNotVerified: true));
  }

  @override
  Future<void> eventLogout() {
    // TODO: implement eventLogout
    return Future.delayed(const Duration(seconds: 1));
  }
  @override
  Future<AuthUser> eventRegisterAndLoginAndNotify({required String email, required String password}) {
    // TODO: implement registerAndLogin
    return Future(() => const AuthEventUser(id: '00', email: 'event register email', registerNotVerified: true));
  }

  @override
  Future<AuthUser> orgLoginAndNotify({required String email, required String password}) {
    // TODO: implement orgLoginAndNotify
    return Future(() => const AuthOrgUser(id: '00', email: 'org login email', registerNotVerified: true));
  }
  @override
  Future<void> orgLogout() {
    // TODO: implement orgLogout
    return Future.delayed(const Duration(seconds: 1));
  }
  @override
  Future<AuthUser> orgRegisterAndLoginAndNotify({required String email, required String password}) {
    // TODO: implement orgRegisterAndLoginAndNotify
    return Future(() => const AuthOrgUser(id: '00', email: 'org register email', registerNotVerified: true));
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
