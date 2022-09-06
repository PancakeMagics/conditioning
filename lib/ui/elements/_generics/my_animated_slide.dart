import 'package:conditioning/service/store/utils/animation_durations.dart';
import 'package:flutter/material.dart';

enum NavDirection {
  leftWord,
  leftLeftWordForLeft,
  leftLeftWordForMeddle,
  leftLeftWordForRight,
  upWord,
  rightWord,
  rightRightWordForRight,
  rightRightWordForMeddle,
  rightRightWordForLeft,
  downWord,
  leftUpWord,
  leftDownWord,
  rightUpWord,
  rightDownWord
}

class MyAnimatedSlide extends StatefulWidget {
  const MyAnimatedSlide({
    Key? key,
    required this.isNavIn,
    required this.navDirection,
    this.curve,
    required this.child,
  }) : super(key: key);
  final bool isNavIn;
  final NavDirection navDirection;
  final Curve? curve;
  final Widget child;

  @override
  State<MyAnimatedSlide> createState() => _MyAnimatedSlideState();
}

class _MyAnimatedSlideState extends State<MyAnimatedSlide>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Tween<Offset> _tween;
  late final Animation<Offset> _animation;
  late final Curve _curve;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: shortDuration,
      vsync: this,
    );
    _tween = _getTween(isNavIn: widget.isNavIn, navDirection: widget.navDirection);
    _curve = widget.curve ?? Curves.fastOutSlowIn;
    _animation = _tween
        .chain(CurveTween(curve: _curve))
        .animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: _animation,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

Tween<Offset> _getTween({required bool isNavIn, required NavDirection navDirection}) {
  final Offset begin;
  final Offset end;
  switch (isNavIn) {
    case true:
      end = Offset.zero;
      switch (navDirection) {
        case NavDirection.leftWord:
          begin = const Offset(1.0, 0.0);
          break;
        case NavDirection.leftLeftWordForLeft:
          throw Exception('such args no sense');
        case NavDirection.leftLeftWordForMeddle:
          throw Exception('such args no sense');
        case NavDirection.leftLeftWordForRight:
          begin = const Offset(2.0, 0.0);
          break;
        case NavDirection.upWord:
          begin = const Offset(0.0, 1.0);
          break;
        case NavDirection.rightWord:
          begin = const Offset(-1.0, 0.0);
          break;
        case NavDirection.rightRightWordForRight:
          throw Exception('such args no sense');
        case NavDirection.rightRightWordForMeddle:
          throw Exception('such args no sense');
        case NavDirection.rightRightWordForLeft:
          begin = const Offset(-2.0, 0.0);
          break;
        case NavDirection.downWord:
          begin = const Offset(0.0, -1.0);
          break;
        case NavDirection.leftUpWord:
          begin = const Offset(1.0, 1.0);
          break;
        case NavDirection.leftDownWord:
          begin = const Offset(1.0, -1.0);
          break;
        case NavDirection.rightUpWord:
          begin = const Offset(-1.0, 1.0);
          break;
        case NavDirection.rightDownWord:
          begin = const Offset(-1.0, -1.0);
          break;
        default:
          throw Exception('such args no sense');
      }
      break;
    case false:
      switch (navDirection) {
        case NavDirection.leftWord:
          begin = Offset.zero;
          end = const Offset(-1.0, 0.0);
          break;
        case NavDirection.leftLeftWordForLeft:
          begin = Offset.zero;
          end = const Offset(-2.0, 0.0);
          break;
        case NavDirection.leftLeftWordForMeddle:
          begin = const Offset(1.0, 0.0);
          end = const Offset(-1.0, 0.0);
          break;
        case NavDirection.leftLeftWordForRight:
          throw Exception('such args no sense');
        case NavDirection.upWord:
          begin = Offset.zero;
          end = const Offset(0.0, -1.0);
          break;
        case NavDirection.rightWord:
          begin = Offset.zero;
          end = const Offset(1.0, 0.0);
          break;
        case NavDirection.rightRightWordForRight:
          begin = Offset.zero;
          end = const Offset(2.0, 0.0);
          break;
        case NavDirection.rightRightWordForMeddle:
          begin = const Offset(-1.0, 0.0);
          end = const Offset(1.0, 0.0);
          break;
        case NavDirection.rightRightWordForLeft:
          throw Exception('such args no sense');
        case NavDirection.downWord:
          begin = Offset.zero;
          end = const Offset(0.0, 1.0);
          break;
        case NavDirection.leftUpWord:
          begin = Offset.zero;
          end = const Offset(-1.0, -1.0);
          break;
        case NavDirection.leftDownWord:
          begin = Offset.zero;
          end = const Offset(-1.0, 1.0);
          break;
        case NavDirection.rightUpWord:
          begin = Offset.zero;
          end = const Offset(1.0, -1.0);
          break;
        case NavDirection.rightDownWord:
          begin = Offset.zero;
          end = const Offset(1.0, 1.0);
          break;
        default:
          throw Exception('such args no sense');
      }
      break;
    default:
      begin = Offset.zero;
      end = Offset.zero;
  }
  return Tween(begin: begin, end: end);
}