// import 'package:flutter/material.dart';
//
// import '../tab_bar_style_strategy.dart';
//
// class OutlinedTabBarStyle implements TabBarStyleStrategy {
//   @override
//   Widget build({
//     required List<Widget> tabs,
//     TabController? controller,
//     Color? indicatorColor,
//     Color? backgroundColor,
//     double? borderRadius,
//     EdgeInsets? padding,
//     double? elevation,
//     Color? labelColor,
//     Color? unselectedLabelColor,
//     Decoration? indicatorDecoration,
//   }) {
//     final radius = borderRadius ?? 12;
//
//     return Padding(
//       padding: padding ?? const EdgeInsets.all(4),
//       child: Material(
//         color: backgroundColor ?? Colors.transparent,
//         borderRadius: BorderRadius.circular(radius),
//         child: TabBar(
//           controller: controller,
//           tabs: tabs,
//           indicator:
//               indicatorDecoration ??
//               BoxDecoration(
//                 borderRadius: BorderRadius.circular(radius),
//                 border: Border.all(
//                   color: indicatorColor ?? Colors.blue,
//                   width: 2,
//                 ),
//               ),
//           labelColor: labelColor,
//           unselectedLabelColor: unselectedLabelColor,
//         ),
//       ),
//     );
//   }
// }
