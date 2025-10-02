import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_bar_position_type.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';
import 'package:reusable_tab_bar/views/widgets/widget_placement_builder/tab_bar_placement_builder.dart';

import 'default_tab_provider.dart';

/// Sliver TabBar screen using CustomScrollView
/// Best for full sliver control and complex sliver layouts.
class SliverCustomTabBarScreen extends StatelessWidget {
  final List<Widget> pages;
  final TabWidgetBuilder tabBarBuilder;
  final TabBarPositionType tabBarPlacement;

  final int? initialIndex;
  final void Function(int)? onTabChanged;
  final TabBarCubit? tabBarCubit;

  final Widget? drawer;
  final Widget? sliverAppBar;

  final Widget? bottomNavigation;
  final List<Widget>? fabButtons;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  final double? defaultTabBarHeight;

  SliverCustomTabBarScreen({
    super.key,
    required this.pages,
    required this.tabBarBuilder,
    this.tabBarPlacement = TabBarPositionType.top,
    this.initialIndex,
    this.onTabChanged,
    this.tabBarCubit,
    this.drawer,
    this.sliverAppBar,
    this.fabButtons,
    this.bottomNavigation,
    this.floatingActionButtonLocation,
    this.defaultTabBarHeight,
  }) : assert(pages.isNotEmpty, 'pages cannot be empty');

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
          bottomNavigationBar: placementBuilder.build(
            controller: controller,
            tabBarPlacement: tabBarPlacement,
            tabBarBuilder: tabBarBuilder,
            currentPlacement: TabBarPositionType.bottom,
            child: bottomNavigation,
          ),
          floatingActionButton: placementBuilder.build(
            controller: controller,
            tabBarPlacement: tabBarPlacement,
            tabBarBuilder: tabBarBuilder,
            currentPlacement: TabBarPositionType.float,
            children: fabButtons,
          ),

          floatingActionButtonLocation: floatingActionButtonLocation,
          body: CustomScrollView(
            slivers: [
              placementBuilder.build(
                    controller: controller,
                    tabBarPlacement: tabBarPlacement,
                    tabBarBuilder: tabBarBuilder,
                    currentPlacement: TabBarPositionType.top,
                    child: sliverAppBar,
                    // appBar: sliverAppBar,
                  ) ??
                  const SliverToBoxAdapter(child: SizedBox.shrink()),
              SliverFillRemaining(
                child: TabBarView(controller: controller, children: pages),
              ),
            ],
          ),
        );
      },
    );
  }
}
