import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/tab_bar_cubit.dart';

class AppTabBarWithSelectorButton extends StatelessWidget {
  const AppTabBarWithSelectorButton({
    super.key,
    required this.tabBarViews,
    required this.selectorButtons,
    this.drawer,
    this.appBar,
    this.floatingActionButton,
  });

  final List<Widget> tabBarViews;
  final List<Widget> selectorButtons;
  final Widget? drawer;
  final AppBar? appBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: context.read<TabBarCubit>().state.index,
      length: tabBarViews.length,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // To get index of current tab use tabController.index
              final int index = tabController.index;
              debugPrint('AppTabBarExceptHeader | addListener | index: $index');
              context.read<TabBarCubit>().selectTab(index);
            }
          });

          return Scaffold(
            appBar: appBar,
            drawer: drawer,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: List.generate(selectorButtons.length * 2 - 1, (
                      index,
                    ) {
                      if (index.isEven) {
                        return selectorButtons[index ~/ 2];
                      } else {
                        return const SizedBox(width: 12);
                      }
                    }),
                  ),
                ),
                Expanded(child: TabBarView(children: tabBarViews)),
              ],
            ),
            floatingActionButton: floatingActionButton,
          );
        },
      ),
    );
  }
}
