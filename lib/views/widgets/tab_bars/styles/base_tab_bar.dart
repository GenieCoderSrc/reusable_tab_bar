import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/models/wrapper_model.dart';
import 'package:reusable_tab_bar/views/widgets/widget_wrapper/widget_wrapper_factory.dart';

/// Base widget for creating a TabBar with optional wrapper styling.

abstract class BaseTabBar extends StatelessWidget {
  /// Optional full wrapper configuration.
  final WrapperModel? wrapperModel;

  /// Optional spacing between tabs.
  final double? tabSpacing;

  /// Tabs list.
  final List<Widget> tabs;

  /// Tab controller.
  final TabController? controller;

  /// Scroll and layout behavior.
  final bool isScrollable;
  final TabAlignment? tabAlignment;

  /// Visual styling.
  final Color? indicatorColor;
  final Decoration? indicator;
  final double? dividerHeight;
  final Color? dividerColor;
  final TabBarIndicatorSize? indicatorSize;
  final EdgeInsetsGeometry indicatorPadding;
  final TextScaler? textScaler;
  final double indicatorWeight;
  final TabIndicatorAnimation? indicatorAnimation;

  /// Label styles.
  final Color? labelColor;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? labelPadding;
  final Color? unselectedLabelColor;
  final TextStyle? unselectedLabelStyle;

  /// Layout and gesture.
  final EdgeInsetsGeometry? padding;
  final DragStartBehavior dragStartBehavior;
  final MouseCursor? mouseCursor;
  final bool? enableFeedback;
  final ValueChanged<int>? onTap;
  final TabValueChanged<bool>? onHover;
  final TabValueChanged<bool>? onFocusChange;
  final WidgetStateProperty<Color?>? overlayColor;
  final ScrollPhysics? physics;
  final InteractiveInkFeatureFactory? splashFactory;
  final BorderRadius? splashBorderRadius;

  const BaseTabBar({
    super.key,
    this.wrapperModel,
    this.tabSpacing = 20,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.tabAlignment,
    this.indicatorColor,
    this.indicator,
    this.dividerHeight,
    this.dividerColor,
    this.indicatorSize,
    this.indicatorPadding = EdgeInsets.zero,
    this.textScaler,
    this.indicatorWeight = 2.0,
    this.indicatorAnimation,
    this.labelColor,
    this.labelStyle,
    this.labelPadding,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.padding,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.enableFeedback,
    this.onTap,
    this.onHover,
    this.onFocusChange,
    this.overlayColor,
    this.physics,
    this.splashFactory,
    this.splashBorderRadius,
  });

  /// Subclasses define how to render the final layout.
  @protected
  Widget buildContent(BuildContext context, Widget tabBar);

  /// Builds the wrapped `TabBar` with spacing and wrapper logic.
  @protected
  Widget buildWrappedTabBar(BuildContext context) {
    final spacedTabs = (tabSpacing != null && tabSpacing! > 0)
        ? tabs
              .map(
                (tab) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: tabSpacing! / 2),
                  child: tab,
                ),
              )
              .toList()
        : tabs;

    final rawTabBar = TabBar(
      tabs: spacedTabs,
      controller: controller,
      isScrollable: isScrollable,
      padding: padding,
      indicatorColor: indicatorColor,
      indicatorWeight: indicatorWeight,
      indicatorPadding: indicatorPadding,
      indicator: indicator,
      indicatorSize: indicatorSize,
      dividerColor: dividerColor,
      dividerHeight: dividerHeight,
      labelColor: labelColor,
      labelStyle: labelStyle,
      labelPadding: labelPadding,
      unselectedLabelColor: unselectedLabelColor,
      unselectedLabelStyle: unselectedLabelStyle,
      dragStartBehavior: dragStartBehavior,
      overlayColor: overlayColor,
      mouseCursor: mouseCursor,
      enableFeedback: enableFeedback,
      onTap: onTap,
      onHover: onHover,
      onFocusChange: onFocusChange,
      physics: physics,
      splashFactory: splashFactory,
      splashBorderRadius: splashBorderRadius,
      tabAlignment: tabAlignment,
      textScaler: textScaler,
      indicatorAnimation: indicatorAnimation,
    );

    // 1️⃣ Custom wrapper builder
    final customBuilder = wrapperModel?.customWrapperBuilder;
    if (customBuilder != null) {
      return customBuilder(context, rawTabBar);
    }

    // 2️⃣ Enum-based wrapper factory fallback
    final wrapper = WidgetWrapperFactory.create(
      model: wrapperModel ?? const WrapperModel(),
    );

    return wrapper.wrap(rawTabBar);
  }

  @override
  Widget build(BuildContext context) =>
      buildContent(context, buildWrappedTabBar(context));
}
