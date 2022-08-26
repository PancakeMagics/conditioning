import 'package:conditioning/service/l10n/util.dart';
import 'package:flutter/material.dart';

class OrgUser extends StatefulWidget {
  const OrgUser({Key? key}) : super(key: key);

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

