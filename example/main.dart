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
      title: 'All TabBar Screens Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainMenuScreen(),
    );
  }
}

/// Main menu to navigate between different TabBar screens
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TabBar Screens Menu')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Simple TabBar Screen'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DemoSimpleTabBarScreen()),
            ),
          ),
          ListTile(
            title: const Text('Sliver Custom TabBar Screen'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DemoSliverCustomScreen()),
            ),
          ),
          ListTile(
            title: const Text('Sliver Nested TabBar Screen'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DemoSliverNestedScreen()),
            ),
          ),
          ListTile(
            title: const Text('Side TabBar Screen'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DemoSideTabBarScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

/// 1️⃣ Simple TabBar Screen Example

class DemoSimpleTabBarScreen extends StatelessWidget {
  const DemoSimpleTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleTabBarScreen(
      pages: const [
        Center(child: Text('Dashboard Page')),
        Center(child: Text('Messages Page')),
        Center(child: Text('Settings Page')),
      ],
      tabBarBuilder: (controller) {
        return TabAppBar(
          controller: controller,
          titleTxt: 'Animated TabBar Demo',
          centerTitle: true,
          appBarHeight: 150,
          appBarBottomHeight: 100,

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
                animationType: AnimationType.bounceAdvanced,
                scaleFactor: 1.2,
                selectedColor: Color(0xff7e29c1),
                unselectedColor: Colors.blueGrey,
                selectedWrapperType: WrapperType.neuMorphic,
                selectedWrapperModel: WrapperModel(elevation: 1),
              ),
            );

            return SimpleTabBar(
              controller: controller,
              dividerHeight: 0,
              // Remove divider
              wrapperType: WrapperType.card,
              wrapperModel: WrapperModel(
                backgroundColor: Colors.white70,
                margin: const EdgeInsets.all(15),
                elevation: 0,
              ),
              indicator: TabIndicatorFactory.build(
                type: IndicatorType.none, // Remove indicator
              ),
              tabs: tabs,
            );
          },
        );
      },
      fabButtons: [
        FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
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

/// 2️⃣ Sliver Custom TabBar Screen Example
class DemoSliverCustomScreen extends StatelessWidget {
  const DemoSliverCustomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverCustomTabBarScreen(
      pages: const [
        Center(child: Text('Home Content')),
        Center(child: Text('Profile Content')),
        Center(child: Text('Settings Content')),
      ],
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
            final tabs = TabBuilder.build(
              controller: controller,
              tabItems: const [
                SimpleTabModel(label: 'Home'),
                SimpleTabModel(label: 'Profile'),
                SimpleTabModel(label: 'Settings'),
              ],
              animation: TabAnimationModel(
                enabled: true,
                animationType: AnimationType.fade,
                selectedColor: Colors.deepPurple,
                unselectedColor: Colors.grey,
                selectedWrapperType: WrapperType.card,
                selectedWrapperModel: WrapperModel(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 6,
                  ),
                ),
              ),
            );

            return SimpleTabBar(
              controller: controller,
              dividerHeight: 0,
              indicator: TabIndicatorFactory.build(type: IndicatorType.none),
              wrapperType: WrapperType.outlinedContainer,
              wrapperModel: WrapperModel(
                borderRadius: 12,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              ),
              tabs: tabs,
            );
          },
        );
      },
    );
  }
}

/// 3️⃣ Sliver Nested TabBar Screen Example

class DemoSliverNestedScreen extends StatelessWidget {
  const DemoSliverNestedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverNestedTabBarScreen(
      pages: const [
        Center(child: Text('Home Content')),
        Center(child: Text('Profile Content')),
        Center(child: Text('Settings Content')),
      ],
      tabBarBuilder: (controller) {
        return SliverTabAppBar(
          expandedHeight: 220,
          pinned: true,
          floating: false,
          snap: false,
          titleTxt: 'Sliver Nested TabBar Demo',
          centerTitle: true,
          appBarBottomHeight: 72,
          controller: controller,
          tabBarBuilder: (controller) {
            final tabs = TabBuilder.build(
              controller: controller,
              tabItems: const [
                SimpleTabModel(label: 'Home'),
                SimpleTabModel(label: 'Profile'),
                SimpleTabModel(label: 'Settings'),
              ],
              animation: TabAnimationModel(
                enabled: true,
                animationType: AnimationType.fade,
                selectedColor: Colors.deepPurple,
                unselectedColor: Colors.grey,
                selectedWrapperType: WrapperType.card,
                selectedWrapperModel: WrapperModel(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 6,
                  ),
                ),
              ),
            );

            return SimpleTabBar(
              controller: controller,
              dividerHeight: 0,
              indicator: TabIndicatorFactory.build(type: IndicatorType.none),
              wrapperType: WrapperType.outlinedContainer,
              wrapperModel: WrapperModel(
                borderRadius: 12,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              ),
              tabs: tabs,
            );
          },
        );
      },
    );
  }
}

/// Side TabBar Screen Example
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

/// Stack Position TabBar Screen Example
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
            animationType: AnimationType.bounceAdvanced,
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
          indicator: TabIndicatorFactory.build(type: IndicatorType.none),
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
