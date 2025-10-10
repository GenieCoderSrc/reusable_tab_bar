import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_type.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/image_tab_item_model.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/lottie_tab_item_model.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/simple_tab_model.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/tab_item_model.dart';
import 'package:reusable_tab_bar/data/models/wrapper_model.dart';
import 'package:reusable_tab_bar/views/widgets/tabs/styles/image_tab.dart';
import 'package:reusable_tab_bar/views/widgets/tabs/styles/lottie_tab.dart';
import 'package:reusable_tab_bar/views/widgets/tabs/styles/simple_tab.dart';

// file: tab_factory.dart
class TabFactory {
  const TabFactory._(); // prevent instantiation

  static Widget create(
    TabItemModel model, {
    final TabType? tabType,
    final bool? rotate,
    final int? rotateTurns,
    final WrapperModel? wrapperModel,
  }) {
    if (model is SimpleTabModel) {
      return SimpleTab(
        icon: model.icon,
        label: model.label,
        spacing: model.spacing,
        height:
            model.height ??
            ((model.tabType ?? tabType) == TabType.iconTopText ? 80 : null),
        iconFirst: (model.tabType ?? tabType) != TabType.textThenIcon,
        vertical: (model.tabType ?? tabType) == TabType.iconTopText,
        wrapperModel: wrapperModel,
        rotate: rotate,
        rotateTurns: rotateTurns,
      );
    } else if (model is LottieTabItemModel) {
      return LottieTab(
        lottieAsset: model.lottieAsset,
        lottieUrl: model.lottieUrl,
        label: model.label,
        wrapperModel: wrapperModel,
        rotate: rotate,
        rotateTurns: rotateTurns,
      );
    } else if (model is ImageTabItemModel) {
      if (model.image == null && model.imagePath == null) {
        throw ArgumentError(
          'Either image or imagePath must be provided for TabType.image',
        );
      }
      return ImageTab(
        imageProvider: model.image,
        imagePath: model.imagePath,
        label: model.label,
        spacing: model.spacing,
        wrapperModel: wrapperModel,
        rotate: rotate,
        rotateTurns: rotateTurns,
      );
    }

    return Tab(text: model.label);
  }
}

// class TabFactory {
//   const TabFactory._(); // prevent instantiation
//
//   static Widget create(TabItemModel model) {
//     switch (model.type) {
//       case TabType.lottie:
//         final lottieModel = model as LottieTabItemModel;
//         return LottieTab(
//           lottieAsset: lottieModel.lottieAsset,
//           lottieUrl: lottieModel.lottieUrl,
//           label: lottieModel.label,
//         );
//
//       case TabType.image:
//         final imageModel = model as ImageTabItemModel;
//         if (imageModel.image == null && imageModel.imagePath == null) {
//           throw ArgumentError(
//             'Either image or imagePath must be provided for TabType.image',
//           );
//         }
//         return ImageTab(
//           imageProvider: imageModel.image,
//           imagePath: imageModel.imagePath,
//           label: imageModel.label,
//           spacing: imageModel.spacing,
//         );
//
//       case TabType.textOnly:
//       case TabType.iconOnly:
//       case TabType.iconThenText:
//       case TabType.textThenIcon:
//       case TabType.iconTopText:
//         final iconModel = model as IconTabItemModel;
//         return SimpleTab(
//           icon: iconModel.icon,
//           label: iconModel.label,
//           iconFirst: _getIconFirst(iconModel.type),
//           vertical: _isVertical(iconModel.type),
//           spacing: iconModel.spacing,
//         );
//
//       // case TabType.custom:
//       //   if (model is! WrapperModel || wrapperModel == null) {
//       //     throw ArgumentError(
//       //       'customWidget must be provided for TabType.custom',
//       //     );
//       //   }
//       //   return model.customWidget!;
//     }
//   }
//
//   // helpers to determine layout
//   static bool _getIconFirst(TabType type) {
//     return type == TabType.iconThenText || type == TabType.iconTopText;
//   }
//
//   static bool _isVertical(TabType type) {
//     return type == TabType.iconTopText;
//   }
// }

