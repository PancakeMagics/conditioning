import 'dart:developer';
import 'dart:ui';
import 'package:conditioning/service/utils/extensions/offset.dart';
import 'package:conditioning/ui/elements/_generics/border_radius.dart';
import 'package:flutter/material.dart';

import 'clipper/clipper_rect.dart';
import 'clipper/clipper_rrect.dart';

part 'pes_item.dart';

part 'pes_state.dart';

class PesPen extends StatefulWidget {
  const PesPen({
    Key? key,
    required this.pesView,
    required this.pesItem,
    required this.child,
  }) : super(key: key);
  final Widget pesView;
  final PesItem? pesItem;
  final Widget child;

  @override
  State<PesPen> createState() => _PesPenState();
}

class _PesPenState extends State<PesPen> with SingleTickerProviderStateMixin {
  late final double _windowWidth;
  late final double _windowHeight;
  late final Offset _maxWindowOffset;
  late final GlobalKey _stickyKey;
  late final AnimationController _controller;
  late final Animation _animation;
  late final Tween _tween;

  late PesItem? _item;
  late double _itemWidth;
  late double _itemHeight;

  // late Offset _itemCenterOffset;
  late Offset _itemCornerAOffset;
  late Offset _itemCornerBOffset;
  late PesState _pesState;
  late bool _expandOver;
  late double _fraction;

  @override
  void initState() {
    final windowSize = MediaQueryData.fromWindow(window).size;
    _windowWidth = windowSize.width;
    _windowHeight = windowSize.height;
    _maxWindowOffset = Offset(windowSize.width, windowSize.height);
    _stickyKey = GlobalKey();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _tween = Tween(begin: 0.0, end: 1.0);
    _animation = _tween
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease))
      ..addListener(() => setState(() => _fraction = _animation.value));


    _pesState = PesState.inPool;
    _expandOver = false;
    _fraction = 0.0;
    _item = null;
    // _itemCenterOffset =
    _itemCornerAOffset = _itemCornerBOffset = const Offset(0.0, 0.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PesPen oldWidget) {
    if (widget.pesItem != oldWidget.pesItem) {
      _pesState = PesState.inPosition;
      _controller.forward();
      _item = widget.pesItem!;
      _itemCornerAOffset = _item!.itemZeroOffset;
      _itemCornerBOffset = _itemCornerAOffset.toCornerBOffset(_item!.itemSize);
      // _itemCenterOffset = ((_itemCornerAOffset + _itemCornerBOffset) / 2)
      //     .adjustScaffold(_stickyKey);

      _itemWidth = _item!.itemSize.width;
      _itemHeight = _item!.itemSize.height;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: _stickyKey,
      children: [
        widget.child,
        IgnorePointer(
          ignoring:
              _pesState == PesState.inPosition || _pesState == PesState.inPool,
          child: AnimatedOpacity(
            curve: Curves.easeOut,
            opacity: _pesState == PesState.expand ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1000),
            child: Stack(
              children: [
                _getPen(),
                _getPes(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getPen() => GestureDetector(
        child: ClipPath(
          clipper: RRectClipper(
            /// from itemCenter to windowSize
            // cornerA: _itemCenterOffset * (1 - _fraction),
            // cornerB: _itemCenterOffset + (_maxWindowOffset - _itemCenterOffset) * _fraction,

            /// from itemCorner to windowSize
            cornerA: _itemCornerAOffset * (1 - _fraction),
            cornerB: _itemCornerBOffset +
                (_maxWindowOffset - _itemCornerBOffset) * _fraction,
          ),
          child: Container(color: const Color.fromRGBO(0, 0, 0, 0.6)),
        ),
        onTap: () => _shrink(),
      );

  Widget _getPes() => AnimatedPositioned(
        curve: Curves.easeInQuart,
        left: _pesTargetPosition('left'),
        top: _pesTargetPosition('top'),
        width: _pesTargetPosition('width'),
        height: _pesTargetPosition('height'),
        duration: _pesTargetDuration(_pesState),
        child: Material(
          borderRadius: borderRadius10,
          child: Card(
            borderOnForeground: false,
            elevation: 50.0,
            child: AnimatedOpacity(
              curve: Curves.easeOut,
              opacity: _expandOver ? 1.0 : 0.0,
              duration: _expandOver
                  ? const Duration(milliseconds: 500)
                  : const Duration(milliseconds: 100),
              child: Stack(
                children: [
                  widget.pesView,
                  Positioned(
                    child: IconButton(
                      onPressed: () => _shrink(),
                      icon: const Icon(Icons.cancel_sharp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onEnd: () {
          switch (_pesState) {
            case PesState.inPosition:
              setState(() => _pesState = PesState.expand);
              break;
            case PesState.expand:
              setState(() => _expandOver = true);
              break;
            case PesState.shrink:
              setState(() => _pesState = PesState.inPool);
              break;
            case PesState.inPool:
              break;
          }
        },
      );
  double _pesTargetPosition(String what) {
    double value = 0.0;
    if (_item != null) {
      switch (_pesState) {
        case PesState.inPosition:
        case PesState.shrink:
          switch (what) {
            case 'left':
              value = _itemCornerAOffset.dx;
              break;
            case 'top':
              value = _itemCornerAOffset.dy;
              break;
            case 'width':
              value = _itemWidth;
              break;
            case 'height':
              value = _itemHeight;
              break;
          }
          break;
        case PesState.expand:
          switch (what) {
            case 'left':
              value = (_windowWidth - _itemWidth) / 4;
              break;
            case 'top':
              value = _windowHeight * 1 / 16;
              break;
            // (_windowWidth/2 - (_windowWidth - item.itemLeft)/4) * 2;
            case 'width':
              value = _windowWidth - (_windowWidth - _itemWidth) / 2;
              break;
            case 'height':
              value = _windowHeight * 7 / 8;
              break;
          }
          break;
        case PesState.inPool:
          value = 0.0;
          break;
      }
    }
    return value;
  }
  Duration _pesTargetDuration(PesState state) {
    switch (state) {
      case PesState.inPosition:
        return const Duration(microseconds: 10);
      case PesState.expand:
        return const Duration(milliseconds: 500);
      case PesState.shrink:
        return const Duration(milliseconds: 500);
      case PesState.inPool:
        return const Duration(microseconds: 10);
    }
  }
  void _shrink() {
    setState(() {
      _expandOver = false;
      _controller.reverse();
      _pesState = PesState.shrink;
    });
  }
}
