import 'package:flutter/material.dart';
import '../presentation/market.dart';

Route<dynamic>? marketRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/market':
      return MaterialPageRoute(builder: (_) => const Market());
    default:
      return null;
  }
}
