import 'package:conditioning/service/l10n/util.dart';
import 'package:flutter/material.dart';

class ExploreEventsScreen extends StatefulWidget {
  const ExploreEventsScreen({Key? key}) : super(key: key);

  @override
  State<ExploreEventsScreen> createState() => _ExploreEventsScreenState();
}

class _ExploreEventsScreenState extends State<ExploreEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.viewTitle_exploreEvents),
      ),
    );
  }
}