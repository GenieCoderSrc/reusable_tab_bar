import 'package:flutter/widgets.dart';
import 'i_wrapper.dart';

class NoneWrapper implements IWrapper {
  const NoneWrapper();

  @override
  Widget wrap(Widget child) => child;
}
