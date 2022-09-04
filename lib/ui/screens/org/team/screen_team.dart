import 'package:conditioning/bloc/ui/org/org_bloc.dart';
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrgTeamScreen extends StatefulWidget {
  const OrgTeamScreen({Key? key}) : super(key: key);

  @override
  State<OrgTeamScreen> createState() => _OrgTeamScreenState();
}

class _OrgTeamScreenState extends State<OrgTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.loc.screenName_orgDocumention),
            IconButton(
                onPressed: () {
                  context
                      .read<OrgBloc>()
                      .add(const OrgEventTeamToHome());
                },
                icon: const Icon(Icons.home)),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
