import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart' ;


class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "CONFU Hair Dryer",
      description: "High-performance ionic hairdryer designed for salon-quality results and reduced frizz.",
      price: 129.99,
      imagePath: "lib/assets/images/Product_1.jpg",
    ),
    Product(
      name: "Slip-On Sneaker",
      description: "Effortlessly stylish and comfortable slip-on sneakers, perfect for casual wear.",
      price: 299.99,
      imagePath: "lib/assets/images/Product_2.jpg",
    ),
    Product(
      name: "Unisex Black Hoodie",
      description: "A versatile black hoodie featuring the Peer logo, offering comfort and a sleek look.",
      price: 149.99,
      imagePath: "lib/assets/images/Product_3.jpg",
    ),
    Product(
      name: "Florentin Sunglasses",
      description: "Chic black sunglasses with green lenses, blending fashion with UV protection.",
      price: 99.99,
      imagePath: "lib/assets/images/Product_4.jpg",
    ),
  ];

  final List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}