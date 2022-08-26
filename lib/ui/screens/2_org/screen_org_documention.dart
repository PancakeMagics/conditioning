import 'package:conditioning/service/l10n/util.dart';
import 'package:flutter/material.dart';

class OrgDocumentionScreen extends StatefulWidget {
  const OrgDocumentionScreen({Key? key}) : super(key: key);

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
    );
  }
}

