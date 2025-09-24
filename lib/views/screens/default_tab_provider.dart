import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_tab_bar/utils/tab_controller_listener.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';

/// Single responsibility: provide a DefaultTabController
/// and synchronize it with [TabBarCubit].
class DefaultTabProvider extends StatelessWidget {
  final int tabCount;
  final int initialIndex;
  final void Function(int)? onTabChanged;
  final TabBarCubit? tabBarCubit;
  final TabWidgetBuilder builder;

  const DefaultTabProvider({
    super.key,
    required this.tabCount,
    required this.builder,
    this.initialIndex = 0,
    this.onTabChanged,
    this.tabBarCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabBarCubit>(
      create: (_) => tabBarCubit ?? TabBarCubit()
        ..selectTab(initialIndex),
      child: Builder(
        builder: (context) {
          final tabCubit = context.read<TabBarCubit>();

          return DefaultTabController(
            length: tabCount,
            initialIndex: context.read<TabBarCubit>().state.index,
            child: Builder(
              builder: (context) {
                final controller = DefaultTabController.of(context);
                addTabControllerListener(
                  controller: controller,
                  tabCubit: tabCubit,
                  onTabChanged: onTabChanged,
                );
                return builder(controller);
              },
            ),
          );
        },
      ),
    );
  }
}
