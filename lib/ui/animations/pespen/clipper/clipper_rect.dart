

import 'dart:ui';

import 'package:flutter/material.dart' show CustomClipper, Path, Offset, Size, Rect;

class RectClipper extends CustomClipper<Path> {
  final Offset cornerA;
  final Offset cornerB;
  const RectClipper({required this.cornerA, required this.cornerB});

  @override
  getClip(Size size) {
    return  Path()
      ..addRect(Rect.fromPoints(cornerA, cornerB))
    ;
  }

  @override
  bool shouldReclip(covariant RectClipper oldClipper) => oldClipper.cornerA != cornerA || oldClipper.cornerB != cornerB;

}