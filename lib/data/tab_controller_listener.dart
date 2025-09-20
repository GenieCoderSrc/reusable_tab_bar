import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';

/// Adds a listener to a TabController to sync with TabBarCubit and optional callback.
void addTabControllerListener({
  required TabController controller,
  required TabBarCubit tabCubit,
  void Function(int)? onTabChanged,
}) {
  controller.addListener(() {
    if (!controller.indexIsChanging) {
      tabCubit.selectTab(controller.index);
      onTabChanged?.call(controller.index);
    }
  });
}
