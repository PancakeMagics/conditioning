import 'package:conditioning/ui/animations/navigation/my_animated_slide.dart';
import 'package:conditioning/ui/screens/event/management/screen_management.dart';
import 'package:flutter/material.dart';

class EventScreensController extends StatefulWidget {
  const EventScreensController({Key? key})
      : super(key: key);

  @override
  State<EventScreensController> createState() => _EventScreensControllerState();
}

class _EventScreensControllerState extends State<EventScreensController> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  List<Widget> _getWidgetList() {
    return <Widget>[
      const ManagementScreen(
          isNavIn: true, slideDirection: NavDirection.rightWord),
    ];
  }
}
