
import 'package:conditioning/bloc/store/orgs/orgs_bloc.dart';
import 'package:conditioning/bloc/utils/views/explore_bloc.dart';
import 'package:conditioning/service/intl/util.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/elements/buttons/icon_text_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreOrgView extends StatefulWidget {
  const ExploreOrgView({Key? key}) : super(key: key);

  @override
  State<ExploreOrgView> createState() => _ExploreOrgViewState();
}

class _ExploreOrgViewState extends State<ExploreOrgView> {
  final orgList = StoreService.fromFirebase().orgList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: ListView.builder(
        itemCount: orgList.length,
        itemBuilder: (context, index) {
          final currentOrg = orgList[index];

          return getIconTextCard(
            icon: Icons.school,
            text: currentOrg.orgName,
            onTap: () {
              context.read<ExploreBloc>().add(OrgStoreEventTapOrg(orgId: currentOrg.orgId));
            },
          );
        },
      ),
    );
  }
}
// Container(
//   margin: const EdgeInsets.all(8.0),
//   decoration: BoxDecoration(
//     border: Border.all(color: Colors.black),
//   ),
//   child: const SizedBox(
//     height: 384,
//     width: 256,
//   ),
// ),