import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/store/entities/store_user.dart';
import 'package:conditioning/service/utils/extensions/globalkey.dart';
import 'package:conditioning/ui/elements/app/pespen/pes_pen.dart';
import 'package:conditioning/ui/elements/_generics/buttons/button_icon_text_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

class ExploreUserView extends StatefulWidget {
  const ExploreUserView({Key? key, required this.userList}) : super(key: key);
  final List<StoreUser> userList;

  @override
  State<ExploreUserView> createState() => _ExploreUserViewState();
}

class _ExploreUserViewState extends State<ExploreUserView> {
  late final List<StoreUser> _userList;
  final _itemKeyMap = <int, GlobalKey>{};

  @override
  void initState() {
    _userList = widget.userList;
    for (var i = 0; i < _userList.length; i++) {_itemKeyMap.putIfAbsent(i, () => GlobalKey());}
    super.initState();
  }

  void _itemOnTap(StoreUser user, GlobalKey key) {
    final renderBox = key.renderBox;
  }

  @override
  Widget build(BuildContext context) {
    context.read<AppExploreUserBloc>().add(const ExploreUserEventStoreUsersData());

    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: ListView.builder(
          itemCount: _userList.length,
          itemBuilder: (context, index) {
            final user = _userList[index];
            final key = _itemKeyMap[index]!;
            return IconTextCard(
              key: key,
              icon: Icons.school,
              text: user.name,
              onTap: () => setState(() => _itemOnTap(user, key)),
            );
          },
      ),
    );
  }
}

