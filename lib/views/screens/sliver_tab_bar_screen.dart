import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/sliver_tab_bar_type.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';

import 'base_tab_bar_screen.dart';

class SliverTabBarScreen extends BaseTabBarScreen {
  final SliverTabBarType sliverType;

  /// Pages for each tab
  final List<Widget> pages;

  /// Optional tab bar widget builder (only TabController required)
  final TabControllerBuilder? tabBarBuilder;

  const SliverTabBarScreen({
    super.key,
    required super.numberOfTabs,
    required this.pages,
    this.tabBarBuilder,
    this.sliverType = SliverTabBarType.sticky,
    super.initialIndex,
    super.getIndex,
    super.tabBarCubit,
    super.drawer,
    super.fabButtons,
  });

  @override
  Widget buildBody(BuildContext context, TabController controller) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: sliverType == SliverTabBarType.sticky,
          floating: sliverType == SliverTabBarType.floating,
          snap: sliverType == SliverTabBarType.floating,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(''), // Optional: Add title or leave empty
          ),
          bottom: tabBarBuilder != null
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: tabBarBuilder!(controller),
                )
              : null,
        ),
        SliverFillRemaining(child: TabBarView(children: pages)),
      ],
    );
  }
}

// class SliverTabBarScreen extends BaseTabBarScreen {
//   final SliverTabBarType sliverType;
//
//   const SliverTabBarScreen({
//     super.key,
//     required super.tabItems,
//     required super.pages,
//     this.sliverType = SliverTabBarType.sticky,
//     super.visualStyle,
//     super.animate,
//     super.initialIndex,
//     super.getIndex,
//     super.tabBarCubit,
//     super.appBarHeight,
//     super.appBarBottomHeight,
//     super.titleTxt,
//     super.titleWidget,
//     super.centerTitle,
//     super.fabButtons,
//     super.tabBarUseCard,
//     super.tabBarCardColor,
//     super.tabBarCardElevation,
//     super.tabBarCardShape,
//     super.tabBarWrapperPadding,
//     super.tabBarAlignment,
//     super.tabBarDecoration,
//     super.backgroundColor,
//     super.labelColor,
//     super.unselectedLabelColor,
//     super.borderRadius,
//     super.padding,
//     super.elevation,
//     super.indicatorColor,
//     super.indicator,
//     super.hideTopAppBar = true,
//   });
//
//   @override
//   Widget buildBody(BuildContext context, TabController controller) {
//     return CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           // actions: apa,
//           toolbarHeight: super.appBarBottomHeight ?? 250,
//           pinned: sliverType == SliverTabBarType.sticky,
//           floating: sliverType == SliverTabBarType.floating,
//           snap: sliverType == SliverTabBarType.floating,
//           title: titleWidget ?? (titleTxt != null ? Text(titleTxt!) : null),
//
//           bottom: tabItems.isNotEmpty
//               ? PreferredSize(
//                   preferredSize: Size.fromHeight(
//                     super.appBarBottomHeight ?? kToolbarHeight,
//                   ),
//                   child: ComposableTabBarWrapper(
//                     tabItems: tabItems,
//                     controller: controller,
//                     visualStyle: visualStyle,
//                     labelColor: labelColor,
//                     unselectedLabelColor: unselectedLabelColor,
//                     backgroundColor: backgroundColor,
//                     indicator: indicator,
//                     borderRadius: borderRadius,
//                     padding: padding,
//                     elevation: elevation,
//                     useCard: tabBarUseCard,
//                     cardColor: tabBarCardColor,
//                     cardElevation: tabBarCardElevation,
//                     cardShape: tabBarCardShape,
//                     wrapperPadding: tabBarWrapperPadding,
//                     alignment: tabBarAlignment,
//                     decoration: tabBarDecoration,
//                   ),
//                 )
//               : null,
//         ),
//         SliverFillRemaining(child: TabBarView(children: pages)),
//       ],
//     );
//   }
// }

