import 'package:flutter/material.dart';
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
      tabBarPosition: TabBarPosition.body,
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
              tabItems: const [
                SimpleTabModel(icon: Icons.dashboard, label: 'Dashboard'),
                SimpleTabModel(icon: Icons.message, label: 'Messages'),
                SimpleTabModel(icon: Icons.settings, label: 'Settings'),
              ],
              controller: controller,
              tabType: TabType.iconThenText,
              rotate: true,
              rotateTurns: 3,
              wrapperModel: WrapperModel(
                wrapperType: WrapperType.outlinedContainer,
                gradient: LinearGradient(colors: [Colors.amber, Colors.pink]),
                // customWrapperBuilder: (Widget child) => Card(child: child),
              ),

              animation: TabAnimationModel(
                enabled: true,
                animationType: TabAnimationType.bounceAdvanced,
                scaleFactor: 1.2,
                // containerCurve: Curves.bounceIn,
                // containerCurve: Curves.linearToEaseOut,
                selectedColor: Color(0xff7e29c1),
                unselectedColor: Colors.blueGrey,
                selectedWrapperModel: WrapperModel(
                  wrapperType: WrapperType.neuMorphic,
                  // gradient: LinearGradient(colors: [Colors.amber, Colors.pink]),
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  // backgroundColor: Colors.blue,
                  // shadowLightColor: Colors.redAccent.shade100,
                  // shadowDarkColor: Colors.redAccent.shade700,
                  // borderRadius: 50,
                  elevation: 1,
                ),
                unselectedWrapperModel: WrapperModel(
                  wrapperType: WrapperType.gradient,
                  gradient: LinearGradient(colors: [Colors.amber, Colors.pink]),
                  // customWrapperBuilder: (Widget child) => Card(child: child),
                ),
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
              isScrollable: true,
              
              // backgroundColor: Colors.deepPurple,
              // wrapperType: WrapperType.neuMorphic,
              wrapperModel: WrapperModel(
              wrapperType: WrapperType.card,
                backgroundColor: Colors.white70,
                margin: EdgeInsets.all(15),
                elevation: 0,
              ),

              indicator: TabIndicatorFactory.build(
                IndicatorModel(
                  type: TabIndicatorType.dot,
                  position: TabIndicatorPosition.top,
                  color: Colors.blueGrey,
                  // customPainter: RoundedIndicatorPainter(color: Colors.black45),
                  // gradient: LinearGradient(
                  //   colors: [Colors.pinkAccent, Colors.amber],
                  // ),
                  // borderRadius: 10,
                  // height: 5,
                ),
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
