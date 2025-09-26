import 'package:flutter/material.dart';
/// Encapsulates animation-related properties for the tab list.
import 'package:flutter/widgets.dart';
import 'package:reusable_tab_bar/data/enums/animation_type.dart';
import 'package:reusable_tab_bar/data/enums/wrapper_type.dart';
import 'package:reusable_tab_bar/data/models/wrapper_model.dart';

class TabAnimationModel {
  final bool enabled;
  final AnimationType animationType;
  final Duration? duration;
  final double? scaleFactor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final EdgeInsets? selectedPadding;
  final EdgeInsets? unselectedPadding;
  final Curve? curve;
  final Curve? scaleCurve;
  final Curve? opacityCurve;
  final Curve? containerCurve;

  /// Wrappers for selected state
  final WrapperType? selectedWrapperType;
  final WrapperModel? selectedWrapperModel;

  /// Wrappers for unselected state
  final WrapperType? unselectedWrapperType;
  final WrapperModel? unselectedWrapperModel;

  const TabAnimationModel({
    this.enabled = true,
    this.animationType = AnimationType.scale,
    this.scaleFactor = 1.2,
    this.duration = const Duration(milliseconds: 250),
    this.selectedColor,
    this.unselectedColor,
    this.selectedPadding,
    this.unselectedPadding,
    this.curve = Curves.easeInOut,
    this.scaleCurve = Curves.easeInOut,
    this.opacityCurve = Curves.easeInOut,
    this.containerCurve = Curves.easeInOut,
    this.selectedWrapperType,
    this.selectedWrapperModel,
    this.unselectedWrapperType,
    this.unselectedWrapperModel,
  });
}
