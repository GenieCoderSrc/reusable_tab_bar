import 'package:flutter/material.dart';
import 'i_tab_animator.dart';

import 'package:flutter/material.dart';

class FadeTabAnimator extends StatelessWidget {
  final Widget child;
  final bool selected;
  final Duration duration;
  final double unselectedOpacity;
  final Curve curve;

  const FadeTabAnimator({
    super.key,
    required this.child,
    required this.selected,
    this.duration = const Duration(milliseconds: 250),
    this.unselectedOpacity = 0.7,
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: duration,
      opacity: selected ? 1.0 : unselectedOpacity,
      curve: curve,
      child: child,
    );
  }
}

