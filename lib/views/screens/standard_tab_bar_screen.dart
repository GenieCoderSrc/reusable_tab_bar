import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';

import 'base_tab_bar_screen.dart';

class StandardTabBarScreen extends BaseTabBarScreen {
  final List<Widget> pages;
  final TabControllerBuilder? tabBarBuilder;

  // AppBar
  final double? appBarHeight;
  final double? appBarBottomHeight;
  final String? titleTxt;
  final Widget? titleWidget;
  final bool? centerTitle;

  // AppBar Leading
  final Widget? leadingWidget;
  final double? leadingWidth;
  final bool automaticallyImplyLeading;

  final List<Widget>? actionsList;

  final Widget? bottomWidget;
  final String? bottomTitleTxt;
  final Color? bottomTitleTxtColor;

  StandardTabBarScreen({
    super.key,
    required this.pages,
    super.initialIndex,
    super.getIndex,
    super.tabBarCubit,
    super.drawer,
    super.fabButtons,
    this.appBarHeight,
    this.titleTxt,
    this.titleWidget,
    this.centerTitle,
    this.actionsList,
    this.tabBarBuilder,
    this.appBarBottomHeight,
    this.leadingWidget,
    this.leadingWidth,
    this.automaticallyImplyLeading = true,
    this.bottomWidget,
    this.bottomTitleTxt,
    this.bottomTitleTxtColor,
  }) : super(numberOfTabs: pages.length);

  @override
  Widget buildBody(BuildContext context, TabController controller) {
    return TabBarView(children: pages);
  }

  @override
  TabAppBarBuilder? get appBarBuilder =>
      (context, controller) => _buildAppBar(context, controller);

  PreferredSizeWidget? _buildAppBar(
    BuildContext context,
    TabController controller,
  ) {
    if (titleTxt == null && titleWidget == null && tabBarBuilder == null) {
      return null;
    }

    final theme = Theme.of(context);

    return AppBar(
      toolbarHeight: appBarHeight,
      centerTitle: centerTitle,
      title: titleWidget ?? (titleTxt != null ? Text(titleTxt!) : null),
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leadingWidget,
      leadingWidth: leadingWidth,
      actions: actionsList,
      bottom:
          tabBarBuilder != null ||
              bottomWidget != null ||
              bottomTitleTxt != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(
                appBarBottomHeight ?? kToolbarHeight + (appBarHeight ?? 0),
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
                  if (tabBarBuilder != null) tabBarBuilder!(controller),
                ],
              ),
            )
          : null,
    );
  }
}

