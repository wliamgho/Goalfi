import 'package:flutter/material.dart';
import 'package:goalfi/features/calculator/presentation/calculator.dart';
import 'package:goalfi/features/main_tab/main_tab_bar.dart';
import 'package:goalfi/features/market/presentation/market.dart';
import 'package:goalfi/splash/splashScreen.dart';
import 'package:goalfi/features/homepage/presentation/homepage.dart';

class AppRouter {
  static const String splash = '/';
  static const String mainTab = '/main_tab';
  static const String home = '/home';
  static const String market = '/market';
  static const String calculatorTab = '/calculator';

  /// Maps route names to widgets
  static Widget _getScreen(String routeName) {
    print('Navigating to route: $routeName'); // Debug
    switch (routeName) {
      case splash:
        return const SplashScreen();
      case mainTab:
        return const MainTabBar();
      case home:
        return const HomePage();
      case market:
        return const Market();
      case calculatorTab:
        return const CalculatorTab();
      default:
        return const Scaffold(
          body: Center(child: Text('Page not found')),
        );
    }
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => _getScreen(settings.name!),
    );
  }
}
