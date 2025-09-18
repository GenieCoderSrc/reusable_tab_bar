import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model.dart';
import 'package:reusable_tab_bar/views/widgets/styled_tab_bar/animated_tab_wrapper.dart';
import 'package:reusable_tab_bar/views/widgets/tabs/tab_factory.dart';

class TabBuilder {
  const TabBuilder._();

  /// Build tabs from models with optional animation support.
  static List<Widget> buildAnimatedTabs({
    required List<TabItemModel> tabItems,
    required TabController controller,
    bool animate = true,
  }) {
    return List.generate(tabItems.length, (index) {
      final model = tabItems[index];
      final isSelected = controller.index == index;

      final tab = TabFactory.create(model);

      return animate
          ? AnimatedTabWrapper(selected: isSelected, child: tab)
          : tab;
    });
  }
}
