import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';

class TabFABSwitcher extends StatelessWidget {
  final List<Widget>? fabButtons;

  const TabFABSwitcher({super.key, required this.fabButtons});

  @override
  Widget build(BuildContext context) {
    if (fabButtons == null || fabButtons!.isEmpty)
      return const SizedBox.shrink();

    return BlocBuilder<TabBarCubit, TabBarState>(
      builder: (context, tabState) {
        if (tabState.index >= fabButtons!.length)
          return const SizedBox.shrink();
        return fabButtons![tabState.index];
      },
    );
  }
}
