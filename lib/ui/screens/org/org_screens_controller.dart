import 'package:conditioning/bloc/ui/org/org_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/animations/navigation/my_animated_slide.dart';
import 'package:conditioning/ui/screens/org/documention/screen_org_documention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrgScreensController extends StatefulWidget {
  const OrgScreensController({Key? key})
      : super(key: key);

  @override
  State<OrgScreensController> createState() => _OrgScreensControllerState();
}

class _OrgScreensControllerState extends State<OrgScreensController> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrgBloc>(
      create: (context) =>
          OrgBloc(authProvider: AuthService.fromFirebase(),
              storeProvider: StoreService.fromFirebase()),
      child: Container(),
    );
  }

  List<Widget> _getWidgetList() {
    return <Widget>[
      const OrgDocumentionScreen(isNavIn: true, slideDirection: NavDirection.rightWord),
    ];
  }
}

