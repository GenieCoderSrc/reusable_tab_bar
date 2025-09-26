import 'package:flutter/material.dart';
import 'i_wrapper.dart';

class SegmentedWrapper implements IWrapper {
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? selectedColor;
  final bool isSelected;

  const SegmentedWrapper({
    this.margin,
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = 12,
    this.backgroundColor,
    this.selectedColor,
    this.isSelected = false,
  });

  @override
  Widget wrap(Widget child) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: isSelected
            ? (selectedColor ??
                  Colors.blueAccent.withAlpha((0.2 * 255).round()))
            : (backgroundColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: isSelected
              ? (selectedColor ?? Colors.blueAccent)
              : Colors.grey,
          width: 1.5,
        ),
      ),
      child: child,
    );
  }
}
