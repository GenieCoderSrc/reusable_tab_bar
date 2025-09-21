import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'base_tab.dart';

class LottieTab extends BaseTab {
  final String? lottieAsset;
  final String? lottieUrl;
  final double size;
  final double spacing;
  final bool vertical;

  const LottieTab({
    super.key,
    super.label,
    super.wrapperType,
    super.customWrapperBuilder,
    super.padding,
    super.backgroundColor,
    this.lottieAsset,
    this.lottieUrl,
    this.size = 36,
    this.spacing = 6,
    this.vertical = true,
  });

  @override
  Widget buildContent(BuildContext context) {
    final children = <Widget>[
      if (lottieAsset != null)
        Lottie.asset(lottieAsset!, width: size, height: size),
      if (lottieUrl != null)
        Lottie.network(
          lottieUrl!,
          width: size,
          height: size,
          animate: true,
          reverse: true,
        ),
      if (label != null) Text(label!),
    ];

    return vertical
        ? Column(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing,
            children: children,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            spacing: spacing,
            children: children,
          );
  }
}
