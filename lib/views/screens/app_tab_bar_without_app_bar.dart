import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';

class AppTabBarWithDivider extends StatelessWidget {
  const AppTabBarWithDivider({
    super.key,
    required this.tabScreens,
    required this.tabHeaders,
    this.initialIndex,
    this.preferredSize,
    this.backgroundColor,
    this.selectedLabelColor,
    this.unselectedLabelColor,
    this.getIndex,
    this.indicatorColor,
    this.appBarHeight,
    this.drawer,
    this.indicatorWeight,
    this.titleTxt,
    this.titleWidget,
    this.leadingWidget,
    this.leadingWidth,
    this.actionsList,
    this.bottomWidget,
    this.bottomTitleTxt,
    this.centerTitle,
    this.appBar,
    this.fabButtons,
  });

  final List<Widget> tabScreens;
  final List<Widget> tabHeaders;
  final int? initialIndex;
  final Color? backgroundColor;
  final Color? selectedLabelColor;
  final Color? unselectedLabelColor;
  final double? indicatorWeight;
  final Color? indicatorColor;
  final Function? getIndex;
  final double? preferredSize;
  final double? appBarHeight;
  final Widget? drawer;

  final String? titleTxt;
  final Widget? titleWidget;
  final bool? centerTitle;

  final Widget? leadingWidget;
  final double? leadingWidth;
  final List<Widget>? actionsList;

  final Widget? bottomWidget;
  final String? bottomTitleTxt;
  final Widget? appBar;
  final List<Widget>? fabButtons; // FABs for Each Tab

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialIndex ?? 0,
      length: tabScreens.length,
      child: Builder(
        builder: (BuildContext context) {
          if (getIndex != null) {
            final index = DefaultTabController.of(context).index;
            getIndex?.call(index);
          }
          return Scaffold(
            drawer: drawer,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                preferredSize ?? kToolbarHeight + (appBarHeight ?? 0),
              ),
              child: Container(
                color: backgroundColor ?? Theme.of(context).primaryColor,
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      if (appBar != null) appBar!,
                      TabBar(
                        indicatorColor: indicatorColor ?? Colors.white,
                        labelColor: selectedLabelColor,
                        unselectedLabelColor: unselectedLabelColor,
                        indicatorWeight: indicatorWeight ?? 4.0,
                        tabs: tabHeaders,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(children: tabScreens),
            floatingActionButton: fabButtons != null
                ? BlocBuilder<TabBarCubit, TabBarState>(
                    builder: (context, tabState) {
                      // Return the FAB corresponding to the active tab index
                      return fabButtons?[tabState.index] ??
                          const SizedBox.shrink();
                    },
                  )
                : null,
          );
        },
      ),
    );
  }
}
