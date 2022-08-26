part of 'app_user_bloc.dart';

@immutable
abstract class AppUserState {
  final bool isLoading;
  final String? loadingText;
  final Exception? exception;
  const AppUserState(
      {required this.isLoading, this.loadingText, this.exception});
}

class AppUserStateForgotPassword extends AppUserStateLoginYet {
  final bool hasSentEmail;
  const AppUserStateForgotPassword({required bool isLoading, String? loadingText, required this.hasSentEmail, Exception? exception}): super(
    isLoading: isLoading,
    loadingText: loadingText,
    exception: exception,
  );
}

class AppUserStateInitial extends AppUserState {
  const AppUserStateInitial({required bool isLoading, String? loadingText, Exception? exception})
      : super(
          isLoading: isLoading,
          loadingText: loadingText,
    exception: exception,
        );
}

class AppUserStateLogin extends AppUserState {
  final AuthUser authUser;
  final StoreUser? storeUser;
  const AppUserStateLogin({required this.authUser, this.storeUser}) : super(isLoading: false);
}

class AppUserStateLoginYet extends AppUserStateInitial {
  const AppUserStateLoginYet({required bool isLoading, String? loadingText, Exception? exception})
      : super(
          isLoading: isLoading,
          loadingText: loadingText,
    exception: exception,
        );
}

class AppUserStateRegisterYet extends AppUserStateInitial {
  final String? registerSuccessMessage;
  const AppUserStateRegisterYet({required bool isLoading, String? loadingText, Exception? exception, this.registerSuccessMessage})
      : super(
    isLoading: isLoading,
    loadingText: loadingText,
    exception: exception,
  );
}