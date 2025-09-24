import 'package:flutter/material.dart';

abstract class TabBarStyleStrategy {
  Widget build({
    required List<Widget> tabs,
    TabController? controller,
    Color? indicatorColor,
    Color? backgroundColor,
    double? borderRadius,
    EdgeInsets? padding,
    double? elevation,
    Color? labelColor,
    Color? unselectedLabelColor,
    Decoration? indicatorDecoration, // NEW
  });
}

// abstract class TabBarStyleStrategy {
//   Widget build({
//     required TabController controller,
//     required List<Widget> tabs,
//     required Color indicatorColor,
//     required Color backgroundColor,
//     required double borderRadius,
//     required EdgeInsets padding,
//     double elevation,
//     Color? labelColor,
//     Color? unselectedLabelColor,
//   });
// }
