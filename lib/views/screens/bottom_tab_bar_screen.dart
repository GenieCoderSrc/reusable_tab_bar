import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/views/widgets/styled_tab_bar/composable_tab_bar_wrapper.dart';

import 'base_tab_bar_screen.dart';

class BottomTabBarScreen extends BaseTabBarScreen {
  const BottomTabBarScreen({
    super.key,
    required super.tabItems,
    required super.pages,
    super.visualStyle,
    super.animate,
    super.initialIndex,
    super.getIndex,
    super.tabBarCubit,
    super.fabButtons,
    super.backgroundColor,
    super.labelColor,
    super.unselectedLabelColor,
    super.borderRadius,
    super.padding,
    super.elevation,
    super.indicatorColor,
    super.indicator,
    super.hideTopAppBar = true,
    // Optional wrapper
    super.tabBarUseCard,
    super.tabBarCardColor,
    super.tabBarCardElevation,
    super.tabBarCardShape,
    super.tabBarWrapperPadding,
    super.tabBarAlignment,
    super.tabBarDecoration,
  });

  @override
  Widget buildBody(BuildContext context, TabController controller) {
    return Scaffold(
      body: TabBarView(children: pages),
      bottomNavigationBar: Material(
        color: backgroundColor ?? Theme.of(context).canvasColor,
        child: ComposableTabBarWrapper(
          tabItems: tabItems,
          controller: controller,
          visualStyle: visualStyle,
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
          backgroundColor: backgroundColor,
          indicator: indicator,
          borderRadius: borderRadius,
          padding: padding,
          elevation: elevation,
          useCard: tabBarUseCard,
          cardColor: tabBarCardColor,
          cardElevation: tabBarCardElevation,
          cardShape: tabBarCardShape,
          wrapperPadding: tabBarWrapperPadding,
          alignment: tabBarAlignment,
          decoration: tabBarDecoration,
        ),
      ),
    );
  }
}

// class BottomTabBarScreen extends StatelessWidget {
//   final List<TabItemModel> tabItems;
//   final List<Widget> pages;
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final int? initialIndex;
//   final void Function(int)? getIndex;
//   final TabBarCubit? tabBarCubit;
//   final bool tabBarUseCard;
//   final Color? tabBarCardColor;
//   final double? tabBarCardElevation;
//   final ShapeBorder? tabBarCardShape;
//   final EdgeInsets? tabBarWrapperPadding;
//   final Alignment? tabBarAlignment;
//   final Decoration? tabBarDecoration;
//
//   const BottomTabBarScreen({
//     super.key,
//     required this.tabItems,
//     required this.pages,
//     this.visualStyle = TabBarVisualStyle.filled,
  //  this.animate,
    // this.initialIndex,
//     this.getIndex,
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
//       child: DefaultTabController(
//         length: tabItems.length,
//         initialIndex: initialIndex ?? 0,
//         child: Builder(
//           builder: (context) {
//             final controller = DefaultTabController.of(context)!;
//             controller.addListener(() {
//               if (!controller.indexIsChanging) {
//                 context.read<TabBarCubit>().selectTab(controller.index);
//                 getIndex?.call(controller.index);
//               }
//             });
//
//             return Scaffold(
//               body: TabBarView(children: pages),
//               bottomNavigationBar: ComposableTabBarWrapper(
//                 tabItems: tabItems,
//                 controller: controller,
//                 visualStyle: visualStyle,
//                 useCard: tabBarUseCard,
//                 cardColor: tabBarCardColor,
//                 cardElevation: tabBarCardElevation,
//                 cardShape: tabBarCardShape,
//                 wrapperPadding: tabBarWrapperPadding,
//                 alignment: tabBarAlignment,
//                 decoration: tabBarDecoration,
//               ),
//               floatingActionButton: TabFABSwitcher(
//                 fabButtons: pages.map((_) => const SizedBox.shrink()).toList(),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class BottomTabBarScreen extends StatelessWidget {
//   final List<TabItemModel> tabItems;
//   final List<Widget> pages;
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final int? initialIndex;
//   final void Function(int)? getIndex;
//
//   const BottomTabBarScreen ({
//     super.key,
//     required this.tabItems,
//     required this.pages,
//     this.visualStyle = TabBarVisualStyle.filled,
  //  this.animate,
    // this.initialIndex,
//     this.getIndex,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => TabBarCubit()..selectTab(initialIndex ?? 0),
//       child: DefaultTabController(
//         length: tabItems.length,
//         initialIndex: initialIndex ?? 0,
//         child: Builder(
//           builder: (context) {
//             final tabCubit = context.read<TabBarCubit>();
//             final controller = DefaultTabController.of(context);
//             controller.addListener(() {
//               if (!controller.indexIsChanging) {
//                 tabCubit.selectTab(controller.index);
//                 getIndex?.call(controller.index);
//               }
//             });
//
//             return Scaffold(
//               body: TabBarView(children: pages),
//               bottomNavigationBar: Material(
//                 elevation: 8,
//                 child: StyledTabBar(
//                   tabItems: tabItems,
//                   controller: controller,
//                   visualStyle: visualStyle,
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class BottomTabBarScreen extends StatelessWidget {
//   const BottomTabBarScreen({
//     super.key,
//     required this.tabs,
//     required this.views,
//     required this.controller,
//     required this.visualStyle,
//     this.title,
//     this.backgroundColor,
//     this.indicatorColor,
//     this.elevation = 4,
//   });
//
//   final List<Tab> tabs;
//   final List<Widget> views;
//   final TabController controller;
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final String? title;
//   final Color? backgroundColor;
//   final Color? indicatorColor;
//   final double elevation;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title ?? 'Bottom Tabs')),
//       body: TabBarView(controller: controller, children: views),
//       bottomNavigationBar: Material(
//         elevation: elevation,
//         child: StyledTabBar(
//           tabs: tabs,
//           controller: controller,
//           visualStyle: visualStyle,
//           backgroundColor: backgroundColor,
//           indicatorColor: indicatorColor, tabItems: [],
//         ),
//       ),
//     );
//   }
// }
