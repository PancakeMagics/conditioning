import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/store/entities/event.dart';
import 'package:conditioning/service/utils/extensions/globalkey.dart';
import 'package:conditioning/ui/animations/pespen/pes_pen.dart';
import 'package:conditioning/ui/elements/buttons/icon_text_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

class ExploreEventView extends StatefulWidget {
  const ExploreEventView({Key? key, required this.eventList}) : super(key: key);
  final List<Event> eventList;

  @override
  State<ExploreEventView> createState() => _ExploreEventViewState();
}

class _ExploreEventViewState extends State<ExploreEventView> {
  late final List<Event> _eventList;
  final _itemKeyMap = <int, GlobalKey>{};

  @override
  void initState() {
    _eventList = widget.eventList;
    for (var i = 0; i < _eventList.length; i++) {_itemKeyMap.putIfAbsent(i, () => GlobalKey());}
    super.initState();
  }

  void _itemOnTap(Event event, GlobalKey key) {
    final renderBox = key.renderBox;
  }

  @override
  Widget build(BuildContext context) {
    context.read<AppExploreEventsBloc>().add(const ExploreEventEventStoreEventsData());

    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: ListView.builder(
        itemCount: _eventList.length,
        itemBuilder: (context, index) {
          final org = _eventList[index];
          final key = _itemKeyMap[index]!;
          return IconTextCard(
            key: key,
            icon: Icons.school,
            text: org.name,
            onTap: () => setState(() => _itemOnTap(org, key)),
          );
        },
      ),
    );
  }
}
