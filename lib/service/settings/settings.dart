import 'package:conditioning/bloc/ui/app/explore/explore_bloc.dart';
import 'package:conditioning/service/settings/animation_durations.dart';
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
