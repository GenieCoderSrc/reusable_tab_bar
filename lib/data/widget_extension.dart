// Helper extension for null safety
import 'package:flutter/material.dart';

extension WidgetExtension on Widget? {
  T? let<T>(T Function(Widget) transformation) {
    final widget = this;
    return widget == null ? null : transformation(widget);
  }
}
