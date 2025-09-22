import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_bar_placement.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';
import 'package:reusable_tab_bar/views/widgets/tab_fab_switcher.dart';

class TabBarPlacementBuilder {
  /// Builds a widget based on the screen's [tabBarPlacement]
  /// and the placement this builder handles [currentWidget].
  ///
  /// - [controller]: TabController for TabBar/TabBarView.
  /// - [tabBarPlacement]: The current placement of the tabBar in the screen.
  /// - [tabBarBuilder]: The main builder for TabBar widget.
  /// - [currentWidget]: The placement this builder is responsible for.
  /// - [child]: Optional fallback widget if [tabBarPlacement] does not match [currentWidget].
  /// - [children]: Optional FAB widgets for floatBtn placement.
  Widget? build({
    required TabController controller,
    required WidgetPlacement tabBarPlacement,
    required TabWidgetBuilder tabBarBuilder,
    required WidgetPlacement currentWidget,
    Widget? child,
    List<Widget>? children,
  }) {
    // If the placement matches → always use the tabBarBuilder
    if (tabBarPlacement == currentWidget) {
      return tabBarBuilder(controller);
    }

    switch (currentWidget) {
      case WidgetPlacement.floatBtn:
        if (children != null && children.isNotEmpty) {
          return TabFABSwitcher(fabButtons: children);
        }
        return child;

      // Other placements (bottomBar, appBar, etc.) → just return fallback child
      default:
        return child;
    }
  }
}
