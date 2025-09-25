import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/wrapper_type.dart';
import 'package:reusable_tab_bar/data/models/wrapper_model.dart';
import 'package:reusable_tab_bar/views/widgets/widget_wrapper/widget_wrapper_factory.dart';

/// Abstract base for all Tab widgets with optional wrapper styling.
abstract class BaseTab extends StatelessWidget {
  /// Optional text label for the tab.
  final String? label;

  /// Choose a predefined wrapper type, e.g. [WrapperType.card].
  final WrapperType? wrapperType;

  /// Fully custom styling configuration.
  final WrapperModel? wrapperModel;

  /// Custom builder to wrap the child if you don’t want to use [wrapperType].
  // final Widget Function(Widget child)? customWrapperBuilder;

  /// Optional height of the tab (passed to the [Tab] widget).
  final double? height;

  /// Whether to rotate the tab content 270° (for vertical tabs)
  final bool? rotate;
  final int? rotateTurns;

  const BaseTab({
    super.key,
    this.label,
    this.wrapperType,
    this.wrapperModel,
    // this.customWrapperBuilder,
    this.height,
    this.rotate,
    this.rotateTurns,
  });

  /// Implement this in subclasses to build the core content of the tab.
  @protected
  Widget buildContent(BuildContext context);

  /// Builds the final Tab with either a custom builder or a factory wrapper.
  @protected
  Widget buildTab(BuildContext context) {
    Widget content = buildContent(context);

    // Rotate the content if needed
    if (rotate ?? false || rotateTurns != null) {
      content = RotatedBox(quarterTurns: rotateTurns ?? 3, child: content);
    }

    // 1️⃣ If a completely custom wrapper is provided, use it.
    if (wrapperModel?.customWrapperBuilder != null) {
      return Tab(
        height: height,
        child: wrapperModel?.customWrapperBuilder!(content),
      );
    }

    // 2️⃣ Otherwise, use the factory with the provided model or defaults.
    final wrapper = WidgetWrapperFactory.create(
      wrapperType ?? WrapperType.padded,
      model: wrapperModel ?? const WrapperModel(),
    );

    return Tab(height: height, child: wrapper.wrap(content));
  }

  @override
  Widget build(BuildContext context) => buildTab(context);
}
