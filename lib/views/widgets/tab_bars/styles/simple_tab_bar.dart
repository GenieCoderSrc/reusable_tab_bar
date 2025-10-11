import 'package:flutter/material.dart';

import 'base_tab_bar.dart';

class SimpleTabBar extends BaseTabBar {
  const SimpleTabBar({
    super.key,
    super.wrapperModel,
    super.tabSpacing,
    required super.tabs,
    super.controller,
    super.isScrollable,
    super.tabAlignment,
    super.indicatorColor,
    super.indicator,
    super.dividerHeight,
    super.dividerColor,
    super.indicatorSize,
    super.indicatorPadding,
    super.labelColor,
    super.unselectedLabelColor,
    super.padding,
    super.labelStyle,
    super.unselectedLabelStyle,
    super.labelPadding,
    super.textScaler,
    super.indicatorWeight,
    super.indicatorAnimation,
    super.splashFactory,
    super.splashBorderRadius,
    super.dragStartBehavior,
    super.mouseCursor,
    super.onTap,
  });

  @override
  @protected
  Widget buildContent(BuildContext context, Widget tabBar) {
    // For simple tab bar, just return the wrapped tab bar
    return tabBar;
  }
}
