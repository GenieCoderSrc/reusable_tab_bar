/// Defines each tab’s visual/content properties.
// file: tab_item_model.dart
abstract class TabItemModel {
  final String? label;

  final double spacing;
  final double? height;

  const TabItemModel({this.label, this.spacing = 4, this.height});
}

// class TabItemModel {
//   final TabType type;
//   final String? label;
//   final IconData? icon;
//   final String? lottieAsset;
//   final String? lottieUrl;
//   final String? imagePath;
//   final ImageProvider? image;
//   final Widget? customWidget;
//   final WrapperType? wrapperType;
//   final WrapperModel? wrapperModel;
//   final double spacing;
//
//   const TabItemModel({
//     required this.type,
//     this.wrapperType,
//     this.label,
//     this.icon,
//     this.lottieAsset,
//     this.lottieUrl,
//     this.imagePath,
//     this.image,
//     this.customWidget,
//     this.wrapperModel,
//     this.spacing = 4,
//   });
// }
