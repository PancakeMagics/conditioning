import 'package:conditioning/service/utils/intl/util.dart';
import 'package:flutter/material.dart';

class SearchingAppBar extends AppBar {
  SearchingAppBar({
    Key? key,
    required this.actionSearching,
    this.actionLeftIcon,
    this.actionLeft,
    this.actionRightIcon,
    this.actionRight,
  }) : super(key: key);
  final VoidCallback actionSearching;
  final IconData? actionLeftIcon;
  final VoidCallback? actionLeft;
  final IconData? actionRightIcon;
  final VoidCallback? actionRight;

  @override
  State<AppBar> createState() => _AppBarSearching();
}

class _AppBarSearching extends State<SearchingAppBar> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                            hintText: context.loc.hint_searching,
                            contentPadding: const EdgeInsets.only(left: 8.0),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        child: const Icon(Icons.search_rounded),
                        onPressed: () => widget.actionSearching,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _getActionLeft(),
          _getActionRight(),
        ],
      ),
    );
  }

  Widget _getActionLeft() {
    final actionLeft = widget.actionLeft;
    final actionLeftIcon = widget.actionLeftIcon;
    if (actionLeft != null || actionLeftIcon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed: actionLeft, icon: Icon(actionLeftIcon))
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _getActionRight() {
    final actionRight = widget.actionRight;
    final actionRightIcon = widget.actionRightIcon;
    if (actionRight != null || actionRightIcon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: actionRight, icon: Icon(actionRightIcon))
        ],
      );
    } else {
      return Container();
    }
  }
}
