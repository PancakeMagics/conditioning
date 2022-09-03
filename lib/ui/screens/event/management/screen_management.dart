import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:conditioning/ui/animations/navigation/my_animated_slide.dart';
import 'package:flutter/material.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen(
      {Key? key,
        required this.isNavIn,
        required this.slideDirection,
        this.curve})
      : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;
  final Curve? curve;

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
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

