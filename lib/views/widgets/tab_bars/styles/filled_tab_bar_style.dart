// import 'package:flutter/material.dart';
// import '../tab_bar_style_strategy.dart';
//
// class FilledTabBarStyle implements TabBarStyleStrategy {
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
//         color: backgroundColor ?? Colors.white,
//         borderRadius: BorderRadius.circular(radius),
//         child: TabBar(
//           controller: controller,
//           tabs: tabs,
//           indicator:
//               indicatorDecoration ??
//               BoxDecoration(
//                 color: indicatorColor ?? Colors.blue,
//                 borderRadius: BorderRadius.circular(radius),
//               ),
//           labelColor: labelColor,
//           unselectedLabelColor: unselectedLabelColor,
//         ),
//       ),
//     );
//   }
// }
