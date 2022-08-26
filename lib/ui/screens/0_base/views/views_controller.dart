import 'package:conditioning/bloc/store/store_bloc.dart';
import 'package:conditioning/ui/screens/0_base/views/view_explore_orgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewsController extends StatefulWidget {
  const ViewsController({Key? key}) : super(key: key);

  @override
  State<ViewsController> createState() => _ViewsControllerState();
}

class _ViewsControllerState extends State<ViewsController> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreBloc, StoreState>(
      builder: (context, state) {
        return ExploreOrgsScreen();
      },
      listener: (context, state) {

      },
    );
  }
}
