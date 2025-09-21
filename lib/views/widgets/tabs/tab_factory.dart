import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_type.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model.dart';
import 'package:reusable_tab_bar/views/widgets/tabs/styles/custom_shape_tab.dart';
import 'package:reusable_tab_bar/views/widgets/tabs/styles/simple_tab.dart';
import 'package:reusable_tab_bar/views/widgets/tabs/styles/image_tab.dart';
import 'package:reusable_tab_bar/views/widgets/tabs/styles/lottie_tab.dart';

class TabFactory {
  const TabFactory._(); // prevent instantiation

  static Widget create(TabItemModel model) {
    switch (model.type) {
      case TabType.textOnly:
        return SimpleTab(label: model.label);

      case TabType.iconOnly:
        return SimpleTab(icon: model.icon);

      case TabType.iconThenText:
        return SimpleTab(
          icon: model.icon,
          label: model.label,
          iconFirst: true,
          vertical: false,
          spacing: model.spacing,
        );

      case TabType.textThenIcon:
        return SimpleTab(
          icon: model.icon,
          label: model.label,
          iconFirst: false,
          vertical: false,
          spacing: model.spacing,
        );

      case TabType.iconTopText:
        return SimpleTab(
          icon: model.icon,
          label: model.label,
          iconFirst: true,
          vertical: true,
          spacing: model.spacing,
        );

      case TabType.lottie:
        return LottieTab(lottieAsset: model.lottieAsset, label: model.label);

      case TabType.image:
        if (model.image == null) {
          throw ArgumentError(
            'imageProvider must be provided for TabType.image',
          );
        }
        return ImageTab(
          imageProvider: model.image!,
          label: model.label,
          spacing: model.spacing,
        );

      case TabType.customShape:
        if (model.customShape == null) {
          throw ArgumentError(
            'customShape must be provided for TabType.customShape',
          );
        }
        return CustomShapeTab(
          label: model.label,
          customShape: model.customShape!,
          spacing: model.spacing,
        );

      case TabType.custom:
        if (model.customWidget == null) {
          throw ArgumentError(
            'customWidget must be provided for TabType.custom',
          );
        }
        return model.customWidget!;
    }
  }
}
