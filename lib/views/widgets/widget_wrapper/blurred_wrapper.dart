import 'dart:ui';

import 'package:flutter/material.dart';

import 'i_wrapper.dart';

class BlurredWrapper implements IWrapper {
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final double borderRadius;
  final double blurX;
  final double blurY;

  const BlurredWrapper({
    this.margin,
    this.padding = const EdgeInsets.all(8),
    this.backgroundColor,
    this.borderRadius = 8,
    this.blurX = 8,
    this.blurY = 8,
  });

  @override
  Widget wrap(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurX, sigmaY: blurY),
        child: Container(
          margin: margin,
          padding: padding,
          color:
              backgroundColor?.withAlpha((0.3 * 255).round()) ??
              Colors.white.withAlpha((0.2 * 255).round()),
          child: child,
        ),
      ),
    );
  }
}
