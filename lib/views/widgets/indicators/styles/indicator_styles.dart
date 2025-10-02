// import 'package:flutter/material.dart';
// import 'package:reusable_tab_bar/data/enums/tab_indicator_type.dart';
// import 'package:reusable_tab_bar/data/models/indicator_model.dart';
//
// abstract class IndicatorDecorations {
//   // ✅ Public helper methods for reuse
//   static Decoration box(IndicatorModel indicator) {
//     // Use the provided radius if set, otherwise choose a default per type
//     final double radius =
//         indicator.radius ?? _defaultRadiusForType(indicator.type);
//
//     return BoxDecoration(
//       color: indicator.color,
//       gradient: indicator.gradient,
//       borderRadius: indicator.shape == BoxShape.rectangle
//           ? BorderRadius.circular(radius)
//           : null,
//       shape: indicator.shape ?? BoxShape.rectangle,
//     );
//   }
//
//   static Decoration line(IndicatorModel indicator) {
//     final double pad = indicator.verticalPadding ?? 0;
//     final insets = indicator.type == IndicatorType.topLine
//         ? EdgeInsets.only(top: pad)
//         : EdgeInsets.only(bottom: pad);
//
//     return UnderlineTabIndicator(
//       borderSide: BorderSide(
//         color: indicator.color ?? Colors.blue,
//         width: indicator.thickness ?? 2,
//       ),
//       borderRadius: BorderRadius.circular(indicator.radius ?? 0),
//       insets: insets,
//     );
//   }
//
//   /// Returns the default radius for each box-like type
//   static double _defaultRadiusForType(IndicatorType? type) {
//     switch (type) {
//       case IndicatorType.rectangle:
//         return 0.0;
//       case IndicatorType.dot:
//         return 4.0;
//       case IndicatorType.bubble:
//         return 16.0;
//       case IndicatorType.rounded:
//         return 8.0;
//       default:
//         return 8.0; // fallback for gradient or other types
//     }
//   }
// }
//
// /// Simple reusable building blocks for indicators
// // class IndicatorDecorations {
// //   /// Rounded container for bubble/rounded/dot/rectangle types
// //   static Decoration rounded({
// //     Color? color,
// //     double radius = 8,
// //     double? opacity,
// //   }) {
// //     return BoxDecoration(
// //       color: opacity != null ? color?.withValues(alpha: opacity) : color,
// //       borderRadius: BorderRadius.circular(radius),
// //     );
// //   }
// //
// //   /// Gradient container with optional border radius
// //   static Decoration gradient({Gradient? gradient, double radius = 16}) {
// //     return BoxDecoration(
// //       gradient:
// //           gradient ?? LinearGradient(colors: [Colors.blue, Colors.purple]),
// //       borderRadius: BorderRadius.circular(radius),
// //     );
// //   }
// //
// //   /// Underline style
// //   static Decoration underline({
// //     Color? color,
// //     double thickness = 2,
// //     double? borderRadius,
// //   }) {
// //     return UnderlineTabIndicator(
// //       borderSide: BorderSide(color: color ?? Colors.blue, width: thickness),
// //       borderRadius: BorderRadius.circular(borderRadius ?? 8),
// //     );
// //   }
// //
// //   /// Top line
// //   static Decoration topLine({
// //     Color? color,
// //     double thickness = 2,
// //     double verticalPadding = 0,
// //   }) {
// //     return UnderlineTabIndicator(
// //       borderSide: BorderSide(color: color ?? Colors.blue, width: thickness),
// //       insets: EdgeInsets.only(top: verticalPadding),
// //     );
// //   }
// // }
