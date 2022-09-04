import 'package:conditioning/bloc/ui/org/org_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;

import 'org_screens_controller.dart';

class OrgScreensControllerProvider extends StatelessWidget {
  const OrgScreensControllerProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrgBloc>(
        create: (context) => OrgBloc(
          authProvider: AuthService.fromFirebase(),
          storeProvider: StoreService.fromFirebase(),
        ),
        child: const OrgScreensController(),
    );
  }
}
