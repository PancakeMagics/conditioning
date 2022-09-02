import 'package:flutter/material.dart' show GlobalKey, Offset, Size;

extension GetPosition on Offset {
  Offset toCenterOffset(Size size) => Offset(
    (dx + (dx + size.width)) / 2,
    (dy + (dy + size.height)) / 2,
  );

  Offset toCornerBOffset(Size size) => Offset(
    dx + size.width,
    dy + size.height,
  );

  /// Adjust target center.
  /// If Spotlight is a child of Scaffold, translation (Widget position) is shifted by AppBar, so adjust the center of ClipCircle.
  /// Spotlight が、Scaffold の子供の場合、translation (Widget position) が AppBar 分ずれるので、ClipCircle のセンターを調整する
  Offset adjustScaffold(GlobalKey stickyKey) {
    // Get the translation vector (widget position) from Spotlight
    var object = stickyKey.currentContext?.findRenderObject();
    var translation = object?.getTransformTo(null).getTranslation();
    if (translation != null) {
      return Offset(
        dx - translation.x,
        dy - translation.y,
      );
    } else {
      return this;
    }
  }
}
