import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_bar_placement.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';
import 'package:reusable_tab_bar/views/widgets/widget_placement_builder/tab_bar_placement_builder.dart';

import 'default_tab_provider.dart';

class SimpleTabBarScreen extends StatelessWidget {
  final List<Widget> pages;
  final TabWidgetBuilder tabBarBuilder;
  final WidgetPlacement tabBarPlacement;

  final int? initialIndex;
  final void Function(int)? onTabChanged;
  final TabBarCubit? tabBarCubit;

  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigation;
  final List<Widget>? fabButtons;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const SimpleTabBarScreen({
    super.key,
    required this.pages,
    required this.tabBarBuilder,
    this.tabBarPlacement = WidgetPlacement.appBar,
    this.initialIndex,
    this.onTabChanged,
    this.tabBarCubit,
    this.drawer,
    this.appBar,
    this.bottomNavigation,
    this.fabButtons,
    this.floatingActionButtonLocation,
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

          /// app bar
          appBar:
              placementBuilder.build(
                    controller: controller,
                    tabBarPlacement: tabBarPlacement,
                    tabBarBuilder: tabBarBuilder,
                    currentWidget: WidgetPlacement.appBar,
                    child: appBar,
                  )
                  as PreferredSizeWidget?,

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

          /// tab view
          body: TabBarView(controller: controller, children: pages),
        );
      },
    );
  }
}
