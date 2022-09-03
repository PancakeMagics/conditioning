import 'dart:ui';

import 'package:conditioning/service/settings/animation_durations.dart';
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:flutter/material.dart';

class SearchingBar extends StatefulWidget {
  const SearchingBar({
    Key? key,
    required this.backgroundColor,
    required this.child,
  }) : super(key: key);
  final Widget child;
  final Color backgroundColor;

  @override
  State<SearchingBar> createState() => _SearchingBarState();
}

class _SearchingBarState extends State<SearchingBar>
    with SingleTickerProviderStateMixin {
  late final Offset _maxWindowOffset;
  late final FocusNode _focusNode;
  late bool _isExpand;

  @override
  void initState() {
    final windowSize = MediaQueryData.fromWindow(window).size;
    _maxWindowOffset = Offset(windowSize.width, windowSize.height);
    _isExpand = false;
    _focusNode = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final overlayColor = widget.backgroundColor;
    final pageColor = Color.fromARGB(
      overlayColor.alpha,
      overlayColor.red + 30,
      overlayColor.green + 30,
      overlayColor.blue + 30,
    );
    final searchingColor = Color.fromARGB(
      overlayColor.alpha,
      overlayColor.red + 50,
      overlayColor.green + 50,
      overlayColor.blue + 50,
    );

    return Stack(
      children: [
        widget.child,
        AnimatedPositioned(
          curve: Curves.fastLinearToSlowEaseIn,
          top: _isExpand ? 0.0 : 20.0,
          left: _isExpand ? 0.0 : _maxWindowOffset.dx / 6,
          width: _isExpand ? _maxWindowOffset.dx : _maxWindowOffset.dx * 5 / 6,
          height: _isExpand ? _maxWindowOffset.dy : 48.0,
          duration: shortDuration,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: overlayColor,
            ),
          ),
        ),
        AnimatedPositioned(
          curve: Curves.fastLinearToSlowEaseIn,
          top: 20.0,
          left: _isExpand ? _maxWindowOffset.dx / 10 : _maxWindowOffset.dx / 8,
          right:
              _isExpand ? _maxWindowOffset.dx / 10 : _maxWindowOffset.dx / 24,
          height: _isExpand ? _maxWindowOffset.dy * 7/8 : 48.0,
          duration: shortDuration,
          child: _searchingPage(pageColor),
        ),
        AnimatedPositioned(
          curve: Curves.fastLinearToSlowEaseIn,
          top: 20.0,
          left: _isExpand ? _maxWindowOffset.dx / 10 : _maxWindowOffset.dx / 8,
          right: _maxWindowOffset.dx / 10,
          height: 48.0,
          duration: shortDuration,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: searchingColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: AnimatedOpacity(
                          opacity: _isExpand ? 1.0 : 0.0,
                          duration: shortDuration,
                          child: const Icon(Icons.arrow_back),
                        ),
                        onTap: () => setState(() {
                          if (_isExpand) {
                            _isExpand = false;
                            _focusNode.unfocus();
                          }
                        }),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Focus(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: context.loc.hint_searching,
                            ),
                            focusNode: _focusNode,
                          ),
                          onFocusChange: (hasFocus) {
                            if (hasFocus && !_isExpand)
                              setState(() => _isExpand = true);
                          },
                        ),
                      )
                    ],
                  ),
                  AnimatedOpacity(
                    opacity: _isExpand ? 1.0 : 0.0,
                    duration: shortDuration,
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide())),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchingPage(Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        color: color,
      ),
    );
  }
}
