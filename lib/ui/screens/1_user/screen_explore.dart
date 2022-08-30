import 'package:conditioning/bloc/auth/app/others/event_screen_to_screen.dart';
import 'package:conditioning/bloc/utils/views/explore_bloc.dart';
import 'package:conditioning/service/extensions/pair.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/animations/slide_in_widget.dart';
import 'package:conditioning/ui/elements/appbar/appbar_searching.dart';
import 'package:conditioning/ui/screens/1_user/views/explore/views_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/utils/screens/base_bloc.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen(
      {Key? key,
      required this.isSlideIn,
      required this.slideDirection,
      this.curve})
      : super(key: key);
  final bool isSlideIn;
  final SlideDirection slideDirection;
  final Curve? curve;

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return SlideWidgetBuilder(
      isSlideIn: widget.isSlideIn,
      slideDirection: widget.slideDirection,
      curve: widget.curve,
      child: BlocProvider(
        create: (context) =>
            ExploreBloc(storeProvider: StoreService.fromFirebase()),
        child: const ViewsController(),
      ),
    );
  }
}