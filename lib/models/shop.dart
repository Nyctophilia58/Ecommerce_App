import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart' ;


class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      description: "Description of Product 1",
      price: 99.99,
      // imagePath: "assets/images/product1.jpg",
    ),
    Product(
      name: "Product 2",
      description: "Description of Product 2",
      price: 199.99,
      // imagePath: "assets/images/product2.jpg",
    ),
    Product(
      name: "Product 3",
      description: "Description of Product 3",
      price: 299.99,
      // imagePath: "assets/images/product3.jpg",
    ),
    Product(
      name: "Product 4",
      description: "Description of Product 4",
      price: 399.99,
      // imagePath: "assets/images/product4.jpg",
    ),
  ];

  List<Product> _cart = [];

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