// import 'package:flutter/material.dart';
// import 'package:reusable_tab_bar/data/enums/tab_bar_visual_style.dart';
// import 'package:reusable_tab_bar/data/models/indicator_model.dart';
// import 'package:reusable_tab_bar/data/models/tab_item_model.dart';
// import 'package:reusable_tab_bar/views/widgets/tab_bars/utils/tab_bar_helpers.dart';
// import 'package:reusable_tab_bar/views/widgets/tabs/tab_builder.dart';
//
// import 'tab_bar_style_factory.dart';
//
// class StyledTabBar extends StatelessWidget implements PreferredSizeWidget {
//   const StyledTabBar({
//     super.key,
//     required this.tabItems,
//     required this.controller,
//     this.indicator,
//     this.visualStyle = TabBarVisualStyle.filled,
//     this.backgroundColor,
//     this.indicatorColor,
//     this.labelColor,
//     this.unselectedLabelColor,
//     this.borderRadius,
//     this.padding,
//     this.elevation,
//     this.animate,
//   });
//
//   final List<TabItemModel> tabItems;
//   final TabController controller;
//   final TabBarVisualStyle visualStyle;
//   final Color? backgroundColor;
//   final bool? animate;
//
//   final Color? labelColor;
//   final Color? unselectedLabelColor;
//   final double? borderRadius;
//   final EdgeInsets? padding;
//   final double? elevation;
//
//   final IndicatorModel? indicator;
//   final Color? indicatorColor;
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//
//   @override
//   Widget build(BuildContext context) {
//     if (tabItems.isEmpty) {
//       return const SizedBox.shrink();
//     }
//
//     final theme = Theme.of(context);
//
//     // Resolve colors with priority: explicit > tabBarTheme > theme > fallback
//     final bgColor = resolveBackgroundColor(
//       backgroundColor: backgroundColor,
//       theme: theme,
//     );
//
//     final indColor = resolveIndicatorColor(
//       indicatorColor: indicatorColor,
//       indicator: indicator,
//       theme: theme,
//     );
//
//     final lblColor = resolveLabelColor(labelColor: labelColor, theme: theme);
//
//     final unLblColor = resolveUnselectedLabelColor(
//       unselectedLabelColor: unselectedLabelColor,
//       theme: theme,
//     );
//
//     final tabIndicator = resolveIndicator(
//       indicator: indicator,
//       tabBarThemeIndicator: theme.tabBarTheme.indicator,
//       indicatorColor: indColor,
//       borderRadius: borderRadius ?? 12,
//     );
//
//     // Build tabs
//     // final tabs = TabBuilder.build(
//     //   tabItems: tabItems,
//     //   controller: controller,
//     //   animate: animate,
//     // );
//
//     // Select the style strategy
//     final strategy = TabBarStyleFactory.getStrategy(visualStyle);
//
//     return strategy.build(
//       controller: controller,
//       tabs: tabs,
//       indicatorColor: indColor,
//       backgroundColor: bgColor,
//       borderRadius: borderRadius,
//       padding: padding,
//       elevation: elevation,
//       labelColor: lblColor,
//       unselectedLabelColor: unLblColor,
//       indicatorDecoration: tabIndicator,
//     );
//   }
// }
//
// //
// // class StyledTabBar extends StatelessWidget implements PreferredSizeWidget {
// //   const StyledTabBar({
// //     super.key,
// //     required this.tabs,
// //     required this.controller,
// //     this.visualStyle = TabBarVisualStyle.filled,
// //     this.backgroundColor,
// //     this.indicatorColor,
// //     this.elevation = 4,
// //     this.borderRadius = 24,
// //     this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //   });
// //
// //   final List<Tab> tabs;
// //   final TabController controller;
// //   final TabBarVisualStyle visualStyle;
// //   final Color? backgroundColor;
// //   final Color? indicatorColor;
// //   final double elevation;
// //   final double borderRadius;
// //   final EdgeInsets padding;
// //
// //   @override
// //   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);
// //     final bg = backgroundColor ?? theme.colorScheme.surface;
// //     final ind = indicatorColor ?? theme.colorScheme.primary;
// //
// //     final strategy = TabBarStyleFactory.getStrategy(visualStyle);
// //
// //     return strategy.build(
// //       controller: controller,
// //       tabs: tabs,
// //       indicatorColor: ind,
// //       backgroundColor: bg,
// //       borderRadius: borderRadius,
// //       padding: padding,
// //       elevation: elevation,
// //       labelColor: theme.colorScheme.onPrimary,
// //       unselectedLabelColor: theme.colorScheme.onSurface,
// //     );
// //   }
// // }
// //
// // // class StyledTabBar extends StatelessWidget implements PreferredSizeWidget {
// // //   const StyledTabBar({
// // //     super.key,
// // //     required this.tabs,
// // //     required this.controller,
// // //     this.visualStyle = TabBarVisualStyle.filled,
// // //     this.backgroundColor,
// // //     this.indicatorColor,
// // //     this.elevation = 4,
// // //     this.borderRadius = 24,
// // //     this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // //   });
// // //
// // //   final List<Tab> tabs;
// // //   final TabController controller;
// // //   final TabBarVisualStyle visualStyle;
// // //   final Color? backgroundColor;
// // //   final Color? indicatorColor;
// // //   final double elevation;
// // //   final double borderRadius;
// // //   final EdgeInsets padding;
// // //
// // //   @override
// // //   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final theme = Theme.of(context);
// // //     final bg = backgroundColor ?? theme.colorScheme.surface;
// // //     final ind = indicatorColor ?? theme.colorScheme.primary;
// // //
// // //     Widget baseTab(BoxDecoration indicator, Color? label) => TabBar(
// // //       controller: controller,
// // //       tabs: tabs,
// // //       indicator: indicator,
// // //       labelColor: label,
// // //       unselectedLabelColor: theme.colorScheme.onSurface,
// // //     );
// // //
// // //     Widget wrap(Widget child, {Color? color, double elev = 0}) => Padding(
// // //       padding: padding,
// // //       child: Material(
// // //         color: color ?? Colors.transparent,
// // //         elevation: elev,
// // //         borderRadius: BorderRadius.circular(borderRadius),
// // //         child: child,
// // //       ),
// // //     );
// // //
// // //     switch (visualStyle) {
// // //       case TabBarVisualStyle.simple:
// // //         return TabBar(tabs: tabs, controller: controller);
// // //
// // //       case TabBarVisualStyle.outlined:
// // //         return wrap(
// // //           baseTab(
// // //             BoxDecoration(
// // //               borderRadius: BorderRadius.circular(borderRadius),
// // //               border: Border.all(color: ind, width: 2),
// // //             ),
// // //             ind,
// // //           ),
// // //         );
// // //       case TabBarVisualStyle.filled:
// // //         return wrap(
// // //           baseTab(
// // //             BoxDecoration(
// // //               borderRadius: BorderRadius.circular(borderRadius),
// // //               color: ind,
// // //             ),
// // //             theme.colorScheme.onPrimary,
// // //           ),
// // //           color: bg,
// // //         );
// // //       case TabBarVisualStyle.blurred:
// // //         return ClipRRect(
// // //           borderRadius: BorderRadius.circular(borderRadius),
// // //           child: BackdropFilter(
// // //             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
// // //             child: wrap(
// // //               baseTab(
// // //                 BoxDecoration(
// // //                   borderRadius: BorderRadius.circular(borderRadius),
// // //                   color: ind.withValues(alpha: 0.5),
// // //                 ),
// // //                 theme.colorScheme.onSurface,
// // //               ),
// // //               color: bg.withValues(alpha: 0.3),
// // //             ),
// // //           ),
// // //         );
// // //       case TabBarVisualStyle.elevated:
// // //         return wrap(
// // //           baseTab(
// // //             BoxDecoration(
// // //               borderRadius: BorderRadius.circular(borderRadius),
// // //               color: ind,
// // //             ),
// // //             theme.colorScheme.onPrimary,
// // //           ),
// // //           color: bg,
// // //           elev: elevation,
// // //         );
// // //     }
// // //   }
// // // }
// //
// // // /// A purely visual TabBar wrapper.
// // // class StyledTabBar extends StatelessWidget implements PreferredSizeWidget {
// // //   const StyledTabBar({
// // //     super.key,
// // //     required this.tabs,
// // //     required this.controller,
// // //     this.visualStyle = TabBarVisualStyle.filled,
// // //     this.backgroundColor,
// // //     this.indicatorColor,
// // //     this.elevation = 4,
// // //     this.borderRadius = 24,
// // //     this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// // //   });
// // //
// // //   final List<Tab> tabs;
// // //   final TabController controller;
// // //   final TabBarVisualStyle visualStyle;
// // //   final Color? backgroundColor;
// // //   final Color? indicatorColor;
// // //   final double elevation;
// // //   final double borderRadius;
// // //   final EdgeInsets padding;
// // //
// // //   @override
// // //   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final theme = Theme.of(context);
// // //     final bg = backgroundColor ?? theme.colorScheme.surface;
// // //     final ind = indicatorColor ?? theme.colorScheme.primary;
// // //
// // //     Widget tabBar(BoxDecoration indicator, Color? labelColor) => TabBar(
// // //       controller: controller,
// // //       tabs: tabs,
// // //       indicator: indicator,
// // //       labelColor: labelColor,
// // //       unselectedLabelColor: theme.colorScheme.onSurface,
// // //     );
// // //
// // //     Widget wrap(Widget child, {Color? color, double elev = 0}) => Padding(
// // //       padding: padding,
// // //       child: Material(
// // //         color: color ?? Colors.transparent,
// // //         elevation: elev,
// // //         borderRadius: BorderRadius.circular(borderRadius),
// // //         child: child,
// // //       ),
// // //     );
// // //
// // //     switch (visualStyle) {
// // //       case TabBarVisualStyle.outlined:
// // //         return wrap(
// // //           tabBar(
// // //             BoxDecoration(
// // //               borderRadius: BorderRadius.circular(borderRadius),
// // //               border: Border.all(color: ind, width: 2),
// // //             ),
// // //             ind,
// // //           ),
// // //         );
// // //
// // //       case TabBarVisualStyle.filled:
// // //         return wrap(
// // //           tabBar(
// // //             BoxDecoration(
// // //               borderRadius: BorderRadius.circular(borderRadius),
// // //               color: ind,
// // //             ),
// // //             theme.colorScheme.onPrimary,
// // //           ),
// // //           color: bg,
// // //         );
// // //
// // //       case TabBarVisualStyle.blurred:
// // //         return ClipRRect(
// // //           borderRadius: BorderRadius.circular(borderRadius),
// // //           child: BackdropFilter(
// // //             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
// // //             child: wrap(
// // //               tabBar(
// // //                 BoxDecoration(
// // //                   borderRadius: BorderRadius.circular(borderRadius),
// // //                   color: ind.withAlpha((0.5 * 255).round()),
// // //                 ),
// // //                 theme.colorScheme.onSurface,
// // //               ),
// // //               color: bg.withAlpha((0.3 * 255).round()),
// // //             ),
// // //           ),
// // //         );
// // //
// // //       case TabBarVisualStyle.elevated:
// // //         return wrap(
// // //           tabBar(
// // //             BoxDecoration(
// // //               borderRadius: BorderRadius.circular(borderRadius),
// // //               color: ind,
// // //             ),
// // //             theme.colorScheme.onPrimary,
// // //           ),
// // //           color: bg,
// // //           elev: elevation,
// // //         );
// // //     }
// // //   }
// // // }
