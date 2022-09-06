import 'package:conditioning/ui/elements/_generics/curve_sin.dart';
import 'package:conditioning/ui/elements/_login/arrow/arrow_direction.dart';
import 'package:flutter/material.dart';

@immutable
class AnimatingArrow extends StatefulWidget {
  const AnimatingArrow({
    Key? key,
    required this.onTap,
    required this.direction,
  }) : super(key: key);
  final Function onTap;
  final ArrowDirection direction;

  @override
  State<AnimatingArrow> createState() => _AnimatingArrowState();
}

class _AnimatingArrowState extends State<AnimatingArrow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Tween<Offset> _tween;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..repeat();

    _tween = Tween(begin: const Offset(0.0, 0.0), end: const Offset(0.5, 0.0));
    _animation = _tween
        .chain(CurveTween(curve: const SineCurve(count: 3)))
        .animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: widget.direction.index,
      child: InkWell(
        onTap: () => widget.onTap(),
        child: SlideTransition(
          position: _animation,
          // child: const Center(child: FlutterLogo(size: 20)),
          child: const Icon(Icons.arrow_back_outlined),
        ),
      ),
    );
  }
}
