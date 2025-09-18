import 'package:flutter/material.dart';

import '../tab_bar_style_strategy.dart';

class SimpleTabBarStyle implements TabBarStyleStrategy {
  @override
  Widget build({
    required List<Widget> tabs,
    TabController? controller,
    Color? indicatorColor,
    Color? backgroundColor,
    double? borderRadius,
    EdgeInsets? padding,
    double? elevation,
    Color? labelColor,
    Color? unselectedLabelColor,
    Decoration? indicatorDecoration,

  }) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TabBar(
        controller: controller,
        tabs: tabs,
        indicator:
            indicatorDecoration ??
            UnderlineTabIndicator(
              borderSide: BorderSide(
                color: indicatorColor ?? Colors.blue,
                width: 2,
              ),
            ),
        labelColor: labelColor,
        unselectedLabelColor: unselectedLabelColor,
      ),
    );
  }
}
