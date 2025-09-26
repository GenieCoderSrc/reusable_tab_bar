import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/simple_tab_model.dart';
import 'package:reusable_tab_bar/data/models/wrapper_model.dart';
import 'package:reusable_tab_bar/reusable_tab_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Side TabBar Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const DemoSideTabBarScreen(),
    );
  }
}

class DemoSideTabBarScreen extends StatelessWidget {
  const DemoSideTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SideTabBarScreen(
      pages: const [
        Center(child: Text('Home Page')),
        Center(child: Text('Profile Page')),
        Center(child: Text('Settings Page')),
        Center(child: Text('Dashboard Page')),
      ],

      // Side tab bar builder
      sideTabBarBuilder: (controller) {
        // Build tabs with TabBuilder
        final tabs = TabBuilder.build(
          controller: controller,
          tabType: TabType.iconTopText,
          rotate: true,
          // rotateTurns: 1,
          // wrapperType: WrapperType.,
          // wrapperModel: WrapperModel(customWrapperBuilder: (child)=> RotatedBox(quarterTurns: 3, child: child,)),
          tabItems: const [
            SimpleTabModel(
              label: 'Home',
              icon: Icons.home,
              tabType: TabType.iconTopText,
            ),
            SimpleTabModel(label: 'Profile', icon: Icons.person),
            SimpleTabModel(label: 'Settings', icon: Icons.settings),
            SimpleTabModel(label: 'Dashboard', icon: Icons.dashboard),

          ],
          animation: TabAnimationModel(
            enabled: true,
            animationType: AnimationType.scale,
            scaleFactor: 1.1,
            selectedColor: Colors.teal,
            unselectedColor: Colors.grey,
            selectedWrapperType: WrapperType.neuMorphic,
            selectedWrapperModel: WrapperModel(
              backgroundColor: Colors.white,
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            ),
          ),
        );

        // return TabBar(tabs: tabs, tabAlignment: TabAlignment.fill);

        // Use vertical SimpleTabBar
        // return SimpleTabBar(
        return SideTabBar(
          controller: controller,
          tabs: tabs,
          dividerHeight: 0,
          isScrollable: true,
          // remove divider
          wrapperType: WrapperType.outlinedContainer,
          wrapperModel: WrapperModel(
            borderRadius: 12,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
          // tabAlignment: TabAlignment.start,
          indicator: TabIndicatorFactory.build(
            type: IndicatorType.none, // remove indicator
          ),
        );
      },

      fabButtons: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.teal,
          child: const Icon(Icons.add),
        ),
      ],

      bottomNavigation: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Custom Bottom Navigation',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
