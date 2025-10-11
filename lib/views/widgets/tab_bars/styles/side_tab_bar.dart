import 'package:flutter/material.dart';

import 'base_tab_bar.dart';

class SideTabBar extends BaseTabBar {
  const SideTabBar({
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
    // Rotate the entire wrapped TabBar for vertical display
    return RotatedBox(
      quarterTurns: 1, // rotate 90° clockwise
      child: tabBar,
    );
  }
}
