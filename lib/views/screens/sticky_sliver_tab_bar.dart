import 'package:flutter/material.dart';

/// Reusable sticky TabBar inside a SliverAppBar.
/// Keeps the TabBar pinned while the content scrolls.
class StickySliverTabBar extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> tabViews;
  final String title;
  final Color backgroundColor;

  const StickySliverTabBar({
    Key? key,
    required this.tabs,
    required this.tabViews,
    required this.title,
    this.backgroundColor = Colors.blue,
  }) : assert(
         tabs.length == tabViews.length,
         'tabs and tabViews must have same length',
       ),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: backgroundColor,
              title: Text(title),
              bottom: TabBar(tabs: tabs),
            ),
            SliverFillRemaining(child: TabBarView(children: tabViews)),
          ],
        ),
      ),
    );
  }
}
