import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_indicator_type.dart';
import 'package:reusable_tab_bar/data/enums/tab_indicator_position.dart';

/// Model that encapsulates all possible configuration for a tab indicator.
class IndicatorModel {
  final TabIndicatorType type;
  final Color? color;
  final double? thickness;
  final double? radius;
  final BoxShape? shape;
  final Gradient? gradient;
  final Decoration? customDecoration;
  final double? verticalPadding;
  final EdgeInsetsGeometry? padding;
  final TabIndicatorPosition position;

  /// Builder for a custom painter. Provides the size and textDirection.
  final CustomPainter Function(Size size, TextDirection? direction)?
  customPainterBuilder;

  const IndicatorModel({
    this.type = TabIndicatorType.underline,
    this.color,
    this.thickness = 2,
    this.radius,
    this.shape,
    this.verticalPadding,
    this.gradient,
    this.customDecoration,
    this.padding,
    this.position = TabIndicatorPosition.bottom,
    this.customPainterBuilder,
  });
}
