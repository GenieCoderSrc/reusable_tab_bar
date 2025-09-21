import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/models/custom_shape_tab_model.dart';

import 'base_tab.dart';

/// A tab that displays a custom-shaped container with optional styling from [CustomShapeTabModel].
class CustomShapeTab extends BaseTab {
  final CustomShapeTabModel customShape;
  final double spacing;
  final bool vertical;

  const CustomShapeTab({
    super.key,
    super.label,
    super.wrapperType,
    super.customWrapperBuilder,
    super.padding,
    super.backgroundColor,
    required this.customShape,
    this.spacing = 4,
    this.vertical = true,
  });

  @override
  Widget buildContent(BuildContext context) {
    final container = Container(
      padding: customShape.padding,
      decoration: BoxDecoration(
        color: customShape.backgroundColor,
        borderRadius: BorderRadius.circular(customShape.borderRadius),
        border: Border.all(
          color: customShape.borderColor,
          width: customShape.borderWidth,
        ),
        boxShadow: customShape.boxShadow != null
            ? [customShape.boxShadow!]
            : null,
      ),
      child:
          customShape.child ??
          (label != null ? Text(label!, style: customShape.textStyle) : null),
    );

    final children = <Widget>[container];

    return vertical
        ? Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing,
            children: children,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing,
            children: children,
          );
  }
}
