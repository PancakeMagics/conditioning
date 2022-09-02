
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/auth/auth_provider_firebase.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';

class AuthService implements AuthProvider {
  final AuthProvider _authProvider;
  const AuthService(this._authProvider);
  factory AuthService.fromFirebase() => AuthService(AuthProviderFirebase());

  @override
  AuthAppUser? get authAppUser => _authProvider.authAppUser;
  @override
  List<AuthUser> get authUserList => _authProvider.authUserList;

  @override
  Future<AuthUser> appLoginAndNotify({required String email, required String password,}) => _authProvider.appLoginAndNotify(email: email, password: password,);

  @override
  Future<void> appLogout() => _authProvider.appLogout();

  @override
  Future<AuthUser> appRegisterAndLoginAndNotify({required String email, required String password}) => _authProvider.appRegisterAndLoginAndNotify(email: email, password: password,);

  @override
  Future<AuthUser> eventLoginAndNotify({required String email, required String password}) => _authProvider.eventLoginAndNotify(email: email, password: password,);

  @override
  Future<void> eventLogout() => _authProvider.eventLogout();

  @override
  Future<AuthUser> eventRegisterAndLoginAndNotify({required String email, required String password}) => _authProvider.eventRegisterAndLoginAndNotify(email: email, password: password,);

  @override
  Future<void> initialize() => _authProvider.initialize();

  @override
  Future<AuthUser> orgLoginAndNotify({required String email, required String password}) => _authProvider.orgLoginAndNotify(email: email, password: password,);

  @override
  Future<void> orgLogout() => _authProvider.orgLogout();

  @override
  Future<AuthUser> orgRegisterAndLoginAndNotify({required String email, required String password}) => _authProvider.orgRegisterAndLoginAndNotify(email: email, password: password,);

  @override
  Future<void> sendEmailVerification() => _authProvider.sendEmailVerification();

  @override
  Future<void> sendPasswordReset({required String toEmail}) => _authProvider.sendPasswordReset(toEmail: toEmail);
}
