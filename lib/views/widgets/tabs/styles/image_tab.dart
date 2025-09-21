import 'package:flutter/material.dart';

import 'base_tab.dart';

class ImageTab extends BaseTab {
  final ImageProvider imageProvider;
  final double width;
  final double height;
  final double spacing;
  final bool vertical;

  const ImageTab({
    super.key,
    super.label,
    super.wrapperType,
    super.customWrapperBuilder,
    super.padding,
    super.backgroundColor,
    required this.imageProvider,
    this.width = 24,
    this.height = 24,
    this.spacing = 4,
    this.vertical = true,
  });

  @override
  Widget buildContent(BuildContext context) {
    final children = <Widget>[
      Image(image: imageProvider, width: width, height: height),
      if (label != null) Text(label!),
    ];

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
