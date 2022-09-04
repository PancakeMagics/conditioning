import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppFriendsScreen extends StatefulWidget {
  const AppFriendsScreen({Key? key}) : super(key: key);

  @override
  State<AppFriendsScreen> createState() => _AppFriendsScreenState();
}

class _AppFriendsScreenState extends State<AppFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.loc.screenName_friend),
            IconButton(
                onPressed: () {
                  context
                      .read<AppBloc>()
                      .add(const AppEventFriendToHome());
                },
                icon: const Icon(Icons.home)),
          ],
        ),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AppBloc>().add(const AppEventFriendToExplore());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
