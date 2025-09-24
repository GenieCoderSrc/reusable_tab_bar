import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/animation_type.dart';
import 'package:reusable_tab_bar/views/widgets/animations/tab_animator_factory.dart';

/// Factory to build animated tabs with different animation styles.
class AnimatedTabBuilder {
  const AnimatedTabBuilder._(); // Prevent instantiation

  static List<Widget> build({
    required TabController controller,
    required List<Widget> tabs,
    AnimationType animationType = AnimationType.scale,
    bool animate = true,
    Duration duration = const Duration(milliseconds: 250),
    double scaleFactor = 1.1,
    Color? selectedColor,
    Color? unselectedColor,
    EdgeInsets? selectedPadding,
    EdgeInsets? unselectedPadding,
    Curve scaleCurve = Curves.easeInOut,
    Curve opacityCurve = Curves.easeInOut,
    Curve containerCurve = Curves.easeInOut,
  }) {
    return List.generate(tabs.length, (index) {
      return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          final selected = controller.index == index;

          return AnimatedTabFactory.build(
            selected: selected,
            child: tabs[index],
            animationType: animationType,
            duration: duration,
            scaleFactor: scaleFactor,
            selectedColor: selectedColor,
            unselectedColor: unselectedColor,
            selectedPadding: selectedPadding,
            unselectedPadding: unselectedPadding,
            scaleCurve: scaleCurve,
            opacityCurve: opacityCurve,
            containerCurve: containerCurve,
          );
        },
      );
    });
  }
}
