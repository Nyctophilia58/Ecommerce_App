import 'package:flutter/material.dart';
import 'package:ecommerce_app/components/my_button.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.shopping_bag,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            const Text(
              "Minimal Shop",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Premium Quality Products",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),

            const SizedBox(height: 25),

            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Icon(Icons.arrow_forward)
            ),
          ],
        ),
      ),
    );
  }
}