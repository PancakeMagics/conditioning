import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/service/utils/intl/util.dart';
import 'package:conditioning/ui/animations/navigation/navigation_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({
    Key? key,
    required this.isNavIn,
    required this.slideDirection,
  }) : super(key: key);
  final bool isNavIn;
  final NavDirection slideDirection;

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return NavigationBuilder(
      isNavIn: widget.isNavIn,
      navDirection: widget.slideDirection,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.loc.screenName_friend),
              IconButton(
                  onPressed: () {
                    context
                        .read<AppBloc>()
                        .add(const AppUserEventFriendToHome());
                  },
                  icon: const Icon(Icons.home)),
            ],
          ),
        ),
        body: widget.isNavIn ? Container() : Container(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<AppBloc>().add(const AppUserEventFriendToExplore());
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
