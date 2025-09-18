import 'package:flutter/material.dart';

import 'base_tab.dart';

/// A tab that displays an icon and text together.
/// Can be horizontal (icon → text or text → icon) or vertical (icon on top of text).
class IconTextTab extends BaseTab {
  final IconData? icon;
  final bool iconFirst;
  final bool vertical;
  final double spacing;
  final double iconSize;

  const IconTextTab({
    super.key,
    super.label,
    this.icon,
    this.iconFirst = true,
    this.vertical = false,
    this.spacing = 4,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    if (icon == null && label != null) return Text(label!);
    if (label == null && icon != null) return Icon(icon, size: iconSize);

    final children = <Widget>[
      if (icon != null) Icon(icon, size: iconSize),
      if (label != null) Text(label!),
    ];

    if (!iconFirst && children.length == 2) {
      children.insert(0, children.removeAt(1));
    }

    return Tab(
      child: vertical
          ? Column(
        mainAxisSize: MainAxisSize.min,
        spacing: spacing,
        children: children,
      )
          : Row(
        mainAxisSize: MainAxisSize.min,
        spacing: spacing,
        children: children,
      ),
    );
  }
}

