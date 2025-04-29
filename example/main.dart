import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_tab_bar/reusable_tab_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabBarCubit>(create: (_) => TabBarCubit()),
      ],
      child: MaterialApp(
        title: 'Reusable Tab Bar Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTabBar(
      tabScreens: const [
        Center(child: Text('Home Screen')),
        Center(child: Text('Search Screen')),
        Center(child: Text('Profile Screen')),
      ],
      tabHeaders: const [
        Tab(icon: Icon(Icons.home), text: 'Home'),
        Tab(icon: Icon(Icons.search), text: 'Search'),
        Tab(icon: Icon(Icons.person), text: 'Profile'),
      ],
      titleTxt: 'Reusable TabBar',
      backgroundColor: Colors.blue,
      selectedLabelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorColor: Colors.white,
      appBarHeight: 0,
      preferredSize: 100,
      fabButtons: const [
        FloatingActionButton(onPressed: null, child: Icon(Icons.home)),
        FloatingActionButton(onPressed: null, child: Icon(Icons.search)),
        FloatingActionButton(onPressed: null, child: Icon(Icons.person)),
      ],
    );
  }
}
