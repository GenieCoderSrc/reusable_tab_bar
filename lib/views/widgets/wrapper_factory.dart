import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/wrapper_type.dart';

/// Helper to build default wrappers based on [WrapperType].
class WrapperFactory {
  static Widget Function(Widget child) builder(
    WrapperType type, {
    EdgeInsets padding = const EdgeInsets.all(8),
    EdgeInsets? margin,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    switch (type) {
      case WrapperType.none:
        return (child) => child;

      case WrapperType.padded:
        return (child) => Padding(padding: padding, child: child);

      case WrapperType.card:
        return (child) => Card(
          margin: margin,
          color: backgroundColor,
          child: Padding(padding: padding, child: child),
        );

      case WrapperType.outlinedContainer:
        return (child) => Container(
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            border: borderColor != null ? Border.all(color: borderColor) : null,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: child,
        );
    }
  }
}
