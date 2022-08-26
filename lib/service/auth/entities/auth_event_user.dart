part of 'auth_user.dart';

@immutable
class AuthEventUser extends AuthUser {
  const AuthEventUser({
    required super.id,
    required super.email,
    required super.registerNotVerified,
  });
// factory AuthUser.fromFirebase(User)
}

