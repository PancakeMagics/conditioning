
abstract class AuthException implements Exception {}

//login exceptions
class UserNotFoundAuthException implements AuthException {}
class WrongPasswordAuthException implements AuthException {}
class UserNotLoggedInException implements Exception {}

//register exceptions
class WeakPasswordAuthException implements AuthException {}
class EmailAlreadyInUseAuthException implements AuthException {}
class InvalidEmailAuthException implements AuthException {}