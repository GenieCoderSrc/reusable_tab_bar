import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';
import 'package:reusable_tab_bar/view_models/tab_bar_cubit.dart';

import 'default_tab_provider.dart';


/// A reusable modal tab bar screen
/// Tabs are displayed at the top inside a modal bottom sheet
class ModalTabBarScreen extends StatelessWidget {
  final List<Widget> pages;
  final TabWidgetBuilder tabBarBuilder;

  final int? initialIndex;
  final void Function(int)? onTabChanged;
  final TabBarCubit? tabBarCubit;

  final bool isDismissible;
  final bool enableDrag;

  const ModalTabBarScreen({
    super.key,
    required this.pages,
    required this.tabBarBuilder,
    this.initialIndex,
    this.onTabChanged,
    this.tabBarCubit,
    this.isDismissible = true,
    this.enableDrag = true,
  });

  /// Show the modal
  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (_) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabProvider(
      tabCount: pages.length,
      initialIndex: initialIndex ?? 0,
      onTabChanged: onTabChanged,
      tabBarCubit: tabBarCubit,
      builder: (controller) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              tabBarBuilder(controller),
              Expanded(
                child: TabBarView(controller: controller, children: pages),
              ),
            ],
          ),
        );
      },
    );
  }
}
