import 'package:flutter/material.dart';
import 'i_wrapper.dart';

class NeuMorphicWrapper implements IWrapper {
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final double borderRadius;
  final Color? shadowLightColor;
  final Color? shadowDarkColor;

  const NeuMorphicWrapper({
    this.margin,
    this.padding = const EdgeInsets.all(8),
    this.backgroundColor,
    this.borderRadius = 8,
    this.shadowLightColor,
    this.shadowDarkColor,
  });

  @override
  Widget wrap(Widget child) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey.shade200,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: shadowLightColor ?? Colors.white,
            offset: const Offset(-4, -4),
            blurRadius: 6,
          ),
          BoxShadow(
            color: shadowDarkColor ?? Colors.black26,
            offset: const Offset(4, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: child,
    );
  }
}
