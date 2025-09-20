import 'package:flutter/material.dart';

import 'base_tab_bar_screen.dart';

class SideTabBarScreen extends BaseTabBarScreen {
  const SideTabBarScreen({
    super.key,
    required super.tabItems,
    required super.pages,
    super.visualStyle,
    super.animate,
    super.initialIndex,
    super.getIndex,
    super.tabBarCubit,
    super.fabButtons,
    super.tabBarUseCard,
    super.tabBarCardColor,
    super.tabBarCardElevation,
    super.tabBarCardShape,
    super.tabBarWrapperPadding,
    super.tabBarAlignment,
    super.tabBarDecoration,
    super.backgroundColor,
    super.labelColor,
    super.unselectedLabelColor,
    super.borderRadius,
    super.padding,
    super.elevation,
    super.indicatorColor,
    super.indicator,
    super.hideTopAppBar = true,
  });

  @override
  Widget buildBody(BuildContext context, TabController controller) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: controller.index,
          onDestinationSelected: (index) {
            controller.animateTo(index);
          },
          labelType: NavigationRailLabelType.selected,
          destinations: tabItems
              .map(
                (tab) => NavigationRailDestination(
                  icon: Icon(tab.icon),
                  label: Text(tab.label ?? ''),
                ),
              )
              .toList(),
        ),
        Expanded(
          child: TabBarView(controller: controller, children: pages),
        ),
      ],
    );
  }
}

// class SideTabBarScreen extends StatelessWidget {
//   final List<TabItemModel> tabItems;
//   final List<Widget> pages;
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final int? initialIndex;
//   final void Function(int)? getIndex;
//   final TabBarCubit? tabBarCubit;
//
//   const SideTabBarScreen({
//     super.key,
//     required this.tabItems,
//     required this.pages,
//     this.visualStyle = TabBarVisualStyle.filled,
  //  this.animate,
    // this.initialIndex,
//     this.getIndex,
//     this.tabBarCubit,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => tabBarCubit ?? TabBarCubit()..selectTab(initialIndex ?? 0),
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
//               body: Row(
//                 children: [
//                   ComposableTabBarWrapper(
//                     tabItems: tabItems,
//                     controller: controller,
//                     visualStyle: visualStyle,
//                     alignment: Alignment.topLeft,
//                   ),
//                   Expanded(
//                     child: TabBarView(children: pages),
//                   ),
//                 ],
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

// class SideTabBarScreen extends StatelessWidget {
//   final List<TabItemModel> tabItems;
//   final List<Widget> pages;
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final int? initialIndex;
//   final void Function(int)? getIndex;
//
//   const SideTabBarScreen({
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
//               body: Row(
//                 children: [
//                   Container(
//                     width: 100,
//                     color: Theme.of(context).colorScheme.surface,
//                     child: StyledTabBar(
//                       tabItems: tabItems,
//                       controller: controller,
//                       visualStyle: visualStyle,
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                       // Vertical layout
//                     ),
//                   ),
//                   Expanded(child: TabBarView(children: pages)),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class SideTabBarScreen extends StatelessWidget {
//   const SideTabBarScreen({
//     super.key,
//     required this.tabs,
//     required this.views,
//     required this.controller,
//     required this.visualStyle,
//     this.sideWidth = 180,
//     this.backgroundColor,
//     this.indicatorColor,
//   });
//
//   final List<Tab> tabs;
//   final List<Widget> views;
//   final TabController controller;
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final double sideWidth;
//   final Color? backgroundColor;
//   final Color? indicatorColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           SizedBox(
//             width: sideWidth,
//             child: StyledTabBar(
//               tabs: tabs,
//               controller: controller,
//               visualStyle: visualStyle,
//               backgroundColor: backgroundColor,
//               indicatorColor: indicatorColor,
//             ),
//           ),
//           Expanded(
//             child: TabBarView(controller: controller, children: views),
//           ),
//         ],
//       ),
//     );
//   }
// }
