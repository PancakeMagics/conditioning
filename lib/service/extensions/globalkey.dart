
import 'package:flutter/material.dart' show GlobalKey, RenderBox;

extension GetRenderBox on GlobalKey {
  RenderBox get renderBox => currentContext?.findRenderObject() as RenderBox;
}