import 'dart:ui';

import 'package:flutter/material.dart'
    show CustomClipper, Path, Offset, Size, Rect;

class RRectClipper extends CustomClipper<Path> {
  final Offset cornerA;
  final Offset cornerB;

  const RRectClipper({required this.cornerA, required this.cornerB});

  @override
  getClip(Size size) {
    return Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromPoints(cornerA, cornerB),
        const Radius.circular(10.0),
      ));
  }

  @override
  bool shouldReclip(covariant RRectClipper oldClipper) =>
      oldClipper.cornerA != cornerA || oldClipper.cornerB != cornerB;
}
