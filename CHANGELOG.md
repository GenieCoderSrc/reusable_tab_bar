# Changelog

All notable changes to this project will be documented in this file.



## 0.0.4

### Sep 25, 2025

### ✨ Implemented

* Support for multiple indicator types: `none`, `underline`, `gradient`, `rounded`, `dot`, `bubble`, `rectangle`, `topLine`, `customPainter`, `custom`.
* Tab animation models: `TabAnimationModel` with configurable animation types, scale, colors, padding, curves, and wrappers.
* Built-in animators: `BounceTabAnimator`, `FadeTabAnimator`, `ScaleTabAnimator`, `SlideTabAnimator`, `TabAnimator`.
* Factories: `TabAnimatorFactory`, `TabAnimatedBuilder`, `TabIndicatorFactory`, `TabBuilder`, `TabFactory`.
* Wrapper support via `WidgetWrapperMixin`.
* Example included demonstrating usage with `TabBar` and `TabBarView`.




## 0.0.3

### Sep 19, 2025

### ✨ Implemented
* Implemented `StandardTabBarScreen` with fully customizable tabs and FABs.
* Implemented `ComposableTabBarWrapper` for optional card/decoration around the tab bar.
* Added `SliverTabBarScreen`, `BottomTabBarScreen`, `SideTabBarScreen`, `ModalTabBarScreen` for reusable tab layouts.
* Added `TabFABSwitcher` for per-tab FAB handling.
* Added accessibility support and responsive design considerations.
* Created `AnimatedTabWrapper` for animated tab transitions.
* Introduced `TabBarVisualStyle` enum and `IndicatorModel` for styling.
* Integrated Cubit state management with `TabBarCubit` for tab index tracking.
* Provided full documentation, README, and example file for usage.



## 0.0.2

### Aug 22, 2025

### ✨ Updated

- Removed `app_style` dependency.
- Removed `flutter_lints` dependency.
- Updated Dart sdk to 3.9.0

## 0.0.1

- Initial release of `reusable_tab_bar`.
- Provides:
    - `TapBarProvider` for managing tab selection with `ChangeNotifier`.
    - `TabBarCubit` and `TabBarState` for managing tab selection using `Bloc`.
    - `AppTabBar` widget for creating customizable TabBar layouts.
    - `AppTabBarWithSelectorButton` widget for custom tab navigation using external selector buttons.
- Supports features like:
    - Custom app bars, floating action buttons, drawers.
    - Dynamic tab selection and state management.
    - Full flexibility for styling and behavior control.
