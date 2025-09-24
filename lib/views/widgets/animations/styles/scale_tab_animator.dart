import 'package:flutter/material.dart';

class ScaleTabAnimator extends StatelessWidget {
  final Widget child;
  final bool selected;
  final Duration duration;
  final double scaleFactor;
  final Curve curve;

  const ScaleTabAnimator({
    super.key,
    required this.child,
    required this.selected,
    this.duration = const Duration(milliseconds: 250),
    this.scaleFactor = 1.1,
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: selected ? scaleFactor : 1.0,
      duration: duration,
      curve: curve,
      child: child,
    );
  }
}
