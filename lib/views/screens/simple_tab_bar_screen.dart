import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_bar_position_type.dart';
import 'package:reusable_tab_bar/data/widget_extension.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';
import 'package:reusable_tab_bar/views/widgets/widget_placement_builder/tab_bar_placement_builder.dart';

import 'default_tab_provider.dart';

class SimpleTabBarScreen extends StatelessWidget {
  final List<Widget> pages;
  final TabWidgetBuilder tabBarBuilder;
  final TabBarPosition tabBarPosition;

  final int? initialIndex;
  final void Function(int)? onTabChanged;
  final TabBarCubit? tabBarCubit;

  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigation;
  final List<Widget>? fabButtons;
  final List<PreferredSizeWidget>? appBars;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final double? defaultTabBarHeight;

  const SimpleTabBarScreen({
    super.key,
    required this.pages,
    required this.tabBarBuilder,
    this.tabBarPosition = TabBarPosition.top,
    this.initialIndex,
    this.onTabChanged,
    this.tabBarCubit,
    this.drawer,
    this.appBar,
    this.appBars,
    this.bottomNavigation,
    this.fabButtons,
    this.floatingActionButtonLocation,
    this.defaultTabBarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabProvider(
      tabCount: pages.length,
      initialIndex: initialIndex ?? 0,
      onTabChanged: onTabChanged,
      tabBarCubit: tabBarCubit,
      builder: (controller) {
        final placementBuilder = TabBarPlacementBuilder(
          defaultTabBarHeight: defaultTabBarHeight,
        );

        return Scaffold(
          drawer: drawer,

          /// app bar
          /// app bar - fixed type casting issue
          appBar: placementBuilder
              .build(
                controller: controller,
                tabBarPlacement: tabBarPosition,
                tabBarBuilder: tabBarBuilder,
                currentPlacement: TabBarPosition.top,
                child: appBar,
                children: appBars,
              )
              ?.let((widget) {
                // Ensure it's a PreferredSizeWidget for Scaffold.appBar
                if (widget is PreferredSizeWidget) return widget;
                // Wrap non-PreferredSizeWidget with PreferredSize
                return PreferredSize(
                  preferredSize: Size.fromHeight(
                    defaultTabBarHeight ?? kToolbarHeight,
                  ),
                  child: widget,
                );
              }),

          /// bottom navigation
          bottomNavigationBar: placementBuilder.build(
            controller: controller,
            tabBarPlacement: tabBarPosition,
            tabBarBuilder: tabBarBuilder,
            currentPlacement: TabBarPosition.bottom,
            child: bottomNavigation,
          ),

          /// floating action button(s)
          floatingActionButton: placementBuilder.build(
            controller: controller,
            tabBarPlacement: tabBarPosition,
            tabBarBuilder: tabBarBuilder,
            currentPlacement: TabBarPosition.float,
            children: fabButtons,
          ),
          floatingActionButtonLocation: floatingActionButtonLocation,

          /// tab view
          body: placementBuilder.build(
            controller: controller,
            tabBarBuilder: tabBarBuilder,
            tabBarPlacement: tabBarPosition,
            currentPlacement: TabBarPosition.body,
            child: TabBarView(controller: controller, children: pages),
          ),
        );
      },
    );
  }
}
