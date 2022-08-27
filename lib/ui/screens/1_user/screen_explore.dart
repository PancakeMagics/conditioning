import 'package:conditioning/bloc/auth/app/others/event_screen_to_screen.dart';
import 'package:conditioning/bloc/store/store_bloc.dart';
import 'package:conditioning/bloc/utils/views/explore_bloc.dart';
import 'package:conditioning/service/intl/util.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/animations/slide_in_widget.dart';
import 'package:conditioning/ui/screens/1_user/views/explore/views_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/utils/screens/base_bloc.dart';

class ExploreScreen extends StatefulWidget {
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
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final _searchingText = TextEditingController();

  @override
  void dispose() {
    _searchingText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideWidgetBuilder(
      isSlideIn: widget.isSlideIn,
      slideDirection: widget.slideDirection,
      curve: widget.curve,
      child: Scaffold(
        appBar: AppBar(
          title: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.draw_outlined)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {context.read<BaseBloc>().add(const ScreensEventExploreToHome());},
                      icon: const Icon(Icons.home)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 180,
                          child: TextField(
                            controller: _searchingText,
                            decoration: InputDecoration(
                              hintText: context.loc.hint_searching,
                              contentPadding: const EdgeInsets.only(left: 8.0),
                            ),
                          ),
                        ),
                        OutlinedButton(
                          child: const Icon(Icons.search_rounded),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) => ExploreBloc(storeProvider: StoreService.fromFirebase()),
          child: const ViewsController(),
        ),
      ),
    );
  }
}