part of 'auth_user.dart';

@immutable
class AuthAppUser extends AuthUser {
  const AuthAppUser({
    required super.id,
    required super.email,
    required super.registerNotVerified,
    super.name,
});
  // factory AuthUser.fromFirebase(User)
}
