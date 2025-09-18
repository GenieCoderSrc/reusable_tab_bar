import 'package:flutter/material.dart';

/// A reusable collapsible tab bar widget using SliverAppBar + TabBar.
/// Pass in your tabs, tab views, and customization options.
class CollapsibleTabBar extends StatelessWidget {
  final double expandedHeight;
  final bool pinned;
  final Color backgroundColor;
  final Widget title;
  final List<Tab> tabs;
  final List<Widget> tabViews;
  final Widget? flexibleBackground;

  const CollapsibleTabBar({
    Key? key,
    required this.title,
    required this.tabs,
    required this.tabViews,
    this.expandedHeight = 200,
    this.pinned = true,
    this.backgroundColor = Colors.blue,
    this.flexibleBackground,
  }) : assert(
         tabs.length == tabViews.length,
         'tabs and tabViews must have same length',
       ),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: title,
            backgroundColor: backgroundColor,
            pinned: pinned,
            expandedHeight: expandedHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: flexibleBackground ?? _defaultFlexibleBackground(),
            ),
            bottom: TabBar(tabs: tabs),
          ),
        ],
        body: TabBarView(children: tabViews),
      ),
    );
  }

  Widget _defaultFlexibleBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
