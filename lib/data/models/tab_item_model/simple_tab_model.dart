import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_type.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/tab_item_model.dart';

class SimpleTabModel extends TabItemModel {
  final String? label;
  final IconData? icon;
  final TabType tabType;

  const SimpleTabModel({
    this.icon,
    this.label,
    this.tabType = TabType.iconThenText,
    super.wrapperType,
    super.wrapperModel,
    super.spacing = 4,
    super.height,
  });
}
