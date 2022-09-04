import 'package:conditioning/bloc/ui/org/org_bloc.dart';
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

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
        backgroundColor: Colors.blueGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.loc.screenName_orgDocumention),
            IconButton(
                onPressed: () {
                  context
                      .read<OrgBloc>()
                      .add(const OrgEventDocumentionToHome());
                },
                icon: const Icon(Icons.home)),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
