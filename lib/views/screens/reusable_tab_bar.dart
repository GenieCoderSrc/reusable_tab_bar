import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/sliver_tab_bar_type.dart';
import 'package:reusable_tab_bar/data/enums/tab_bar_layout.dart';
import 'package:reusable_tab_bar/data/enums/tab_bar_visual_style.dart';
import 'package:reusable_tab_bar/data/models/indicator_model.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';

import 'bottom_tab_bar_screen.dart';
import 'modal_tab_bar_screen.dart';
import 'side_tab_bar_screen.dart';
import 'sliver_tab_bar_screen.dart';
import 'standard_tab_bar_screen.dart';

/// Single entry point: chooses correct screen based on layout.
class ReusableTabBarScreen extends StatelessWidget {
  final TabBarLayout layout;

  // Common tab config
  final List<TabItemModel> tabItems;
  final List<Widget> pages;
  final TabBarVisualStyle visualStyle;
  final int? initialIndex;
  final void Function(int)? getIndex;
  final TabBarCubit? tabBarCubit;

  // AppBar / Scaffold options
  final double? preferredSize;
  final double? appBarHeight;
  final Widget? drawer;
  final String? titleTxt;
  final bool? centerTitle;
  final Widget? titleWidget;
  final Widget? leadingWidget;
  final double? leadingWidth;
  final List<Widget>? actionsList;
  final Widget? bottomWidget;
  final String? bottomTitleTxt;
  final PreferredSizeWidget? appBar;

  // FABs per tab
  final List<Widget>? fabButtons;

  // Tab Bar style
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final double? elevation;
  final Color? indicatorColor;
  final IndicatorModel? indicator;

  // Optional wrapper
  final bool tabBarUseCard;
  final Color? tabBarCardColor;
  final double? tabBarCardElevation;
  final ShapeBorder? tabBarCardShape;
  final EdgeInsets? tabBarWrapperPadding;
  final Alignment? tabBarAlignment;
  final Decoration? tabBarDecoration;

  // Sliver-specific
  final SliverTabBarType? sliverType;

  const ReusableTabBarScreen({
    super.key,
    required this.layout,
    required this.tabItems,
    required this.pages,
    this.visualStyle = TabBarVisualStyle.filled,
    this.initialIndex,
    this.getIndex,
    this.tabBarCubit,
    this.preferredSize,
    this.appBarHeight,
    this.drawer,
    this.titleTxt,
    this.centerTitle,
    this.titleWidget,
    this.leadingWidget,
    this.leadingWidth,
    this.actionsList,
    this.bottomWidget,
    this.bottomTitleTxt,
    this.appBar,
    this.fabButtons,
    this.backgroundColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.borderRadius,
    this.padding,
    this.elevation,
    this.indicatorColor,
    this.indicator,
    this.tabBarUseCard = false,
    this.tabBarCardColor,
    this.tabBarCardElevation,
    this.tabBarCardShape,
    this.tabBarWrapperPadding,
    this.tabBarAlignment,
    this.tabBarDecoration,
    this.sliverType,
  });

