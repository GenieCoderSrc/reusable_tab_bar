import 'package:flutter/material.dart';
import 'i_wrapper.dart';

class CardWrapper implements IWrapper {
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double borderRadius;
  final double elevation;
  final EdgeInsets padding;

  const CardWrapper({
    this.margin,
    this.backgroundColor,
    this.borderRadius = 8,
    this.elevation = 4,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget wrap(Widget child) {
    return Card(
      margin: margin,
      color: backgroundColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
