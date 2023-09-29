import 'package:flutter/material.dart';

import '../domain/products_repository.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String? productId;

  const ProductDetailsScreen({super.key, this.productId});

  @override
  Widget build(BuildContext context) {
    final products = ProductsRepository.getProducts();
    final product = products.firstWhere(
      (element) => element.id == productId,
      orElse: () => products.first,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Product information')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Item Details Screen'),
            Text('ID: ${product.id}'),
            Text('Title: ${product.title}'),
            Text('Description: ${product.description}'),
          ],
        ),
      ),
    );
  }
}
