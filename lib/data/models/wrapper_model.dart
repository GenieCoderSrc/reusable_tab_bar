import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/enums/wrapper_type.dart';

/// Holds style information for a custom-shaped tab.
/// Optional wrapper styling for the tab itself.
class WrapperModel extends Equatable {
  final WrapperType wrapperType;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double elevation;
  final double blurX;
  final double blurY;
  final Color? shadowLightColor;
  final Color? shadowDarkColor;
  final Gradient? gradient;

  final Widget Function(Widget child)? customWrapperBuilder;

  const WrapperModel({
    this.wrapperType = WrapperType.padded,
    this.padding = const EdgeInsets.all(8),
    this.margin,
    this.borderRadius = 8.0,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.elevation = 4.0,
    this.blurX = 8.0,
    this.blurY = 8.0,
    this.shadowLightColor,
    this.shadowDarkColor,
    this.gradient,
    this.customWrapperBuilder,
  });

  /// Enables easy state updates
  WrapperModel copyWith({
    WrapperType? wrapperType,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
    double? borderWidth,
    double? elevation,
    double? blurX,
    double? blurY,
    Color? shadowLightColor,
    Color? shadowDarkColor,
    Gradient? gradient,
  }) {
    return WrapperModel(
      wrapperType: wrapperType ?? this.wrapperType,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      elevation: elevation ?? this.elevation,
      blurX: blurX ?? this.blurX,
      blurY: blurY ?? this.blurY,
      shadowLightColor: shadowLightColor ?? this.shadowLightColor,
      shadowDarkColor: shadowDarkColor ?? this.shadowDarkColor,
      gradient: gradient ?? this.gradient,
    );
  }

  @override
  List<Object?> get props => [
    wrapperType,
    padding,
    margin,
    borderRadius,
    backgroundColor,
    borderColor,
    borderWidth,
    elevation,
    blurX,
    blurY,
    shadowLightColor,
    shadowDarkColor,
    gradient,
  ];
}

// class WrapperModel {
//   final EdgeInsets? padding;
//   final double? borderRadius;
//   final Color? backgroundColor;
//   final Color? borderColor;
//   final double? borderWidth;
//   final TextStyle? textStyle;
//   final BoxShadow? boxShadow;
//   final Widget? child;
//
//   const WrapperModel({
//     this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//     this.borderRadius = 16.0,
//     this.backgroundColor,
//     this.borderColor,
//     this.borderWidth,
//     this.textStyle,
//     this.boxShadow,
//     this.child,
//   });
// }

// class WrapperModel {
//   final EdgeInsets? padding;
//   final double? borderRadius;
//   final Color? backgroundColor;
//   final Color? borderColor;
//   final double? borderWidth;
//   final TextStyle? textStyle;
//   final BoxShadow? boxShadow;
//   final Widget? child;
//
//   const WrapperModel({
//     this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//     this.borderRadius = 16.0,
//     this.backgroundColor,
//     this.borderColor,
//     this.borderWidth,
//     this.textStyle,
//     this.boxShadow,
//     this.child,
//   });
// }
