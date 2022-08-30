import 'package:conditioning/bloc/utils/views/explore_bloc.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:conditioning/ui/screens/1_user/views/explore/views_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen(
      {Key? key,
      required this.isNavIn,
      required this.slideDirection,
      this.curve})
      : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;
  final Curve? curve;

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return NavigationBuilder(
      isNavIn: widget.isNavIn,
      navDirection: widget.slideDirection,
      curve: widget.curve,
      child: BlocProvider(
              create: (context) =>
                  ExploreBloc(storeProvider: StoreService.fromFirebase()),
              child: ViewsController(isNavIn: widget.isNavIn),
            ),
    );
  }
}
