import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/wrapper_type.dart';
import 'package:reusable_tab_bar/views/widgets/wrapper_factory.dart';

abstract class BaseTab extends StatelessWidget {
  final String? label;

  /// Choose either a predefined wrapper type or supply a custom builder.
  final WrapperType? wrapperType;
  final Widget Function(Widget child)? customWrapperBuilder;

  /// Default padding for the wrapper.
  final EdgeInsets padding;
  final EdgeInsets? margin;

  /// Optional background color for wrapper types that support it.
  final Color? backgroundColor;

  const BaseTab({
    super.key,
    this.label,
    this.wrapperType,
    this.customWrapperBuilder,
    this.padding = const EdgeInsets.all(8),
    this.margin,
    this.backgroundColor,
  });

  /// Child content to render inside the tab.
  @protected
  Widget buildContent(BuildContext context);

  /// Builds the final Tab widget with either a custom or enum-based wrapper.
  @protected
  Widget buildTab(BuildContext context) {
    final content = buildContent(context);

    // 1️⃣ If custom builder is provided, use it.
    if (customWrapperBuilder != null) {
      return Tab(child: customWrapperBuilder!(content));
    }

    // 2️⃣ Otherwise use predefined enum-based wrapper.
    final defaultWrapper = WrapperFactory.builder(
      wrapperType ?? WrapperType.none,
      padding: padding,
      backgroundColor: backgroundColor,
    );
    return Tab(child: defaultWrapper(content));
  }

  @override
  Widget build(BuildContext context) => buildTab(context);
}
