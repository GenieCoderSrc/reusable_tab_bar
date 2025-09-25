import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/indicator_type.dart';
import 'package:reusable_tab_bar/data/enums/tab_indicator_position.dart';

import 'painters/custom_painter_decoration.dart';
import 'painters/point_tab_indicator.dart';

class TabIndicatorFactory {
  const TabIndicatorFactory._();

  static Decoration? build({
    required IndicatorType type,
    Color? color,
    double? height,
    double? width,
    double? borderRadius,
    Gradient? gradient,
    CustomPainter? customPainter,
    Decoration? customDecoration,
    EdgeInsetsGeometry? insets,
    TabIndicatorPosition position = TabIndicatorPosition.bottom,
  }) {
    switch (type) {
      case IndicatorType.none:
        return UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        );
      case IndicatorType.underline:
        return UnderlineTabIndicator(
          borderSide: BorderSide(
            color: color ?? Colors.blue,
            width: height ?? 3.0,
          ),
          insets: insets ?? EdgeInsets.zero,
        );

      case IndicatorType.gradient:
        return BoxDecoration(
          gradient:
              gradient ??
              LinearGradient(
                colors: [
                  color ?? Colors.blue,
                  (color ?? Colors.blue).withAlpha((0.7 * 255).round()),
                ],
              ),
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        );

      case IndicatorType.rounded:
        return BoxDecoration(
          color: color ?? Colors.blue,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        );

      case IndicatorType.dot:
        return CustomPainterDecoration(
          color: color ?? Colors.blue,
          size: height ?? 6.0,
          insets: insets,
          painterBuilder: (size, textDirection) => PointIndicatorPainter(
            color: color ?? Colors.blue,
            pointSize: height ?? 6.0,
            insets: insets ?? EdgeInsets.zero,
            position: position,
            textDirection: textDirection,
          ),
        );

      case IndicatorType.bubble:
        return BoxDecoration(
          color: color ?? Colors.blue.withAlpha((0.3 * 255).round()),
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        );

      case IndicatorType.rectangle:
        return BoxDecoration(
          color: color ?? Colors.blue,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        );

      case IndicatorType.topLine:
        return UnderlineTabIndicator(
          borderSide: BorderSide(
            color: color ?? Colors.blue,
            width: height ?? 3.0,
          ),
          insets: insets ?? EdgeInsets.zero,
        );

      case IndicatorType.customPainter:
        if (customPainter != null) {
          return CustomPainterDecoration(
            painterBuilder: (size, textDirection) => customPainter,
            insets: insets,
          );
        }
        return const UnderlineTabIndicator();

      case IndicatorType.custom:
        if (customDecoration != null) {
          return customDecoration;
        }
        return const UnderlineTabIndicator();
    }
  }
}
