part of 'auth_user.dart';

@immutable
class AuthOrgUser extends AuthUser {
  const AuthOrgUser({
    required super.id,
    required super.email,
    required super.registerNotVerified,
    super.isAnonymous,
    super.displayName,
    super.photoURL,
    super.phoneNumber,
  });

  factory AuthOrgUser.fromFirebase(User user) => AuthOrgUser(
    id: user.uid,
    email: user.email,
    registerNotVerified: !user.emailVerified,
    isAnonymous: user.isAnonymous,
    displayName: user.displayName,
    photoURL: user.photoURL,
    phoneNumber: user.phoneNumber,
  );
}
