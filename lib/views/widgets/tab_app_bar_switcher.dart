import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';

/// Switches AppBars per active tab or uses a single AppBar if provided.
/// Dynamically calculates PreferredSize based on the appBar(s) + tabBarWidget.

class TabAppBarSwitcher extends StatelessWidget {
  final Widget? appBar; // single app bar
  final List<Widget>? appBars; // multiple app bars (per tab)
  final Widget tabBarWidget;
  final double? defaultTabBarHeight;

  const TabAppBarSwitcher({
    super.key,
    required this.tabBarWidget,
    this.appBar,
    this.appBars,
    this.defaultTabBarHeight,
  });

  @override
  Widget build(BuildContext context) {
    // case: multiple appBars (per tab)
    if (appBars != null && appBars!.isNotEmpty) {
      return BlocBuilder<TabBarCubit, TabBarState>(
        // only rebuild when index changes
        buildWhen: (prev, curr) => prev.index != curr.index,
        builder: (context, tabState) {
          final index = tabState.index;
          if (index >= appBars!.length)
            return _wrapWithPreferredSize(tabBarWidget);

          final activeAppBar = appBars![index];
          return _buildTabAppBar(appBar: activeAppBar);
        },
      );
    }

    // case: single appBar
    if (appBar != null) {
      return _buildTabAppBar(appBar: appBar);
    }

    // fallback: only tabBar
    return _wrapWithPreferredSize(tabBarWidget);
  }

  /// Builds the tab bar with the provided app bar (single or per-tab)
  Widget _buildTabAppBar({Widget? appBar}) {
    if (appBar != null) {
      final tabAppBar = Column(
        mainAxisSize: MainAxisSize.min,
        children: [appBar, tabBarWidget],
      );

      if (appBar is PreferredSizeWidget) {
        final appBarHeight = _resolveHeight(appBar);
        final tabBarHeight = _resolveHeight(tabBarWidget);

        return PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight + tabBarHeight),
          child: tabAppBar,
        );
      }

      // Any other widget (e.g., SliverAppBar)
      return tabAppBar;
    }

    return _wrapWithPreferredSize(tabBarWidget);
  }

  double _resolveHeight(Widget? widget) {
    if (widget == null) return 0;
    if (widget is PreferredSizeWidget) return widget.preferredSize.height;
    return defaultTabBarHeight ?? kToolbarHeight;
  }

  /// Wraps a widget with PreferredSize if it isn't already
  Widget _wrapWithPreferredSize(Widget widget) {
    if (widget is PreferredSizeWidget) return widget;
    return PreferredSize(
      preferredSize: Size.fromHeight(defaultTabBarHeight ?? kToolbarHeight),
      child: widget,
    );
  }
}
