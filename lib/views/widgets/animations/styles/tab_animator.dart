import 'package:flutter/material.dart';

import 'i_tab_animator.dart';

class TabAnimator extends ITabAnimator {
  /// Enable/disable animations
  final bool? animate;

  /// Animation duration
  final Duration duration;

  /// Scale factor when selected
  final double scaleFactor;

  /// Optional colors
  final Color? selectedColor;
  final Color? unselectedColor;

  /// Optional padding
  final EdgeInsets? selectedPadding;
  final EdgeInsets? unselectedPadding;

  /// Optional animation curves
  final Curve? scaleCurve;
  final Curve? opacityCurve;
  final Curve? containerCurve;

  const TabAnimator({
    super.key,
    required super.child,
    required super.selected,
    super.selectedWrapperType,
    super.selectedWrapperModel,
    super.unselectedWrapperType,
    super.unselectedWrapperModel,
    this.animate = true,
    this.duration = const Duration(milliseconds: 250),
    this.scaleFactor = 1.1,
    this.selectedColor,
    this.unselectedColor,
    this.selectedPadding,
    this.unselectedPadding,
    this.scaleCurve,
    this.opacityCurve,
    this.containerCurve,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final effectivePadding = selected
        ? (selectedPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4))
        : (unselectedPadding ??
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4));

    if (animate == false) {
      return Padding(
        padding: effectivePadding,
        child: buildWrapperChild(), // ✅ wrapper support
      );
    }

    return AnimatedContainer(
      duration: duration,
      curve: containerCurve ?? Curves.easeInOut,
      padding: effectivePadding,
      child: AnimatedScale(
        scale: selected ? scaleFactor : 1.0,
        duration: duration,
        curve: scaleCurve ?? Curves.easeInOut,
        child: AnimatedOpacity(
          duration: duration,
          opacity: selected ? 1.0 : 0.7,
          curve: opacityCurve ?? Curves.easeInOut,
          child: DefaultTextStyle.merge(
            style: TextStyle(
              color: selected
                  ? (selectedColor ?? theme.primaryColor)
                  : (unselectedColor ?? Colors.grey),
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
            child: buildWrapperChild(), // ✅ wrapper applied correctly
          ),
        ),
      ),
    );
  }
}

// class TabAnimator extends StatelessWidget {
//   final Widget child;
//   final bool selected;
//
//   /// Enable/disable animations
//   final bool? animate;
//
//   /// Animation duration
//   final Duration duration;
//
//   /// Scale factor when selected
//   final double scaleFactor;
//
//   /// Optional colors
//   final Color? selectedColor;
//   final Color? unselectedColor;
//
//   /// Optional padding
//   final EdgeInsets? selectedPadding;
//   final EdgeInsets? unselectedPadding;
//
//   /// Optional animation curves
//   final Curve scaleCurve;
//   final Curve opacityCurve;
//   final Curve containerCurve;
//
//   const TabAnimator({
//     super.key,
//     required this.child,
//     required this.selected,
//     this.animate = true,
//     this.duration = const Duration(milliseconds: 250),
//     this.scaleFactor = 1.1,
//     this.selectedColor,
//     this.unselectedColor,
//     this.selectedPadding,
//     this.unselectedPadding,
//     this.scaleCurve = Curves.easeInOut,
//     this.opacityCurve = Curves.easeInOut,
//     this.containerCurve = Curves.easeInOut,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     final effectivePadding = selected
//         ? (selectedPadding ??
//               const EdgeInsets.symmetric(horizontal: 16, vertical: 4))
//         : (unselectedPadding ??
//               const EdgeInsets.symmetric(horizontal: 8, vertical: 4));
//
//     if (animate == false) {
//       return Padding(padding: effectivePadding, child: child);
//     }
//
//     return AnimatedContainer(
//       duration: duration,
//       curve: containerCurve,
//       padding: effectivePadding,
//       child: AnimatedScale(
//         scale: selected ? scaleFactor : 1.0,
//         duration: duration,
//         curve: scaleCurve,
//         child: AnimatedOpacity(
//           duration: duration,
//           opacity: selected ? 1.0 : 0.7,
//           curve: opacityCurve,
//           child: DefaultTextStyle.merge(
//             style: TextStyle(
//               color: selected
//                   ? (selectedColor ?? theme.primaryColor)
//                   : (unselectedColor ?? Colors.grey),
//               fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//             ),
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }
