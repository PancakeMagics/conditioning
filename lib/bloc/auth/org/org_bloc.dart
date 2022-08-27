import 'package:bloc/bloc.dart';
import 'package:conditioning/bloc/auth/app/app_bloc.dart';
import 'package:conditioning/bloc/auth/auth_bloc.dart';
import 'package:conditioning/bloc/auth/auth_event.dart';
import 'package:conditioning/service/auth/auth_provider.dart';
import 'package:conditioning/service/auth/entities/auth_user.dart';
import 'package:meta/meta.dart';

import '../auth_state.dart';

part 'org_event.dart';
part 'org_state.dart';

class OrgBloc extends AppBloc {
  AuthOrgUser? authOrgUser;

  OrgBloc({required AuthProvider authProvider}) : super(authProvider: authProvider) {
    on<OrgUserEventLogin>((event, emit) async {
      await _orgUserLoginTryCatch(emit, () async {
        authOrgUser = await authProvider.orgLoginAndNotify(
            email: event.email, password: event.password) as AuthOrgUser;
      });
    });
    on<OrgUserEventRegisterAndLogin>((event, emit) async {
      await _orgUserLoginTryCatch(emit, () async {
        authOrgUser = await authProvider.orgRegisterAndLoginAndNotify(
            email: event.email, password: event.password) as AuthOrgUser;
      });
    });
    on<OrgUserEventLogout>((event, emit) async {
      try {
        await authProvider.orgLogout();
        authOrgUser = null;
        emit(OrgUserStateLogout(authAppUser: authAppUser, isLoading: false));
      } on Exception catch (e) {
        emit(OrgUserStateLogoutYet(
            exception: e,
            authAppUser: authAppUser,
            authOrgUser: authOrgUser,
            isLoading: false));
      }
    });
  }

  _orgUserLoginTryCatch(Emitter<AuthState> emit, AuthFunction function) async {
    emit(OrgUserStateLoginYet(isLoading: true, authAppUser: authAppUser));
    try {
      await function();
      emit(OrgUserStateLogin(
          isLoading: false,
          authAppUser: authAppUser,
          authOrgUser: authOrgUser));
    } on Exception catch (e) {
      emit(OrgUserStateLoginYet(
          exception: e, isLoading: false, authAppUser: authAppUser));
    }
  }
}
