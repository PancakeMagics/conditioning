import 'dart:developer';

import 'package:conditioning/bloc/services/auth/auth_state.dart';
import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/entities/event.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/store/entities/user.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:conditioning/ui/animations/pespen/pes_pen.dart';
import 'package:conditioning/ui/elements/appbar/appbar_searching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/pes/view_event_detail.dart';
import 'views/pes/view_org_detail.dart';
import 'views/pes/view_user_detail.dart';
import 'views/view_explore_org.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({
    Key? key,
    required this.isNavIn,
    required this.slideDirection,
    required this.viewOption,
  }) : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;
  final ExploreViewOption? viewOption;

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final _aProvider = AuthService.fromFirebase();
  final _sProvider = StoreService.fromFirebase();
  late ExploreViewOption? _option;
  PesItem? _pesItem = null;

  @override
  void initState() {
    _option = widget.viewOption;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ExploreScreen oldWidget) {
    _option = widget.viewOption;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBuilder(
      isNavIn: widget.isNavIn,
      navDirection: widget.slideDirection,
      child: BlocProvider(
        // create: _getBlocProviderCreate,
        // child: _getBlocBuilder(),
        create: (context) => ExploreOrgsBloc(
            storeProvider: _sProvider, authProvider: _aProvider),
        child: PesPen(
          pesItem: _updatePestItem(),
          pesView: _updatePestView(),
          child: BlocConsumer<ExploreOrgsBloc, AuthState>(
            listener: (context, state) {
              log(''
                  'listener state: $state'
                  '');
              if (state is ExploreStateOrgDetail) {
                setState(() {
                  _pesItem = state.org;
                });
              }
            },
            builder: (context, state) {
              log(''
                  'builder state: $state'
                  '');

              return Scaffold(
                appBar: SearchingAppBar(
                  actionSearching: () {},
                  actionLeftIcon: Icons.home,
                  actionLeft: () => setState(() => context
                      .read<AppBloc>()
                      .add(const AppUserEventExploreToHome())),
                  actionRightIcon: Icons.draw_outlined,
                  actionRight: () {},
                ),
                body:
                    ExploreOrgView(isNavIn: true, orgList: _sProvider.orgList),
              );
            },
          ),
        ),
      ),
    );
  }

  PesItem? _updatePestItem() {
    if (_pesItem != null) {
      switch (_option) {
        case ExploreViewOption.user:
          return _pesItem as PesItem<User>;
        case ExploreViewOption.org:
          return _pesItem as PesItem<Org>;
        case ExploreViewOption.event:
          return _pesItem as PesItem<Event>;
        default:
          return null;
      }
    } else {
      return null;
    }
  }

  Widget _updatePestView() {
    if (_pesItem != null) {
      switch (_option) {
        case ExploreViewOption.user:
          return ExploreUserDetail(user: _pesItem!.item as User);
        case ExploreViewOption.org:
          return ExploreOrgDetail(org: _pesItem!.item as Org);
        case ExploreViewOption.event:
          return ExploreEventDetail(event: _pesItem!.item as Event);
        default:
          return Container();
      }
    } else {
      return Container();
    }
  }

// Bloc _getBlocProviderCreate(BuildContext context) {
//   switch (_option) {
//     case ExploreViewOption.user:
//       return ExploreUsersBloc(
//           storeProvider: _sProvider, authProvider: _aProvider);
//     case ExploreViewOption.org:
//       return ExploreOrgsBloc(
//           storeProvider: _sProvider, authProvider: _aProvider);
//     case ExploreViewOption.event:
//       return ExploreEventsBloc(
//           storeProvider: _sProvider, authProvider: _aProvider);
//
//     //TODO:
//     case ExploreViewOption.topic:
//       return ExploreEventsBloc(
//           storeProvider: _sProvider, authProvider: _aProvider);
//     case null:
//       return ExploreEventsBloc(
//           storeProvider: _sProvider, authProvider: _aProvider);
//   }
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
//               isNavIn: true, eventList: _sProvider.eventList);
//         },
//       );
//    // TODO:
//     // case ExploreViewOption.topic: return ExploreTopicView(isNavIn: true, topicList: _sProvider.userList);
//     case ExploreViewOption.topic:
//       return Container();
//     default:
//       return Container();
//   }

}
