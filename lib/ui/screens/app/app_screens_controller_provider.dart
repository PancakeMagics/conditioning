import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/entities/providers/store_user_provider.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/service/utils/constants/option_store.dart';
import 'package:conditioning/service/store/entities/providers/local/preferences/shared_preference_utils.dart';
import 'package:conditioning/ui/screens/app/app_screens_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;

class AppScreensControllerProvider extends StatelessWidget {
  const AppScreensControllerProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context) => AppBloc(
        prefs: SharedPreferenceUtils().preferences!,
        authProvider: AuthService.fromFirebase(),
        storeProvider:
            StoreService.getFromFirebase(storeOption: StoreOption.user)
                as StoreUserProvider,
      ),
      child: const AppScreensController(),
    );
  }
}
