import 'package:conditioning/bloc/store/store_bloc.dart';
import 'package:conditioning/bloc/utils/views/explore_bloc.dart';
import 'package:conditioning/ui/screens/1_user/views/explore/view_explore_org.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/store/orgs/orgs_bloc.dart';

class ViewsController extends StatefulWidget {
  const ViewsController({Key? key,
    required this.isNavIn,
  }) : super(key: key);
  final bool isNavIn;

  @override
  State<ViewsController> createState() => _ViewsControllerState();
}

class _ViewsControllerState extends State<ViewsController> {
  @override
  Widget build(BuildContext context) {
    context.read<ExploreBloc>().add(const StoreEventInitialize());

    return BlocBuilder<ExploreBloc, StoreState>(
      builder: (context, state) {
        return ExploreOrgView(isNavIn: widget.isNavIn);
      },
    );
  }
}
