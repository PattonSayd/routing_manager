import 'package:flutter/material.dart';
import 'package:routing_manager/navigation/router_delegate.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final _routerDelegate = MyRouterDelegate();

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
    );
  }
}
