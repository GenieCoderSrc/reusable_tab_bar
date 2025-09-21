import 'package:flutter/material.dart';

/// Builds an AppBar for a tab screen
typedef TabAppBarBuilder =
    PreferredSizeWidget? Function(TabController controller);

/// Builds a widget using only TabController
typedef TabWidgetBuilder = Widget Function(TabController controller);

/// Builds a widget using context and TabController
// typedef TabWidgetBuilder =
//     Widget? Function(BuildContext context, TabController controller);
