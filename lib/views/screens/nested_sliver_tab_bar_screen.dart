import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';
import 'package:reusable_tab_bar/views/widgets/tab_fab_switcher.dart';

import 'default_tab_provider.dart';

/// Sliver TabBar screen using NestedScrollView
/// Best for inner scrollable content with collapsible/pinned app bar.
class NestedSliverTabBarScreen extends StatelessWidget {
  final List<Widget> pages;
  final TabWidgetBuilder sliverAppBar;

  final int? initialIndex;
  final void Function(int)? onTabChanged;
  final TabBarCubit? tabBarCubit;

  final Widget? drawer;
  final List<Widget>? fabButtons;
  final Widget? bottomNavigation;

  NestedSliverTabBarScreen({
    super.key,
    required this.pages,
    required this.sliverAppBar,
    this.initialIndex,
    this.onTabChanged,
    this.tabBarCubit,
    this.drawer,
    this.fabButtons,
    this.bottomNavigation,
  }) : assert(pages.isNotEmpty, 'pages cannot be empty');

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
          body: NestedScrollView(
            headerSliverBuilder: (_, __) => [sliverAppBar(controller)],
            body: TabBarView(controller: controller, children: pages),
          ),
        );
      },
    );
  }
}
