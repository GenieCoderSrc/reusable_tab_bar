import 'package:reusable_tab_bar/data/enums/wrapper_type.dart';
import 'package:reusable_tab_bar/data/models/wrapper_model.dart';

import 'blurred_wrapper.dart';
import 'card_wrapper.dart';
import 'glass_morphic_wrapper.dart';
import 'gradient_wrapper.dart';
import 'i_wrapper.dart';
import 'neu_morphic_wrapper.dart';
import 'none_wrapper.dart';
import 'outlined_container_wrapper.dart';
import 'padded_wrapper.dart';
import 'segmented_wrapper.dart';

class WidgetWrapperFactory {
  const WidgetWrapperFactory._();

  /// Create an [IWrapper] implementation using a single [WrapperModel].
  static IWrapper create(
    WrapperType type, {
    WrapperModel model = const WrapperModel(),
  }) {
    switch (type) {
      case WrapperType.none:
        return const NoneWrapper();

      case WrapperType.padded:
        return PaddedWrapper(padding: model.padding);

      case WrapperType.card:
        return CardWrapper(
          margin: model.margin,
          backgroundColor: model.backgroundColor,
          borderRadius: model.borderRadius,
          elevation: model.elevation,
          padding: model.padding,
        );

      case WrapperType.outlinedContainer:
        return OutlinedContainerWrapper(
          margin: model.margin,
          padding: model.padding,
          borderColor: model.borderColor,
          backgroundColor: model.backgroundColor,
          borderRadius: model.borderRadius,
        );

      case WrapperType.blurred:
        return BlurredWrapper(
          margin: model.margin,
          padding: model.padding,
          backgroundColor: model.backgroundColor,
          borderRadius: model.borderRadius,
          blurX: model.blurX,
          blurY: model.blurY,
        );

      case WrapperType.neuMorphic:
        return NeuMorphicWrapper(
          margin: model.margin,
          padding: model.padding,
          backgroundColor: model.backgroundColor,
          borderRadius: model.borderRadius,
          shadowLightColor: model.shadowLightColor,
          shadowDarkColor: model.shadowDarkColor,
        );

      case WrapperType.gradient:
        return GradientWrapper(
          margin: model.margin,
          padding: model.padding,
          borderRadius: model.borderRadius,
          gradient: model.gradient,
        );

      case WrapperType.glassMorphic:
        return GlassMorphicWrapper(
          margin: model.margin,
          padding: model.padding,
          borderRadius: model.borderRadius,
        );

      case WrapperType.segmented:
        return SegmentedWrapper(
          margin: model.margin,
          padding: model.padding,
          borderRadius: model.borderRadius,
        );
    }
  }
}