// class StandardTabBarScreen extends StatelessWidget {
//   // TabBar
//   final List<Widget> pages;
//   final int? initialIndex;
//   final void Function(int)? getIndex;
//   final TabBarCubit? tabBarCubit;
//   final Widget Function(TabController)? tabBarBuilder;
//
//   // AppBar
//   final double? appBarHeight;
//   final double? appBarBottomHeight;
//   final String? titleTxt;
//   final Widget? titleWidget;
//   final bool? centerTitle;
//
//   // AppBar Leading
//   final Widget? leadingWidget;
//   final double? leadingWidth;
//   final bool automaticallyImplyLeading;
//
//   // AppBar Action
//   final List<Widget>? actionsList;
//
//   final Widget? bottomWidget;
//   final String? bottomTitleTxt;
//   final Color? bottomTitleTxtColor;
//
//   // Drawer
//   final Widget? drawer;
//
//   // FAB
//   final List<Widget>? fabButtons;
//
//   const StandardTabBarScreen({
//     super.key,
//     required this.pages,
//     this.tabBarBuilder,
//     this.appBarHeight,
//     this.titleTxt,
//     this.titleWidget,
//     this.centerTitle,
//     this.actionsList,
//     this.appBarBottomHeight,
//     this.leadingWidget,
//     this.leadingWidth,
//     this.automaticallyImplyLeading = true,
//     this.bottomWidget,
//     this.bottomTitleTxt,
//     this.bottomTitleTxtColor,
//     this.initialIndex,
//     this.getIndex,
//     this.tabBarCubit,
//     this.fabButtons,
//     this.drawer,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final int numberOfTabs = pages.length;
//
//     return BlocProvider(
//       create: (_) => tabBarCubit ?? TabBarCubit()
//         ..selectTab(initialIndex ?? 0),
//       child: Builder(
//         builder: (context) {
//           final tabCubit = context.read<TabBarCubit>();
//
//           return DefaultTabController(
//             length: numberOfTabs,
//             initialIndex: context.read<TabBarCubit>().state.index,
//             child: Builder(
//               builder: (context) {
//                 final controller = DefaultTabController.of(context);
//                 addTabControllerListener(
//                   controller: controller,
//                   tabCubit: tabCubit,
//                   onTabChanged: getIndex,
//                 );
//
//                 return Scaffold(
//                   drawer: drawer,
//                   appBar: _buildAppBar(context, controller),
//                   body: TabBarView(children: pages),
//                   floatingActionButton: TabFABSwitcher(fabButtons: fabButtons),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   PreferredSizeWidget? _buildAppBar(
//       BuildContext context,
//       TabController controller,
//       ) {
//     if (titleTxt == null && titleWidget == null && tabBarBuilder == null) {
//       return null;
//     }
//
//     final theme = Theme.of(context);
//
//     return AppBar(
//       toolbarHeight: appBarHeight,
//       centerTitle: centerTitle,
//       title: titleWidget ?? (titleTxt != null ? Text(titleTxt!) : null),
//       automaticallyImplyLeading: automaticallyImplyLeading,
//       leading: leadingWidget,
//       leadingWidth: leadingWidth,
//       actions: actionsList,
//       bottom:
//       (tabBarBuilder == null &&
//           bottomWidget == null &&
//           bottomTitleTxt == null)
//           ? null
//           : PreferredSize(
//         preferredSize: Size.fromHeight(
//           appBarBottomHeight ?? kToolbarHeight + (appBarHeight ?? 0),
//         ),
//         child: Column(
//           children: [
//             if (bottomWidget != null)
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: bottomWidget!,
//               ),
//             if (bottomTitleTxt != null)
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 child: Text(
//                   bottomTitleTxt ?? "",
//                   style: theme.textTheme.titleSmall?.copyWith(
//                     color: bottomTitleTxtColor ?? Colors.white,
//                   ),
//                 ),
//               ),
//             if (tabBarBuilder != null) tabBarBuilder!(controller),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// Standard TabBar Screen with optional FABs per tab and fully composable StyledTabBar.
// class StandardTabBarScreen extends StatelessWidget {
//   final List<TabItemModel> tabItems;
//   final List<Widget> pages;
//
//   // TabBar core
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final int? initialIndex;
//   final void Function(int)? getIndex;
//
//   // AppBar sizing/content
//   final double? preferredSize;
//   final double? appBarHeight;
//   final Widget? drawer;
//   final String? titleTxt;
//   final bool? centerTitle;
//   final Widget? titleWidget;
//   final Widget? leadingWidget;
//   final double? leadingWidth;
//   final List<Widget>? actionsList;
//   final Widget? bottomWidget;
//   final String? bottomTitleTxt;
//   final PreferredSizeWidget? appBar;
//
//   // FABs per tab
//   final List<Widget>? fabButtons;
//
//   // Optional external Cubit
//   final TabBarCubit? tabBarCubit;
//
//   // Tab Bar Visual overrides
//   final Color? backgroundColor;
//   final Color? labelColor;
//   final Color? unselectedLabelColor;
//   final double? borderRadius;
//   final EdgeInsets? padding;
//   final double? elevation;
//
//   // Indicator Style
//   final Color? indicatorColor;
//   final IndicatorModel? indicator;
//
//   // Optional wrapper decoration
//   final bool tabBarUseCard;
//   final Color? tabBarCardColor;
//   final double? tabBarCardElevation;
//   final ShapeBorder? tabBarCardShape;
//   final EdgeInsets? tabBarWrapperPadding;
//   final Alignment? tabBarAlignment;
//   final Decoration? tabBarDecoration;
//
//   const StandardTabBarScreen({
//     super.key,
//     required this.tabItems,
//     required this.pages,
//     this.visualStyle = TabBarVisualStyle.filled,
//  this.animate,
// this.initialIndex,
//     this.getIndex,
//     this.preferredSize,
//     this.appBarHeight,
//     this.drawer,
//     this.titleTxt,
//     this.titleWidget,
//     this.centerTitle,
//     this.leadingWidget,
//     this.leadingWidth,
//     this.actionsList,
//     this.bottomWidget,
//     this.bottomTitleTxt,
//     this.appBar,
//     this.fabButtons,
//     this.backgroundColor,
//     this.labelColor,
//     this.unselectedLabelColor,
//     this.borderRadius,
//     this.padding,
//     this.elevation,
//     this.indicatorColor,
//     this.indicator,
//     this.tabBarCubit,
//     this.tabBarUseCard = false,
//     this.tabBarCardColor,
//     this.tabBarCardElevation,
//     this.tabBarCardShape,
//     this.tabBarWrapperPadding,
//     this.tabBarAlignment,
//     this.tabBarDecoration,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => tabBarCubit ?? TabBarCubit()..selectTab(initialIndex ?? 0),
//       child: Builder(
//         builder: (context) {
//           final tabCubit = context.read<TabBarCubit>();
//
//           return DefaultTabController(
//             length: tabItems.length,
//             initialIndex: initialIndex ?? 0,
//             child: Builder(
//               builder: (context) {
//                 final controller = DefaultTabController.of(context);
//                 controller.addListener(() {
//                   if (!controller.indexIsChanging) {
//                     tabCubit.selectTab(controller.index);
//                     getIndex?.call(controller.index);
//                   }
//                 });
//
//                 return Scaffold(
//                   drawer: drawer,
//                   appBar: appBar ??
//                       AppBar(
//                         toolbarHeight: appBarHeight,
//                         centerTitle: centerTitle,
//                         title: titleWidget ?? (titleTxt != null ? Text(titleTxt!) : null),
//                         leading: leadingWidget,
//                         leadingWidth: leadingWidth,
//                         actions: actionsList,
//                         bottom: PreferredSize(
//                           preferredSize: Size.fromHeight(preferredSize ?? kToolbarHeight),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               ComposableTabBarWrapper(
//                                 tabItems: tabItems,
//                                 controller: controller,
//                                 visualStyle: visualStyle,
//                                 labelColor: labelColor,
//                                 unselectedLabelColor: unselectedLabelColor,
//                                 backgroundColor: backgroundColor,
//                                 indicator: indicator,
//                                 borderRadius: borderRadius,
//                                 padding: padding,
//                                 elevation: elevation,
//                                 useCard: tabBarUseCard,
//                                 cardColor: tabBarCardColor,
//                                 cardElevation: tabBarCardElevation,
//                                 cardShape: tabBarCardShape,
//                                 wrapperPadding: tabBarWrapperPadding,
//                                 alignment: tabBarAlignment,
//                                 decoration: tabBarDecoration,
//                               ),
//                               if (bottomTitleTxt != null)
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 4),
//                                   child: Text(
//                                     bottomTitleTxt!,
//                                     style: Theme.of(context).textTheme.bodySmall,
//                                   ),
//                                 ),
//                               if (bottomWidget != null) bottomWidget!,
//                             ],
//                           ),
//                         ),
//                       ),
//                   body: TabBarView(children: pages),
//
//                   // FAB switches automatically based on TabBarCubit state
//                   floatingActionButton: TabFABSwitcher(fabButtons: fabButtons),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

