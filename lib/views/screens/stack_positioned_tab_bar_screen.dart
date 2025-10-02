import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';
import 'package:reusable_tab_bar/views/widgets/tab_fab_switcher.dart';

import 'default_tab_provider.dart';

class StackPositionedTabBarScreen extends StatelessWidget {
  final List<Widget> pages;
  final TabWidgetBuilder tabBarBuilder;

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
        return Scaffold(
          drawer: drawer,

          /// bottom navigation
          bottomNavigationBar: bottomNavigation,

          /// floating action button(s)
          floatingActionButton: TabFABSwitcher(fabButtons: fabButtons),
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
                child: tabBarBuilder(controller),
              ),
            ],
          ),
        );
      },
    );
  }
}
