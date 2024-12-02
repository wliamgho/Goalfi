import 'package:flutter/material.dart';

typedef RouterFactory = Route<dynamic>? Function(RouteSettings settings);

class RouterGenerator {
  final RouterFactory routerFactory;

  RouterGenerator({required this.routerFactory});

  Route<dynamic> generateRoute(RouteSettings settings) {
    final route = routerFactory(settings);
    if (route != null) {
      return route;
    }
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('Page not found')),
      ),
    );
  }
}