/// Standard TabBar Screen with optional FABs per tab and fully composable StyledTabBar.
// class StandardTabBarScreen extends StatelessWidget {
//   final List<TabItemModel> tabItems;
//   final List<Widget> pages;
//
//   // TabBar core
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final int? initialIndex;
//   final void Function(int)? getIndex;
//
//   // AppBar sizing/content
//   final double? preferredSize;
//   final double? appBarHeight;
//   final Widget? drawer;
//   final String? titleTxt;
//   final bool? centerTitle;
//   final Widget? titleWidget;
//   final Widget? leadingWidget;
//   final double? leadingWidth;
//   final List<Widget>? actionsList;
//   final Widget? bottomWidget;
//   final String? bottomTitleTxt;
//   final PreferredSizeWidget? appBar;
//
//   // FABs per tab
//   final List<Widget>? fabButtons;
//
//   // Optional external Cubit
//   final TabBarCubit? tabBarCubit;
//
//   // Tab Bar Visual overrides
//   final Color? backgroundColor;
//   final Color? labelColor;
//   final Color? unselectedLabelColor;
//   final double? borderRadius;
//   final EdgeInsets? padding;
//   final double? elevation;
//
//   // Indicator Style
//   final Color? indicatorColor;
//   final IndicatorModel? indicator;
//
//   // Optional wrapper decoration
//   final bool tabBarUseCard;
//   final Color? tabBarCardColor;
//   final double? tabBarCardElevation;
//   final ShapeBorder? tabBarCardShape;
//   final EdgeInsets? tabBarWrapperPadding;
//   final Alignment? tabBarAlignment;
//   final Decoration? tabBarDecoration;
//
//   const StandardTabBarScreen({
//     super.key,
//     required this.tabItems,
//     required this.pages,
//     this.visualStyle = TabBarVisualStyle.filled,
//  this.animate,
// this.initialIndex,
//     this.getIndex,
//     this.preferredSize,
//     this.appBarHeight,
//     this.drawer,
//     this.titleTxt,
//     this.titleWidget,
//     this.centerTitle,
//     this.leadingWidget,
//     this.leadingWidth,
//     this.actionsList,
//     this.bottomWidget,
//     this.bottomTitleTxt,
//     this.appBar,
//     this.fabButtons,
//     this.backgroundColor,
//     this.labelColor,
//     this.unselectedLabelColor,
//     this.borderRadius,
//     this.padding,
//     this.elevation,
//     this.indicatorColor,
//     this.indicator,
//     this.tabBarCubit,
//     this.tabBarUseCard = false,
//     this.tabBarCardColor,
//     this.tabBarCardElevation,
//     this.tabBarCardShape,
//     this.tabBarWrapperPadding,
//     this.tabBarAlignment,
//     this.tabBarDecoration,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => tabBarCubit ?? TabBarCubit()
//         ..selectTab(initialIndex ?? 0),
//       child: Builder(
//         builder: (context) {
//           final tabCubit = context.read<TabBarCubit>();
//
//           return DefaultTabController(
//             length: tabItems.length,
//             initialIndex: initialIndex ?? 0,
//             child: Builder(
//               builder: (context) {
//                 final controller = DefaultTabController.of(context);
//                 controller.addListener(() {
//                   if (!controller.indexIsChanging) {
//                     tabCubit.selectTab(controller.index);
//                     getIndex?.call(controller.index);
//                   }
//                 });
//
//                 return Scaffold(
//                   drawer: drawer,
//                   appBar:
//                       appBar ??
//                       AppBar(
//                         toolbarHeight: appBarHeight,
//                         centerTitle: centerTitle,
//                         title:
//                             titleWidget ??
//                             (titleTxt != null ? Text(titleTxt!) : null),
//                         leading: leadingWidget,
//                         leadingWidth: leadingWidth,
//                         actions: actionsList,
//                         bottom: PreferredSize(
//                           preferredSize: Size.fromHeight(
//                             preferredSize ?? kToolbarHeight,
//                           ),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               ComposableTabBarWrapper(
//                                 tabItems: tabItems,
//                                 controller: controller,
//                                 visualStyle: visualStyle,
//                                 labelColor: labelColor,
//                                 unselectedLabelColor: unselectedLabelColor,
//                                 backgroundColor: backgroundColor,
//                                 indicator: indicator,
//                                 borderRadius: borderRadius,
//                                 padding: padding,
//                                 elevation: elevation,
//                                 useCard: tabBarUseCard,
//                                 cardColor: tabBarCardColor,
//                                 cardElevation: tabBarCardElevation,
//                                 cardShape: tabBarCardShape,
//                                 wrapperPadding: tabBarWrapperPadding,
//                                 alignment: tabBarAlignment,
//                                 decoration: tabBarDecoration,
//                               ),
//                               if (bottomTitleTxt != null)
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 4),
//                                   child: Text(
//                                     bottomTitleTxt!,
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodySmall,
//                                   ),
//                                 ),
//                               if (bottomWidget != null) bottomWidget!,
//                             ],
//                           ),
//                         ),
//                       ),
//                   body: TabBarView(children: pages),
//
//                   // FAB switches automatically based on TabBarCubit state
//                   floatingActionButton: TabFABSwitcher(fabButtons: fabButtons),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// /// Highly configurable standard tab screen using a Cubit for tab index.
// class StandardTabBarScreen extends StatelessWidget {
//   final List<TabItemModel> tabItems;
//   final List<Widget> pages;
//
//   // TabBar core
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final int? initialIndex;
//   final void Function(int)? getIndex;
//
//   // AppBar sizing/content
//   final double? preferredSize;
//   final double? appBarHeight;
//   final Widget? drawer;
//   final String? titleTxt;
//   final bool? centerTitle;
//   final Widget? titleWidget;
//   final Widget? leadingWidget;
//   final double? leadingWidth;
//   final List<Widget>? actionsList;
//   final Widget? bottomWidget;
//   final String? bottomTitleTxt;
//   final PreferredSizeWidget? appBar;
//
//   // FABs per tab
//   final List<Widget>? fabButtons;
//
//   // Optional external Cubit
//   final TabBarCubit? tabBarCubit;
//
//   // Tab Bar Visual overrides
//   final Color? backgroundColor;
//   final Color? labelColor;
//   final Color? unselectedLabelColor;
//   final double? borderRadius;
//   final EdgeInsets? padding;
//   final double? elevation;
//
//   // Indicator Style
//   final Color? indicatorColor;
//   final IndicatorModel? indicator;
//
//   const StandardTabBarScreen({
//     super.key,
//     required this.tabItems,
//     required this.pages,
//     this.visualStyle = TabBarVisualStyle.filled,
//  this.animate,
// this.initialIndex,
//     this.getIndex,
//     this.preferredSize,
//     this.appBarHeight,
//     this.drawer,
//     this.titleTxt,
//     this.titleWidget,
//     this.centerTitle,
//     this.leadingWidget,
//     this.leadingWidth,
//     this.actionsList,
//     this.bottomWidget,
//     this.bottomTitleTxt,
//     this.appBar,
//     this.fabButtons,
//     this.backgroundColor,
//     this.labelColor,
//     this.unselectedLabelColor,
//     this.borderRadius,
//     this.padding,
//     this.elevation,
//     this.indicatorColor,
//     this.indicator,
//     this.tabBarCubit,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => tabBarCubit ?? TabBarCubit()
//         ..selectTab(initialIndex ?? 0),
//       child: Builder(
//         builder: (context) {
//           final tabCubit = context.read<TabBarCubit>();
//
//           return DefaultTabController(
//             length: tabItems.length,
//             initialIndex: initialIndex ?? 0,
//             child: Builder(
//               builder: (context) {
//                 final controller = DefaultTabController.of(context);
//                 controller.addListener(() {
//                   if (!controller.indexIsChanging) {
//                     tabCubit.selectTab(controller.index);
//                     getIndex?.call(controller.index);
//                   }
//                 });
//
//                 return Scaffold(
//                   drawer: drawer,
//                   appBar:
//                       appBar ??
//                       AppBar(
//                         toolbarHeight: appBarHeight,
//                         centerTitle: centerTitle,
//                         title:
//                             titleWidget ??
//                             (titleTxt != null ? Text(titleTxt!) : null),
//                         leading: leadingWidget,
//                         leadingWidth: leadingWidth,
//                         actions: actionsList,
//                         bottom: PreferredSize(
//                           preferredSize: Size.fromHeight(
//                             preferredSize ?? kToolbarHeight,
//                           ),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               StyledTabBar(
//                                 tabItems: tabItems,
//                                 controller: controller,
//                                 visualStyle: visualStyle,
//                                 labelColor: labelColor,
//                                 unselectedLabelColor: unselectedLabelColor,
//                                 borderRadius: borderRadius,
//                                 padding: padding,
//                                 elevation: elevation,
//                                 backgroundColor: backgroundColor,
//                                 indicatorColor: indicatorColor,
//                                 indicator: indicator,
//                               ),
//                               if (bottomTitleTxt != null)
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 4),
//                                   child: Text(
//                                     bottomTitleTxt!,
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.bodySmall,
//                                   ),
//                                 ),
//                               if (bottomWidget != null) bottomWidget!,
//                             ],
//                           ),
//                         ),
//                       ),
//                   body: TabBarView(children: pages),
//
//                   // FAB switches automatically based on TabBarCubit state
//                   floatingActionButton: TabFABSwitcher(fabButtons: fabButtons),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
