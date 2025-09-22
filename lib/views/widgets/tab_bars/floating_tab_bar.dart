import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';

class FloatingTabBar extends StatelessWidget {
  final TabWidgetBuilder tabBarBuilder;
  final TabController controller;

  const FloatingTabBar({
    super.key,
    required this.tabBarBuilder,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsetsGeometry.symmetric(horizontal: 20),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(32),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: tabBarBuilder(controller),
        ),
      ),
    );
  }
}
