import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_tab_bar/data/tab_controller_listener.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';
import 'package:reusable_tab_bar/views/widgets/tab_fab_switcher.dart';

abstract class BaseTabBarScreen extends StatelessWidget {
  /// Number of tabs in this screen
  final int numberOfTabs;
  final int? initialIndex;
  final void Function(int)? getIndex;
  final TabBarCubit? tabBarCubit;

  // FAB per tab
  final List<Widget>? fabButtons;

  final Widget? drawer;

  /// AppBar builder function
  final TabAppBarBuilder? appBarBuilder;
  final TabWidgetBuilder? bottomBarBuilder;

  const BaseTabBarScreen({
    super.key,
    required this.numberOfTabs,
    this.initialIndex,
    this.getIndex,
    this.tabBarCubit,
    this.drawer,
    this.appBarBuilder,
    this.bottomBarBuilder,
    this.fabButtons,
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
            length: numberOfTabs,
            initialIndex: context.read<TabBarCubit>().state.index,
            child: Builder(
              builder: (context) {
                final controller = DefaultTabController.of(context);
                addTabControllerListener(
                  controller: controller,
                  tabCubit: tabCubit,
                  onTabChanged: getIndex,
                );

                return Scaffold(
                  drawer: drawer,
                  appBar: appBarBuilder?.call(context, controller),
                  body: buildBody(context, controller),
                  floatingActionButton: TabFABSwitcher(fabButtons: fabButtons),
                  bottomNavigationBar: bottomBarBuilder?.call(
                    context,
                    controller,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
