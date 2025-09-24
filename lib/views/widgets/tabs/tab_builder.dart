import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/animation_type.dart';
import 'package:reusable_tab_bar/views/widgets/animations/animated_tab_builder.dart';

class TabBuilder {
  const TabBuilder._(); // Prevent instantiation

  static List<Widget> build({
    required TabController controller,
    required List<Widget> tabs,
    bool animated = true,
    AnimationType animationType = AnimationType.scale,
    double scaleFactor = 1.2,
    Color? selectedColor,
    Color? unselectedColor,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    if (!animated || animationType == AnimationType.none) return tabs;

    return AnimatedTabBuilder.build(
      controller: controller,
      tabs: tabs,
      animationType: animationType,
      animate: true,
      scaleFactor: scaleFactor,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      duration: duration,
    );
  }
}
