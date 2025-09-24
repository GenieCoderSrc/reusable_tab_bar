import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/animation_type.dart';
import 'package:reusable_tab_bar/views/widgets/animations/styles/bounce_tab_animator.dart';
import 'package:reusable_tab_bar/views/widgets/animations/styles/fade_tab_animator.dart';
import 'package:reusable_tab_bar/views/widgets/animations/styles/scale_tab_animator.dart';
import 'package:reusable_tab_bar/views/widgets/animations/styles/slide_tab_animator.dart';
import 'package:reusable_tab_bar/views/widgets/animations/styles/tab_animator.dart';

class AnimatedTabFactory {
  static Widget build({
    required bool selected,
    required Widget child,
    AnimationType? animationType,
    Duration? duration,
    double? scaleFactor,
    Color? selectedColor,
    Color? unselectedColor,
    EdgeInsets? selectedPadding,
    EdgeInsets? unselectedPadding,
    Curve? scaleCurve,
    Curve? opacityCurve,
    Curve? containerCurve,
  }) {
    switch (animationType) {
      case AnimationType.fade:
        return FadeTabAnimator(
          selected: selected,
          child: child,
          duration: duration ?? const Duration(milliseconds: 250),
          curve: opacityCurve ?? Curves.easeInOut,
        );

      case AnimationType.slide:
        return SlideTabAnimator(
          selected: selected,
          child: child,
          duration: duration ?? const Duration(milliseconds: 250),
        );

      case AnimationType.scale:
        return ScaleTabAnimator(
          selected: selected,
          child: child,
          duration: duration ?? const Duration(milliseconds: 250),
          scaleFactor: scaleFactor ?? 1.1,
          curve: scaleCurve ?? Curves.easeInOut,
        );

      case AnimationType.bounceSimple:
        return ScaleTabAnimator(
          selected: selected,
          child: child,
          curve: Curves.elasticOut,
          scaleFactor: 1.2,
          duration: duration ?? const Duration(milliseconds: 300),
        );

      case AnimationType.bounceAdvanced:
        return BounceTabAnimator(
          selected: selected,
          child: child,
          duration: duration ?? const Duration(milliseconds: 300),
          scaleFactor: scaleFactor ?? 1.2,
        );

      case AnimationType.all:
      default:
        return TabAnimator(
          selected: selected,
          child: child,
          duration: duration ?? const Duration(milliseconds: 250),
          // all != none = true
          // none != none = false
          animate: animationType != AnimationType.none,
          scaleFactor: scaleFactor ?? 1.1,
          selectedColor: selectedColor,
          unselectedColor: unselectedColor,
          selectedPadding: selectedPadding,
          unselectedPadding: unselectedPadding,
          scaleCurve: scaleCurve ?? Curves.easeInOut,
          opacityCurve: opacityCurve ?? scaleCurve ?? Curves.easeInOut,
          containerCurve: containerCurve ?? scaleCurve ?? Curves.easeInOut,
        );
    }
  }
}

// class TabAnimatorFactory {
//   static Widget build({
//     required AnimationType animationType,
//     required bool selected,
//     required Widget child,
//
//     /// Animation duration
//     final Duration? duration,
//
//     /// Scale factor when selected
//     final double? scaleFactor,
//
//     /// Optional colors
//     final Color? selectedColor,
//     final Color? unselectedColor,
//
//     /// Optional padding
//     final EdgeInsets? selectedPadding,
//     final EdgeInsets? unselectedPadding,
//
//     /// Optional animation curves
//     final Curve? scaleCurve,
//     final Curve? opacityCurve,
//     final Curve? containerCurve,
//   }) {
//     switch (animationType) {
//       case AnimationType.scale:
//         return ScaleTabAnimator(selected: selected, child: child);
//       case AnimationType.fade:
//         return FadeTabAnimator(selected: selected, child: child);
//       case AnimationType.slide:
//         return SlideTabAnimator(selected: selected, child: child);
//       case AnimationType.bounce:
//         return BounceTabAnimator(selected: selected, child: child);
//       case AnimationType.all:
//         return TabAnimator(selected: selected, child: child);
//     }
//   }
// }
