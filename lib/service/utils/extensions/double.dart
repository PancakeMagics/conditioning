import 'dart:developer';

import 'package:flutter/material.dart' show GlobalKey;

extension GetRealPosition on double {
  double adjustScaffold({required bool isX, required GlobalKey stickyKey}) {
    var object = stickyKey.currentContext?.findRenderObject();
    var translation = object?.getTransformTo(null).getTranslation();

    log('translation y: ${translation?.y}');
    log('translation x: ${translation?.y}');

    return (translation == null)
        ? this
        : isX
            ? this - translation.x
            : this - translation.y;
  }
}
