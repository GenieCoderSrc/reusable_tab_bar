import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';

/// Separate widget for building a SliverAppBar with tab support.
class SliverTabAppBar extends StatelessWidget {
  final TabController controller;
  final TabWidgetBuilder tabBarBuilder;

  // ---- AppBar configuration ----
  final double? expandedHeight;
  final double? appBarBottomHeight;
  final String? titleTxt;
  final Widget? titleWidget;
  final bool? centerTitle;

  // Leading
  final Widget? leadingWidget;
  final double? leadingWidth;
  final bool automaticallyImplyLeading;

  // Actions
  final List<Widget>? actions;

  // Bottom widget / title under the AppBar
  final Widget? bottomWidget;
  final String? bottomTitleTxt;
  final Color? bottomTitleTxtColor;

  // ---- Sliver configuration ----
  final bool pinned;
  final bool floating;
  final bool snap;

  const SliverTabAppBar({
    super.key,
    required this.controller,
    required this.tabBarBuilder,
    this.expandedHeight,
    this.appBarBottomHeight,
    this.titleTxt,
    this.titleWidget,
    this.centerTitle,
    this.leadingWidget,
    this.leadingWidth,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.bottomWidget,
    this.bottomTitleTxt,
    this.bottomTitleTxtColor,
    this.pinned = false,
    this.floating = false,
    this.snap = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leadingWidget,
      leadingWidth: leadingWidth,
      pinned: pinned,
      floating: floating,
      snap: snap,
      expandedHeight: expandedHeight ?? kToolbarHeight,
      centerTitle: centerTitle,
      title: titleWidget ?? (titleTxt != null ? Text(titleTxt!) : null),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(appBarBottomHeight ?? kToolbarHeight),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              tabBarBuilder(controller),
              if (bottomWidget != null) bottomWidget!,
              if (bottomTitleTxt != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    bottomTitleTxt!,
                    style: TextStyle(
                      color: bottomTitleTxtColor ?? Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
