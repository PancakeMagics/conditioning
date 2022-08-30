import 'package:conditioning/service/intl/util.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:flutter/material.dart';

class EventManagementScreen extends StatefulWidget {
  const EventManagementScreen(
      {Key? key,
        required this.isNavIn,
        required this.slideDirection,
        this.curve})
      : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;
  final Curve? curve;

  @override
  State<EventManagementScreen> createState() => _EventManagementScreenState();
}

class _EventManagementScreenState extends State<EventManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.screenName_eventManagement),
      ),
      body: widget.isNavIn ? Container() : Container(),
    );
  }
}

