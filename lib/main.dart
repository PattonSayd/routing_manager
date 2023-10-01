import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'navigation/route_information_parser.dart';
import 'navigation/router_delegate.dart';

final l = Logger();

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final _routerDelegate = MyRouterDelegate();
  final _routeInformationParser = MyRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Online Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
