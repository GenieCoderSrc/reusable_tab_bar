// import 'package:flutter/material.dart';
//
// /// Reusable overlay (floating) TabBar that sits above the TabBarView
// /// inside a Stack. Perfect for bottom-centered tabs with custom shape.
// class OverlayTabBar extends StatelessWidget {
//   final List<Tab> tabs;
//   final List<Widget> tabViews;
//   final double elevation;
//   final BorderRadiusGeometry borderRadius;
//   final BoxDecoration? indicatorDecoration;
//   final Color? backgroundColor;
//   final EdgeInsetsGeometry margin;
//
//   const OverlayTabBar({
//     Key? key,
//     required this.tabs,
//     required this.tabViews,
//     this.elevation = 6,
//     this.borderRadius = const BorderRadius.all(Radius.circular(24)),
//     this.indicatorDecoration,
//     this.backgroundColor,
//     this.margin = const EdgeInsets.all(16),
//   }) : assert(
//          tabs.length == tabViews.length,
//          'tabs and tabViews must have same length',
//        ),
//        super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: tabs.length,
//       child: Stack(
//         children: [
//           TabBarView(children: tabViews),
//           Positioned(
//             left: margin.horizontal / 2,
//             right: margin.horizontal / 2,
//             bottom: margin.vertical / 2,
//             child: Material(
//               elevation: elevation,
//               color: backgroundColor ?? Theme.of(context).cardColor,
//               borderRadius: borderRadius,
//               child: TabBar(
//                 tabs: tabs,
//                 indicator:
//                     indicatorDecoration ??
//                     BoxDecoration(
//                       borderRadius: borderRadius,
//                       color: Theme.of(context).primaryColor,
//                     ),
//                 labelColor: Colors.white,
//                 unselectedLabelColor: Colors.black54,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
