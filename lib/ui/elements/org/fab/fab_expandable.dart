import 'package:conditioning/service/store/utils/animation_durations.dart';
import 'package:flutter/material.dart';
import 'package:conditioning/ui/elements/org/fab/fab_expandable_element.dart' show ExpandFAB;

@immutable
class ExpandableFAB extends StatefulWidget {
  const ExpandableFAB({
    Key? key,
    this.initialOpen,
    required this.stackAlignment,
    required this.children,
  }) : super(key: key);
  final bool? initialOpen;
  final Alignment stackAlignment;
  final double maxDistance = 96.0;
  final List<Widget> children;

  @override
  State<ExpandableFAB> createState() => _ExpandableFABState();
}

class _ExpandableFABState extends State<ExpandableFAB> with SingleTickerProviderStateMixin {
  late bool _open;
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      duration: mediumShortDuration,
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  Widget _buildTapToOpenFab() => IgnorePointer(
        ignoring: false,
        child: AnimatedContainer(
            transformAlignment: Alignment.center,
            transform: Matrix4.diagonal3Values(
              _open ? 0.7 : 1.0,
              _open ? 0.7 : 1.0,
              1.0,
            ),
            duration: const Duration(milliseconds: 250),
            curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
            child: AnimatedOpacity(
              opacity: _open ? 0.0 : 1.0,
              curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
              duration: const Duration(milliseconds: 250),
              child: SizedBox(
                width: 64,
                height: 64,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: _toggle,
                    child: const Icon(Icons.add_box),
                  ),
                ),
              ),
            )),
      );
  Widget _buildTapToCloseFab() => SizedBox(
        width: 48.0,
        height: 48.0,
        child: FittedBox(
          child: Center(
            child: Material(
              elevation: 4.0,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: _toggle,
                    child: const Icon(Icons.close),
                  )),
            ),
          ),
        ),
      );
  List<Widget> _buildFabElementButtons(Alignment stackAlignment) {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(ExpandFAB(
        stackAlignment: stackAlignment,
        directionInDegrees: angleInDegrees,
        maxDistance: widget.maxDistance,
        progress: _expandAnimation,
        child: widget.children[i],
      ));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    final stackAlignment = widget.stackAlignment;
    return SizedBox.expand(
      child: Stack(
        alignment: stackAlignment,
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildTapToCloseFab(),
          ),
          ..._buildFabElementButtons(stackAlignment),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }
}