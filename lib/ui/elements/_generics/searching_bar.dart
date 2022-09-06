import 'dart:ui' show window;
import 'package:conditioning/service/store/utils/animation_durations.dart';
import 'package:conditioning/service/utils/extensions/buildcontext.dart';
import 'package:conditioning/ui/elements/_generics/border_radius.dart';
import 'package:flutter/material.dart';

class SearchingBar extends StatefulWidget {
  const SearchingBar({
    Key? key,
    required this.backgroundColor,
    required this.child,
  }) : super(key: key);
  final Color backgroundColor;
  final Widget child;

  @override
  State<SearchingBar> createState() => _SearchingBarState();
}

class _SearchingBarState extends State<SearchingBar>
    with SingleTickerProviderStateMixin {
  final FocusNode _searchingFocusNode = FocusNode();
  late final double _searchingBarHeight;
  late final double _searchingBarTopPadding;
  late final Color _searchingColor;
  late final Color _pageColor;
  late final Color _backgroundColor;
  late final Offset _maxWindowOffset;
  late bool _isExpand;

  @override
  void initState() {
    final windowSize = MediaQueryData.fromWindow(window).size;
    _maxWindowOffset = Offset(windowSize.width, windowSize.height);
    _isExpand = false;
    _backgroundColor = widget.backgroundColor;
    _pageColor = Color.fromARGB(
      _backgroundColor.alpha,
      _backgroundColor.red + 30,
      _backgroundColor.green + 30,
      _backgroundColor.blue + 30,
    );
    _searchingColor = Color.fromARGB(
      _backgroundColor.alpha,
      _backgroundColor.red + 50,
      _backgroundColor.green + 50,
      _backgroundColor.blue + 50,
    );

    final appBarHeight = AppBar().preferredSize.height;
    _searchingBarHeight = appBarHeight * 4 / 5;
    _searchingBarTopPadding = appBarHeight / 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: Size.fromHeight(_searchingBarHeight),
        child: Stack(
          children: [
            widget.child,
            AnimatedPositioned(
              curve: Curves.fastLinearToSlowEaseIn,
              top: _isExpand ? 0.0 : _searchingBarTopPadding,
              left: _isExpand ? 0.0 : _maxWindowOffset.dx / 6,
              right:
                  _isExpand ? _maxWindowOffset.dx : _maxWindowOffset.dx * 1 / 24,
              height: _isExpand ? _maxWindowOffset.dy : _searchingBarHeight,
              duration: shortMediumDuration,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: borderRadius10,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      context.theme.primaryColor,
                      _backgroundColor,
                    ],
                  ),
                ),
                child: _searchingPage(),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.fastLinearToSlowEaseIn,
              top: _searchingBarTopPadding,
              left: _isExpand
                  ? _maxWindowOffset.dx / 10
                  : _maxWindowOffset.dx / 6,
              right: _maxWindowOffset.dx / 10,
              height: _searchingBarHeight,
              duration: shortDuration,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: borderRadius10,
                  color: _searchingColor,
                ),
                child: Focus(
                  child: SizedBox(
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: context.loc.hint_searching,
                          icon: InkWell(
                            child: AnimatedOpacity(
                              opacity: _isExpand ? 1.0 : 0.0,
                              duration: shortDuration,
                              child: const Icon(Icons.arrow_back),
                            ),
                            onTap: () => setState(() {
                              if (_isExpand) {
                                _isExpand = false;
                                _searchingFocusNode.unfocus();
                              }
                            }),
                          ),
                        ),
                        focusNode: _searchingFocusNode,
                      ),
                    ),
                  ),
                  onFocusChange: (hasFocus) {
                    if (hasFocus && !_isExpand) {
                      setState(() => _isExpand = true);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchingPage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: const BoxDecoration(borderRadius: borderRadius10),
      child: AnimatedOpacity(
        opacity: _isExpand ? 1.0 : 0.0,
        duration: shortDuration,
        child: Container(
          decoration: const BoxDecoration(border: Border(bottom: BorderSide())),
        ),
      ),
    );
  }
}
