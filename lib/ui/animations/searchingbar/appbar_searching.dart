import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:flutter/material.dart';

//TODO: like gmail

class SearchingAppBar extends AppBar {
  SearchingAppBar({
    Key? key,
    required this.searchingHint,
    required this.searchingAction,
    this.actionIcon,
    this.action,
  }) : super(key: key);
  final String searchingHint;
  final VoidCallback searchingAction;
  final IconData? actionIcon;
  final VoidCallback? action;

  @override
  State<AppBar> createState() => _AppBarSearching();
}

class _AppBarSearching extends State<SearchingAppBar> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //TODO: make a searching textField like gmail

    return AppBar(
      title: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 180,
                        child: TextField(
                          controller: _textController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: widget.searchingHint,
                            contentPadding: const EdgeInsets.only(left: 8.0),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        child: const Icon(Icons.search_rounded),
                        onPressed: () => widget.searchingAction,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _getActionIcon(isLeft: true),
        ],
      ),
    );
  }

  Widget _getActionIcon({required bool isLeft}) {
    final action = widget.action;
    final actionIcon = widget.actionIcon;
    if (action != null || actionIcon != null) {
      return Row(
        mainAxisAlignment: isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          IconButton(onPressed: action, icon: Icon(actionIcon))
        ],
      );
    } else {
      return Container();
    }
  }
}
