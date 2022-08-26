import 'package:conditioning/bloc/auth/auth_bloc.dart';

class EventUserStateLogout extends AppUserStateEventUserLogin {
  const EventUserStateLogout({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(authEventUser: null);
}

class EventUserStateLogoutYet extends AppUserStateEventUserLogin {
  const EventUserStateLogoutYet({
    required super.authAppUser,
    required super.authEventUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class EventUserStateManagement extends AppUserStateEventUserLogin {
  const EventUserStateManagement({
    required super.authAppUser,
    required super.authEventUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}
