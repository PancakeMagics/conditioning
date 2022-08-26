import 'package:conditioning/service/l10n/util.dart';
import 'package:flutter/material.dart';

class EventManagementScreen extends StatefulWidget {
  const EventManagementScreen({Key? key}) : super(key: key);

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
    );
  }
}

