import 'package:flutter/material.dart';

List<Widget> rotateWidgets(List<Widget> widgets, {int? quarterTurns}) {
  return widgets
      .map(
        (widget) => RotatedBox(quarterTurns: quarterTurns ?? 3, child: widget),
      )
      .toList();
}


List<Widget> rotateTabs(TabBar tabBar) {
  return tabBar.tabs.map((tab) {
    // Only rotate the content inside each tab, not the Tab widget itself
    if (tab is Tab && tab.child != null) {
      return Tab(
        child: RotatedBox(quarterTurns: 3, child: tab.child),
      );
    } else if (tab is Tab && tab.text != null) {
      return Tab(
        child: RotatedBox(quarterTurns: 3, child: Text(tab.text!)),
      );
    }
    return tab;
  }).toList();
}
