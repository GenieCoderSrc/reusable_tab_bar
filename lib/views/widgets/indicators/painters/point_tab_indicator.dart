import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_indicator_position.dart';

class PointIndicatorPainter extends CustomPainter {
  final Color color;
  final double pointSize;
  final EdgeInsetsGeometry insets;
  final TabIndicatorPosition position;
  final TextDirection? textDirection;

  PointIndicatorPainter({
    required this.color,
    required this.pointSize,
    required this.insets,
    required this.position,
    this.textDirection,
  });

  // Only inject the direction, keep everything else same
  PointIndicatorPainter copyWithDirection(TextDirection? direction) {
    return PointIndicatorPainter(
      color: color,
      pointSize: pointSize,
      insets: insets,
      position: position,
      textDirection: direction,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final indicatorRect = insets.resolve(textDirection).deflateRect(rect);

    final paint = Paint()
      ..color = color
      ..strokeWidth = pointSize
      ..strokeCap = StrokeCap.round;

    final center = Offset(
      indicatorRect.left + indicatorRect.width / 2,
      position == TabIndicatorPosition.bottom
          ? indicatorRect.bottom
          : indicatorRect.top,
    );

    canvas.drawPoints(PointMode.points, [center], paint);
  }

  @override
  bool shouldRepaint(covariant PointIndicatorPainter oldDelegate) =>
      color != oldDelegate.color ||
      pointSize != oldDelegate.pointSize ||
      insets != oldDelegate.insets ||
      position != oldDelegate.position ||
      textDirection != oldDelegate.textDirection;
}
