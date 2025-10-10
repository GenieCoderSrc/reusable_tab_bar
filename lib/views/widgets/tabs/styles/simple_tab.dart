import 'package:flutter/material.dart';

import 'base_tab.dart';

/// A tab that displays an icon and text together.
/// Can be horizontal (icon → text or text → icon) or vertical (icon on top of text).
class SimpleTab extends BaseTab {
  final IconData? icon;
  final bool iconFirst;
  final bool vertical;
  final double spacing;
  final double iconSize;
  final TextStyle? textStyle;

  const SimpleTab({
    super.key,
    super.label,
    super.wrapperModel,
    super.height,
    super.rotate,
    super.rotateTurns,
    this.icon,
    this.iconFirst = true,
    this.vertical = false,
    this.spacing = 4,
    this.iconSize = 24,
    this.textStyle,
  });

  @override
  Widget buildContent(BuildContext context) {
    // 1️⃣ Text-only
    if (icon == null && label != null) {
      return Text(
        label!,
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
      );
    }

    // 2️⃣ Icon-only
    if (label == null && icon != null) {
      return Icon(icon, size: iconSize);
    }

    // 3️⃣ Icon + Label
    final children = <Widget>[
      if (icon != null) Icon(icon, size: iconSize),
      if (label != null)
        Text(
          label!,
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
    ];

    // Flip order if iconFirst = false
    if (!iconFirst && children.length == 2) {
      children.insert(0, children.removeAt(1));
    }

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
