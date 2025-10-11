import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String imgSource;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Widget? placeholder;

  const ImageView({
    super.key,
    required this.imgSource,
    this.fit,
    this.width,
    this.height,
    this.borderRadius,
    this.placeholder,
  });

  bool get _isNetworkImage =>
      imgSource.startsWith('http://') || imgSource.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    final imageWidget = _isNetworkImage
        ? Image.network(
            imgSource,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, error, stackTrace) =>
                placeholder ?? const Icon(Icons.broken_image),
          )
        : Image.asset(
            imgSource,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, error, stackTrace) =>
                placeholder ?? const Icon(Icons.broken_image),
          );

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    return imageWidget;
  }
}
