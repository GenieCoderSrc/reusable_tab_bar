import 'package:flutter/material.dart';

/// Wraps any tab widget with animated selection effects.
/// Works with IconTextTab, LottieTab, ImageTab, CustomShapeTab, or custom tabs.
class AnimatedTabWrapper extends StatelessWidget {
  final Widget child;
  final bool selected;
  final Duration duration;
  final double scaleFactor;
  final Color? selectedColor;
  final Color? unselectedColor;

  const AnimatedTabWrapper({
    super.key,
    required this.child,
    required this.selected,
    this.duration = const Duration(milliseconds: 250),
    this.scaleFactor = 1.1,
    this.selectedColor,
    this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: duration,
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(horizontal: selected ? 16 : 8, vertical: 4),
      child: AnimatedScale(
        scale: selected ? scaleFactor : 1.0,
        duration: duration,
        curve: Curves.easeInOut,
        child: AnimatedOpacity(
          duration: duration,
          opacity: selected ? 1.0 : 0.7,
          child: DefaultTextStyle.merge(
            style: TextStyle(
              color: selected
                  ? (selectedColor ?? theme.primaryColor)
                  : (unselectedColor ?? Colors.grey),
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
