// import 'package:flutter/material.dart';
//
// import 'base_tab.dart';
//
// class CustomShapeTab extends BaseTab {
//   final Widget? child;
//   final double borderRadius;
//   final Color? borderColor;
//   final double borderWidth;
//   final BoxShadow? boxShadow;
//   final TextStyle? textStyle;
//   final double spacing;
//   final bool vertical;
//
//   const CustomShapeTab({
//     super.key,
//     super.label,
//     super.wrapperType,
//     super.customWrapperBuilder,
//     super.padding,
//     super.margin,
//     super.backgroundColor,
//     this.child,
//     this.borderRadius = 8,
//     this.borderColor = Colors.transparent,
//     this.borderWidth = 1,
//     this.boxShadow,
//     this.textStyle,
//     this.spacing = 4,
//     this.vertical = true,
//   });
//
//   @override
//   Widget buildContent(BuildContext context) {
//     final container = Container(
//       padding: padding,
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(borderRadius),
//         border: Border.all(
//           color: borderColor ?? Colors.transparent,
//           width: borderWidth,
//         ),
//         boxShadow: boxShadow != null ? [boxShadow!] : null,
//       ),
//       child: child ?? (label != null ? Text(label!, style: textStyle) : null),
//     );
//
//     return vertical
//         ? Column(mainAxisSize: MainAxisSize.min, children: [container])
//         : Row(mainAxisSize: MainAxisSize.min, children: [container]);
//   }
// }
//
// // class CustomShapeTab extends BaseTab {
// //   final CustomShapeTabModel customShape;
// //   final double spacing;
// //   final bool vertical;
// //
// //   const CustomShapeTab({
// //     super.key,
// //     super.label,
// //     super.wrapperType,
// //     super.customWrapperBuilder,
// //     super.padding,
// //     super.backgroundColor,
// //     required this.customShape,
// //     this.spacing = 4,
// //     this.vertical = true,
// //   });
// //
// //   @override
// //   Widget buildContent(BuildContext context) {
// //     final container = Container(
// //       padding: customShape.padding,
// //       decoration: BoxDecoration(
// //         color: customShape.backgroundColor,
// //         borderRadius: BorderRadius.circular(customShape.borderRadius),
// //         border: Border.all(
// //           color: customShape.borderColor,
// //           width: customShape.borderWidth,
// //         ),
// //         boxShadow: customShape.boxShadow != null
// //             ? [customShape.boxShadow!]
// //             : null,
// //       ),
// //       child:
// //           customShape.child ??
// //           (label != null ? Text(label!, style: customShape.textStyle) : null),
// //     );
// //
// //     final children = <Widget>[container];
// //
// //     return vertical
// //         ? Column(
// //             mainAxisSize: MainAxisSize.min,
// //             spacing: spacing,
// //             children: children,
// //           )
// //         : Row(
// //             mainAxisSize: MainAxisSize.min,
// //             spacing: spacing,
// //             children: children,
// //           );
// //   }
// // }
