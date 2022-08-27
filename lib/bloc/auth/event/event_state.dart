part of 'event_bloc.dart';

class EventStateInitialYet extends AppUserStateLogin {
  const EventStateInitialYet({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class EventStateInitialed extends AppUserStateLogin {
  const EventStateInitialed({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class EventUserStateLoginYet extends EventStateInitialed {
  const EventUserStateLoginYet({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class EventUserStateRegisterYet extends EventUserStateLoginYet {
  const EventUserStateRegisterYet({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class EventUserStateForgotPassword extends EventUserStateLoginYet {
  final bool hasSentEmail;
  const EventUserStateForgotPassword({
    required this.hasSentEmail,
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class EventUserStateLogin extends EventStateInitialed {
  final AuthEventUser? authEventUser;
  const EventUserStateLogin({
    required this.authEventUser,
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}

class EventUserStateLogout extends EventUserStateLogin {
  const EventUserStateLogout({
    required super.authAppUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  }) : super(authEventUser: null);
}

class EventUserStateLogoutYet extends EventUserStateLogin {
  const EventUserStateLogoutYet({
    required super.authAppUser,
    required super.authEventUser,
    required super.isLoading,
    super.loadingText,
    super.exception,
  });
}