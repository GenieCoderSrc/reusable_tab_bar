import 'package:flutter/material.dart';

/// Simple reusable building blocks for indicators
class IndicatorDecorations {
  /// Rounded container for bubble/rounded/dot/rectangle types
  static Decoration rounded({
    Color? color,
    double radius = 8,
    double? opacity,
  }) {
    return BoxDecoration(
      color: opacity != null ? color?.withValues(alpha: opacity) : color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Gradient container with optional border radius
  static Decoration gradient({Gradient? gradient, double radius = 16}) {
    return BoxDecoration(
      gradient:
          gradient ?? LinearGradient(colors: [Colors.blue, Colors.purple]),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Underline style
  static Decoration underline({Color? color, double thickness = 2}) {
    return UnderlineTabIndicator(
      borderSide: BorderSide(color: color ?? Colors.blue, width: thickness),
    );
  }

  /// Top line
  static Decoration topLine({
    Color? color,
    double thickness = 2,
    double verticalPadding = 0,
  }) {
    return UnderlineTabIndicator(
      borderSide: BorderSide(color: color ?? Colors.blue, width: thickness),
      insets: EdgeInsets.only(top: verticalPadding),
    );
  }
}
