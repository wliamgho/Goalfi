import 'package:flutter/material.dart';
import '../presentation/homepage.dart';

Route<dynamic>? homepageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/homepage':
      return MaterialPageRoute(builder: (_) => const HomePage());
    default:
      return null;
  }
}
