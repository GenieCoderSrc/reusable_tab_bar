import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/views/widgets/image_view/image_view.dart';

import 'base_tab.dart';

class ImageTab extends BaseTab {
  final Widget? image;
  final String? imgSource;
  final ImageProvider? imageProvider;

  final double? width;
  final bool? vertical;
  final double spacing;
  final BorderRadius? borderRadius;
  final BoxFit? fit;

  const ImageTab({
    super.key,
    this.image,
    this.imgSource,
    this.imageProvider,
    super.wrapperModel,
    super.label,
    super.rotate,
    super.rotateTurns,
    super.height,
    this.width,
    this.spacing = 4,
    this.vertical,
    this.borderRadius,
    this.fit,
  });

  @override
  Widget buildContent(BuildContext context) {
    final List<Widget> children = <Widget>[
      if (imageProvider != null)
        Image(
          image: imageProvider!,
          width: width ?? 24,
          height: height ?? 24,
          fit: fit,
        ),
      if (imgSource != null)
        ImageView(
          imgSource: imgSource!,
          width: width ?? 24,
          height: height ?? 24,
          borderRadius: borderRadius,
          fit: fit,
        ),
      if (image != null) image!,
      if (label != null)
        Text(
          label!,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
    ];

    final Widget tab = (vertical ?? true)
        ? Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: spacing,
            children: children,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: spacing,
            children: children,
          );

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height ?? 48),
      child: rotate ?? false
          ? RotatedBox(quarterTurns: rotateTurns ?? 3, child: tab)
          : tab,
    );
  }
}
