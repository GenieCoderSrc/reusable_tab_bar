import 'dart:ui';

import 'package:flutter/material.dart';

import '../tab_bar_style_strategy.dart';

class BlurredTabBarStyle implements TabBarStyleStrategy {
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
    final radius = borderRadius ?? 12;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(4),
          child: Material(
            color: (backgroundColor ?? Colors.white).withOpacity(0.3),
            borderRadius: BorderRadius.circular(radius),
            child: TabBar(
              controller: controller,
              tabs: tabs,
              indicator:
                  indicatorDecoration ??
                  BoxDecoration(
                    color: (indicatorColor ?? Colors.blue).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(radius),
                  ),
              labelColor: labelColor,
              unselectedLabelColor: unselectedLabelColor,
            ),
          ),
        ),
      ),
    );
  }
}
