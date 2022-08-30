import 'package:conditioning/service/extensions/globalkey.dart';
import 'package:conditioning/service/extensions/pair.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/store/store_service.dart';
import 'package:conditioning/ui/animations/pespen/pes_pen.dart';
import 'package:conditioning/ui/elements/appbar/appbar_searching.dart';
import 'package:conditioning/ui/elements/buttons/icon_text_card.dart';
import 'package:conditioning/ui/screens/1_user/views/explore/view_explore_org_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

import '../../../../../bloc/auth/app/others/event_screen_to_screen.dart';
import '../../../../../bloc/utils/screens/base_bloc.dart';

class ExploreOrgView extends StatefulWidget {
  const ExploreOrgView({
    Key? key,
    required this.isNavIn,
  }) : super(key: key);
  final bool isNavIn;

  @override
  State<ExploreOrgView> createState() => _ExploreOrgViewState();
}

class _ExploreOrgViewState extends State<ExploreOrgView> {
  final _orgList = StoreService.fromFirebase().orgList;
  final _itemKeyMap = <int, GlobalKey>{};
  late PesItem<Org>? _pesItem;
  late Org? _org;

  @override
  void initState() {
    for (var i = 0; i < _orgList.length; i++) {
      _itemKeyMap.putIfAbsent(i, () => GlobalKey());
    }
    _pesItem = null;
    _org = null;
    super.initState();
  }

  void _itemOnTap(Org org, GlobalKey key) {
    final renderBox = key.renderBox;
    _pesItem = PesItem(
      itemZeroOffset: renderBox.localToGlobal(Offset.zero),
      itemSize: renderBox.size,
      item: org,
    );
    _org = org;
  }

  @override
  Widget build(BuildContext context) {
    return PesPen(
      pesItem: _pesItem,
      pesView: ExploreOrgViewView(org: _org),
      child: Scaffold(
        appBar: AppBarSearching(
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
          child: widget.isNavIn
              ? ListView.builder(
                  itemCount: _orgList.length,
                  itemBuilder: (context, index) {
                    final org = _orgList[index];
                    final key = _itemKeyMap[index]!;
                    return getIconTextCard(
                      key: key,
                      icon: Icons.school,
                      text: org.name,
                      onTap: () => setState(() => _itemOnTap(org, key)),
                    );
                  },
                )
              : Container(),
        ),
      ),
    );
  }
}
