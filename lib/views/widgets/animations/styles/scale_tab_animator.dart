import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'i_tab_animator.dart';

class ScaleTabAnimator extends ITabAnimator {
  final Duration duration;
  final double scaleFactor;
  final Curve? curve;

  const ScaleTabAnimator({
    super.key,
    required super.child,
    required super.selected,
    super.selectedWrapperType,
    super.selectedWrapperModel,
    super.unselectedWrapperType,
    super.unselectedWrapperModel,
    this.duration = const Duration(milliseconds: 250),
    this.scaleFactor = 1.1,
    this.curve,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: selected ? scaleFactor : 1.0,
      duration: duration,
      curve: curve ?? Curves.easeInOut,
      child: buildWrapperChild(), // ✅ uses selected/unselected wrapper
    );
  }
}
