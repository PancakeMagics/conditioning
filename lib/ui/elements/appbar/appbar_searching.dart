import 'package:conditioning/service/intl/util.dart';
import 'package:flutter/material.dart';

import '../../../service/extensions/pair.dart';

class AppBarSearching extends AppBar {
  AppBarSearching({Key? key,
    required this.actionSearching,
    this.actionLeft,
    this.actionRight,
  }) : super(key: key);
  final VoidCallback actionSearching;
  final Pair<IconData, VoidCallback>? actionLeft;
  final Pair<IconData, VoidCallback>? actionRight;

  @override
  State<AppBar> createState() => _AppBarSearching();
}

class _AppBarSearching extends State<AppBarSearching> {
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
    if (actionLeft != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed: actionLeft.b, icon: Icon(actionLeft.a))
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _getActionRight() {
    final actionRight = widget.actionRight;
    if (actionRight != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [IconButton(onPressed: actionRight.b, icon: Icon(actionRight.a))],
      );
    } else {
      return Container();
    }
  }
}

