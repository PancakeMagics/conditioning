import 'dart:math' show sin;
import 'package:flutter/material.dart' show Curve;

class SineCurve extends Curve {
  final double count;
  const SineCurve({required this.count});

  @override
  double transformInternal(double t) {
    final y = sin(count * t) * 0.4;
    return y;
  }
}
