import 'package:reusable_tab_bar/data/enums/tab_type.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/tab_item_model.dart';

class LottieTabItemModel extends TabItemModel {
  final String? lottieUrl;
  final String lottieAsset;

  const LottieTabItemModel({
    required this.lottieAsset,
    this.lottieUrl,
    super.spacing = 4,
    super.wrapperType,
    super.wrapperModel,
  });
}
