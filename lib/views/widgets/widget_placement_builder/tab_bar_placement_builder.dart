import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_bar_position_type.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';
import 'package:reusable_tab_bar/views/widgets/tab_fab_switcher.dart';

class TabBarPlacementBuilder {
  Widget? build({
    required TabController controller,
    required TabWidgetBuilder tabBarBuilder,
    required TabBarPositionType tabBarPlacement,
    required TabBarPositionType currentPlacement,
    PreferredSizeWidget? appBar,
    Widget? child,
    List<Widget>? children,
  }) {
    // Only apply placement logic if this builder is responsible
    if (tabBarPlacement != currentPlacement) {
      // Return fallback: FABs or child
      if (currentPlacement == TabBarPositionType.float) {
        if (children != null && children.isNotEmpty) {
          return TabFABSwitcher(fabButtons: children);
        }
      }
      return child;
    }

    final tabBarWidget = tabBarBuilder(controller);

    switch (tabBarPlacement) {
      case TabBarPositionType.top:
        return _buildTopPlacement(tabBarWidget, appBar);

      case TabBarPositionType.bottom:
        return _buildBottomPlacement(tabBarWidget, child);

      case TabBarPositionType.float:
        return _buildFloatPlacement(tabBarWidget, children, child);

      case TabBarPositionType.body:
        return _buildBodyPlacement(tabBarWidget, child);
    }
  }

  Widget _buildTopPlacement(Widget tabBarWidget, PreferredSizeWidget? appBar) {
    if (appBar != null) {
      return PreferredSize(
        preferredSize: Size.fromHeight(
          appBar.preferredSize.height +
              (tabBarWidget is PreferredSizeWidget
                  ? tabBarWidget.preferredSize.height
                  : kToolbarHeight),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [appBar, tabBarWidget],
        ),
      );
    }
    return tabBarWidget;
  }

  Widget _buildBottomPlacement(Widget tabBarWidget, Widget? child) {
    if (child != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [tabBarWidget, child],
      );
    }
    return tabBarWidget;
  }

  Widget _buildFloatPlacement(
    Widget tabBarWidget,
    List<Widget>? fabButtons,
    Widget? child,
  ) {
    if (fabButtons != null && fabButtons.isNotEmpty) {
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          tabBarWidget,
          TabFABSwitcher(fabButtons: fabButtons),
        ],
      );
    }

    if (child != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [tabBarWidget, child],
      );
    }

    return tabBarWidget;
  }

  /// New: TabBar inside body
  Widget _buildBodyPlacement(Widget tabBarWidget, Widget? child) {
    if (child != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [tabBarWidget, child],
      );
    }
    return tabBarWidget;
  }
}

// class TabBarPlacementBuilder {
//   /// Builds a widget based on the screen's [tabBarPlacement]
//   /// and the placement this builder handles [currentPlacement].
//   ///
//   /// - [controller]: TabController for TabBar/TabBarView.
//   /// - [tabBarPlacement]: The current placement of the tabBar in the screen.
//   /// - [tabBarBuilder]: The main builder for TabBar widget.
//   /// - [currentPlacement]: The placement this builder is responsible for.
//   /// - [child]: Optional fallback widget if [tabBarPlacement] does not match [currentPlacement].
//   /// - [children]: Optional FAB widgets for floatBtn placement.
//   Widget? build({
//     required TabController controller,
//     required TabWidgetBuilder tabBarBuilder,
//     required TabBarPositionType tabBarPlacement,
//     required TabBarPositionType currentPlacement,
//     Widget? child,
//     List<Widget>? children,
//   }) {
//     // If the placement matches → always use the tabBarBuilder
//     if (tabBarPlacement == currentPlacement) {
//       return tabBarBuilder(controller);
//     }
//
//     switch (currentPlacement) {
//       case TabBarPositionType.float:
//         if (children != null && children.isNotEmpty) {
//           return TabFABSwitcher(fabButtons: children);
//         }
//         return child;
//
//       // Other placements (bottomBar, appBar, etc.) → just return fallback child
//       default:
//         return child;
//     }
//   }
// }
