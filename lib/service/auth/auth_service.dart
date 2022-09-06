
import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/auth/entities/providers/auth_user_provider_firebase.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService implements AuthProvider {
  final AuthProvider _authProvider;
  const AuthService(this._authProvider);
  factory AuthService.fromFirebase() => AuthService(AuthProviderFirebase());

  @override
  Future<void> initialize() => _authProvider.initialize();

  @override
  AuthAppUser? get authAppUser => _authProvider.authAppUser;

  @override
  Future<AuthAppUser> appRegisterAndLoginAndNotify({required String email, required String password}) => _authProvider.appRegisterAndLoginAndNotify(email: email, password: password,);

  @override
  Future<AuthAppUser> appLoginAndNotify({required String email, required String password,}) => _authProvider.appLoginAndNotify(email: email, password: password,);

  @override
  Future<void> appLogout() => _authProvider.appLogout();

  @override
  List<AuthUser> get authUserList => _authProvider.authUserList;

  @override
  Future<AuthEventUser> eventRegisterAndLoginAndNotify({required String email, required String password}) => _authProvider.eventRegisterAndLoginAndNotify(email: email, password: password,);

  @override
  Future<AuthEventUser> eventLoginAndNotify({required String email, required String password}) => _authProvider.eventLoginAndNotify(email: email, password: password,);

  @override
  Future<void> eventLogout() => _authProvider.eventLogout();

  @override
  Future<AuthOrgUser> orgLoginAndNotify({required String email, required String password}) => _authProvider.orgLoginAndNotify(email: email, password: password,);

  @override
  Future<AuthOrgUser> orgRegisterAndLoginAndNotify({required String email, required String password}) => _authProvider.orgRegisterAndLoginAndNotify(email: email, password: password,);

  @override
  Future<void> orgLogout() => _authProvider.orgLogout();

  @override
  Future<void> sendEmailVerification() => _authProvider.sendEmailVerification();

  @override
  Future<void> sendPasswordReset({required String toEmail}) => _authProvider.sendPasswordReset(toEmail: toEmail);
}
