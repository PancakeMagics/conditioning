
import 'package:flutter/material.dart';

const longLongDuration = Duration(milliseconds: 2000);
const longDuration = Duration(milliseconds: 1000);
const mediumDuration = Duration(milliseconds: 600);
const mediumShortDuration = Duration(milliseconds: 500);
const shortMediumDuration = Duration(milliseconds: 400);
const shortDuration = Duration(milliseconds: 300);
const shortShortDuration = Duration(milliseconds: 100);
const miniDuration = Duration(microseconds: 10);

//TODO: handle multiple animation: pageRouteTransition, boxDecorationTransition...

@immutable
class AnimationDuration {
  // TODO: use switchBar for user to configure duration, and not linear progress
  final Duration duration; // from (3~1 seconds), (1000 ~ 1 milli,), (1000 ~ micro)

  const AnimationDuration({this.duration = mediumDuration});
}