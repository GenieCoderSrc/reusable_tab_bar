# Reusable Tab Bar

**Reusable Tab Bar** is a production-ready Flutter package that provides highly customizable and flexible tab bar screens with multiple layouts, animation support, and per-tab FABs. It follows **SOLID principles**, **DRY**, and **composition over inheritance**, enabling developers to create consistent, responsive, and animated tab bars in their Flutter apps.

## Features

* Supports multiple layouts: `standard`, `sliver`, `bottom`, `side`, `modal`
* Animated tab transitions (scale, underline, text style)
* Per-tab FAB support
* Custom tab types: text, icon, icon + text, Lottie, image, custom shapes, arbitrary widgets
* Fully styled `StyledTabBar` with visual styles (`filled`, `outlined`, `blurred`, `elevated`, etc.)
* Wrapper support for additional card, padding, alignment, or decorations around tabs
* Accessibility and semantics support for screen readers
* Responsive design for phones and tablets
* Uses Cubit (`TabBarCubit`) for tab index state management

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  reusable_tab_bar:
    git:
      url: https://github.com/GenieCoderSrc/reusable_tab_bar
```

## Usage

### Standard Tab Bar

```dart
ReusableTabBarScreen(
  layout: TabBarLayout.standard,
  tabItems: [
    TabItemModel(label: 'Home', icon: Icons.home),
    TabItemModel(label: 'Profile', icon: Icons.person),
  ],
  pages: [HomePage(), ProfilePage()],
  fabButtons: [
    FloatingActionButton(onPressed: () {}),
    FloatingActionButton(onPressed: () {}),
  ],
  visualStyle: TabBarVisualStyle.filled,
);
```

### Sliver Tab Bar

```dart
ReusableTabBarScreen(
  layout: TabBarLayout.sliver,
  sliverType: SliverTabBarType.floating,
  tabItems: tabItems,
  pages: pages,
);
```

### Bottom / Side / Modal Tabs

All layouts use the same `ReusableTabBarScreen` API. Just change `layout` to the desired `TabBarLayout` value.

## Custom Tabs

```dart
TabItemModel(
  type: TabType.lottie,
  lottieAsset: 'assets/animations/tab_animation.json',
  label: 'Animated',
);
```

## Tab Animations

Animated tabs scale icons and change text style when selected. This is handled automatically via `AnimatedTabWrapper`.

## Wrappers

You can wrap the tab bar with a card or custom decoration:

```dart
ReusableTabBarScreen(
  tabBarUseCard: true,
  tabBarCardColor: Colors.white,
  tabBarCardElevation: 4,
  tabBarCardShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);
```

## State Management

`TabBarCubit` handles the currently selected tab index. You can provide your own Cubit instance if needed:

```dart
final myCubit = TabBarCubit();

ReusableTabBarScreen(
  tabBarCubit: myCubit,
);
```
Made with ❤️ using SOLID principles and composable widgets for clean and maintainable UI components.

## License

© MIT License. Developed with ❤️ by [Shohidul Islam](https://github.com/ShohidulProgrammer)
