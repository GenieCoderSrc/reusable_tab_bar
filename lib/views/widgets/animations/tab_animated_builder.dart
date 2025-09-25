import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/models/tab_animation_model.dart';
import 'package:reusable_tab_bar/views/widgets/animations/tab_animator_factory.dart';

/// Factory to build animated tabs with different animation styles.
class TabAnimatedBuilder {
  const TabAnimatedBuilder._(); // Prevent instantiation

  static List<Widget> build({
    required TabController controller,
    required List<Widget> tabs,
    required TabAnimationModel animation,
  }) {
    return List.generate(tabs.length, (index) {
      return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          final selected = controller.index == index;

          return TabAnimatorFactory.build(
            selected: selected,
            child: tabs[index],
            animation: animation,
          );
        },
      );
    });
  }
}
