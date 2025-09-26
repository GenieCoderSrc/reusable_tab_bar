import 'package:flutter/material.dart';

/// Paints a rounded rectangle at the bottom of the tab area.
class RoundedIndicatorPainter extends CustomPainter {
  final Color color;
  final double radius;
  final double indicatorHeight;

  RoundedIndicatorPainter({
    required this.color,
    this.radius = 8,
    this.indicatorHeight = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Rect rect = Rect.fromLTWH(
      0,
      size.height - indicatorHeight,
      size.width,
      indicatorHeight,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(radius)),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant RoundedIndicatorPainter oldDelegate) =>
      color != oldDelegate.color ||
      radius != oldDelegate.radius ||
      indicatorHeight != oldDelegate.indicatorHeight;
}
