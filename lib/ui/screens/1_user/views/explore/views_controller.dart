import 'package:conditioning/bloc/store/store_bloc.dart';
import 'package:conditioning/bloc/utils/views/explore_bloc.dart';
import 'package:conditioning/ui/screens/1_user/views/explore/view_explore_orgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/store/orgs/orgs_bloc.dart';

class ViewsController extends StatefulWidget {
  const ViewsController({Key? key}) : super(key: key);

  @override
  State<ViewsController> createState() => _ViewsControllerState();
}

class _ViewsControllerState extends State<ViewsController> {
  @override
  Widget build(BuildContext context) {
    context.read<ExploreBloc>().add(const StoreEventInitialize());

    return BlocConsumer<ExploreBloc, StoreState>(
      builder: (context, state) {
        return const ExploreOrgView();
      },
      listener: (context, state) {
        if (state is OrgStoreStateTapped) {
          final currentOrg = state.org;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text(currentOrg.orgName))));
        }
      },
    );
  }
}
