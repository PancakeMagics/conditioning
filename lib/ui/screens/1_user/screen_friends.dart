import 'package:conditioning/bloc/auth/blocs/bloc_screens.dart';
import 'package:conditioning/bloc/auth/events/others/event_screen_to_screen.dart';
import 'package:conditioning/service/l10n/util.dart';
import 'package:conditioning/ui/animations/slide_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen(
      {Key? key,
        required this.isSlideIn,
        required this.slideDirection,
        this.curve})
      : super(key: key);
  final bool isSlideIn;
  final SlideDirection slideDirection;
  final Curve? curve;

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return SlideWidgetBuilder(
      isSlideIn: widget.isSlideIn,
      slideDirection: widget.slideDirection,
      curve: widget.curve,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.loc.screenName_friend),
              IconButton(
                  onPressed: () {
                    context.read<ScreensBloc>().add(const ScreensEventFriendToHome());
                  },
                  icon: const Icon(Icons.home)
              ),
            ],
          ),
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ScreensBloc>().add(const ScreensEventFriendToExplore());
            },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}