import 'package:flutter/material.dart';
/// Builds an AppBar for a tab screen
typedef TabAppBarBuilder = PreferredSizeWidget? Function(
    BuildContext context,
    TabController controller,
    );

/// Builds a widget using context and TabController
typedef TabWidgetBuilder = Widget? Function(
    BuildContext context,
    TabController controller,
    );

/// Builds a widget using only TabController
typedef TabControllerBuilder = Widget Function(TabController controller);


