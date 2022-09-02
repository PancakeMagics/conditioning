import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/ui/org/org_bloc.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:conditioning/ui/elements/view_loading.dart';
import 'package:conditioning/ui/screens/org/documention/screen_org_documention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrgScreensController extends StatefulWidget {
  const OrgScreensController(
      {Key? key,
        required this.isNavIn,
        required this.slideDirection,
      })
      : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;

  @override
  State<OrgScreensController> createState() => _OrgScreensControllerState();
}

class _OrgScreensControllerState extends State<OrgScreensController> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrgBloc, AuthState>(
      builder: (context, state) => Stack(children: [..._getWidgetList()]),
      listener: (context, state) {
        if (state.isLoading) {
          LoadingView().showOverlay(context: context);
        } else {
          LoadingView().hideOverlay();
        }
      },
    );
  }

  List<Widget> _getWidgetList() {
    return <Widget>[
      const OrgDocumentionScreen(isNavIn: true, slideDirection: NavDirection.rightWord),
    ];
  }
}

