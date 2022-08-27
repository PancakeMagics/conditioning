
abstract class AuthException implements Exception {}

//login exceptions
class LoginException implements AuthException {}
class UserNotFoundAuthException implements LoginException {}
class WrongPasswordAuthException implements LoginException {}
class UserNotLoggedInException implements LoginException {}

//register exceptions
class RegisterException implements AuthException {}
class WeakPasswordAuthException implements RegisterException {}
class EmailAlreadyInUseAuthException implements RegisterException {}
class InvalidEmailAuthException implements RegisterException {}