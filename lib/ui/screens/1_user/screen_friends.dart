import 'package:conditioning/service/intl/util.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/auth/app/others/event_screen_to_screen.dart';
import '../../../bloc/utils/screens/base_bloc.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen(
      {Key? key,
      required this.isNavIn,
      required this.slideDirection,
      this.curve})
      : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;
  final Curve? curve;

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return NavigationBuilder(
      isNavIn: widget.isNavIn,
      navDirection: widget.slideDirection,
      curve: widget.curve,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.loc.screenName_friend),
              IconButton(
                  onPressed: () {
                    context
                        .read<BaseBloc>()
                        .add(const ScreensEventFriendToHome());
                  },
                  icon: const Icon(Icons.home)),
            ],
          ),
        ),
        body: widget.isNavIn ? Container() : Container(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<BaseBloc>().add(const ScreensEventFriendToExplore());
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
