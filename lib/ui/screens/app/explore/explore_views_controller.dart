import 'dart:developer';

import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/entities/event.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/store/entities/user.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:conditioning/ui/animations/navigation/my_animated_slide.dart';
import 'package:conditioning/ui/animations/pespen/pes_pen.dart';
import 'package:conditioning/ui/animations/searchingbar/appbar_searching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/pes/view_event_detail.dart';
import 'views/pes/view_org_detail.dart';
import 'views/pes/view_user_detail.dart';
import 'views/view_explore_org.dart';

class ExploreViewsController extends StatefulWidget {
  const ExploreViewsController({
    Key? key,
    required this.viewOption,
  }) : super(key: key);
  final ExploreViewOption viewOption;

  @override
  State<ExploreViewsController> createState() => _ExploreViewsControllerState();
}

class _ExploreViewsControllerState extends State<ExploreViewsController> {
  final _aProvider = AuthService.fromFirebase();
  final _sProvider = StoreService.fromFirebase();
  PesItem? _pesItem = null;
  late Widget _pestView;

  @override
  Widget build(BuildContext context) {
    final option = widget.viewOption;
    switch (option) {
      case ExploreViewOption.user:
        // TODO: Handle this case.
        break;
      case ExploreViewOption.org:
        // TODO: Handle this case.
        break;
      case ExploreViewOption.event:
        // TODO: Handle this case.
        break;
      case ExploreViewOption.topic:
        // TODO: Handle this case.
        break;
    }

    ExploreUsersBloc(storeProvider: _sProvider, authProvider: _aProvider);
    ExploreOrgsBloc(storeProvider: _sProvider, authProvider: _aProvider);
    ExploreEventsBloc(storeProvider: _sProvider, authProvider: _aProvider);
    ExploreEventsBloc(storeProvider: _sProvider, authProvider: _aProvider);

    return BlocProvider(
      create: (context) => ExploreOrgsBloc(
          storeProvider: _sProvider, authProvider: _aProvider),
      child: BlocConsumer<ExploreOrgsBloc, AuthState>(
        listener: (context, state) {
          if (state is ExploreStateOrgDetail) {
            setState(() {
              _pesItem = state.org;
            });
          }
        },
        builder: (context, state) {
          ExploreUserDetail(user: _pesItem!.item as User);
          ExploreOrgDetail(org: _pesItem!.item as Org);
          ExploreEventDetail(event: _pesItem!.item as Event);

          return PesPen(
              pesItem: _pesItem,
              pesView: Container(),
              child: Scaffold(
                appBar: SearchingAppBar(
                  searchingHint: context.loc.hint_searchingOrg,
                  searchingAction: () {},
                  actionIcon: Icons.home,
                  action: () => setState(() => context
                      .read<AppBloc>()
                      .add(const AppEventExploreToHome())),
                ),
                body:
                ExploreOrgView(isNavIn: true, orgList: _sProvider.orgList),
              ),
          );
        },
      ),
    );
  }

// Widget _getBlocBuilder() {
//   switch (_option) {
//     case ExploreViewOption.user:
//       return BlocBuilder<ExploreUsersBloc, AuthState>(
//         builder: (context, state) {
//           return Scaffold(
//               appBar: SearchingAppBar(
//                 actionSearching: () {},
//                 actionLeftIcon: Icons.home,
//                 actionLeft: () => setState(() => context
//                     .read<AppBloc>()
//                     .add(const AppUserEventExploreToHome())),
//                 actionRightIcon: Icons.draw_outlined,
//                 actionRight: () {},
//               ),
//               body: ExploreUserView(
//                   isNavIn: true, userList: _sProvider.userList),
//           );
//         },
//       );
//     case ExploreViewOption.org:
//       return BlocBuilder<ExploreOrgsBloc, AuthState>(
//         builder: (context, state) {
//           return PesPen(
//               pesItem: _updatePestItem(),
//               pesView: _updatePestView(),
//               child: Scaffold(
//                 appBar: SearchingAppBar(
//                   actionSearching: () {},
//                   actionLeftIcon: Icons.home,
//                   actionLeft: () => setState(() => context
//                       .read<AppBloc>()
//                       .add(const AppUserEventExploreToHome())),
//                   actionRightIcon: Icons.draw_outlined,
//                   actionRight: () {},
//                 ),
//                 body: ExploreOrgView(isNavIn: true, orgList: _sProvider.orgList),
//               ),
//           );
//         },
//       );
//     case ExploreViewOption.event:
//       return BlocBuilder<ExploreEventsBloc, AuthState>(
//         builder: (context, state) {
//           return ExploreEventView(
//               isNavIn: true, topicList: _sProvider.eventList);
//         },
//       );
//    // TODO:
//     // case ExploreViewOption.topic: return ExploreTopicView(isNavIn: true, topicList: _sProvider.userList);
//     case ExploreViewOption.topic:
//       return Container();
//     default:
//       return Container();
//   }
//
}
