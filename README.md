# Reusable Tab Bar

A flexible, customizable Flutter widget package that makes it easy to build advanced `TabBar` interfaces with `Bloc`, `Cubit`, and `ChangeNotifier` support.

## Features

- Easily create tabbed interfaces with custom tab headers and tab screens.
- Built-in support for `ChangeNotifier` and `Bloc/Cubit` state management.
- Customize `AppBar` titles, colors, heights, and actions.
- Add floating action buttons (FABs) specific to each tab.
- Support for `Drawer` and extra `bottom widgets` below tabs.
- Lightweight and efficient tab state management with automatic index tracking.

## Getting Started

### Installation

Add to your `pubspec.yaml`:

```yaml
reusable_tab_bar: latest
```

Then run:

```bash
flutter pub get
```

### Usage

```dart
import 'package:reusable_tab_bar/reusable_tab_bar.dart';

// Inside your widget tree
AppTabBar(
  tabScreens: [
    ScreenOne(),
    ScreenTwo(),
    ScreenThree(),
  ],
  tabHeaders: [
    Tab(text: 'One'),
    Tab(text: 'Two'),
    Tab(text: 'Three'),
  ],
  titleTxt: 'My Tabbed App',
  centerTitle: true,
  drawer: MyDrawer(),
  fabButtons: [
    FloatingActionButton(onPressed: () {}),
    FloatingActionButton(onPressed: () {}),
    FloatingActionButton(onPressed: () {}),
  ],
)
```

Or use with a selector-style button header:

```dart
AppTabBarWithSelectorButton(
  tabBarViews: [
    ScreenOne(),
    ScreenTwo(),
    ScreenThree(),
  ],
  selectorButtons: [
    ElevatedButton(onPressed: () {}, child: Text('One')),
    ElevatedButton(onPressed: () {}, child: Text('Two')),
    ElevatedButton(onPressed: () {}, child: Text('Three')),
  ],
)
```

### State Management

- `TapBarProvider` (with `ChangeNotifier`) for basic reactive tab changes.
- `TabBarCubit` and `TabBarState` (with `Bloc`) for more advanced state handling.

Tab changes automatically sync with UI elements using these providers.

## Customization Options

| Property | Description |
|:---------|:------------|
| `tabScreens` | List of widgets for each tab's content |
| `tabHeaders` | List of widgets for each tab's header |
| `fabButtons` | Floating action buttons specific to each tab |
| `titleTxt`, `titleWidget` | Title for the AppBar |
| `centerTitle` | Center the title text |
| `backgroundColor` | Background color of AppBar |
| `indicatorColor`, `indicatorWeight` | Tab indicator customization |
| `selectedLabelColor`, `unselectedLabelColor` | Label color customization |
| `drawer` | Add a navigation drawer |
| `actionsList` | Add AppBar actions |
| `bottomWidget`, `bottomTitleTxt` | Optional bottom widgets below tabs |

## Example

For a complete example, check the `/example` folder.

## Roadmap
- [ ] Dark mode support.
- [ ] More animation options.
- [ ] Custom tab controller injection.

## Contributing

Contributions are welcome! Please open issues or submit pull requests.

## License

[MIT License](LICENSE)

---

