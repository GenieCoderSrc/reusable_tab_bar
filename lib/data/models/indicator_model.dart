import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/indicator_type.dart';

class IndicatorModel {
  final IndicatorType? type;
  final Color? color;
  final double? thickness;
  final double? radius;
  final double? verticalPadding;
  final Gradient? gradient;
  final Decoration? customDecoration;
  final CustomPainter? customPainter;

  const IndicatorModel({
    this.type = IndicatorType.underline,
    this.color,
    this.thickness = 2,
    this.radius,
    this.verticalPadding,
    this.gradient,
    this.customDecoration,
    this.customPainter,
  });
}
