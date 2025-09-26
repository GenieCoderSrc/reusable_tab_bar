import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/indicator_type.dart';

class IndicatorModel {
  final IndicatorType? type;
  final Color? color;
  final double? thickness;
  final double? radius;
  final BoxShape? shape;
  final double? verticalPadding;
  final Gradient? gradient;
  final Decoration? customDecoration;

  /// Builder for a custom painter. Provides the size and textDirection.
  final CustomPainter Function(Size size, TextDirection? direction)?
  customPainterBuilder;

  const IndicatorModel({
    this.type = IndicatorType.underline,
    this.color,
    this.thickness = 2,
    this.radius,
    this.shape,
    this.verticalPadding,
    this.gradient,
    this.customDecoration,
    this.customPainterBuilder,
  });
}
