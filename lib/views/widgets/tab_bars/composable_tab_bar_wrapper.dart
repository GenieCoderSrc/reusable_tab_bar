// import 'package:flutter/material.dart';
// import 'package:reusable_tab_bar/data/enums/tab_bar_visual_style.dart';
// import 'package:reusable_tab_bar/data/models/indicator_model.dart';
// import 'package:reusable_tab_bar/data/models/tab_item_model.dart';
//
// import 'styled_tab_bar.dart';
//
// /// A nullable and composable wrapper for StyledTabBar.
// /// Can optionally wrap the tab bar with Card, Container, alignment, padding, or extra decorations.
// class ComposableTabBarWrapper extends StatelessWidget {
//   final List<TabItemModel>? tabItems;
//   final TabController? controller;
//
//   // Styling
//   final TabBarVisualStyle visualStyle;
//   final Color? labelColor;
//   final Color? unselectedLabelColor;
//   final Color? backgroundColor;
//   final double? borderRadius;
//   final EdgeInsets? padding;
//   final double? elevation;
//   final IndicatorModel? indicator;
//   final Color? indicatorColor;
//
//   // Wrapper options
//   final bool useCard;
//   final Color? cardColor;
//   final double? cardElevation;
//   final ShapeBorder? cardShape;
//   final EdgeInsets? wrapperPadding;
//   final Alignment? alignment;
//   final Decoration? decoration;
//
//   const ComposableTabBarWrapper({
//     super.key,
//     this.tabItems,
//     this.controller,
//     this.visualStyle = TabBarVisualStyle.filled,
//     this.labelColor,
//     this.unselectedLabelColor,
//     this.backgroundColor,
//     this.indicator,
//     this.indicatorColor,
//     this.borderRadius,
//     this.padding,
//     this.elevation,
//     this.useCard = false,
//     this.cardColor,
//     this.cardElevation,
//     this.cardShape,
//     this.wrapperPadding,
//     this.alignment,
//     this.decoration,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     if (tabItems == null || tabItems!.isEmpty || controller == null) {
//       return const SizedBox.shrink();
//     }
//
//     Widget tabBar = StyledTabBar(
//       tabItems: tabItems!,
//       controller: controller!,
//       visualStyle: visualStyle,
//       labelColor: labelColor,
//       unselectedLabelColor: unselectedLabelColor,
//       backgroundColor: backgroundColor,
//       indicator: indicator,
//       indicatorColor: indicatorColor,
//       borderRadius: borderRadius,
//       padding: padding,
//       elevation: elevation,
//     );
//
//     // Wrap with optional alignment
//     if (alignment != null) {
//       tabBar = Align(alignment: alignment!, child: tabBar);
//     }
//
//     // Wrap with optional decoration/container
//     if (decoration != null || wrapperPadding != null) {
//       tabBar = Container(
//         padding: wrapperPadding,
//         decoration: decoration,
//         child: tabBar,
//       );
//     }
//
//     // Wrap with optional card
//     if (useCard) {
//       tabBar = Card(
//         color: cardColor,
//         elevation: cardElevation ?? 2,
//         margin: wrapperPadding,
//         shape:
//             cardShape ??
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(borderRadius ?? 12),
//             ),
//         child: tabBar,
//       );
//     }
//
//     return tabBar;
//   }
// }
