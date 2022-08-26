import 'dart:math' show pi;

import 'package:flutter/material.dart';

@immutable
class ExpandFAB extends StatelessWidget {
  const ExpandFAB({
    Key? key,
    required this.stackAlignment,
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  }) : super(key: key);
  final Alignment stackAlignment;
  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (pi / 180),
          progress.value * maxDistance,
        );

        final alignmentX = stackAlignment.x;
        final alignmentY = stackAlignment.y;
        if (alignmentX == 1.0 && alignmentY == 1.0) {
          return Positioned(
              right: 24.0 + offset.dx,
              bottom: 12.0 + offset.dy,
              child: Transform.rotate(
                angle: (1.0 - progress.value) * 5,
                child: child,
              ));
        } else if (alignmentX == -1.0 && alignmentY == 1.0){
          return Positioned(
              left: 24.0 + offset.dx,
              bottom: 12.0 + offset.dy,
              child: Transform.rotate(
                angle: (1.0 - progress.value) * 5,
                child: child,
              ));
        } else {
          return Container();
        }
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}
