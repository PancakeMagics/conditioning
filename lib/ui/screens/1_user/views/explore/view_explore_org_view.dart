import 'package:conditioning/service/store/entities/org.dart';
import 'package:flutter/material.dart';

class ExploreOrgViewView extends StatefulWidget {
  const ExploreOrgViewView({
    Key? key,
    required this.org,
  }) : super(key: key);
  final Org? org;

  @override
  State<ExploreOrgViewView> createState() => _ExploreOrgViewViewState();
}

class _ExploreOrgViewViewState extends State<ExploreOrgViewView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        child: Center(child: Text(widget.org?.orgName ?? '')),
      ),
    );
  }
}
