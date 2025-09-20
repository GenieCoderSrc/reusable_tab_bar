import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/views/widgets/styled_tab_bar/composable_tab_bar_wrapper.dart';

import 'base_tab_bar_screen.dart';

class ModalTabBarScreen extends BaseTabBarScreen {
  const ModalTabBarScreen({
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

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => this,
    );
  }

  @override
  Widget buildBody(BuildContext context, TabController controller) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          ComposableTabBarWrapper(
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
          Expanded(
            child: TabBarView(controller: controller, children: pages),
          ),
        ],
      ),
    );
  }
}

// class ModalTabBarScreen extends StatelessWidget {
//   final List<TabItemModel> tabItems;
//   final List<Widget> pages;
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final int? initialIndex;
//   final void Function(int)? getIndex;
//   final TabBarCubit? tabBarCubit;
//
//   const ModalTabBarScreen({
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
//             return Dialog(
//               child: SizedBox(
//                 width: double.maxFinite,
//                 height: 400,
//                 child: Column(
//                   children: [
//                     ComposableTabBarWrapper(
//                       tabItems: tabItems,
//                       controller: controller,
//                       visualStyle: visualStyle,
//                     ),
//                     Expanded(
//                       child: TabBarView(children: pages),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class ModalTabBarScreen extends StatelessWidget {
//   final List<TabItemModel> tabItems;
//   final List<Widget> pages;
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final int? initialIndex;
//   final void Function(int)? getIndex;
//
//   const ModalTabBarScreen({
//     super.key,
//     required this.tabItems,
//     required this.pages,
//     this.visualStyle = TabBarVisualStyle.filled,
  //  this.animate,
    // this.initialIndex,
//     this.getIndex,
//   });
//
//   /// Show modal
//   static Future<void> show(
//       BuildContext context, {
//         required List<TabItemModel> tabItems,
//         required List<Widget> pages,
//         TabBarVisualStyle visualStyle = TabBarVisualStyle.filled,
//       }) {
//     return showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (_) => ModalTabBarScreen(
//         tabItems: tabItems,
//         pages: pages,
//         visualStyle: visualStyle,
//       ),
//     );
//   }
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
//             return SafeArea(
//               child: Column(
//                 children: [
//                   StyledTabBar(
//                     tabItems: tabItems,
//                     controller: controller,
//                     visualStyle: visualStyle,
//                   ),
//                   Expanded(
//                     child: TabBarView(children: pages),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class ModalTabBarScreen extends StatelessWidget {
//   const ModalTabBarScreen({
//     super.key,
//     required this.tabs,
//     required this.views,
//     required this.controller,
//     required this.visualStyle,
//     this.modalHeight = 400,
//     this.backgroundColor,
//     this.indicatorColor,
//   });
//
//   final List<Tab> tabs;
//   final List<Widget> views;
//   final TabController controller;
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final double modalHeight;
//   final Color? backgroundColor;
//   final Color? indicatorColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         builder: (_) => SizedBox(
//           height: modalHeight,
//           child: Column(
//             children: [
//               StyledTabBar(
//                 tabs: tabs,
//                 controller: controller,
//                 visualStyle: visualStyle,
//                 backgroundColor: backgroundColor,
//                 indicatorColor: indicatorColor,
//               ),
//               Expanded(child: TabBarView(controller: controller, children: views)),
//             ],
//           ),
//         ),
//       ),
//       child: const Text('Open Modal Tabs'),
//     );
//   }
// }
