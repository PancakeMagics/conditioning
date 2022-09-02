import 'dart:developer';

import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/store/entities/org.dart';
import 'package:conditioning/service/utils/extensions/globalkey.dart';
import 'package:conditioning/ui/animations/pespen/pes_pen.dart';
import 'package:conditioning/ui/elements/buttons/icon_text_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

class ExploreOrgView extends StatefulWidget {
  const ExploreOrgView({
    Key? key,
    required this.isNavIn,
    required this.orgList,
  }) : super(key: key);
  final bool isNavIn;
  final List<Org> orgList;

  @override
  State<ExploreOrgView> createState() => _ExploreOrgViewState();
}

class _ExploreOrgViewState extends State<ExploreOrgView> {
  late final List<Org> _orgList;
  @override
  void initState() {
    _orgList = widget.orgList;
    super.initState();
  }

  void _itemOnTap(BuildContext context, Org org, GlobalKey key) {
    final renderBox = key.renderBox;
    context.read<ExploreOrgsBloc>().add(ExploreEventOrgOnTap(
          orgItem: PesItem<Org>(
            itemZeroOffset: renderBox.localToGlobal(Offset.zero),
            itemSize: renderBox.size,
            item: org,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: widget.isNavIn
          ? ListView.builder(
              itemCount: _orgList.length,
              itemBuilder: (context, index) {
                final org = _orgList[index];
                final key = GlobalKey();
                return getIconTextCard(
                  key: key,
                  icon: Icons.school,
                  text: org.name,
                  onTap: () => setState(() => _itemOnTap(context, org, key)),
                );
              },
            )
          : Container(),
    );
  }
}
