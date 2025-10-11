import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/tab_indicator_type.dart';
import 'package:reusable_tab_bar/data/models/indicator_model.dart';

import 'painters/custom_painter_decoration.dart';
import 'painters/point_tab_indicator.dart';

/// Factory that builds a Decoration for TabBar indicators based on [IndicatorModel].
class TabIndicatorFactory {
  const TabIndicatorFactory._(); // Prevent instantiation

  static Decoration? build(IndicatorModel model) {
    switch (model.type) {
      case TabIndicatorType.none:
        return null;

      case TabIndicatorType.underline:
        return UnderlineTabIndicator(
          borderSide: BorderSide(
            color: model.color ?? Colors.blue,
            width: model.thickness ?? 3.0,
          ),
          insets: model.padding ?? EdgeInsets.zero,
        );

      case TabIndicatorType.gradient:
        return BoxDecoration(
          gradient:
              model.gradient ??
              LinearGradient(
                colors: [
                  model.color ?? Colors.blue,
                  (model.color ?? Colors.blue).withAlpha((0.7 * 255).round()),
                ],
              ),
          borderRadius: BorderRadius.circular(model.radius ?? 0),
          shape: model.shape ?? BoxShape.rectangle,
        );

      case TabIndicatorType.rounded:
        return BoxDecoration(
          color: model.color ?? Colors.blue,
          borderRadius: BorderRadius.circular(model.radius ?? 8),
          shape: model.shape ?? BoxShape.rectangle,

        );

      case TabIndicatorType.dot:
        return CustomPainterDecoration(
          color: model.color ?? Colors.blue,
          size: model.thickness ?? 6.0,
          insets: model.padding,
          painterBuilder: (size, direction) => PointIndicatorPainter(
            color: model.color ?? Colors.blue,
            pointSize: model.thickness ?? 6.0,
            insets: model.padding ?? EdgeInsets.zero,
            position: model.position,
            textDirection: direction,
          ),
        );

      case TabIndicatorType.bubble:
        return BoxDecoration(
          color: (model.color ?? Colors.blue).withAlpha((0.3 * 255).round()),
          borderRadius: BorderRadius.circular(model.radius ?? 16),
          shape: model.shape ?? BoxShape.rectangle,
        );

      case TabIndicatorType.rectangle:
        return BoxDecoration(
          color: model.color ?? Colors.blue,
          borderRadius: BorderRadius.circular(model.radius ?? 0),
          shape: model.shape ?? BoxShape.rectangle,
        );

      case TabIndicatorType.topLine:
        return UnderlineTabIndicator(
          borderSide: BorderSide(
            color: model.color ?? Colors.blue,
            width: model.thickness ?? 3.0,
          ),
          insets: model.padding ?? EdgeInsets.zero,
        );

      case TabIndicatorType.customPainter:
        if (model.customPainterBuilder != null) {
          return CustomPainterDecoration(
            painterBuilder: model.customPainterBuilder!,
            insets: model.padding,
          );
        }
        return const UnderlineTabIndicator();

      case TabIndicatorType.custom:
        return model.customDecoration ?? const UnderlineTabIndicator();
    }
  }
}
