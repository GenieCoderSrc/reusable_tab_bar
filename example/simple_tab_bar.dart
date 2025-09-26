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
          appBarHeight: 150,
          appBarBottomHeight: 100,

          // 👇 Add the animated tabs here
          tabBarBuilder: (controller) {
            // Build normal tabs first
            final tabs = TabBuilder.build(
              controller: controller,
              // wrapperType: WrapperType.outlinedContainer,
              // wrapperModel: WrapperModel(
              //   gradient: LinearGradient(colors: [Colors.amber, Colors.pink]),
              //   // customWrapperBuilder: (Widget child) => Card(child: child),
              // ),
              tabItems: const [
                // SimpleTabModel(icon: Icons.dashboard),
                // SimpleTabModel(icon: Icons.message),
                // SimpleTabModel(icon: Icons.settings),
                //   SimpleTabModel(icon: Icons.dashboard, label: 'Dashboard'),
                // SimpleTabModel(icon: Icons.message, label: 'Messages'),
                // SimpleTabModel(icon: Icons.settings, label: 'Settings'),
                SimpleTabModel(label: 'Dashboard'),
                SimpleTabModel(label: 'Messages'),
                SimpleTabModel(label: 'Settings'),
              ],
              animation: TabAnimationModel(
                enabled: true,
                animationType: AnimationType.bounceAdvanced,
                scaleFactor: 1.2,
                // containerCurve: Curves.bounceIn,
                // containerCurve: Curves.linearToEaseOut,
                selectedColor: Color(0xff7e29c1),
                unselectedColor: Colors.blueGrey,
                selectedWrapperType: WrapperType.neuMorphic,
                selectedWrapperModel: WrapperModel(
                  // gradient: LinearGradient(colors: [Colors.amber, Colors.pink]),
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  // backgroundColor: Colors.blue,
                  // shadowLightColor: Colors.redAccent.shade100,
                  // shadowDarkColor: Colors.redAccent.shade700,
                  // borderRadius: 50,
                  elevation: 1,
                ),
                // unselectedWrapperType: WrapperType.gradient,
                // unselectedWrapperModel: WrapperModel(
                //   gradient: LinearGradient(colors: [Colors.amber, Colors.pink]),
                //   // customWrapperBuilder: (Widget child) => Card(child: child),
                // ),
              ),
            );

            // // Build normal tabs first
            // final tabs = const [
            //   Tab(icon: Icon(Icons.dashboard), text: 'Dashboard'),
            //   Tab(icon: Icon(Icons.message), text: 'Messages'),
            //   Tab(icon: Icon(Icons.settings), text: 'Settings'),
            // ];

            // return TabBar(tabs: tabs, controller: controller);

            return SimpleTabBar(
              controller: controller,
              dividerHeight: 0,
              wrapperType: WrapperType.card,
              wrapperModel: WrapperModel(
                backgroundColor: Colors.white70,
                margin: EdgeInsets.all(15),
                elevation: 0,
              ),
              // isScrollable: true,
              // backgroundColor: Colors.deepPurple,
              // wrapperType: WrapperType.neuMorphic,
              indicator: TabIndicatorFactory.build(
                type: IndicatorType.none,
                // customPainter: RoundedIndicatorPainter(color: Colors.black45),
                // position: TabIndicatorPosition.top,
                // gradient: LinearGradient(
                //   colors: [Colors.pinkAccent, Colors.amber],
                // ),
                // color: Colors.transparent,
                // borderRadius: 40,
                // height: 10,
              ),
              tabs: tabs,
              // tabs: animatedTabs,
            );
          },
        );
      },

      fabButtons: [
        FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
        SizedBox.shrink(),
        FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      ],
    );
  }
}
