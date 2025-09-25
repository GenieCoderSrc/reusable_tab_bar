import 'package:flutter/material.dart';

import 'base_tab_bar.dart';

class SideTabBar extends BaseTabBar {
  const SideTabBar({
    super.key,
    required super.tabs,
    super.controller,
    super.wrapperType,
    super.wrapperModel,
    super.isScrollable,
    super.tabSpacing,
    super.tabAlignment,
    super.indicatorColor,
    super.indicator,
    super.dividerColor,
    super.dividerHeight,
    super.indicatorSize,
    super.labelColor,
    super.unselectedLabelColor,
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
