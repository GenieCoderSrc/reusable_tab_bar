import 'package:flutter/widgets.dart';
import 'package:reusable_tab_bar/data/enums/wrapper_type.dart';
import 'package:reusable_tab_bar/data/models/wrapper_model.dart';
import 'package:reusable_tab_bar/views/widgets/animations/utils/selected_widget_wrapper_mixin.dart';

abstract class ITabAnimator extends StatelessWidget with WidgetWrapperMixin {
  @override
  final bool selected;

  @override
  final Widget child;

  @override
  final WrapperType? selectedWrapperType;
  @override
  final WrapperModel? selectedWrapperModel;

  @override
  final WrapperType? unselectedWrapperType;
  @override
  final WrapperModel? unselectedWrapperModel;

  const ITabAnimator({
    super.key,
    required this.selected,
    required this.child,
    this.selectedWrapperType,
    this.selectedWrapperModel,
    this.unselectedWrapperType,
    this.unselectedWrapperModel,
  });
}
