import 'package:flutter/material.dart';

class BounceTabAnimator extends StatefulWidget {
  final Widget child;
  final bool selected;
  final Duration duration;
  final double scaleFactor;

  const BounceTabAnimator({
    super.key,
    required this.child,
    required this.selected,
    this.duration = const Duration(milliseconds: 300),
    this.scaleFactor = 1.2,
  });

  @override
  State<BounceTabAnimator> createState() =>
      _BounceTabAnimatorState();
}

class _BounceTabAnimatorState extends State<BounceTabAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: widget.scaleFactor).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    if (widget.selected) _controller.forward();
  }

  @override
  void didUpdateWidget(covariant BounceTabAnimator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected != oldWidget.selected) {
      widget.selected
          ? _controller.forward(from: 0.0)
          : _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
