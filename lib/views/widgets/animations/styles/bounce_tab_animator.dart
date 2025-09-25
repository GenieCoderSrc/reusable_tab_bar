import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reusable_tab_bar/data/enums/wrapper_type.dart';
import 'package:reusable_tab_bar/data/models/wrapper_model.dart';
import 'package:reusable_tab_bar/views/widgets/animations/utils/selected_widget_wrapper_mixin.dart';

class BounceTabAnimator extends StatefulWidget with WidgetWrapperMixin {
  @override
  final Widget child;
  @override
  final bool selected;

  @override
  final WrapperType? selectedWrapperType;
  @override
  final WrapperModel? selectedWrapperModel;

  @override
  final WrapperType? unselectedWrapperType;
  @override
  final WrapperModel? unselectedWrapperModel;

  final Duration duration;
  final double scaleFactor;
  final Curve? curve;

  const BounceTabAnimator({
    super.key,
    required this.child,
    required this.selected,
    this.scaleFactor = 1.2,
    this.duration = const Duration(milliseconds: 300),
    this.selectedWrapperType,
    this.selectedWrapperModel,
    this.unselectedWrapperType,
    this.unselectedWrapperModel,
    this.curve,
  });

  @override
  State<BounceTabAnimator> createState() => _BounceTabAnimatorState();
}

class _BounceTabAnimatorState extends State<BounceTabAnimator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _animation = Tween<double>(begin: 1.0, end: widget.scaleFactor).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve ?? Curves.elasticOut,
      ),
    );

    if (widget.selected) _controller.forward();
  }

  @override
  void didUpdateWidget(covariant BounceTabAnimator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selected != oldWidget.selected) {
      widget.selected ? _controller.forward(from: 0.0) : _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.buildWrapperChild(), // ✅ uses selected/unselected wrapper
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
