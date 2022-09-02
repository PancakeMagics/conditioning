import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/ui/event/event_bloc.dart';
import 'package:conditioning/service/utils/intl/util.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:conditioning/ui/elements/view_loading.dart';
import 'package:conditioning/ui/screens/event/management/screen_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventScreensController extends StatefulWidget {
  const EventScreensController({
    Key? key,
    required this.isNavIn,
    required this.slideDirection,
  })
  : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;

  @override
  State<EventScreensController> createState() => _EventScreensControllerState();
}

class _EventScreensControllerState extends State<EventScreensController> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventBloc, AuthState>(
      builder: (context, state) => Stack(children: [..._getWidgetList()]),
      listener: (context, state) {
        if (state.isLoading) {
          LoadingView().showOverlay(context: context);
        } else {
          LoadingView().hideOverlay();
        }
      },
    );
  }

  List<Widget> _getWidgetList() {
    return <Widget>[
      const ManagementScreen(isNavIn: true, slideDirection: NavDirection.rightWord),
    ];
  }
}
