
import 'package:conditioning/service/intl/util.dart';
import 'package:flutter/material.dart';

class ExploreOrgsScreen extends StatefulWidget {
  const ExploreOrgsScreen({Key? key}) : super(key: key);

  @override
  State<ExploreOrgsScreen> createState() => _ExploreOrgsScreenState();
}

class _ExploreOrgsScreenState extends State<ExploreOrgsScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.viewTitle_exploreOrgs),
      ),
    );
  }
}

