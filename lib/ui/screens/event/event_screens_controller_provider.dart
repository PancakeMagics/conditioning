import 'package:conditioning/bloc/ui/event/event_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/screens/event/event_screens_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;

class EventScreensControllerProvider extends StatelessWidget {
  const EventScreensControllerProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventBloc>(
        create: (context) => EventBloc(
          authProvider: AuthService.fromFirebase(),
          storeProvider: StoreService.fromFirebase(),
        ),
        child: const EventScreensController(),
    );
  }
}
