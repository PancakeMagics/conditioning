import 'package:conditioning/service/store/utils/animation_durations.dart';
import 'package:conditioning/service/utils/constants/option_explore_view.dart';
import 'package:flutter/material.dart';

@immutable
class AppSettings {
  final bool autoLogin;
  final ExploreViewOption exploreViewOption;
  final AnimationDuration animationDuration;

  const AppSettings({
    this.autoLogin = false,
    this.exploreViewOption = ExploreViewOption.org,
    this.animationDuration = const AnimationDuration(),
  });
}
