import 'package:conditioning/service/store/entities/topic.dart';
import 'package:conditioning/service/utils/extensions/globalkey.dart';
import 'package:conditioning/ui/elements/buttons/icon_text_card.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

class ExploreTopicView extends StatefulWidget {
  const ExploreTopicView({
    Key? key,
    required this.isNavIn,
    required this.topicList,
  }) : super(key: key);
  final bool isNavIn;
  final List<Topic> topicList;

  @override
  State<ExploreTopicView> createState() => _ExploreTopicViewState();
}

class _ExploreTopicViewState extends State<ExploreTopicView> {
  late final List<Topic> _topicList;
  final _itemKeyMap = <int, GlobalKey>{};

  @override
  void initState() {
    _topicList = widget.topicList;
    for (var i = 0; i < _topicList.length; i++) {_itemKeyMap.putIfAbsent(i, () => GlobalKey());}
    super.initState();
  }

  void _itemOnTap(Topic topic, GlobalKey key) {
    // final renderBox = key.renderBox;
    // context.read<ExploreTopicsBloc>().add(ExploreEventTopicOnTap(
    //   topicItem: PesItem<Topic>(
    //     itemZeroOffset: renderBox.localToGlobal(Offset.zero),
    //     itemSize: renderBox.size,
    //     item: topic,
    //   ),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: widget.isNavIn
          ? ListView.builder(
        itemCount: _topicList.length,
        itemBuilder: (context, index) {
          final topic = _topicList[index];
          final key = _itemKeyMap[index]!;
          return IconTextCard(
            key: key,
            icon: Icons.school,
            text: topic.name,
            onTap: () => setState(() => _itemOnTap(topic, key)),
          );
        },
      )
          : Container(),
    );
  }
}

