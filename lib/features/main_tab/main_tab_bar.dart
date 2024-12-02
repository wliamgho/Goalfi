import 'package:flutter/material.dart';
import 'package:goalfi/features/index.dart';
import 'package:goalfi/core/utils/navigator_ext.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({Key? key}) : super(key: key);

  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Create unique GlobalKeys for each Navigator
  final GlobalKey<NavigatorState> homepageNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> marketNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> calculatorNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 3 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          buildNavigator(
              key: homepageNavigatorKey,
              initialRoute: '/homepage',
              routerFactory: homepageRoutes),
          buildNavigator(
              key: marketNavigatorKey,
              initialRoute: '/market',
              routerFactory: marketRoutes),
          buildNavigator(
              key: calculatorNavigatorKey,
              initialRoute: '/calculator',
              routerFactory: calculatorRoutes),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
        child: BottomNavigationBar(
          currentIndex: _tabController.index,
          onTap: (index) {
            setState(() {
              _tabController.index = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Homepage',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Market',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Kalkulator',
            ),
          ],
        ),
      ),
    );
  }
}
