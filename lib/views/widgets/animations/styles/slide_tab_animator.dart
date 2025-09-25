import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'i_tab_animator.dart';

class SlideTabAnimator extends ITabAnimator {
  final Duration duration;
  final Offset selectedOffset;
  final Offset unselectedOffset;
  final Curve? curve;

  const SlideTabAnimator({
    super.key,
    required super.child,
    required super.selected,
    super.selectedWrapperType,
    super.selectedWrapperModel,
    super.unselectedWrapperType,
    super.unselectedWrapperModel,
    this.duration = const Duration(milliseconds: 250),
    this.selectedOffset = Offset.zero,
    this.unselectedOffset = const Offset(0, 0.1),
    this.curve,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: duration,
      curve: curve ?? Curves.easeInOut,
      offset: selected ? selectedOffset : unselectedOffset,
      child: buildWrapperChild(), // ✅ wrapper applied depending on state
    );
  }
}
