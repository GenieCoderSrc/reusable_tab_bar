import 'package:flutter/widgets.dart';
import 'package:reusable_tab_bar/data/enums/wrapper_type.dart';
import 'package:reusable_tab_bar/data/models/wrapper_model.dart';
import 'package:reusable_tab_bar/views/widgets/widget_wrapper/widget_wrapper_factory.dart';

mixin WidgetWrapperMixin {
  bool get selected;

  Widget get child;

  WrapperModel? get selectedWrapperModel;

  WrapperModel? get unselectedWrapperModel;

  Widget buildWrapperChild() {
    final type = selected
        ? selectedWrapperModel?.wrapperType
        : unselectedWrapperModel?.wrapperType;

    final model = selected ? selectedWrapperModel : unselectedWrapperModel;

    if (type == null || type == WrapperType.none) {
      return child;
    }

    return WidgetWrapperFactory.create(
      model: model ?? const WrapperModel(),
    ).wrap(child);
  }
}
