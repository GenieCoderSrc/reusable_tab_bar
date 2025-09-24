import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/animation_type.dart';
import 'package:reusable_tab_bar/data/enums/tab_type.dart';
import 'package:reusable_tab_bar/data/models/tab_animation_model.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/tab_item_model.dart';
import 'package:reusable_tab_bar/views/widgets/animations/animated_tab_builder.dart';
import 'package:reusable_tab_bar/views/widgets/tabs/tab_factory.dart';

// file: tab_builder.dart
class TabBuilder {
  const TabBuilder._();

  static List<Widget> build({
    required TabController controller,
    List<TabItemModel>? tabItems,
    List<Widget>? customTabs,
    TabAnimationModel animation = const TabAnimationModel(),
  }) {
    // 1️⃣ Create base tabs from TabItemModel via TabFactory
    final baseTabs = tabItems?.map(TabFactory.create).toList() ?? [];

    // 2️⃣ Use customTabs if provided
    final tabs = baseTabs.isNotEmpty ? baseTabs : (customTabs ?? []);

    // 3️⃣ Optionally animate
    if (!animation.enabled || animation.type == AnimationType.none) {
      return tabs;
    }

    return AnimatedTabBuilder.build(
      controller: controller,
      tabs: tabs,
      animationType: animation.type,
      scaleFactor: animation.scaleFactor,
      selectedColor: animation.selectedColor,
      unselectedColor: animation.unselectedColor,
      duration: animation.duration,
    );
  }
}
