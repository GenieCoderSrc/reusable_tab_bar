import 'package:flutter/widgets.dart';

abstract class ITabAnimator extends StatelessWidget {
  final bool selected;
  final Widget child;

  const ITabAnimator({
    super.key,
    required this.selected,
    required this.child,
  });
}
