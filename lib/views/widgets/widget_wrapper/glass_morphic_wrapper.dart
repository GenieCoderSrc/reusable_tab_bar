import 'dart:ui';

import 'package:flutter/material.dart';

import 'i_wrapper.dart';

class GlassMorphicWrapper implements IWrapper {
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final double borderRadius;

  const GlassMorphicWrapper({
    this.margin,
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = 12,
  });

  @override
  Widget wrap(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(
              colors: [
                Colors.white.withAlpha((0.2 * 255).round()),
                Colors.white.withAlpha((0.05 * 255).round()),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: Colors.white.withAlpha((0.2 * 255).round()),
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
