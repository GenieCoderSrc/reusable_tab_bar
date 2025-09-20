import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_type.dart';

import 'custom_shape_tab_model.dart';

class TabItemModel {
  final TabType type;
  final String? label;
  final IconData? icon;
  final String? lottieAsset;
  final String? lottieUrl;
  final String? imagePath;
  final ImageProvider? image;
  final Widget? customWidget;
  final CustomShapeTabModel? customShape;
  final double spacing;

  const TabItemModel({
    required this.type,
    this.label,
    this.icon,
    this.lottieAsset,
    this.lottieUrl,
    this.imagePath,
    this.image,
    this.customWidget,
    this.customShape,
    this.spacing = 4,
  });
}
