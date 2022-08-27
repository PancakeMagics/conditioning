import 'package:conditioning/service/intl/util.dart';
import 'package:flutter/material.dart';

class ExploreEventsView extends StatefulWidget {
  const ExploreEventsView({Key? key}) : super(key: key);

  @override
  State<ExploreEventsView> createState() => _ExploreEventsViewState();
}

class _ExploreEventsViewState extends State<ExploreEventsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.viewTitle_exploreEvents),
      ),
    );
  }
}