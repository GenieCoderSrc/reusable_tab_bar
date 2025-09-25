import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/reusable_tab_bar.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';
import 'package:reusable_tab_bar/views/widgets/tab_fab_switcher.dart';

/// A reusable screen with vertical side TabBar
/// Tabs are displayed on the left, pages on the right.
class SideTabBarScreen extends StatelessWidget {
  final List<Widget> pages;
  final TabWidgetBuilder sideTabBarBuilder;

  final int? initialIndex;
  final void Function(int)? onTabChanged;
  final TabBarCubit? tabBarCubit;

  final Widget? drawer;
  final List<Widget>? fabButtons;
  final Widget? bottomNavigation;

  const SideTabBarScreen({
    super.key,
    required this.pages,
    required this.sideTabBarBuilder,
    this.initialIndex,
    this.onTabChanged,
    this.tabBarCubit,
    this.drawer,
    this.fabButtons,
    this.bottomNavigation,
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
          floatingActionButton: TabFABSwitcher(fabButtons: fabButtons),
          bottomNavigationBar: bottomNavigation,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildSideTabBar(controller),
              // Pages
              Expanded(
                child: TabBarView(controller: controller, children: pages),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildSideTabBar(TabController controller) {
    return Builder(
      builder: (context) {
        final tabBar = sideTabBarBuilder(controller);

        // If it's already a SideTabBar, use as is
        if (tabBar is SideTabBar) {
          return tabBar;
        }

        // Otherwise, rotate it
        return RotatedBox(quarterTurns: 1, child: tabBar);
      },
    );
  }
}
