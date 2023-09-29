import 'models/product.dart';

class ProductsRepository {
  static const List<Product> products = [
    Product(
      id: '1',
      title: 'Product 1',
      description: 'Description of Product 1',
    ),
    Product(
      id: '2',
      title: 'Product 2',
      description: 'Description of Product 2',
    ),
    Product(
      id: '3',
      title: 'Product 3',
      description: 'Description of Product 3',
    ),
    Product(
      id: '4',
      title: 'Product 4',
      description: 'Description of Product 4',
    ),
    Product(
      id: '5',
      title: 'Product 5',
      description: 'Description of Product 5',
    ),
  ];

  static List<Product> getProducts() => products;
}
