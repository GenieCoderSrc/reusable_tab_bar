import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/tab_item_model.dart';

class ImageTabItemModel extends TabItemModel {
  final String? imagePath;
  final ImageProvider? image;

  const ImageTabItemModel({
    this.imagePath,
    this.image,
    super.wrapperType,
    super.wrapperModel,
    super.spacing = 4,
  });
}