// /// Sliver tab bar screen with pinned/floating behavior and reusable tab bar wrapper.
// class SliverTabBarScreen extends StatelessWidget {
//   final List<TabItemModel> tabItems;
//   final List<Widget> pages;
//
//   // TabBar core
//   final TabBarVisualStyle visualStyle;
// final bool? animate;
//   final int? initialIndex;
//   final void Function(int)? getIndex;
//   final TabBarCubit? tabBarCubit;
//
//   // AppBar content
//   final double? appBarHeight;
//   final String? titleTxt;
//   final Widget? titleWidget;
//   final bool? centerTitle;
//
//   // Sliver behavior
//   final SliverTabBarType sliverType;
//
//   // FAB per tab
//   final List<Widget>? fabButtons;
//
//   // Optional wrapper around tab bar
//   final bool tabBarUseCard;
//   final Color? tabBarCardColor;
//   final double? tabBarCardElevation;
//   final ShapeBorder? tabBarCardShape;
//   final EdgeInsets? tabBarWrapperPadding;
//   final Alignment? tabBarAlignment;
//   final Decoration? tabBarDecoration;
//
//   // Visual overrides
//   final Color? backgroundColor;
//   final Color? labelColor;
//   final Color? unselectedLabelColor;
//   final double? borderRadius;
//   final EdgeInsets? padding;
//   final double? elevation;
//   final Color? indicatorColor;
//   final IndicatorModel? indicator;
//
//   const SliverTabBarScreen({
//     super.key,
//     required this.tabItems,
//     required this.pages,
//     this.visualStyle = TabBarVisualStyle.filled,
//  this.animate,
// this.initialIndex,
//     this.getIndex,
//     this.tabBarCubit,
//     this.appBarHeight,
//     this.titleTxt,
//     this.titleWidget,
//     this.centerTitle,
//     this.sliverType = SliverTabBarType.sticky,
//     this.fabButtons,
//     this.tabBarUseCard = false,
//     this.tabBarCardColor,
//     this.tabBarCardElevation,
//     this.tabBarCardShape,
//     this.tabBarWrapperPadding,
//     this.tabBarAlignment,
//     this.tabBarDecoration,
//     this.backgroundColor,
//     this.labelColor,
//     this.unselectedLabelColor,
//     this.borderRadius,
//     this.padding,
//     this.elevation,
//     this.indicatorColor,
//     this.indicator,
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
//               body: CustomScrollView(
//                 slivers: [
//                   SliverAppBar(
//                     expandedHeight: appBarHeight ?? 200,
//                     pinned: sliverType == SliverTabBarType.sticky,
//                     floating: sliverType == SliverTabBarType.floating,
//                     snap: sliverType == SliverTabBarType.floating,
//                     centerTitle: centerTitle,
//                     title:
//                         titleWidget ??
//                         (titleTxt != null ? Text(titleTxt!) : null),
//                     bottom: PreferredSize(
//                       preferredSize: const Size.fromHeight(kToolbarHeight),
//                       child: ComposableTabBarWrapper(
//                         tabItems: tabItems,
//                         controller: controller,
//                         visualStyle: visualStyle,
//                         useCard: tabBarUseCard,
//                         cardColor: tabBarCardColor,
//                         cardElevation: tabBarCardElevation,
//                         cardShape: tabBarCardShape,
//                         wrapperPadding: tabBarWrapperPadding,
//                         alignment: tabBarAlignment,
//                         decoration: tabBarDecoration,
//                         backgroundColor: backgroundColor,
//                         labelColor: labelColor,
//                         unselectedLabelColor: unselectedLabelColor,
//                         borderRadius: borderRadius,
//                         padding: padding,
//                         elevation: elevation,
//                         indicatorColor: indicatorColor,
//                         indicator: indicator,
//                       ),
//                     ),
//                   ),
//                   SliverFillRemaining(child: TabBarView(children: pages)),
//                 ],
//               ),
//               floatingActionButton: TabFABSwitcher(fabButtons: fabButtons),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
