import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/models/indicator_model.dart';
import 'package:reusable_tab_bar/views/widgets/indicators/indicator_factory.dart';

Color resolveBackgroundColor({
  required Color? backgroundColor,
  required ThemeData theme,
}) {
  return backgroundColor ?? theme.colorScheme.surface;
}

Color resolveIndicatorColor({
  required Color? indicatorColor,
  required IndicatorModel? indicator,
  required ThemeData theme,
}) {
  if (indicatorColor != null) return indicatorColor;
  if (indicator != null && indicator.color != null) return indicator.color!;
  return theme.colorScheme.primary;
}

Color resolveLabelColor({
  required Color? labelColor,
  required ThemeData theme,
}) {
  return labelColor ??
      theme.tabBarTheme.labelColor ??
      theme.colorScheme.onPrimary;
}

Color resolveUnselectedLabelColor({
  required Color? unselectedLabelColor,
  required ThemeData theme,
}) {
  return unselectedLabelColor ??
      theme.tabBarTheme.unselectedLabelColor ??
      theme.colorScheme.onSurface;
}

Decoration resolveIndicator({
  required IndicatorModel? indicator,
  required Decoration? tabBarThemeIndicator,
  required Color indicatorColor,
  required double borderRadius,
}) {
  if (indicator != null) return IndicatorFactory.create(indicator);
  if (tabBarThemeIndicator != null) return tabBarThemeIndicator;

  return BoxDecoration(
    color: indicatorColor,
    borderRadius: BorderRadius.circular(borderRadius),
  );
}
