// import 'package:flutter/material.dart';
//
// /// A reusable sticky TabBar widget.
// /// The TabBar remains pinned at the top while the body scrolls.
// class StickyTabBar extends StatelessWidget {
//   final List<Tab> tabs;
//   final List<Widget> tabViews;
//   final Widget title;
//   final double expandedHeight;
//   final Color backgroundColor;
//   final Widget? flexibleBackground;
//
//   const StickyTabBar({
//     Key? key,
//     required this.tabs,
//     required this.tabViews,
//     required this.title,
//     this.expandedHeight = 180,
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
//             pinned: true,
//             // <-- Key to keep TabBar stuck at top
//             floating: false,
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
//           colors: [Colors.indigo, Colors.blueAccent],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//     );
//   }
// }
