import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_bar_placement.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';
import 'package:reusable_tab_bar/views/widgets/widget_placement_builder/tab_bar_placement_builder.dart';

import 'default_tab_provider.dart';

class StackPositionedTabBarScreen extends StatelessWidget {
  final List<Widget> pages;
  final TabWidgetBuilder tabBarBuilder;
  final WidgetPlacement tabBarPlacement;

  final int? initialIndex;
  final void Function(int)? onTabChanged;
  final TabBarCubit? tabBarCubit;

  final Widget? drawer;
  final Widget? bottomNavigation;
  final List<Widget>? fabButtons;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Position config for the tab bar inside Stack
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const StackPositionedTabBarScreen({
    super.key,
    required this.pages,
    required this.tabBarBuilder,
    this.tabBarPlacement = WidgetPlacement.stack,
    this.initialIndex,
    this.onTabChanged,
    this.tabBarCubit,
    this.drawer,
    this.bottomNavigation,
    this.fabButtons,
    this.floatingActionButtonLocation,
    this.top,
    this.bottom = 0, // default bottom placement
    this.left = 0,
    this.right = 0,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabProvider(
      tabCount: pages.length,
      initialIndex: initialIndex ?? 0,
      onTabChanged: onTabChanged,
      tabBarCubit: tabBarCubit,
      builder: (controller) {
        final placementBuilder = TabBarPlacementBuilder();

        return Scaffold(
          drawer: drawer,

          /// bottom navigation
          bottomNavigationBar: placementBuilder.build(
            controller: controller,
            tabBarPlacement: tabBarPlacement,
            tabBarBuilder: tabBarBuilder,
            currentWidget: WidgetPlacement.bottomBar,
            child: bottomNavigation,
          ),

          /// floating action button(s)
          floatingActionButton: placementBuilder.build(
            controller: controller,
            tabBarPlacement: tabBarPlacement,
            tabBarBuilder: tabBarBuilder,
            currentWidget: WidgetPlacement.floatBtn,
            children: fabButtons,
          ),
          floatingActionButtonLocation: floatingActionButtonLocation,

          /// body with stack overlay
          body: Stack(
            children: [
              /// main content
              TabBarView(controller: controller, children: pages),

              /// positioned tab bar overlay (variable position)
              Positioned(
                top: top,
                bottom: bottom,
                left: left,
                right: right,
                child:
                    placementBuilder.build(
                      controller: controller,
                      tabBarPlacement: tabBarPlacement,
                      tabBarBuilder: tabBarBuilder,
                      currentWidget: WidgetPlacement.stack,
                    ) ??
                    const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
    );
  }
}
