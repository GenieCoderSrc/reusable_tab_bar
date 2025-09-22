// import 'package:flutter/material.dart';
//
// /// A reusable floating TabBar with scrollable content.
// /// Just supply the tabs and tab views; customize visuals via parameters.
// class FloatingTabBar extends StatelessWidget {
//   final List<Tab> tabs;
//   final List<Widget> tabViews;
//   final Widget title;
//   final double expandedHeight;
//   final bool snap;
//   final Color backgroundColor;
//   final Widget? flexibleBackground;
//
//   const FloatingTabBar({
//     Key? key,
//     required this.tabs,
//     required this.tabViews,
//     required this.title,
//     this.expandedHeight = 180,
//     this.snap = true,
//     this.backgroundColor = Colors.blue,
//     this.flexibleBackground,
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
//       child: NestedScrollView(
//         headerSliverBuilder: (context, innerBoxIsScrolled) => [
//           SliverAppBar(
//             title: title,
//             backgroundColor: backgroundColor,
//             floating: true,
//             // Key to make the TabBar float
//             snap: snap,
//             // Snaps back immediately when scrolling up
//             expandedHeight: expandedHeight,
//             flexibleSpace: FlexibleSpaceBar(
//               background: flexibleBackground ?? _defaultFlexibleBackground(),
//             ),
//             bottom: TabBar(tabs: tabs),
//           ),
//         ],
//         body: TabBarView(children: tabViews),
//       ),
//     );
//   }
//
//   Widget _defaultFlexibleBackground() {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Colors.indigo, Colors.blue],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//     );
//   }
// }
