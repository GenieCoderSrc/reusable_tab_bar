import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/wrapper_type.dart';
import 'package:reusable_tab_bar/data/models/wrapper_model.dart';
import 'package:reusable_tab_bar/views/widgets/widget_wrapper/widget_wrapper_factory.dart';

/// Base widget for creating a TabBar with optional wrapper styling.
abstract class BaseTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final TabController? controller;

  /// Choose either a predefined wrapper type or supply a custom builder.
  final WrapperType? wrapperType;

  /// Optional full wrapper configuration.
  final WrapperModel? wrapperModel;

  /// Other TabBar styling.
  final bool isScrollable;
  final double? tabSpacing; // optional spacing between tabs
  final TabAlignment? tabAlignment;
  final Color? indicatorColor;
  final Decoration? indicator;
  final double? dividerHeight;
  final Color? dividerColor;
  final TabBarIndicatorSize? indicatorSize;
  final Color? labelColor;
  final Color? unselectedLabelColor;

  const BaseTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.wrapperType,
    this.wrapperModel,
    this.isScrollable = false,
    this.tabSpacing,
    this.tabAlignment,
    this.indicatorColor,
    this.indicator,
    this.dividerHeight,
    this.dividerColor,
    this.indicatorSize,
    this.labelColor,
    this.unselectedLabelColor,
  });

  /// Subclasses define how to render the tab bar in the UI.
  @protected
  Widget buildContent(BuildContext context, Widget tabBar);

  /// Builds the wrapped TabBar with spacing and wrapper.
  @protected
  Widget buildWrappedTabBar(BuildContext context) {
    // Optional spacing between tabs.
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
      controller: controller,
      tabs: spacedTabs,
      isScrollable: isScrollable,
      tabAlignment: tabAlignment,
      indicatorColor: indicatorColor,
      indicator: indicator,
      dividerHeight: dividerHeight,
      dividerColor: dividerColor,
      indicatorSize: indicatorSize,
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
    );

    // 1️⃣ Custom wrapper builder has highest priority
    final Widget Function(Widget child)? customWrapperBuilder =
        wrapperModel?.customWrapperBuilder;
    if (customWrapperBuilder != null) {
      return customWrapperBuilder(rawTabBar);
    }

    // 2️⃣ Enum-based wrapper with optional model.
    final wrapper = WidgetWrapperFactory.create(
      model: wrapperModel ?? const WrapperModel(),
    );

    return wrapper.wrap(rawTabBar);
  }

  @override
  Widget build(BuildContext context) =>
      buildContent(context, buildWrappedTabBar(context));
}

// abstract class BaseTabBar extends StatelessWidget {
//   final List<Widget> tabs;
//   final TabController? controller;
//
//   /// Choose either a predefined wrapper type or supply a custom builder.
//   final WrapperType? wrapperType;
//   final Widget Function(Widget child)? customWrapperBuilder;
//
//   /// Default padding for the wrapper.
//   final EdgeInsets padding;
//   final EdgeInsets? margin;
//
//   /// Optional background color for wrapper types that support it.
//   final Color? backgroundColor;
//
//   /// Other TabBar styling.
//   final bool isScrollable;
//   final double? tabSpacing; // optional spacing between tabs
//   final TabAlignment? tabAlignment;
//   final Color? indicatorColor;
//   final Decoration? indicator;
//   final TabBarIndicatorSize? indicatorSize;
//   final Color? labelColor;
//   final Color? unselectedLabelColor;
//
//   const BaseTabBar({
//     super.key,
//     required this.tabs,
//     this.controller,
//     this.wrapperType,
//     this.customWrapperBuilder,
//     this.padding = const EdgeInsets.all(8),
//     this.margin,
//     this.backgroundColor,
//     this.isScrollable = false,
//     this.tabSpacing,
//     this.tabAlignment,
//     this.indicatorColor,
//     this.indicator,
//     this.indicatorSize,
//     this.labelColor,
//     this.unselectedLabelColor,
//   });
//
//   /// Subclasses define how to render the tab bar in the UI
//   @protected
//   Widget buildContent(BuildContext context, Widget tabBar);
//
//   /// Builds the wrapped TabBar with spacing and wrapper
//   @protected
//   Widget buildWrappedTabBar(BuildContext context) {
//     // // Apply spacing to tabs individually
//     // final paddedTabs = (tabSpacing != null && tabSpacing! > 0)
//     //     ? tabs
//     //           .map(
//     //             (tab) => Padding(
//     //               padding: EdgeInsets.symmetric(horizontal: tabSpacing! / 2),
//     //               child: tab,
//     //             ),
//     //           )
//     //           .toList()
//     //     : tabs;
//
//     Widget rawTabBar = TabBar(
//       controller: controller,
//       tabs: tabs,
//       isScrollable: isScrollable,
//       tabAlignment: tabAlignment,
//       indicatorColor: indicatorColor,
//       indicator: indicator,
//       indicatorSize: indicatorSize,
//       labelColor: labelColor,
//       unselectedLabelColor: unselectedLabelColor,
//     );
//
//     // Custom wrapper
//     if (customWrapperBuilder != null) return customWrapperBuilder!(rawTabBar);
//
//     // Enum-based wrapper
//     final wrapper = WidgetWrapperFactory.create(
//       wrapperType ?? WrapperType.none,
//       padding: padding,
//       backgroundColor: backgroundColor,
//     );
//     return wrapper.wrap(rawTabBar);
//   }
//
//   @override
//   Widget build(BuildContext context) =>
//       buildContent(context, buildWrappedTabBar(context));
// }
