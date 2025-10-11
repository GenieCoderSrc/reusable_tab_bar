import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/tab_item_model.dart';

class ImageTabItemModel extends TabItemModel {
  final String? imageSource;
  final ImageProvider? imageProvider;
  final Widget? image;

  final double? width;
  final double? height;
  final bool? vertical;
  final BorderRadius? borderRadius;
  final BoxFit? fit;

  const ImageTabItemModel({
    this.image,
    this.width,
    this.height,
    this.vertical,
    this.imageSource,
    this.imageProvider,
    this.borderRadius,
    this.fit,
    super.spacing = 4,
  });
}
