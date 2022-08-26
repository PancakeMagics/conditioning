import 'package:flutter/material.dart';

enum SlideDirection { leftWord, upWord, rightWord, downWord, leftUpWord, leftDownWord, rightUpWord, rightDownWord }
class SlideWidgetBuilder extends StatefulWidget {
  const SlideWidgetBuilder({
    Key? key,
    required this.child,
    this.isSlideIn,
    this.slideDirection,
    this.curve,
  }) : super(key: key);
  final bool? isSlideIn;
  final SlideDirection? slideDirection;
  final Curve? curve;
  final Widget child;

  @override
  State<SlideWidgetBuilder> createState() => _SlideWidgetBuilderState();
}

class _SlideWidgetBuilderState extends State<SlideWidgetBuilder>
    // with TickerProviderStateMixin {
    with SingleTickerProviderStateMixin {

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
    switch (widget.isSlideIn) {
      case true:
        end = Offset.zero;
        switch (widget.slideDirection) {
          case SlideDirection.leftWord:
            begin = const Offset(1.0, 0.0);
            break;
          case SlideDirection.upWord:
            begin = const Offset(0.0, 1.0);
            break;
          case SlideDirection.rightWord:
            begin = const Offset(-1.0, 0.0);
            break;
          case SlideDirection.downWord:
            begin = const Offset(0.0, -1.0);
            break;
          case SlideDirection.leftUpWord:
            begin = const Offset(1.0, 1.0);
            break;
          case SlideDirection.leftDownWord:
            begin = const Offset(1.0, -1.0);
            break;
          case SlideDirection.rightUpWord:
            begin = const Offset(-1.0, 1.0);
            break;
          case SlideDirection.rightDownWord:
            begin = const Offset(-1.0, -1.0);
            break;
          default:
            begin = Offset.zero;
        }
        break;
      case false:
        begin = Offset.zero;
        switch (widget.slideDirection) {
          case SlideDirection.leftWord:
            end = const Offset(-1.0, 0.0);
            break;
          case SlideDirection.upWord:
            end = const Offset(0.0, -1.0);
            break;
          case SlideDirection.rightWord:
            end = const Offset(1.0, 0.0);
            break;
          case SlideDirection.downWord:
            end = const Offset(0.0, 1.0);
            break;
          case SlideDirection.leftUpWord:
            end = const Offset(-1.0, -1.0);
            break;
          case SlideDirection.leftDownWord:
            end = const Offset(-1.0, 1.0);
            break;
          case SlideDirection.rightUpWord:
            end = const Offset(1.0, -1.0);
            break;
          case SlideDirection.rightDownWord:
            end = const Offset(1.0, 1.0);
            break;
          default:
            end = Offset.zero;
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
