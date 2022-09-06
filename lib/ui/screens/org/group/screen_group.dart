import 'package:conditioning/bloc/ui/org/org_bloc.dart';
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrgGroupScreen extends StatefulWidget {
  const OrgGroupScreen({Key? key}) : super(key: key);

  @override
  State<OrgGroupScreen> createState() => _OrgGroupScreenState();
}

class _OrgGroupScreenState extends State<OrgGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.loc.screenName_orgGroup),
            IconButton(
                onPressed: () {
                  context
                      .read<OrgBloc>()
                      .add(const OrgEventGroupToHome());
                },
                icon: const Icon(Icons.home)),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
