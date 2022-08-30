import 'package:conditioning/service/intl/util.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:flutter/material.dart';

class OrgScreen extends StatefulWidget {
  const OrgScreen(
      {Key? key,
        required this.isNavIn,
        required this.slideDirection,
        this.curve})
      : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;
  final Curve? curve;

  @override
  State<OrgScreen> createState() => _OrgScreenState();
}

class _OrgScreenState extends State<OrgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.screenName_orgUser),
      ),
      body: widget.isNavIn ? Container() : Container(),
    );
  }
}

