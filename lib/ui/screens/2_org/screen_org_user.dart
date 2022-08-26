import 'package:conditioning/service/l10n/util.dart';
import 'package:conditioning/ui/animations/slide_in_widget.dart';
import 'package:flutter/material.dart';

class OrgUser extends StatefulWidget {
  const OrgUser(
      {Key? key,
        required this.isSlideIn,
        required this.slideDirection,
        this.curve})
      : super(key: key);
  final bool isSlideIn;
  final SlideDirection slideDirection;
  final Curve? curve;

  @override
  State<OrgUser> createState() => _OrgUserState();
}

class _OrgUserState extends State<OrgUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.screenName_orgUser),
      ),
    );
  }
}

