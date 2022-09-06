part of 'auth_user.dart';

@immutable
class AuthEventUser extends AuthUser {
  const AuthEventUser({
    required super.id,
    required super.email,
    required super.registerNotVerified,
    super.isAnonymous,
    super.displayName,
    super.photoURL,
    super.phoneNumber,
  });

  factory AuthEventUser.fromFirebase(User user) => AuthEventUser(
    id: user.uid,
    email: user.email,
    registerNotVerified: !user.emailVerified,
    isAnonymous: user.isAnonymous,
    displayName: user.displayName,
    photoURL: user.photoURL,
    phoneNumber: user.phoneNumber,
  );
}
