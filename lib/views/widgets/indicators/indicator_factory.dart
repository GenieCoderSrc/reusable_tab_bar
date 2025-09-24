// import 'package:flutter/material.dart';
// import 'package:reusable_tab_bar/data/enums/indicator_type.dart';
// import 'package:reusable_tab_bar/data/models/indicator_model.dart';
// import 'package:reusable_tab_bar/views/widgets/indicators/painters/custom_painter_decoration.dart';
// import 'package:reusable_tab_bar/views/widgets/indicators/styles/indicator_styles.dart';
//
// abstract class IndicatorFactory {
//   static Decoration create(IndicatorModel m) {
//     switch (m.type) {
//       case IndicatorType.bubble:
//       case IndicatorType.rectangle:
//       case IndicatorType.rounded:
//       case IndicatorType.gradient:
//         return IndicatorDecorations.box(m);
//
//       case IndicatorType.customPainter:
//         if (m.customPainterBuilder == null) {
//           throw ArgumentError('customPainterBuilder must be provided');
//         }
//         return CustomPainterDecoration(painterBuilder: m.customPainterBuilder!);
//
//       case IndicatorType.custom:
//         if (m.customDecoration == null) {
//           throw ArgumentError('customDecoration must be provided');
//         }
//         return m.customDecoration!;
//
//       case IndicatorType.underline:
//       case IndicatorType.topLine:
//       default:
//         return IndicatorDecorations.line(m);
//     }
//   }
// }
//
// // class IndicatorFactory {
// //   static Decoration create(IndicatorModel indicator) {
// //     switch (indicator.type) {
// //       case IndicatorType.rounded:
// //         return IndicatorDecorations.rounded(
// //           color: indicator.color ?? Colors.blue,
// //           radius: indicator.radius ?? 16,
// //         );
// //
// //       case IndicatorType.gradient:
// //         return IndicatorDecorations.gradient(
// //           gradient: indicator.gradient,
// //           radius: indicator.radius ?? 16,
// //         );
// //
// //       case IndicatorType.dot:
// //         return IndicatorDecorations.rounded(
// //           color: indicator.color ?? Colors.blue,
// //           radius: indicator.radius ?? 4,
// //         );
// //
// //       case IndicatorType.bubble:
// //         return IndicatorDecorations.rounded(
// //           color: indicator.color ?? Colors.blue.withValues(alpha: 0.2),
// //           radius: indicator.radius ?? 16,
// //         );
// //
// //       case IndicatorType.topLine:
// //         return IndicatorDecorations.topLine(
// //           color: indicator.color ?? Colors.blue,
// //           thickness: indicator.thickness ?? 2,
// //           verticalPadding: indicator.verticalPadding ?? 0,
// //         );
// //
// //       case IndicatorType.rectangle:
// //         return IndicatorDecorations.rounded(
// //           color: indicator.color ?? Colors.blue.withValues(alpha: 0.15),
// //           radius: indicator.radius ?? 4,
// //         );
// //
// //       case IndicatorType.customPainter:
// //         if (indicator.customPainterBuilder == null) {
// //           throw ArgumentError('customPainterBuilder must be provided');
// //         }
// //         return CustomPainterDecoration(
// //           painterBuilder: indicator.customPainterBuilder!,
// //         );
// //
// //       case IndicatorType.custom:
// //         if (indicator.customDecoration == null) {
// //           throw ArgumentError('customDecoration must be provided');
// //         }
// //         return indicator.customDecoration!;
// //
// //       case IndicatorType.underline:
// //       default:
// //         return IndicatorDecorations.underline(
// //           color: indicator.color,
// //           thickness: indicator.thickness ?? 2,
// //         );
// //     }
// //   }
// // }
