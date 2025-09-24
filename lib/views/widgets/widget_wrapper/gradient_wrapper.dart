import 'package:flutter/material.dart';

import 'i_wrapper.dart';

class GradientWrapper implements IWrapper {
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final double borderRadius;
  final Gradient? gradient;
  final List<Color>? gradientColors;

  const GradientWrapper({
    this.margin,
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = 8,
    this.gradient,
    this.gradientColors,
  });

  @override
  Widget wrap(Widget child) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient:
            gradient ??
            LinearGradient(
              colors: gradientColors ?? const [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
