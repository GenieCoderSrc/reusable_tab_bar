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
      title: 'Sliver TabBar Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DemoSliverScreen(),
    );
  }
}

class DemoSliverScreen extends StatelessWidget {
  const DemoSliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverCustomTabBarScreen(
      // 👇 Pages inside TabBarView
      pages: const [
        Center(child: Text('Home Content')),
        Center(child: Text('Profile Content')),
        Center(child: Text('Settings Content')),
      ],

      // 👇 Use your custom SliverTabAppBar
      tabBarBuilder: (controller) {
        return SliverTabAppBar(
          expandedHeight: 220,
          pinned: true,
          floating: false,
          snap: false,
          titleTxt: 'Sliver TabBar Demo',
          centerTitle: true,
          appBarBottomHeight: 72,
          controller: controller,
          tabBarBuilder: (controller) {
            // Build tabs using TabBuilder
            final tabs = TabBuilder.build(
              controller: controller,
              tabItems: const [
                SimpleTabModel(label: 'Home'),
                SimpleTabModel(label: 'Profile'),
                SimpleTabModel(label: 'Settings'),
              ],
              animation: TabAnimationModel(
                enabled: true,
                animationType: TabAnimationType.fade,
                selectedColor: Colors.deepPurple,
                unselectedColor: Colors.grey,
                selectedWrapperType: WrapperType.card,
                selectedWrapperModel: WrapperModel(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                ),
              ),
            );

            // 👇 Your SimpleTabBar (extending BaseTabBar)
            return SimpleTabBar(
              controller: controller,
              dividerHeight: 0,
              // remove divider line
              wrapperModel: WrapperModel(
              wrapperType: WrapperType.outlinedContainer,
                borderRadius: 12,
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              ),
              tabs: tabs,
            );
          },
        );
      },
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

      fabButtons: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
