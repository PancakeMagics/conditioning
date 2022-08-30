import 'package:conditioning/service/intl/util.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({
    Key? key,
    required this.isNavIn,
    required this.slideDirection,
    this.curve})
  : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;
  final Curve? curve;

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.screenName_eventUser),
      ),
      body: widget.isNavIn ? Container() : Container(),
    );
  }
}