  @override
  Widget build(BuildContext context) {
    switch (layout) {
      case TabBarLayout.standard:
        return StandardTabBarScreen(
          tabItems: tabItems,
          pages: pages,
          visualStyle: visualStyle,
          initialIndex: initialIndex,
          getIndex: getIndex,
          tabBarCubit: tabBarCubit,
          appBarHeight: appBarHeight,
          titleTxt: titleTxt,
          titleWidget: titleWidget,
          centerTitle: centerTitle,
          fabButtons: fabButtons,
          tabBarUseCard: tabBarUseCard,
          tabBarCardColor: tabBarCardColor,
          tabBarCardElevation: tabBarCardElevation,
          tabBarCardShape: tabBarCardShape,
          tabBarWrapperPadding: tabBarWrapperPadding,
          tabBarAlignment: tabBarAlignment,
          tabBarDecoration: tabBarDecoration,
          backgroundColor: backgroundColor,
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
          borderRadius: borderRadius,
          padding: padding,
          elevation: elevation,
          indicatorColor: indicatorColor,
          indicator: indicator,
        );

      case TabBarLayout.sliver:
        return SliverTabBarScreen(
          tabItems: tabItems,
          pages: pages,
          visualStyle: visualStyle,
          initialIndex: initialIndex,
          getIndex: getIndex,
          tabBarCubit: tabBarCubit,
          fabButtons: fabButtons,
          sliverType: sliverType ?? SliverTabBarType.sticky,
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
          backgroundColor: backgroundColor,
          indicator: indicator,
          borderRadius: borderRadius,
          padding: padding,
          elevation: elevation,
          tabBarUseCard: tabBarUseCard,
          tabBarCardColor: tabBarCardColor,
          tabBarCardElevation: tabBarCardElevation,
          tabBarCardShape: tabBarCardShape,
          tabBarWrapperPadding: tabBarWrapperPadding,
          tabBarAlignment: tabBarAlignment,
          tabBarDecoration: tabBarDecoration,
        );

      case TabBarLayout.bottom:
        return BottomTabBarScreen(
          tabItems: tabItems,
          pages: pages,
          visualStyle: visualStyle,
          initialIndex: initialIndex,
          getIndex: getIndex,
          tabBarCubit: tabBarCubit,
          fabButtons: fabButtons,
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
          backgroundColor: backgroundColor,
          indicator: indicator,
          borderRadius: borderRadius,
          padding: padding,
          elevation: elevation,
          tabBarUseCard: tabBarUseCard,
          tabBarCardColor: tabBarCardColor,
          tabBarCardElevation: tabBarCardElevation,
          tabBarCardShape: tabBarCardShape,
          tabBarWrapperPadding: tabBarWrapperPadding,
          tabBarAlignment: tabBarAlignment,
          tabBarDecoration: tabBarDecoration,
        );

      case TabBarLayout.side:
        return SideTabBarScreen(
          tabItems: tabItems,
          pages: pages,
          visualStyle: visualStyle,
          initialIndex: initialIndex,
          getIndex: getIndex,
          tabBarCubit: tabBarCubit,
          fabButtons: fabButtons,
          tabBarUseCard: tabBarUseCard,
          tabBarCardColor: tabBarCardColor,
          tabBarCardElevation: tabBarCardElevation,
          tabBarCardShape: tabBarCardShape,
          tabBarWrapperPadding: tabBarWrapperPadding,
          tabBarAlignment: tabBarAlignment,
          tabBarDecoration: tabBarDecoration,
          backgroundColor: backgroundColor,
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
          borderRadius: borderRadius,
          padding: padding,
          elevation: elevation,
          indicatorColor: indicatorColor,
          indicator: indicator,
        );

      case TabBarLayout.modal:
        return ModalTabBarScreen(
          tabItems: tabItems,
          pages: pages,
          visualStyle: visualStyle,
          initialIndex: initialIndex,
          getIndex: getIndex,
          tabBarCubit: tabBarCubit,
          fabButtons: fabButtons,
          tabBarUseCard: tabBarUseCard,
          tabBarCardColor: tabBarCardColor,
          tabBarCardElevation: tabBarCardElevation,
          tabBarCardShape: tabBarCardShape,
          tabBarWrapperPadding: tabBarWrapperPadding,
          tabBarAlignment: tabBarAlignment,
          tabBarDecoration: tabBarDecoration,
          backgroundColor: backgroundColor,
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
          borderRadius: borderRadius,
          padding: padding,
          elevation: elevation,
          indicatorColor: indicatorColor,
          indicator: indicator,
        );
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:reusable_tab_bar/data/enums/tab_bar_layout.dart';
// import 'package:reusable_tab_bar/data/enums/tab_bar_visual_style.dart';
// import 'package:reusable_tab_bar/views/widgets/styled_tab_bar.dart';
//
//
// /// Combines layout logic with visual styles.
// class ReusableTabBar extends StatelessWidget {
//   const ReusableTabBar({
//     super.key,
//     required this.layout,
//     required this.tabs,
//     required this.views,
//     required this.visualStyle,
//     this.appBarTitle,
//     this.isPinned = true,
//     this.isFloating = false,
//     this.backgroundColor,
//     this.indicatorColor,
//     this.sideWidth = 180,
//     this.modalHeight = 400,
//     this.borderRadius = 24,
//     this.elevation = 4,
//   });
//
//   final TabBarLayout layout;
//   final List<Tab> tabs;
//   final List<Widget> views;
//   final TabBarVisualStyle visualStyle;
//
//   final String? appBarTitle;
//   final bool isPinned;
//   final bool isFloating;
//   final Color? backgroundColor;
//   final Color? indicatorColor;
//   final double sideWidth;
//   final double modalHeight;
//   final double borderRadius;
//   final double elevation;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = DefaultTabController.of(context) ??
//         TabController(length: tabs.length, vsync: Scaffold.of(context));
//
//     final styled = StyledTabBar(
//       tabs: tabs,
//       controller: controller,
//       visualStyle: visualStyle,
//       backgroundColor: backgroundColor,
//       indicatorColor: indicatorColor,
//       borderRadius: borderRadius,
//       elevation: elevation,
//     );
//
//     switch (layout) {
//       case TabBarLayout.standard:
//         return DefaultTabController(
//           length: tabs.length,
//           child: Scaffold(
//             appBar: AppBar(
//               title: Text(appBarTitle ?? 'Standard Tabs'),
//               bottom: styled,
//             ),
//             body: TabBarView(controller: controller, children: views),
//           ),
//         );
//
//       case TabBarLayout.sliver:
//         return DefaultTabController(
//           length: tabs.length,
//           child: Scaffold(
//             body: NestedScrollView(
//               headerSliverBuilder: (_, __) => [
//                 SliverAppBar(
//                   pinned: isPinned,
//                   floating: isFloating,
//                   title: Text(appBarTitle ?? 'Sliver Tabs'),
//                   bottom: styled,
//                 ),
//               ],
//               body: TabBarView(controller: controller, children: views),
//             ),
//           ),
//         );
//
//       case TabBarLayout.bottom:
//         return DefaultTabController(
//           length: tabs.length,
//           child: Scaffold(
//             appBar: AppBar(title: Text(appBarTitle ?? 'Bottom Tabs')),
//             body: TabBarView(controller: controller, children: views),
//             bottomNavigationBar: Material(
//               elevation: elevation,
//               child: styled,
//             ),
//           ),
//         );
//
//       case TabBarLayout.side:
//         return DefaultTabController(
//           length: tabs.length,
//           child: Scaffold(
//             body: Row(
//               children: [
//                 SizedBox(width: sideWidth, child: styled),
//                 Expanded(child: TabBarView(controller: controller, children: views)),
//               ],
//             ),
//           ),
//         );
//
//       case TabBarLayout.modal:
//         return Builder(
//           builder: (context) => ElevatedButton(
//             child: const Text('Open Modal Tabs'),
//             onPressed: () => showModalBottomSheet(
//               context: context,
//               isScrollControlled: true,
//               builder: (_) => DefaultTabController(
//                 length: tabs.length,
//                 child: SizedBox(
//                   height: modalHeight,
//                   child: Column(
//                     children: [
//                       styled,
//                       Expanded(
//                         child: TabBarView(
//                           controller: controller,
//                           children: views,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//     }
//   }
// }
