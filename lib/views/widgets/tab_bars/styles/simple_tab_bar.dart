import 'package:flutter/material.dart';

import 'base_tab_bar.dart';

class SimpleTabBar extends BaseTabBar {
  const SimpleTabBar({
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
    super.indicatorSize,
    super.labelColor,
    super.unselectedLabelColor,
  });

  @override
  @protected
  Widget buildContent(BuildContext context, Widget tabBar) {
    // For simple tab bar, just return the wrapped tab bar
    return tabBar;
  }
}
