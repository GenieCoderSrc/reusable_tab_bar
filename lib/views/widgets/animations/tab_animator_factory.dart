import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reusable_tab_bar/data/enums/tab_animation_type.dart';
import 'package:reusable_tab_bar/data/models/tab_animation_model.dart';
import 'package:reusable_tab_bar/views/widgets/animations/styles/bounce_tab_animator.dart';
import 'package:reusable_tab_bar/views/widgets/animations/styles/fade_tab_animator.dart';
import 'package:reusable_tab_bar/views/widgets/animations/styles/scale_tab_animator.dart';
import 'package:reusable_tab_bar/views/widgets/animations/styles/slide_tab_animator.dart';
import 'package:reusable_tab_bar/views/widgets/animations/styles/tab_animator.dart';

class TabAnimatorFactory {
  static Widget build({
    required bool selected,
    required Widget child,
    required TabAnimationModel animation,
  }) {
    switch (animation.animationType) {
      case TabAnimationType.fade:
        return FadeTabAnimator(
          selected: selected,
          child: child,
          duration: animation.duration ?? const Duration(milliseconds: 250),
          curve: animation.opacityCurve ?? animation.curve ?? Curves.easeInOut,
          selectedWrapperType: animation.selectedWrapperType,
          selectedWrapperModel: animation.selectedWrapperModel,
          unselectedWrapperType: animation.unselectedWrapperType,
          unselectedWrapperModel: animation.unselectedWrapperModel,
        );

      case TabAnimationType.slide:
        return SlideTabAnimator(
          selected: selected,
          child: child,
          curve: animation.containerCurve ?? animation.curve,
          duration: animation.duration ?? const Duration(milliseconds: 250),
          selectedWrapperType: animation.selectedWrapperType,
          selectedWrapperModel: animation.selectedWrapperModel,
          unselectedWrapperType: animation.unselectedWrapperType,
          unselectedWrapperModel: animation.unselectedWrapperModel,
        );

      case TabAnimationType.scale:
        return ScaleTabAnimator(
          selected: selected,
          child: child,
          duration: animation.duration ?? const Duration(milliseconds: 250),
          scaleFactor: animation.scaleFactor ?? 1.1,
          curve: animation.scaleCurve ?? animation.curve ?? Curves.easeInOut,
          selectedWrapperType: animation.selectedWrapperType,
          selectedWrapperModel: animation.selectedWrapperModel,
          unselectedWrapperType: animation.unselectedWrapperType,
          unselectedWrapperModel: animation.unselectedWrapperModel,
        );

      case TabAnimationType.bounceSimple:
        return ScaleTabAnimator(
          selected: selected,
          child: child,
          curve: animation.curve ?? Curves.elasticOut,
          scaleFactor: 1.2,
          duration: animation.duration ?? const Duration(milliseconds: 300),
          selectedWrapperType: animation.selectedWrapperType,
          selectedWrapperModel: animation.selectedWrapperModel,
          unselectedWrapperType: animation.unselectedWrapperType,
          unselectedWrapperModel: animation.unselectedWrapperModel,
        );

      case TabAnimationType.bounceAdvanced:
        return BounceTabAnimator(
          selected: selected,
          child: child,
          duration: animation.duration ?? const Duration(milliseconds: 300),
          curve: animation.curve,
          scaleFactor: animation.scaleFactor ?? 1.2,
          selectedWrapperType: animation.selectedWrapperType,
          selectedWrapperModel: animation.selectedWrapperModel,
          unselectedWrapperType: animation.unselectedWrapperType,
          unselectedWrapperModel: animation.unselectedWrapperModel,
        );

      case TabAnimationType.all:
      default:
        return TabAnimator(
          selected: selected,
          child: child,
          duration: animation.duration ?? const Duration(milliseconds: 250),
          animate: animation.animationType != TabAnimationType.none,
          scaleFactor: animation.scaleFactor ?? 1.1,
          selectedColor: animation.selectedColor,
          unselectedColor: animation.unselectedColor,
          selectedPadding: animation.selectedPadding,
          unselectedPadding: animation.unselectedPadding,
          scaleCurve:
              animation.scaleCurve ?? animation.curve ?? Curves.easeInOut,
          opacityCurve:
              animation.opacityCurve ?? animation.curve ?? Curves.easeInOut,
          containerCurve:
              animation.containerCurve ?? animation.curve ?? Curves.easeInOut,
          selectedWrapperType: animation.selectedWrapperType,
          selectedWrapperModel: animation.selectedWrapperModel,
          unselectedWrapperType: animation.unselectedWrapperType,
          unselectedWrapperModel: animation.unselectedWrapperModel,
        );
    }
  }
}
