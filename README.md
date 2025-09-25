# reusable_tab_bar

A Flutter package for building highly customizable, animated, and reusable tab bars. Supports multiple indicator types, animations, and wrapper styles for tab items.

## Features

* Multiple indicator types: underline, gradient, rounded, dot, bubble, rectangle, topLine, customPainter, custom.
* Flexible animations: fade, scale, slide, bounceSimple, bounceAdvanced.
* Wrapper support for both selected and unselected states.
* Supports Lottie, Image, and simple text/icon tabs.
* Customizable padding, colors, and animation curves.
* Easy integration with `TabController`.

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  reusable_tab_bar: <letest_version>
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/reusable_tab_bar.dart';

class MyTabBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 3, vsync: ScaffoldState());

    final tabs = [
      Tab(text: 'Home'),
      Tab(text: 'Search'),
      Tab(text: 'Profile'),
    ];

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          tabs: TabBuilder.build(
            controller: tabController,
            customTabs: tabs,
            animation: TabAnimationModel(
              animationType: AnimationType.scale,
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(child: Text('Home')),
          Center(child: Text('Search')),
          Center(child: Text('Profile')),
        ],
      ),
    );
  }
}
```

### Using Indicators

```dart
TabBar(
  controller: tabController,
  indicator: TabIndicatorFactory.build(
    type: IndicatorType.rounded,
    color: Colors.blue,
    borderRadius: 12,
  ),
  tabs: tabs,
)
```

### Animations

```dart
final animation = TabAnimationModel(
  animationType: AnimationType.bounceAdvanced,
  duration: Duration(milliseconds: 300),
  scaleFactor: 1.2,
);

TabBuilder.build(
  controller: tabController,
  customTabs: tabs,
  animation: animation,
);
```

### Wrappers

You can wrap your tabs with custom styles using `WrapperType` and `WrapperModel`:

```dart
TabBuilder.build(
  controller: tabController,
  tabItems: myTabItems,
  wrapperType: WrapperType.shadow,
  wrapperModel: WrapperModel(
    borderRadius: 8,
    shadowColor: Colors.black26,
  ),
  animation: animation,
);
```

## Enums

* `IndicatorType`: none, underline, gradient, rounded, dot, bubble, rectangle, topLine, customPainter, custom.
* `AnimationType`: fade, scale, slide, bounceSimple, bounceAdvanced, all, none.

## Models

* `TabAnimationModel`: Configure animations including type, duration, scaleFactor, colors, padding, curves, and wrapper support.
* `WrapperModel`: Customizes wrapper appearance.

## Animators

* `BounceTabAnimator` - Bouncy scaling animation.
* `FadeTabAnimator` - Fade in/out animation.
* `ScaleTabAnimator` - Scale selected tab.
* `SlideTabAnimator` - Slide tab up/down.
* `TabAnimator` - General purpose animated tab.

## Factories

* `TabAnimatorFactory` - Returns the correct tab animator based on `TabAnimationModel`.
* `TabAnimatedBuilder` - Builds a list of animated tabs.
* `TabIndicatorFactory` - Builds `Decoration` for Tab indicators.
* `TabBuilder` - Builds tabs with optional animation and wrapper.
* `TabFactory` - Creates tab widgets from `TabItemModel`.

**Note:** All animations respect selected/unselected wrappers and can be combined with custom styles and indicators for a fully flexible tab bar solution.

Made with ❤️ using SOLID principles and composable widgets for clean and maintainable UI components.

## License

© MIT License. Developed with ❤️ by [Shohidul Islam](https://github.com/ShohidulProgrammer)
