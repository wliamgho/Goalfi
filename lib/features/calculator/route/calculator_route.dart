import 'package:flutter/material.dart';
import '../presentation/calculator.dart';

Route<dynamic>? calculatorRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/calculator':
      return MaterialPageRoute(builder: (_) => const CalculatorTab());
    default:
      return null;
  }
}
