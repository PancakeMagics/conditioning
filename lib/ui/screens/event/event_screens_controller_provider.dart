import 'package:conditioning/bloc/ui/event/event_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/entities/providers/store_event_provider.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/service/utils/constants/option_store.dart';
import 'package:conditioning/service/store/entities/providers/local/preferences/shared_preference_utils.dart';
import 'package:conditioning/ui/screens/event/event_screens_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;

class EventScreensControllerProvider extends StatelessWidget {
  const EventScreensControllerProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventBloc>(
        create: (context) => EventBloc(
          prefs: SharedPreferenceUtils().preferences!,
          authProvider: AuthService.fromFirebase(),
          storeProvider: StoreService.getFromFirebase(storeOption: StoreOption.event) as StoreEventProvider,
        ),
        child: const EventScreensController(),
    );
  }
}
