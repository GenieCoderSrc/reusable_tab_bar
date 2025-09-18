
import 'package:flutter/material.dart';

/// Only used internally for custom painter type
class CustomPainterDecoration extends Decoration {
  final CustomPainter painter;

  CustomPainterDecoration(this.painter);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      _CustomPainterBox(painter);
}

class _CustomPainterBox extends BoxPainter {
  final CustomPainter painter;

  _CustomPainterBox(this.painter);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    painter.paint(canvas, cfg.size!);
  }
}
