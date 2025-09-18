import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_tab_bar/data/enums/tab_bar_visual_style.dart';
import 'package:reusable_tab_bar/data/models/indicator_model.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';
import 'package:reusable_tab_bar/views/widgets/styled_tab_bar/composable_tab_bar_wrapper.dart';
import 'package:reusable_tab_bar/views/widgets/tab_fab_switcher.dart';

abstract class BaseTabBarScreen extends StatelessWidget {
  final List<TabItemModel> tabItems;
  final List<Widget> pages;

  final TabBarVisualStyle visualStyle;
  final int? initialIndex;
  final void Function(int)? getIndex;
  final TabBarCubit? tabBarCubit;

  // AppBar
  final double? appBarHeight;
  final String? titleTxt;
  final Widget? titleWidget;
  final bool? centerTitle;

  // FAB per tab
  final List<Widget>? fabButtons;

  // TabBar wrapper
  final bool tabBarUseCard;
  final Color? tabBarCardColor;
  final double? tabBarCardElevation;
  final ShapeBorder? tabBarCardShape;
  final EdgeInsets? tabBarWrapperPadding;
  final Alignment? tabBarAlignment;
  final Decoration? tabBarDecoration;

  // Visual overrides
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final double? elevation;
  final Color? indicatorColor;
  final IndicatorModel? indicator;

  const BaseTabBarScreen({
    super.key,
    required this.tabItems,
    required this.pages,
    this.visualStyle = TabBarVisualStyle.filled,
    this.initialIndex,
    this.getIndex,
    this.tabBarCubit,
    this.appBarHeight,
    this.titleTxt,
    this.titleWidget,
    this.centerTitle,
    this.fabButtons,
    this.tabBarUseCard = false,
    this.tabBarCardColor,
    this.tabBarCardElevation,
    this.tabBarCardShape,
    this.tabBarWrapperPadding,
    this.tabBarAlignment,
    this.tabBarDecoration,
    this.backgroundColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.borderRadius,
    this.padding,
    this.elevation,
    this.indicatorColor,
    this.indicator,
  });

  /// Each screen type implements this
  Widget buildBody(BuildContext context, TabController controller);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => tabBarCubit ?? TabBarCubit()
        ..selectTab(initialIndex ?? 0),
      child: Builder(
        builder: (context) {
          final tabCubit = context.read<TabBarCubit>();

          return DefaultTabController(
            length: tabItems.length,
            initialIndex: initialIndex ?? 0,
            child: Builder(
              builder: (context) {
                final controller = DefaultTabController.of(context);
                controller.addListener(() {
                  if (!controller.indexIsChanging) {
                    tabCubit.selectTab(controller.index);
                    getIndex?.call(controller.index);
                  }
                });

                return Scaffold(
                  appBar: buildAppBar(controller),
                  body: buildBody(context, controller),
                  floatingActionButton: TabFABSwitcher(fabButtons: fabButtons),
                );
              },
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget? buildAppBar(TabController controller) {
    if (titleTxt == null && titleWidget == null && tabItems.isEmpty)
      return null;

    return AppBar(
      toolbarHeight: appBarHeight,
      centerTitle: centerTitle,
      title: titleWidget ?? (titleTxt != null ? Text(titleTxt!) : null),
      bottom: tabItems.isNotEmpty
          ? PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
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
            )
          : null,
    );
  }
}
