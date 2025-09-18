import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'base_tab.dart';

class LottieTab extends BaseTab {
  final String? lottieAsset;
  final double size;
  final double spacing;
  final bool vertical;

  const LottieTab({
    super.key,
    super.label,
    required this.lottieAsset,
    this.size = 36,
    this.spacing = 6,
    this.vertical = true,
  });

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      if (lottieAsset != null)
        Lottie.asset(lottieAsset!, width: size, height: size),
      if (label != null) Text(label!),
    ];

    return Tab(
      child: vertical
          ? Column(
              mainAxisSize: MainAxisSize.min,
              spacing: spacing,
              children: children,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              spacing: spacing,
              children: children,
            ),
    );
  }
}
