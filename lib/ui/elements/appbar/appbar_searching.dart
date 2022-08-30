import 'dart:developer';

import 'package:conditioning/service/intl/util.dart';
import 'package:flutter/material.dart';

import '../../../service/extensions/pair.dart';

AppBar getSearchingAppBar({
  required BuildContext context,
  required TextEditingController controller,
  required VoidCallback actionSearching,
  Pair<IconData, VoidCallback>? actionLeft,
  Pair<IconData, VoidCallback>? actionRight,
}) {
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
                        controller: controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: context.loc.hint_searching,
                          contentPadding: const EdgeInsets.only(left: 8.0),
                        ),
                      ),
                    ),
                    OutlinedButton(
                      child: const Icon(Icons.search_rounded),
                      onPressed: () => actionSearching,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        _getActionLeft(al: actionLeft),
        _getActionRight(ar: actionRight),
      ],
    ),
  );
}

Widget _getActionLeft({required Pair<IconData, VoidCallback>? al}) {
  if (al != null) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(onPressed: al.b, icon: Icon(al.a))
      ],
    );
  } else {
    return Container();
  }
}

Widget _getActionRight({required Pair<IconData, VoidCallback>? ar}) {
  if (ar != null) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [IconButton(onPressed: ar.b, icon: Icon(ar.a))],
    );
  } else {
    return Container();
  }
}
