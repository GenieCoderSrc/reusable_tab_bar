import 'package:flutter/widgets.dart';
import 'i_wrapper.dart';

class PaddedWrapper implements IWrapper {
  final EdgeInsets padding;

  const PaddedWrapper({this.padding = const EdgeInsets.all(8)});

  @override
  Widget wrap(Widget child) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
