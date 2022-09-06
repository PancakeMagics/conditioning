import 'package:conditioning/ui/elements/_login/arrow/arrow_direction.dart';
import 'package:flutter/material.dart';

import 'arrow_animating.dart';

Widget getArrow({
  required ArrowDirection arrowDirection,
  required Function onTap,
}) {
  switch (arrowDirection) {
    case ArrowDirection.left:
      return Row(
        children: [
          SizedBox(
            width: 40,
            child: Column(children: [Expanded(child: AnimatingArrow(direction: ArrowDirection.left, onTap: () => onTap()))]),
          ),
          Expanded(child: Container()),
        ],
      );
    case ArrowDirection.right:
      return Row(
        children: [
          Expanded(child: Container()),
          SizedBox(
            width: 40,
            child: Column(children: [Expanded(child: AnimatingArrow(direction: ArrowDirection.right, onTap: () => onTap()))]),
          ),
        ],
      );
    case ArrowDirection.bottom:
      return Column(
        children: [
          Expanded(child: Container()),
          SizedBox(
            height: 40,
            child: Row(children: [Expanded(child: AnimatingArrow(direction: ArrowDirection.bottom, onTap: () => onTap()))]),
          ),
        ],
      );
    case ArrowDirection.top:
      return Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(children: [Expanded(child: AnimatingArrow(direction: ArrowDirection.top, onTap: () => onTap()))]),
          ),
          Expanded(child: Container()),
        ],
      );
  }
}
