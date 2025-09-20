import 'package:flutter/material.dart';

/// A reusable Decoration that delegates drawing to a CustomPainter.
/// Supports animations via lerpFrom and lerpTo.
class CustomPainterDecoration extends Decoration {
  final Color? color;
  final double? size;
  final EdgeInsetsGeometry? insets;
  final CustomPainter Function(Size size, TextDirection? textDirection) painterBuilder;

  const CustomPainterDecoration({
    this.color,
    this.size,
    this.insets,
    required this.painterBuilder,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainterBoxPainter(painterBuilder);
  }

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is CustomPainterDecoration) {
      return CustomPainterDecoration(
        color: Color.lerp(a.color, color, t),
        size: _lerpDouble(a.size, size, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t),
        painterBuilder: painterBuilder,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is CustomPainterDecoration) {
      return CustomPainterDecoration(
        color: Color.lerp(color, b.color, t),
        size: _lerpDouble(size, b.size, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t),
        painterBuilder: painterBuilder,
      );
    }
    return super.lerpTo(b, t);
  }

  double? _lerpDouble(double? a, double? b, double t) {
    if (a == null && b == null) return null;
    return (a ?? 0) + ((b ?? 0) - (a ?? 0)) * t;
  }
}

class _CustomPainterBoxPainter extends BoxPainter {
  final CustomPainter Function(Size size, TextDirection? textDirection) painterBuilder;

  _CustomPainterBoxPainter(this.painterBuilder);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Size size = configuration.size ?? Size.zero;
    final TextDirection? direction = configuration.textDirection;

    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    final painter = painterBuilder(size, direction);
    painter.paint(canvas, size);

    canvas.restore();
  }
}
