import 'package:flutter/material.dart';
import 'package:reusable_tab_bar/reusable_tab_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All TabBar Screens Demo',
      debugShowCheckedModeBanner: false,
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
          ListTile(
            title: const Text('Stack Positioned TabBar Screen'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DemoStackPositionedTabBarScreen(),
              ),
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
      defaultTabBarHeight: 250,

      pages: const [
        Center(child: Text('Dashboard Page')),
        Center(child: Text('Messages Page')),
        Center(child: Text('Settings Page')),
      ],

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
            animationType: TabAnimationType.all,
            scaleFactor: 1.1,
            // selectedColor: Colors.white,
            unselectedColor: Colors.black54,
            selectedWrapperModel: WrapperModel(
              wrapperType: WrapperType.card,
              // backgroundColor: Colors.indigo,
              borderRadius: 30,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 8),
            ),
          ),
        );

        return SimpleTabBar(
          controller: controller,
          dividerHeight: 0,
          // Remove divider
          wrapperModel: WrapperModel(
            wrapperType: WrapperType.card,
            borderRadius: 30,
            margin: const EdgeInsets.symmetric(horizontal: 80),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          ),
          indicatorColor: Colors.transparent,

          tabs: tabs,
        );
      },

      appBar: AppBar(title: Text("Love")),
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
                animationType: TabAnimationType.fade,
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

              wrapperModel: WrapperModel(
              wrapperType: WrapperType.outlinedContainer,
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
                animationType: TabAnimationType.fade,
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

              wrapperModel: WrapperModel(
              wrapperType: WrapperType.outlinedContainer,
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
        final tabs = TabBuilder.build(
          controller: controller,
          tabType: TabType.iconTopText,
          rotate: true,
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
            animationType: TabAnimationType.scale,
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

        return SideTabBar(
          controller: controller,
          tabs: tabs,
          dividerHeight: 0,
          isScrollable: true,
          // remove divider
          wrapperModel: WrapperModel(
          wrapperType: WrapperType.outlinedContainer,
            borderRadius: 12,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),

          // tabAlignment: TabAlignment.start,
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
            animationType: TabAnimationType.all,
            scaleFactor: 1.1,
            // selectedColor: Colors.white,
            unselectedColor: Colors.black54,
            selectedWrapperModel: WrapperModel(
              wrapperType: WrapperType.card,
              // backgroundColor: Colors.indigo,
              borderRadius: 30,
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
            ),
          ),
        );

        return SimpleTabBar(
          controller: controller,
          tabs: tabs,
          dividerHeight: 0,
          isScrollable: true,
          indicatorColor: Colors.transparent,

          // indicator: TabIndicatorFactory.build(
          //   IndicatorModel(
          //     // type: TabIndicatorType.gradient,
          //     // // position: TabIndicatorPosition.top,
          //     color: Colors.amber,
          //     // gradient: LinearGradient(
          //     //   colors: [Colors.amber, Colors.pinkAccent],
          //     // ),
          //     // thickness: 5,
          //
          //     radius: 16,
          //     padding: EdgeInsets.all(6),
          //   ),
          // ),
          wrapperModel: WrapperModel(
            wrapperType: WrapperType.card,
            borderRadius: 30,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          ),
        );
      },

      // 👇 Configure overlay position
      // top: 5,
      bottom: 450,
      left: 700,
      // right: 100,

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
