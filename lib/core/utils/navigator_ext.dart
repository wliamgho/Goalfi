import 'package:flutter/material.dart';
import 'package:goalfi/core/routes/router_factory.dart';
import 'package:goalfi/core/service_locator.dart';

Widget buildNavigator({
  required GlobalKey<NavigatorState> key,
  required String initialRoute,
  required RouteFactory routerFactory,
}) {
  return Navigator(
    key: key,
    onGenerateRoute:
        RouterGenerator(routerFactory: routerFactory).generateRoute,
    initialRoute: initialRoute,
  );
}
