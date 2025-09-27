import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'i_tab_animator.dart';

class FadeTabAnimator extends ITabAnimator {
  final Duration duration;
  final double unselectedOpacity;
  final Curve? curve;

  const FadeTabAnimator({
    super.key,
    required super.child,
    required super.selected,
    super.selectedWrapperType,
    super.selectedWrapperModel,
    super.unselectedWrapperType,
    super.unselectedWrapperModel,
    this.duration = const Duration(milliseconds: 250),
    this.unselectedOpacity = 0.7,
    this.curve,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: duration,
      opacity: selected ? 1.0 : unselectedOpacity,
      curve: curve ?? Curves.easeInOut,
      child: buildWrapperChild(), // ✅ wrapper applied depending on state
    );
  }
}
