import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reusable_tab_bar/data/enums/wrapper_type.dart';

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

/// Helper to build default wrappers based on [WrapperType].
class WidgetWrapperFactory {
  static IWrapper create(
    WrapperType type, {
    EdgeInsets padding = const EdgeInsets.all(8),
    EdgeInsets? margin,
    Color? backgroundColor,
    Color? borderColor,
    double borderRadius = 8,
    double elevation = 4,
    double blurX = 8,
    double blurY = 8,
    Color? shadowLightColor,
    Color? shadowDarkColor,
    Gradient? gradient,
  }) {
    switch (type) {
      case WrapperType.none:
        return const NoneWrapper();

      case WrapperType.padded:
        return PaddedWrapper(padding: padding);

      case WrapperType.card:
        return CardWrapper(
          margin: margin,
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          elevation: elevation,
          padding: padding,
        );

      case WrapperType.outlinedContainer:
        return OutlinedContainerWrapper(
          margin: margin,
          padding: padding,
          borderColor: borderColor,
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
        );

      case WrapperType.blurred:
        return BlurredWrapper(
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          blurX: blurX,
          blurY: blurY,
        );

      case WrapperType.neuMorphic:
        return NeuMorphicWrapper(
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          shadowLightColor: shadowLightColor,
          shadowDarkColor: shadowDarkColor,
        );

      case WrapperType.gradient:
        return GradientWrapper(
          margin: margin,
          padding: padding,
          borderRadius: borderRadius,
          gradient: gradient,
        );

      case WrapperType.glassMorphic:
        return GlassMorphicWrapper(
          margin: margin,
          padding: padding,
          borderRadius: borderRadius,
        );

      case WrapperType.segmented:
        return SegmentedWrapper(
          margin: margin,
          padding: padding,
          borderRadius: borderRadius,
        );
    }
  }
}
