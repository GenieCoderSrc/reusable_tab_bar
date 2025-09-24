import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/simple_tab_model.dart';
import 'package:reusable_tab_bar/reusable_tab_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Tabs Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DemoScreen(),
    );
  }
}

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleTabBarScreen(
      // Pages displayed in the TabBarView
      pages: const [
        Center(child: Text('Dashboard')),
        Center(child: Text('Messages')),
        Center(child: Text('Settings')),
      ],

      // 👇 TabAppBar inside tabBarBuilder
      tabBarBuilder: (controller) {
        return TabAppBar(
          controller: controller,
          titleTxt: 'Animated TabBar Demo',
          centerTitle: true,

          // 👇 Add the animated tabs here
          tabBarBuilder: (controller) {
            // Build normal tabs first
            final tabs = TabBuilder.build(
              controller: controller,
              tabItems: const [
                SimpleTabModel(
                  tabType: TabType.iconThenText,
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                ),
                SimpleTabModel(
                  tabType: TabType.iconThenText,
                  icon: Icons.message,
                  label: 'Messages',
                ),
                SimpleTabModel(
                  tabType: TabType.iconThenText,
                  icon: Icons.settings,
                  label: 'Settings',
                ),
              ],
              animation: const TabAnimationModel(
                enabled: true,
                type: AnimationType.scale,
                scaleFactor: 1.2,
                selectedColor: Colors.blue,
                unselectedColor: Colors.grey,
              ),
            );

            return SimpleTabBar(
              controller: controller,
              isScrollable: true,
              indicator: TabIndicatorFactory.build(
                type: IndicatorType.rounded,
                color: Colors.blue,
                borderRadius: 12,
              ),
              tabs: tabs,
            );
          },
        );
      },

      fabButtons: [
        FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      ],
    );
  }
}
