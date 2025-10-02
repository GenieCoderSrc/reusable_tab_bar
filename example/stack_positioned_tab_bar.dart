import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model/simple_tab_model.dart';
import 'package:reusable_tab_bar/data/models/wrapper_model.dart';
import 'package:reusable_tab_bar/reusable_tab_bar.dart';
import 'package:reusable_tab_bar/views/screens/stack_positioned_tab_bar_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Positioned TabBar Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const DemoStackPositionedTabBarScreen(),
    );
  }
}

class DemoStackPositionedTabBarScreen extends StatelessWidget {
  const DemoStackPositionedTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StackPositionedTabBarScreen(
      pages: const [
        Center(child: Text('Dashboard Page')),
        Center(child: Text('Messages Page')),
        Center(child: Text('Settings Page')),
      ],

      // 👇 Overlay tab bar inside Stack
      tabBarBuilder: (controller) {
        final tabs = TabBuilder.build(
          controller: controller,
          tabItems: const [
            SimpleTabModel(label: 'Dashboard'),
            SimpleTabModel(label: 'Messages'),
            SimpleTabModel(label: 'Settings'),
          ],
          animation: TabAnimationModel(
            enabled: true,
            animationType: TabAnimationType.bounceAdvanced,
            scaleFactor: 1.1,
            selectedColor: Colors.white,
            unselectedColor: Colors.black54,
            selectedWrapperType: WrapperType.card,
            selectedWrapperModel: WrapperModel(
              backgroundColor: Colors.indigo,
              borderRadius: 12,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),
        );

        return SimpleTabBar(
          controller: controller,
          tabs: tabs,
          dividerHeight: 0,
          isScrollable: true,
          wrapperType: WrapperType.outlinedContainer,
          wrapperModel: WrapperModel(
            borderRadius: 12,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          ),
        );
      },

      // 👇 Configure overlay position
      bottom: 20,
      left: 200,
      // right: 10,

      // 👇 Optional bottom navigation
      bottomNavigation: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Bottom Navigation Content',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),

      // 👇 Optional FABs
      fabButtons: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.indigo,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