// class TabFactory {
//   const TabFactory._(); // prevent instantiation
//
//   static Widget create(TabItemModel model) {
//     switch (model.type) {
//       case TabType.textOnly:
//         return SimpleTab(label: model.label);
//
//       case TabType.iconOnly:
//         return SimpleTab(icon: model.icon);
//
//       case TabType.iconThenText:
//         return SimpleTab(
//           icon: model.icon,
//           label: model.label,
//           iconFirst: true,
//           vertical: false,
//           spacing: model.spacing,
//         );
//
//       case TabType.textThenIcon:
//         return SimpleTab(
//           icon: model.icon,
//           label: model.label,
//           iconFirst: false,
//           vertical: false,
//           spacing: model.spacing,
//         );
//
//       case TabType.iconTopText:
//         return SimpleTab(
//           icon: model.icon,
//           label: model.label,
//           iconFirst: true,
//           vertical: true,
//           spacing: model.spacing,
//         );
//
//       case TabType.lottie:
//         return LottieTab(lottieAsset: model.lottieAsset, label: model.label);
//
//       case TabType.image:
//         if (model.image == null) {
//           throw ArgumentError(
//             'imageProvider must be provided for TabType.image',
//           );
//         }
//         return ImageTab(
//           imageProvider: model.image!,
//           label: model.label,
//           spacing: model.spacing,
//         );
//
//       // case TabType.customShape:
//       //   if (model.customShape == null) {
//       //     throw ArgumentError(
//       //       'customShape must be provided for TabType.customShape',
//       //     );
//       //   }
//       //   return CustomShapeTab(
//       //     label: model.label,
//       //     customShape: model.customShape!,
//       //     spacing: model.spacing,
//       //   );
//
//       case TabType.custom:
//         if (model.customWidget == null) {
//           throw ArgumentError(
//             'customWidget must be provided for TabType.custom',
//           );
//         }
//         return model.customWidget!;
//     }
//   }
// }

// class TabFactory {
//   const TabFactory._(); // prevent instantiation
//
//   static Widget create({
//     TabType tabType = TabType.iconThenText,
//     String? label,
//     IconData? icon,
//     double spacing = 4,
//     String? lottieAsset,
//     ImageProvider? image,
//     bool? iconFirst,
//     bool? vertical,
//     double? height,
//     WrapperType? wrapperType,
//     Widget? customWidget,
//   }) {
//     switch (tabType) {
//       case TabType.textOnly:
//         return SimpleTab(label: label, wrapperType: wrapperType);
//
//       case TabType.iconOnly:
//         return SimpleTab(icon: icon, wrapperType: wrapperType);
//
//       case TabType.iconThenText:
//         return SimpleTab(
//           icon: icon,
//           label: label,
//           iconFirst: true,
//           vertical: vertical ?? false,
//           spacing: spacing,
//           wrapperType: wrapperType,
//         );
//
//       case TabType.textThenIcon:
//         return SimpleTab(
//           icon: icon,
//           label: label,
//           iconFirst: false,
//           vertical: vertical ?? false,
//           spacing: spacing,
//           wrapperType: wrapperType,
//         );
//
//       case TabType.iconTopText:
//         return SimpleTab(
//           icon: icon,
//           label: label,
//           iconFirst: true,
//           vertical: true,
//           spacing: spacing,
//           wrapperType: wrapperType,
//           height: height ?? 50,
//           padding: p,
//         );
//
//       case TabType.lottie:
//         if (lottieAsset == null) {
//           throw ArgumentError(
//             'lottieAsset must be provided for TabType.lottie',
//           );
//         }
//         return LottieTab(
//           lottieAsset: lottieAsset,
//           label: label,
//           wrapperType: wrapperType,
//           height: height ?? 80,
//         );
//
//       case TabType.image:
//         if (image == null) {
//           throw ArgumentError('image must be provided for TabType.image');
//         }
//         return ImageTab(
//           imageProvider: image,
//           label: label,
//           spacing: spacing,
//           wrapperType: wrapperType,
//           height: height,
//         );
//
//       case TabType.custom:
//         if (customWidget == null) {
//           throw ArgumentError(
//             'customWidget must be provided for TabType.custom',
//           );
//         }
//         return customWidget;
//     }
//   }
// }
