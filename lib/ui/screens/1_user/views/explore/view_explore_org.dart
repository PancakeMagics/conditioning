import 'package:conditioning/service/extensions/globalkey.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/animations/pespen/pes_pen.dart';
import 'package:conditioning/ui/elements/appbar/appbar_searching.dart';
import 'package:conditioning/ui/elements/buttons/icon_text_card.dart';
import 'package:conditioning/ui/screens/1_user/views/explore/view_explore_org_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/auth/app/others/event_screen_to_screen.dart';
import '../../../../../bloc/utils/screens/base_bloc.dart';
import '../../../../../service/extensions/pair.dart';

class ExploreOrgView extends StatefulWidget {
  const ExploreOrgView({Key? key}) : super(key: key);

  @override
  State<ExploreOrgView> createState() => _ExploreOrgViewState();
}

class _ExploreOrgViewState extends State<ExploreOrgView> {
  final _orgList = StoreService.fromFirebase().orgList;
  final _itemKeyMap = <int, GlobalKey>{};
  final _searchingText = TextEditingController();
  late PesItem<Org>? _pesItem;

  @override
  void initState() {
    for (var i = 0; i < _orgList.length; i++) {
      _itemKeyMap.putIfAbsent(i, () => GlobalKey());
    }
    _pesItem = null;
    super.initState();
  }

  @override
  void dispose() {
    _searchingText.dispose();
    super.dispose();
  }

  void _itemOnTap(Org org, GlobalKey key) {
    final renderBox = key.renderBox;
    _pesItem = PesItem(
      itemZeroOffset: renderBox.localToGlobal(Offset.zero),
      itemSize: renderBox.size,
      item: org,
    );
    // context
    //     .read<ExploreBloc>()
    //     .add(OrgStoreEventTapOrg(orgId: org.orgId));
  }

  @override
  Widget build(BuildContext context) {
    return PesPen(
        pesItem: _pesItem,
        pesView: ExploreOrgViewView(org: _pesItem?.item),
        child: Scaffold(
          appBar: getSearchingAppBar(
            context: context,
            controller: _searchingText,
            actionSearching: () {},
            actionLeft: Pair(
                a: Icons.home,
                b: () => setState(() => context
                    .read<BaseBloc>()
                    .add(const ScreensEventExploreToHome()))),
            actionRight: Pair(a: Icons.draw_outlined, b: () {}),
          ),
          body: Padding(
            padding: const EdgeInsets.all(36.0),
            child: ListView.builder(
              itemCount: _orgList.length,
              itemBuilder: (context, index) {
                final org = _orgList[index];
                final key = _itemKeyMap[index]!;
                return getIconTextCard(
                  key: key,
                  icon: Icons.school,
                  text: org.orgName,
                  onTap: () => setState(() => _itemOnTap(org, key)),
                );
              },
            ),
          ),
        ),
    );
  }
}
