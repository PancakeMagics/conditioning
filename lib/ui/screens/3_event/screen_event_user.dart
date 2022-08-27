import 'package:conditioning/service/intl/util.dart';
import 'package:conditioning/ui/animations/slide_in_widget.dart';
import 'package:flutter/material.dart';

class EventUserScreen extends StatefulWidget {
  const EventUserScreen({
    Key? key,
    required this.isSlideIn,
    required this.slideDirection,
    this.curve})
  : super(key: key);
  final bool isSlideIn;
  final SlideDirection slideDirection;
  final Curve? curve;

  @override
  State<EventUserScreen> createState() => _EventUserScreenState();
}

class _EventUserScreenState extends State<EventUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.screenName_eventUser),
      ),
    );
  }
}
