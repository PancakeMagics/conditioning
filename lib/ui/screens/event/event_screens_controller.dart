import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/ui/event/event_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:conditioning/ui/animations/navigation/my_animated_slide.dart';
import 'package:conditioning/ui/elements/view_loading.dart';
import 'package:conditioning/ui/screens/event/management/screen_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventScreensController extends StatefulWidget {
  const EventScreensController({Key? key})
      : super(key: key);

  @override
  State<EventScreensController> createState() => _EventScreensControllerState();
}

class _EventScreensControllerState extends State<EventScreensController> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventBloc>(
      create: (context) =>
        EventBloc(authProvider: AuthService.fromFirebase(),
            storeProvider: StoreService.fromFirebase()),
      child: Container(),
    );
  }

  List<Widget> _getWidgetList() {
    return <Widget>[
      const ManagementScreen(
          isNavIn: true, slideDirection: NavDirection.rightWord),
    ];
  }
}
