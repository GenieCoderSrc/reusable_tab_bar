import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({
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
    this.bottomTitleTxtColor,
    this.centerTitle,
    this.automaticallyImplyLeading = true,
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
  final bool automaticallyImplyLeading;

  final List<Widget>? actionsList;
  final Widget? bottomWidget;

  final String? bottomTitleTxt;
  final Color? bottomTitleTxtColor;

  final List<Widget>? fabButtons; // FABs for Each Tab

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      // initialIndex: initialIndex ?? 0,
      initialIndex: context.read<TabBarCubit>().state.activeTabIndex,
      length: tabScreens.length,
      child: Builder(
        builder: (BuildContext context) {
          // final currentIndex = DefaultTabController.of(context).index;
          // debugPrint('AppTabBar | build | currentIndex: $currentIndex');
          // if (getIndex != null) {
          //   getIndex?.call(currentIndex);
          // }
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // To get currentIndex of current tab use tabController.currentIndex
              final int currentIndex = tabController.index;
              debugPrint(
                'AppTabBar | addListener | currentIndex: $currentIndex',
              );
              context.read<TabBarCubit>().setActiveTabIndex(currentIndex);
            }
          });
          return Scaffold(
            drawer: drawer,
            appBar: AppBar(
              title: titleWidget ?? Text(titleTxt ?? ""),
              // title: Padding(
              automaticallyImplyLeading: automaticallyImplyLeading,
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: titleWidget ?? Text(titleTxt ?? ""),
              // ),
              centerTitle: centerTitle,
              leading: leadingWidget,
              actions: actionsList,
              leadingWidth: leadingWidth,
              // flexibleSpace: titleWidget ?? Text(titleTxt ?? ""),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(
                  preferredSize ?? kToolbarHeight + (appBarHeight ?? 0),
                ),
                child: Column(
                  children: [
                    if (bottomWidget != null)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: bottomWidget!,
                      ),
                    if (bottomTitleTxt != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          bottomTitleTxt ?? "",
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: bottomTitleTxtColor ?? Colors.white,
                            // style: AppTxtStyles.kTitleWhite,
                          ),
                        ),
                      ),
                    TabBar(
                      indicatorColor: indicatorColor,
                      labelColor: selectedLabelColor,
                      unselectedLabelColor: unselectedLabelColor,
                      indicatorWeight: indicatorWeight ?? 2.0,
                      tabs: tabHeaders,
                    ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: TabBar(
                    //     indicatorColor: indicatorColor ?? Colors.white,
                    //     labelColor: selectedLabelColor ?? Colors.white,
                    //     unselectedLabelColor:
                    //         unselectedLabelColor ?? Colors.white,
                    //     indicatorWeight: indicatorWeight ?? 2.0,
                    //     tabs: tabHeaders,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            // appBar: PreferredSize(
            //   preferredSize: Size.fromHeight(
            //       preferredSize ?? kToolbarHeight + (appBarHeight ?? 0)),
            //   child: Container(
            //     color: backgroundColor ?? Theme.of(context).primaryColor,
            //     child: SafeArea(
            //       child: Column(
            //         children: <Widget>[
            //           // new Expanded(child: new Container()),
            //           if (appBar != null) appBar!,
            //           TabBar(
            //             indicatorColor: indicatorColor ?? Colors.white,
            //             labelColor: selectedLabelColor,
            //             unselectedLabelColor: unselectedLabelColor,
            //             indicatorWeight: indicatorWeight ?? 2.0,
            //             tabs: tabHeaders,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            body: TabBarView(children: tabScreens),
            floatingActionButton: fabButtons != null
                ? BlocBuilder<TabBarCubit, TabBarState>(
                    builder: (context, tabState) {
                      // Return the FAB corresponding to the active tab index
                      return fabButtons?[tabState.activeTabIndex] ??
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
