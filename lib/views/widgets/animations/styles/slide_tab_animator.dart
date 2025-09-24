import 'package:flutter/material.dart';
import 'i_tab_animator.dart';
import 'package:flutter/material.dart';

class SlideTabAnimator extends StatelessWidget {
  final Widget child;
  final bool selected;
  final Duration duration;
  final Offset selectedOffset;
  final Offset unselectedOffset;
  final Curve curve;

  const SlideTabAnimator({
    super.key,
    required this.child,
    required this.selected,
    this.duration = const Duration(milliseconds: 250),
    this.selectedOffset = Offset.zero,
    this.unselectedOffset = const Offset(0, 0.1),
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: duration,
      curve: curve,
      offset: selected ? selectedOffset : unselectedOffset,
      child: child,
    );
  }
}

