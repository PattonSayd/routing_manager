import 'package:flutter/material.dart';
import 'package:routing_manager/domain/models/routes.dart';
import 'package:routing_manager/domain/products_repository.dart';
import 'package:routing_manager/main.dart';
import 'package:routing_manager/navigation/navigation_state.dart';

class MyRouteInformationParser extends RouteInformationParser<NavigationState> {
  // RouteInformation -> NavigationState
  @override
  Future<NavigationState> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    l.d('call: parseRouteInformation');

    final uri = routeInformation.uri;

    if (uri.pathSegments.isEmpty) {
      return NavigationState.root();
    }

    // if (uri.pathSegments.length == 2) {
    //   final productId = uri.pathSegments[1];

    //   if (uri.pathSegments[0] == Routes.product) {
    //     return NavigationState.product(productId);
    //   }

    //   return NavigationState.root();
    // }

    if (uri.pathSegments.length == 2) {
      final productId = uri.pathSegments[1];

      if (uri.pathSegments[0] == Routes.product.substring(1) &&
          ProductsRepository.products
              .any((product) => product.id == productId)) {
        return NavigationState.product(productId);
      }

      return NavigationState.unknown();
    }

    if (uri.pathSegments.length == 1) {
      final path = uri.pathSegments[0];
      if (path == Routes.basket.substring(1)) {
        return NavigationState.basket();
      }

      return NavigationState.root();
    }

    return NavigationState.unknown();
  }

  // NavigationState -> RouteInformation
  @override
  RouteInformation? restoreRouteInformation(NavigationState configuration) {
    l.d('call: restoreRouteInformation');

    if (configuration.isBasket) {
      return RouteInformation(location: Routes.basket);
    }

    if (configuration.isDetails) {
      return RouteInformation(
          location: '${Routes.product}/${configuration.selectedProductId}');
    }

    if (configuration.isUnknown) {
      return null;
    }

    return RouteInformation(location: Routes.root);
  }
}
