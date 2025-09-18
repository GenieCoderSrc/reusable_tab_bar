import 'package:flutter/material.dart';

/// Holds style information for a custom-shaped tab.
class CustomShapeTabModel {
  final EdgeInsets padding;
  final double borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final TextStyle textStyle;
  final BoxShadow? boxShadow;
  final Widget? child;

  const CustomShapeTabModel({
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.borderRadius = 16.0,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.blueAccent,
    this.borderWidth = 1.5,
    this.textStyle = const TextStyle(fontWeight: FontWeight.w600),
    this.boxShadow,
    this.child,
  });
}
