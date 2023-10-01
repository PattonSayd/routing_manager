import 'package:flutter/material.dart';
import 'package:routing_manager/main.dart';
import 'package:routing_manager/navigation/navigation_state.dart';
import 'package:routing_manager/ui/basket_screen.dart';
import 'package:routing_manager/ui/product_details.screen.dart';
import 'package:routing_manager/ui/product_list_screen.dart';
import 'package:routing_manager/ui/unknown_screen.dart';

class MyRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  // Əgər navigatorKey getter olsa o her xitabda yenidən yaradılacaqdır.
  // Bu halda bir defe yaradılır
  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  NavigationState? state;

  @override
  NavigationState get currentConfiguration {
    l.d('call: currentConfiguration');
    return state ?? NavigationState.root();
  }

  @override
  Widget build(BuildContext context) {
    l.d('build: Navigator');

    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: ProductListScreen(
            onTapBasket: _handleBasket,
            onTapProductDetails: _handleProductDetails,
          ),
        ),
        if (state?.isBasket == true)
          const MaterialPage(
            child: BasketScreen(),
          ),
        if (state?.isDetails == true)
          MaterialPage(
            child: ProductDetailsScreen(productId: state?.selectedProductId),
          ),
        if (state?.isUnknown == true)
          const MaterialPage(
            child: UnknownScreen(),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        state = NavigationState.root();

        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    l.d('call: setNewRoutePath');

    state = configuration;
    notifyListeners();
  }

  void _handleBasket() {
    state = NavigationState.basket();
    notifyListeners();
  }

  void _handleProductDetails(String productId) {
    state = NavigationState.product(productId);
    notifyListeners();
  }
}
