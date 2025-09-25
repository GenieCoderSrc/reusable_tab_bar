import 'package:flutter/material.dart';

import 'base_tab.dart';

class ImageTab extends BaseTab {
  final ImageProvider? imageProvider;
  final double width;

  // final double? height;
  final String? imagePath;
  final double spacing;
  final bool vertical;

  const ImageTab({
    super.key,
    super.label,
    super.wrapperType,
    super.wrapperModel,
    super.rotate,
    super.rotateTurns,
    this.imageProvider,
    this.imagePath,
    this.width = 24,
    super.height,
    this.spacing = 4,
    this.vertical = true,
  });

  @override
  Widget buildContent(BuildContext context) {
    final children = <Widget>[
      if (imageProvider != null)
        Image(image: imageProvider!, width: width, height: height ?? 24),
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
