import 'package:conditioning/ui/animations/sin_curve.dart';
import 'package:flutter/material.dart';

class ArrowLoginScreens extends StatefulWidget {
  const ArrowLoginScreens({Key? key,
    required this.isLeft,
    required this.onTap,
  }) : super(key: key);
  final bool isLeft;
  final Function onTap;

  @override
  State<ArrowLoginScreens> createState() => _ArrowLoginScreensState();
}

class _ArrowLoginScreensState extends State<ArrowLoginScreens> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Tween<Offset> _tween;
  late final Animation<Offset> _animation;
  late bool _isLeft;

  @override
  void initState() {
    _isLeft = widget.isLeft;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..repeat();

    _tween =
        Tween(begin: const Offset(0.0, 0.0), end: const Offset(0.5, 0.0));
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
      quarterTurns: _isLeft ? 0 : 2,
      child: InkWell(
        onTap: () => widget.onTap(),
        child: SlideTransition(
          position: _animation,
          child: const Center(child: FlutterLogo(size: 20)),
        ),
      ),
    );
  }
}
