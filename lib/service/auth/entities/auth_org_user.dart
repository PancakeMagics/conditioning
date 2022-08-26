part of 'auth_user.dart';

@immutable
class AuthOrgUser extends AuthUser {
  const AuthOrgUser({
    required super.id,
    required super.email,
    required super.registerNotVerified,
  });
// factory AuthUser.fromFirebase(User)
}
