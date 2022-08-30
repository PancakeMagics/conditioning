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

class NavigationBuilder extends StatefulWidget {
  const NavigationBuilder({
    Key? key,
    required this.child,
    required this.isNavIn,
    required this.navDirection,
    this.curve,
  }) : super(key: key);
  final bool isNavIn;
  final NavDirection navDirection;
  final Curve? curve;
  final Widget child;

  @override
  State<NavigationBuilder> createState() => _NavigationBuilderState();
}

class _NavigationBuilderState
    extends State<NavigationBuilder>
    with
        SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Tween<Offset> _getTween() {
    final Offset begin;
    final Offset end;
    switch (widget.isNavIn) {
      case true:
        end = Offset.zero;
        switch (widget.navDirection) {
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
        switch (widget.navDirection) {
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

  @override
  Widget build(BuildContext context) {
    final Curve? currentCurve;
    if (widget.curve == null) {
      currentCurve = Curves.fastOutSlowIn;
    } else {
      currentCurve = widget.curve;
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final curvedAnimation = CurvedAnimation(
          parent: _animationController,
          curve: currentCurve!,
        );

        _animationController.forward();
        return SlideTransition(
          position: _getTween().animate(curvedAnimation),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
