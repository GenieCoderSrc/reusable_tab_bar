import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_tab_bar/data/enums/tab_type.dart';
import 'package:reusable_tab_bar/data/models/tab_item_model.dart';
import 'package:reusable_tab_bar/reusable_tab_bar.dart';

void main() {
  runApp(const TabBarExampleApp());
}

class TabBarExampleApp extends StatelessWidget {
  const TabBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable Tab Bar Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabItems = [
      TabItemModel(label: 'Home', icon: Icons.home, type: TabType.iconThenText),
      TabItemModel(
        label: 'Search',
        icon: Icons.search,
        type: TabType.iconThenText,
      ),
      TabItemModel(
        label: 'Profile',
        icon: Icons.person,
        type: TabType.iconThenText,
      ),
    ];

    final pages = [
      Center(child: Text('Home Page')),
      Center(child: Text('Search Page')),
      Center(child: Text('Profile Page')),
    ];

    final fabButtons = [
      FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      FloatingActionButton(onPressed: () {}, child: const Icon(Icons.search)),
      FloatingActionButton(onPressed: () {}, child: const Icon(Icons.person)),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Reusable Tab Bar Examples')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Standard Tab Bar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ReusableTabBarScreen(
                    layout: TabBarLayout.standard,
                    tabItems: tabItems,
                    pages: pages,
                    fabButtons: fabButtons,
                    tabBarUseCard: true,
                    tabBarCardColor: Colors.white,
                    tabBarCardElevation: 4,
                    tabBarCardShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Sliver Tab Bar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ReusableTabBarScreen(
                    layout: TabBarLayout.sliver,
                    tabItems: tabItems,
                    pages: pages,
                    fabButtons: fabButtons,
                    sliverType: SliverTabBarType.sticky,
                    tabBarUseCard: true,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Bottom Tab Bar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ReusableTabBarScreen(
                    layout: TabBarLayout.bottom,
                    tabItems: tabItems,
                    pages: pages,
                    fabButtons: fabButtons,
                    tabBarUseCard: false,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Side Tab Bar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ReusableTabBarScreen(
                    layout: TabBarLayout.side,
                    tabItems: tabItems,
                    pages: pages,
                    fabButtons: fabButtons,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Modal Tab Bar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ReusableTabBarScreen(
                    layout: TabBarLayout.modal,
                    tabItems: tabItems,
                    pages: pages,
                    fabButtons: fabButtons,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
