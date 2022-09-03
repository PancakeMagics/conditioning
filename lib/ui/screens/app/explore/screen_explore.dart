import 'package:conditioning/bloc/ui/app/app_bloc.dart';
import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/auth/auth_service.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/animations/navigation/my_animated_slide.dart';
import 'package:conditioning/ui/animations/pespen/pes_pen.dart';
import 'package:conditioning/ui/animations/searchingbar/appbar_searching.dart';
import 'package:conditioning/ui/animations/searchingbar/searching_bar.dart';
import 'package:conditioning/ui/screens/app/explore/explore_views_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key, required this.viewOption}) : super(key: key);
  final ExploreViewOption viewOption;

  @override
  Widget build(BuildContext context) {
    return SearchingBar(
      backgroundColor: Colors.grey,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text('hello')),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.home_outlined),
                  onPressed: () => context.read<AppBloc>().add(const AppEventExploreToHome()),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
