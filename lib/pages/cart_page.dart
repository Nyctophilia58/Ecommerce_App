import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/components/my_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Remove this item from your cart?"),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Provider.of<Shop>(context, listen: false).removeFromCart(product);
              },
              child: const Text("Yes"),
            ),
          ],
        ),
    );
  }

  void payButtonPressed(BuildContext context){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text(
              "Payment successful!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.green,
              ),
          ),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty ? const Center(child: Text("Your cart is empty")) : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final product = cart[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  leading: Image.network(product.imagePath),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => removeItemFromCart(context, product),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: const Text("Pay"),
            ),
          )
        ],
      ),
    );
  }
}