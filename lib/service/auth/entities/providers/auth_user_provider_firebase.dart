
import 'package:conditioning/firebase_options.dart';
import 'package:conditioning/service/auth/entities/providers/auth_user_provider.dart';
import 'package:conditioning/service/store/utils/store_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth_user.dart';

class AuthProviderFirebase extends AuthProvider {
  late final FirebaseAuth _auth;

  @override
  Future<void> initialize() async {
    final app = await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    _auth = FirebaseAuth.instance;
  }

  @override
  AuthAppUser? get authAppUser => CurrentAppUser().currentUser; // TODO: check if current app user is the same

  @override
  Future<AuthAppUser> appRegisterAndLoginAndNotify({required String email, required String password}) async {
    final credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    CurrentAppUser().currentUser = AuthAppUser.fromFirebase(credential.user!);
    return authAppUser!;
  }

  @override
  Future<AuthAppUser> appLoginAndNotify({required String email, required String password}) async {
    final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    CurrentAppUser().currentUser = AuthAppUser.fromFirebase(credential.user!);
    return authAppUser!;
  }

  @override
  Future<void> appLogout() async {
    CurrentAppUser().currentUser = null;
    return await _auth.signOut();
  }

  // TODO: implement
  @override
  List<AuthUser> get authUserList => [];
  @override
  Future<AuthEventUser> eventRegisterAndLoginAndNotify({required String email, required String password}) {
    return Future(() => const AuthEventUser(id: '00', email: 'event register email', registerNotVerified: true));
  }

  @override
  Future<AuthEventUser> eventLoginAndNotify({required String email, required String password}) {
    return Future(() => const AuthEventUser(id: '00', email: 'event login email', registerNotVerified: true));
  }
  @override
  Future<void> eventLogout() {
    return Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<AuthOrgUser> orgRegisterAndLoginAndNotify({required String email, required String password}) {
    return Future(() => const AuthOrgUser(id: '00', email: 'org register email', registerNotVerified: true));
  }
  @override
  Future<AuthOrgUser> orgLoginAndNotify({required String email, required String password}) {
    return Future(() => const AuthOrgUser(id: '00', email: 'org login email', registerNotVerified: true));
  }
  @override
  Future<void> orgLogout() {
    return Future.delayed(const Duration(seconds: 0));
  }

  // TODO
  @override
  Future<void> sendEmailVerification() {
    return Future.delayed(const Duration(seconds: 0));
  }
  @override
  Future<void> sendPasswordReset({required String toEmail}) {
    return Future.delayed(const Duration(seconds: 0));
  }
}
