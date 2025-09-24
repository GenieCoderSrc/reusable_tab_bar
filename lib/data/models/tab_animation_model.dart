import 'dart:ui';

import 'package:reusable_tab_bar/data/enums/animation_type.dart';

/// Encapsulates animation-related properties for the tab list.
class TabAnimationModel {
  final bool enabled;
  final AnimationType type;
  final double scaleFactor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Duration duration;

  const TabAnimationModel({
    this.enabled = true,
    this.type = AnimationType.scale,
    this.scaleFactor = 1.2,
    this.selectedColor,
    this.unselectedColor,
    this.duration = const Duration(milliseconds: 300),
  });
}
