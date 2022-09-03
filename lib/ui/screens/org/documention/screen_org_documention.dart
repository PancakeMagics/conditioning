import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:conditioning/ui/animations/navigation/my_animated_slide.dart';
import 'package:flutter/material.dart';

class OrgDocumentionScreen extends StatefulWidget {
  const OrgDocumentionScreen(
      {Key? key,
        required this.isNavIn,
        required this.slideDirection,
        this.curve})
      : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;
  final Curve? curve;

  @override
  State<OrgDocumentionScreen> createState() => _OrgDocumentionScreenState();
}

class _OrgDocumentionScreenState extends State<OrgDocumentionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.screenName_orgDocumention),
      ),
      body: widget.isNavIn ? Container() : Container(),
    );
  }
}

