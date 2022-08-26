
import 'package:conditioning/bloc/auth/blocs/bloc_screens.dart';
import 'package:conditioning/bloc/auth/events/others/event_screen_to_screen.dart';
import 'package:conditioning/service/l10n/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.loc.screenName_explore),
            IconButton(
                onPressed: () {
                  context.read<ScreensBloc>().add(const ScreensEventExploreToHome());
                },
                icon: const Icon(Icons.home)
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
