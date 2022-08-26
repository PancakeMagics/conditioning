import 'package:conditioning/service/l10n/util.dart';
import 'package:flutter/material.dart';

class EventUserScreen extends StatefulWidget {
  const EventUserScreen({Key? key}) : super(key: key);

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
