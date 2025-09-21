import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/sliver_tab_bar_type.dart';

/// A single reusable Sliver-based TabBar widget.
/// Behavior is chosen via [type].
class SliverTabBar extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> tabViews;
  final Widget title;
  final double expandedHeight;
  final SliverType type;
  final bool snap; // Only applies if type == floating
  final Color backgroundColor;
  final Widget? flexibleBackground;

  const SliverTabBar({
    Key? key,
    required this.tabs,
    required this.tabViews,
    required this.title,
    this.expandedHeight = 180,
    this.type = SliverType.pinned,
    this.snap = true,
    this.backgroundColor = Colors.blue,
    this.flexibleBackground,
  }) : assert(
         tabs.length == tabViews.length,
         'tabs and tabViews must have same length',
       ),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFloating = type == SliverType.floating;
    final isSticky = type == SliverType.pinned;

    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: title,
            backgroundColor: backgroundColor,
            pinned: isSticky,
            floating: isFloating,
            snap: isFloating && snap,
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
          colors: [Colors.indigo, Colors.blueAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
