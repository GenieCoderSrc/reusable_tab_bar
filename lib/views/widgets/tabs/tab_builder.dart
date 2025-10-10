import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_animation_type.dart';
import 'package:reusable_tab_bar/data/enums/tab_type.dart';
import 'package:reusable_tab_bar/data/enums/wrapper_type.dart';
import 'package:reusable_tab_bar/data/models/tab_animation_model.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/tab_item_model.dart';
import 'package:reusable_tab_bar/data/models/wrapper_model.dart';
import 'package:reusable_tab_bar/views/widgets/animations/tab_animated_builder.dart';
import 'package:reusable_tab_bar/views/widgets/tabs/tab_factory.dart';

// file: tab_builder.dart
class TabBuilder {
  const TabBuilder._();

  static List<Widget> build({
    required TabController controller,
    List<TabItemModel>? tabItems,
    final TabType? tabType,
    final bool? rotate,
    final int? rotateTurns,
    final WrapperModel? wrapperModel,
    List<Widget>? customTabs,
    TabAnimationModel animation = const TabAnimationModel(),
  }) {
    // 1️⃣ Create base tabs from TabItemModel via TabFactory
    final baseTabs =
        tabItems
            ?.map(
              (tabItems) => TabFactory.create(
                tabItems,
                tabType: tabType,
                rotate: rotate,
                rotateTurns: rotateTurns,
                wrapperModel: wrapperModel,
              ),
            )
            .toList() ??
        [];

    // 2️⃣ Use customTabs if provided
    final tabs = baseTabs.isNotEmpty ? baseTabs : (customTabs ?? []);

    // 3️⃣ Optionally animate
    if (!animation.enabled || animation.animationType == TabAnimationType.none) {
      return tabs;
    }

    return TabAnimatedBuilder.build(
      controller: controller,
      tabs: tabs,
      animation: animation,
    );
  }
}
