import 'package:flutter/material.dart';

import 'i_wrapper.dart';

class OutlinedContainerWrapper implements IWrapper {
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final BoxShadow? boxShadow;
  final double borderWidth;

  const OutlinedContainerWrapper({
    this.margin,
    this.padding = const EdgeInsets.all(8),
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 8,
    this.boxShadow,
    this.borderWidth = 1,
  });

  @override
  Widget wrap(Widget child) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow != null ? [boxShadow!] : null,
      ),
      child: child,
    );
  }
}
