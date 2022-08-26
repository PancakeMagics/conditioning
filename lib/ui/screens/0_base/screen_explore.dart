
import 'package:conditioning/bloc/auth/blocs/bloc_screens.dart';
import 'package:conditioning/bloc/auth/events/others/event_screen_to_screen.dart';
import 'package:conditioning/bloc/store/store_bloc.dart';
import 'package:conditioning/service/l10n/util.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/animations/slide_in_widget.dart';
import 'package:conditioning/ui/screens/0_base/views/views_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({
    Key? key,
    required this.isSlideIn,
    required this.slideDirection,
    this.curve})
      : super(key: key);
  final bool isSlideIn;
  final SlideDirection slideDirection;
  final Curve? curve;

  @override
  Widget build(BuildContext context) {
    return SlideWidgetBuilder(
      isSlideIn: isSlideIn,
      slideDirection: slideDirection,
      curve: curve,
      child: BlocProvider(
        create: (context) => StoreBloc(storeProvider: StoreService.fromCloudFirebase()),
        child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          clipBehavior: Clip.hardEdge,
          child: const ViewsController(),
        ),
      ),
    );
  }
}
