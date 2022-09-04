import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/ui/org/org_bloc.dart';
import 'package:conditioning/service/settings/animation_durations.dart';
import 'package:conditioning/ui/elements/view_loading.dart';
import 'package:conditioning/ui/screens/org/documention/screen_documention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/screen_home.dart';
import 'team/screen_team.dart';

class OrgScreensController extends StatefulWidget {
  const OrgScreensController({Key? key})
      : super(key: key);

  @override
  State<OrgScreensController> createState() => _OrgScreensControllerState();
}

class _OrgScreensControllerState extends State<OrgScreensController> {
  late Offset _homeOffset;
  late Offset _teamOffset;
  late Offset _documentionOffset;

  @override
  void initState() {
    _teamOffset = const Offset(-1.0, 0.0);
    _homeOffset = Offset.zero;
    _documentionOffset = const Offset(1.0, 0.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_homeOffset == Offset.zero) {
      context.read<OrgBloc>().add(const OrgEventStoreHomeScreenData());
    } else if (_teamOffset == Offset.zero) {
      context.read<OrgBloc>().add(const OrgEventStoreTeamScreenData());
    }

    return BlocListener<OrgBloc, AuthState>(
      listener: (context, state) {
        if (state is OrgStateDataStore) {
          loadingListener(context, state);
        } else if (state is OrgNavigationState) {
          setState(() {
            if (state is OrgNavigationStateHomeToDocumention) {
              _documentionOffset = Offset.zero;
              _homeOffset = const Offset(-1.0, 0.0);
              _teamOffset = const Offset(-2.0, 0.0);
            } else if (state is OrgNavigationStateHomeToTeam) {
              _teamOffset = Offset.zero;
              _homeOffset = const Offset(1.0, 0.0);
              _documentionOffset = const Offset(2.0, 0.0);
            } else if (state is OrgNavigationStateTeamToHome) {
              _homeOffset = Offset.zero;
              _teamOffset = const Offset(-1.0, 0.0);
              _documentionOffset = const Offset(1.0, 0.0);
            } else if (state is OrgNavigationStateTeamToDocumention) {
              _documentionOffset = Offset.zero;
              _homeOffset = const Offset(-1.0, 0.0);
              _teamOffset = const Offset(-2.0, 0.0);
            } else if (state is OrgNavigationStateDocumentionToTeam) {
              _teamOffset = Offset.zero;
              _homeOffset = const Offset(1.0, 0.0);
              _documentionOffset = const Offset(2.0, 0.0);
            } else if (state is OrgNavigationStateDocumentionToHome) {
              _homeOffset = Offset.zero;
              _teamOffset = const Offset(-1.0, 0.0);
              _documentionOffset = const Offset(1.0, 0.0);
            }
          });
        }
      },
      child: Stack(
        children: [
          AnimatedSlide(
            offset: _teamOffset,
            duration: shortDuration,
            child: const OrgTeamScreen(),
          ),
          AnimatedSlide(
            offset: _homeOffset,
            duration: shortDuration,
            child: const OrgHomeScreen(),
          ),
          AnimatedSlide(
            offset: _documentionOffset,
            duration: shortDuration,
            child: const OrgDocumentionScreen(),
          ),
        ],
      ),
    );
  }
}

