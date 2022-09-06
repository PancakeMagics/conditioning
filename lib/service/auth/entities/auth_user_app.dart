part of 'auth_user.dart';

@immutable
class AuthAppUser extends AuthUser {
  const AuthAppUser({
    required super.id,
    required super.email,
    required super.registerNotVerified,
    super.isAnonymous,
    super.displayName,
    super.photoURL,
    super.phoneNumber,
  });

  factory AuthAppUser.fromFirebase(User user) => AuthAppUser(
    id: user.uid,
    email: user.email,
    registerNotVerified: !user.emailVerified,
    isAnonymous: user.isAnonymous,
    displayName: user.displayName,
    photoURL: user.photoURL,
    phoneNumber: user.phoneNumber,
  );
}

class CurrentAppUser {
  CurrentAppUser._sharedInstance();
  factory CurrentAppUser() => _shared;
  static final CurrentAppUser _shared = CurrentAppUser._sharedInstance();
  AuthAppUser? currentUser;
}