import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/type_def/type_def.dart';

/// A reusable AppBar widget with optional title, bottom widget, and TabBar.
class TabAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController controller;
  final TabWidgetBuilder? tabBarBuilder;

  // AppBar configuration
  final double? appBarHeight;
  final double? appBarBottomHeight;
  final String? titleTxt;
  final TextStyle? titleStyle;
  final Widget? titleWidget;
  final bool? centerTitle;

  // Leading
  final Widget? leadingWidget;
  final double? leadingWidth;
  final bool automaticallyImplyLeading;

  // Actions
  final List<Widget>? actions;

  // Bottom
  final Widget? bottomWidget;
  final String? bottomTitleTxt;
  final TextStyle? bottomTitleStyle;
  final Color? bottomTitleTxtColor;

  const TabAppBar({
    super.key,
    required this.controller,
    this.tabBarBuilder,
    this.appBarHeight,
    this.appBarBottomHeight,
    this.titleTxt,
    this.titleStyle,
    this.titleWidget,
    this.centerTitle,
    this.leadingWidget,
    this.leadingWidth,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.bottomWidget,
    this.bottomTitleTxt,
    this.bottomTitleStyle,
    this.bottomTitleTxtColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      toolbarHeight: appBarHeight,
      centerTitle: centerTitle,
      title:
          titleWidget ??
          (titleTxt != null ? Text(titleTxt!, style: titleStyle) : null),
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leadingWidget,
      leadingWidth: leadingWidth,
      actions: actions,
      bottom:
          (bottomWidget != null ||
              bottomTitleTxt != null ||
              tabBarBuilder != null)
          ? PreferredSize(
              preferredSize: Size.fromHeight(
                appBarBottomHeight ?? kToolbarHeight + (appBarHeight ?? 0),
              ),

              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (bottomWidget != null)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: bottomWidget!,
                      ),
                    if (bottomTitleTxt != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          bottomTitleTxt ?? "",
                          style:
                              bottomTitleStyle ??
                              theme.textTheme.titleSmall?.copyWith(
                                color: bottomTitleTxtColor ?? Colors.white,
                              ),
                        ),
                      ),
                    if (tabBarBuilder != null) tabBarBuilder!(controller),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    appBarHeight ?? kToolbarHeight + (appBarBottomHeight ?? 0),
  );
}
