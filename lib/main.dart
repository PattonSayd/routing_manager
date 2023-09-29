import 'package:flutter/material.dart';
import 'package:routing_manager/domain/models/routes.dart';

import 'ui/basket_screen.dart';
import 'ui/product_details.screen.dart';
import 'ui/product_list_screen.dart';
import 'ui/unknown_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.root,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.root:
            return MaterialPageRoute(builder: (_) => ProductListScreen());
          case Routes.product:
            return MaterialPageRoute(
                builder: (_) => ProductDetailsScreen(
                    productId: settings.arguments as String));
          case Routes.basket:
            return MaterialPageRoute(builder: (_) => const BasketScreen());
          case Routes.unknown:
            MaterialPageRoute(builder: (_) => UnknownScreen(settings.name));
        }

        return null;
      },
    );
  }
}
